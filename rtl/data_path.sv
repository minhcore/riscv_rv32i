module data_path(
    output logic [31:0] alu_result,
    output logic        zero,
    output logic [31:0] write_data,

    input logic         clk,
    input logic         rst_n,
    input logic         pc_src,
    input logic         result_src,
    input logic         alu_control,
    input logic         alu_src,
    input logic [1:0]   imm_src,
    input logic         reg_write,
    input logic [31:0]  instr,
    input logic [31:0]  read_data
);

logic [31:0] wd3_temp, rd1_src_a, rd2_temp, src_b_net, imm_ext_tmp;

assign write_data = rd2_temp;

assign wd3_net = (result_src) ? read_data : alu_result; 
register_file register_file(
    .rd1(rd1_src_a),
    .rd2(rd2_temp),
    .clk(clk),
    .rst_n(rst_n),
    .a1(instr[19:15]),
    .a2(instr[24:20]),
    .a3(instr[11:7]),
    .wd3(wd3_net),
    .we3(reg_write)
);

assign src_b_net = (alu_src) ? imm_ext_tmp : rd2_temp;
alu alu(
    .alu_result(alu_result),
    .zero(zero),
    .src_a(rd1_src_a),
    .src_b(src_b_net),
    .alu_control(alu_control)
);

extend_imm extend_imm(
    .imm_ext(imm_ext_tmp),
    .instr(instr),
    .imm_src(imm_src)
);

endmodule