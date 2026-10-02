module baud_generator#(BAUDRATE_WIDTH = 32)
(
    output logic        tx_baud_tick,
    output logic        rx_baud_tick,

    input logic         clk,
    input logic         rst_n,
    input logic [BAUDRATE_WIDTH-1:0] i_baudrate_div
);

logic [BAUDRATE_WIDTH-1:0] cnt;

assign rx_baud_tick = 0;

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        tx_baud_tick <= 1'b0;
        cnt <= 'b0;
    end
    else begin
        if (cnt == (i_baudrate_div - 1)) begin
            tx_baud_tick <= 1'b1;
            cnt <= 'b0;
        end
        else begin
            tx_baud_tick <= 1'b0;
            cnt <= cnt + 1;
        end
    end
end

endmodule