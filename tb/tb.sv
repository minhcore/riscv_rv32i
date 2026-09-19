module tb();

logic clk, rst_n, mem_write_net;
logic [31:0] alu_result_net, write_data_net, read_data_net;

top DUT(
    .alu_result(alu_result_net),
    .write_data(write_data_net),
    .mem_write(mem_write_net),
    .clk(clk),
    .rst_n(rst_n),
    .read_data(read_data_net)
);

ram RAM(
    .read_data(read_data_net),
    .write_data(write_data_net),
    .address(alu_result_net),
    .clk(clk),
    .rst_n(rst_n),
    .mem_write(mem_write_net)
);

always #(10) clk = ~clk;

initial begin
    clk = 0;
    rst_n = 1;
    @(negedge clk);
    rst_n = 0;
    repeat (5) @(posedge clk);
    rst_n = 1;

    repeat(20) @(posedge clk);
    
    $finish;
end

initial begin
    $dumpfile("tb/wave.vcd");
    $dumpvars(0);
end

endmodule