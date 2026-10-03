module uart_apb #(APB_WIDTH = 32)
(
    output logic                    o_tx,

    input logic                     i_rx,

    output logic [APB_WIDTH-1:0]    prdata,
    output logic                    pready,
    output logic                    pslverr,

    input logic                     pclk,
    input logic                     presetn,
    input logic                     psel,
    input logic                     pwrite,
    input logic [APB_WIDTH-1:0]     paddr,
    input logic                     penable,
    input logic [APB_WIDTH-1:0]     pwdata
);

localparam BAUDRATE_WIDTH = 16;
logic [7:0] data_tx_reg, data_rx_reg;
logic [BAUDRATE_WIDTH-1:0] baudrate_reg;
logic [1:0] control_reg;
logic start_transmit, tx_baud_tick, rx_baud_tick, tx_ready, rx_valid, rx_read;

assign pslverr = 1'b0;
assign pready = 1'b1;

// Write block
always_ff @(posedge pclk or negedge presetn) begin
    if (!presetn) begin
        baudrate_reg <= 'b0;
        data_tx_reg <= 'b0;
        control_reg <= 'b0;
        start_transmit <= 1'b0;
    end
    else if (psel && penable && pwrite) begin
        case(paddr[7:0])
        8'h00: baudrate_reg <= pwdata[BAUDRATE_WIDTH-1:0];
        8'h04: begin
            data_tx_reg <= pwdata[7:0];
            start_transmit <= 1'b1;
        end
        8'h10: control_reg <= pwdata[1:0];
        default;
        endcase
    end else begin
        start_transmit <= 1'b0;
    end
end

// Read block
always_comb begin
    prdata = 0;
    if (psel && !pwrite) begin
        case(paddr[8:0]) 
            8'h00: prdata[BAUDRATE_WIDTH-1:0] = baudrate_reg;
            8'h04: prdata[7:0] = data_tx_reg;
            8'h08: prdata[7:0] = data_rx_reg;
            8'h0C: prdata[1:0] = {rx_valid, tx_ready};
            8'h10: prdata[1:0] = control_reg;
            default:;
        endcase
    end
end

always_ff @(posedge pclk or negedge presetn) begin
    if (!presetn) begin
        rx_read <= 1'b0;
    end
    else begin
        if (psel && !pwrite && (paddr[8:0] == 8'h08)) begin
            rx_read <= 1'b1;
        end
        else begin
            rx_read <= 1'b0;
        end
    end
end

// Instances
baud_generator #(
    .BAUDRATE_WIDTH (BAUDRATE_WIDTH)
)baud_gen(
    .clk            (pclk),
    .rst_n          (presetn),
    .i_baudrate_div (baudrate_reg),
    .tx_baud_tick   (tx_baud_tick),
    .rx_baud_tick   (rx_baud_tick),
    .i_tx_en        (control_reg[0]),
    .i_rx_en        (control_reg[1])
);

uart_tx uart_tx (
    .clk            (pclk),
    .rst_n          (presetn),
    .tx_en          (control_reg[0]),
    .baud_tick      (tx_baud_tick),
    .i_data         (data_tx_reg),
    .i_start        (start_transmit),
    .o_tx           (o_tx),
    .o_ready        (tx_ready)
);

uart_rx uart_rx (
    .clk            (pclk),
    .rst_n          (presetn),
    .rx_en          (control_reg[1]),
    .baud_tick      (rx_baud_tick),
    .i_rx           (i_rx),
    .i_read         (rx_read),
    .o_data         (data_rx_reg),
    .o_data_valid   (rx_valid)
);
endmodule

