module instruction_memory #(
    DEPTH = 1024,
    MEM_FILE = "sw/build/mem.h"
)(
    output logic [31:0]     instr,

    input logic [31:0]      address
);

localparam address_index = $clog2(DEPTH);
logic [31:0] mem[DEPTH];

assign instr = mem[address[address_index + 1 : 2]];

initial begin
    $readmemh(MEM_FILE, mem);
end

endmodule