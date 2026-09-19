module control_unit(
    output logic        pc_src,
    output logic [1:0]  result_src,
    output logic        mem_write,
    output logic        alu_src,
    output logic [1:0]  imm_src,
    output logic        reg_write,
    output logic [2:0]  alu_control,

    input logic [6:0]   op,
    input logic [2:0]   funct3,
    input logic         funct7,
    input logic         zero    
);

logic branch_net, jump_net;
logic [1:0] alu_op_net;

assign pc_src = (branch_net & zero) | jump_net;

main_decoder main_decoder(
    .branch(branch_net),
    .jump(jump_net),
    .result_src(result_src),
    .mem_write(mem_write),
    .alu_src(alu_src),
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