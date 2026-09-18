module instruction_memory(
    output logic [31:0]     instr,

    input logic [31:0]      address
);

logic [31:0] mem[1024];

assign instr = mem[address];

initial begin
    $readmemh("mem.txt", mem);
end

endmodule