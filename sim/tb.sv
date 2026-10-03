`timescale 1ns/1ps

module tb;

    logic clk;
    logic rst_n;
    logic [7:0] gpio_out;
    logic [7:0] gpio_in;
    logic uart_tx;
    logic uart_rx;

    assign uart_rx = uart_tx;

    top #(
        .RAM_DEPTH(1024),
        .ROM_DEPTH(1024),
        .DEFAULT_WIDTH(32),
        .GPIO_WIDTH(8)
    ) DUT (
        .clk(clk),
        .rst_n(rst_n),
        .gpio_out(gpio_out),
        .gpio_in(gpio_in),
        .uart_tx(uart_tx),
        .uart_rx(uart_rx)
    );

    always #10 clk = ~clk;

    initial begin
        clk = 0;
        rst_n = 1;
        gpio_in = 8'hAA;

        @(negedge clk);
        rst_n = 0;
        repeat (5) @(posedge clk);
        rst_n = 1;

        repeat (20000) @(posedge clk);
        $finish;
    end

    initial begin
        $dumpfile("sim/wave.vcd");
        $dumpvars(0, tb);
    end

endmodule