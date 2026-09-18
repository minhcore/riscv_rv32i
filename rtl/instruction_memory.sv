module instruction_memory(
    output logic [31:0]     instr,

    input logic [31:0]      address
);

logic [31:0] mem[1024];

assign instr = mem[address[11:2]];

initial begin
    $readmemh("flow/mem.h", mem);
end

endmodule