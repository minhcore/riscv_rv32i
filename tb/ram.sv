module ram(
    output logic [31:0] read_data,

    input logic [31:0]  write_data,
    input logic [31:0]  address,
    input logic         clk,
    input logic         rst_n,
    input logic         mem_write
);

logic [31:0] mem[64];

assign read_data = mem[address[7:2]];

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        
    end
    else if (mem_write) begin
        mem[address[7:2]] <= write_data;
    end
end

// initial begin
//     mem[0] = 32'd11;
//     mem[1] = 32'd76;
//     mem[2] = 32'd2;
//     mem[3] = 32'd3;
// end

endmodule