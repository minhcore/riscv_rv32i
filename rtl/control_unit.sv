module control_unit(
    output logic [1:0]  pc_src,
    output logic [1:0]  result_src,
    output logic        mem_write,
    output logic        alu_src_a,
    output logic        alu_src_b,
    output logic [2:0]  imm_src,
    output logic        reg_write,
    output logic [2:0]  alu_control,

    input logic [6:0]   op,
    input logic [2:0]   funct3,
    input logic         funct7,
    input logic         zero,
    input logic         lt,
    input logic         ltu  
);

logic branch_net, jump_net, jumr_net, take_branch;
logic [1:0] alu_op_net;

always_comb begin
   case(funct3)
    3'b000: take_branch = (zero == 1);  // beq
    3'b001: take_branch = (zero != 1);  // bne
    3'b100: take_branch = (lt == 1);    // blt
    3'b101: take_branch = (lt != 1);    // bge
    3'b110: take_branch = (ltu == 1);   // bltu
    3'b111: take_branch = (ltu != 1);   // bgeu
    default: take_branch = 1'b0;
   endcase 
end

assign pc_src[0] = (branch_net & take_branch) | jump_net;
assign pc_src[1] = jumr_net;

main_decoder main_decoder(
    .branch(branch_net),
    .jump(jump_net),
    .jumpr(jumr_net),
    .result_src(result_src),
    .mem_write(mem_write),
    .alu_src_a(alu_src_a),
    .alu_src_b(alu_src_b),
    .imm_src(imm_src),
    .reg_write(reg_write),
    .alu_op(alu_op_net),
    .op(op)
);

alu_decoder alu_decoder(
    .alu_control(alu_control),
    .op(op[5]),
    .alu_op(alu_op_net),
    .funct3(funct3),
    .funct7(funct7)
);

endmodule