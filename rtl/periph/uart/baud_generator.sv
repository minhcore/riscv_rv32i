module baud_generator#(BAUDRATE_WIDTH = 16)
(
    output logic        tx_baud_tick,
    output logic        rx_baud_tick,

    input logic         clk,
    input logic         rst_n,
    input logic [BAUDRATE_WIDTH-1:0] i_baudrate_div,
    input logic         i_tx_en,
    input logic         i_rx_en
);

/* i_baudrate_div is 8x tick for RX
   so TX is 8 times RX tick */

logic [BAUDRATE_WIDTH-1:0] rx_cnt;
logic [2:0] tx_cnt;

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        tx_cnt <= 'b0;
        tx_baud_tick <= 1'b0;
    end
    else if (!i_tx_en) begin // Yosys is not agree combined with rst_n
        tx_cnt <= 'b0;
        tx_baud_tick <= 1'b0;
    end
    else begin
        if (rx_cnt == (i_baudrate_div - 1)) begin
            if (tx_cnt == 3'd7) begin
                tx_baud_tick <= 1'b1;
                tx_cnt <= 'b0;
            end
            else begin
                tx_cnt <= tx_cnt + 1;
                tx_baud_tick <= 1'b0;
            end
        end
        else begin
            tx_baud_tick <= 1'b0;
        end
    end
end

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rx_cnt <= 'b0;
        rx_baud_tick <= 1'b0;
    end
    else if (!i_rx_en) begin // Yosys is not agree combined with rst_n
        rx_cnt <= 'b0;
        rx_baud_tick <= 1'b0;
    end
    else begin
        if (rx_cnt == (i_baudrate_div - 1)) begin
            rx_cnt <= 'b0;
            rx_baud_tick <= 1'b1;
        end
        else begin
            rx_baud_tick <= 1'b0;
            rx_cnt <= rx_cnt + 1;
        end
    end
end
endmodule