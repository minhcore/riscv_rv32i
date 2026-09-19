module alu_decoder(
    output logic [2:0]  alu_control,

    input logic         op,
    input logic [1:0]   alu_op,
    input logic [2:0]   funct3,
    input logic         funct7
);

always_comb begin
    casez({alu_op, funct3, op, funct7})
    7'b00_???_??: alu_control = 3'b000; // lw, sw
    7'b01_???_??: alu_control = 3'b001; // beq
    7'b10_000_00: alu_control = 3'b000; // add
    7'b10_000_01: alu_control = 3'b000; // add
    7'b10_000_10: alu_control = 3'b000; // add
    7'b10_000_11: alu_control = 3'b001; // sub
    7'b10_010_??: alu_control = 3'b101; // slt
    7'b10_110_??: alu_control = 3'b011; // or
    7'b10_111_??: alu_control = 3'b010; // and
    default: alu_control = 0;
    endcase
end

endmodule