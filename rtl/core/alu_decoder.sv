module alu_decoder(
    output logic [3:0]  alu_control,

    input logic         op,
    input logic [1:0]   alu_op,
    input logic [2:0]   funct3,
    input logic         funct7
);

always_comb begin
    casez({alu_op, funct3, op, funct7})
    7'b00_???_??: alu_control = 4'b0000; // lw, sw
    7'b01_???_??: alu_control = 4'b0001; // beq
    7'b10_000_00,
    7'b10_000_01,
    7'b10_000_10: alu_control = 4'b0000; // add
    7'b10_000_11: alu_control = 4'b0001; // sub
    7'b10_010_??: alu_control = 4'b0101; // slt
    7'b10_110_??: alu_control = 4'b0011; // or
    7'b10_111_??: alu_control = 4'b0010; // and
    7'b10_001_??: alu_control = 4'b0100; // sll, sli
    7'b10_101_?0: alu_control = 4'b0110; // srl, srli
    7'b10_101_?1: alu_control = 4'b0111; // sra, srai
    default: alu_control = 0;
    endcase
end

endmodule