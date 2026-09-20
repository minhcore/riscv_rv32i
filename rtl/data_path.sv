module data_path(
    output logic [31:0] alu_result,
    output logic        zero,
    output logic [31:0] write_data,
    output logic [31:0] instr,

    input logic         clk,
    input logic         rst_n,
    input logic [1:0]   pc_src,
    input logic [1:0]   result_src,
    input logic [2:0]   alu_control,
    input logic         alu_src,
    input logic [2:0]   imm_src,
    input logic         reg_write,
    input logic [31:0]  read_data
);

logic [31:0] wd3_net, rd1_src_a, rd2_temp, src_b_net, imm_ext_net, pc_next_net, pc_net;

assign write_data = rd2_temp;

always_comb begin
    case(pc_src)
    2'b00: pc_next_net = pc_net + 32'd4;
    2'b01: pc_next_net = pc_net + imm_ext_net;
    2'b10: pc_next_net = alu_result;
    default: pc_next_net = 32'd0;
    endcase
end
program_counter program_counter(
    .pc(pc_net),
    .clk(clk),
    .rst_n(rst_n),
    .pc_next(pc_next_net)
);

instruction_memory rom(
    .instr(instr),
    .address(pc_net)
);

always_comb begin
    case(result_src)
    2'b00: wd3_net = alu_result;
    2'b01: wd3_net = read_data;
    2'b10: wd3_net = pc_net + 32'd4;
    2'b11: wd3_net = imm_ext_net;
    default: wd3_net = 0;
    endcase
end 
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

assign src_b_net = (alu_src) ? imm_ext_net : rd2_temp;
alu alu(
    .alu_result(alu_result),
    .zero(zero),
    .src_a(rd1_src_a),
    .src_b(src_b_net),
    .alu_control(alu_control)
);

extend_imm extend_imm(
    .imm_ext(imm_ext_net),
    .instr(instr),
    .imm_src(imm_src)
);

endmodule