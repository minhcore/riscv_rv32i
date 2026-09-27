module ram #(DEPTH = 1024)(
    output logic [31:0] read_data,

    input logic [31:0]  write_data,
    input logic [31:0]  address,
    input logic         clk,
    input logic         mem_write,
    input logic         mem_read
);

localparam address_index = $clog2(DEPTH);
logic [31:0] mem[DEPTH];

always_ff @(posedge clk) begin
    if (mem_write) begin
        mem[address[address_index + 1 : 2]] <= write_data;
    end
    if (mem_read) begin
        read_data <= mem[address[address_index + 1 : 2]];
    end
end

endmodule