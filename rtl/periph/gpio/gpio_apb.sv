module gpio_apb #(
    PORT_WIDTH = 8,
    APB_WIDTH  = 32
)(
    output logic [PORT_WIDTH-1:0]   data_out_port,

    input logic [PORT_WIDTH-1:0]    data_in_port,

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

logic [PORT_WIDTH-1:0] reg_data_out;
logic [PORT_WIDTH-1:0] data_in_sync_1, data_in_sync_2; 

assign pready = 1'b1;
assign pslverr = 1'b0;
assign data_out_port = reg_data_out;

// Write Block
always_ff @(posedge pclk or negedge presetn) begin
    if (!presetn) begin
        reg_data_out    <= 0;
    end
    else if (psel && penable && pwrite) begin
        case(paddr[3:0])
        4'h0: reg_data_out <= pwdata[PORT_WIDTH-1:0];
        default:;
        endcase
    end
end

// Read Block
always_ff @(posedge pclk or negedge presetn) begin
    if (!presetn) begin
        data_in_sync_1 <= 0;
        data_in_sync_2 <= 0;
    end
    else begin
        data_in_sync_1 <= data_in_port;
        data_in_sync_2 <= data_in_sync_1;
    end
end
always_comb begin
    prdata = 0;
    if (psel && !pwrite) begin
        case(paddr[3:0])
            4'h0: prdata[PORT_WIDTH-1:0] = reg_data_out;
            4'h4: prdata[PORT_WIDTH-1:0] = data_in_sync_2;
            default:;
        endcase
    end     
end

endmodule