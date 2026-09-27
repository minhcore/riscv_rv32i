module cpu #(parameter DEPTH = 1024)(
    // Instruction memory interface
    output logic [31:0] pc,
    input  logic [31:0] instr,

    // Data memory / bus interface
    output logic [31:0] alu_result, // address for memory
    output logic [31:0] write_data,
    output logic        mem_write,
    output logic        mem_read,

    input logic         clk,
    input logic         rst_n,
    input logic [31:0]  read_data, // data from memory
    input logic         stall
);

logic zero_net, lt_net, ltu_net, alu_src_a_net, alu_src_b_net, reg_write_net;
logic [3:0] alu_control_net;
logic [2:0] imm_src_net;
logic [1:0] result_src_net, pc_src_net;

data_path data_path(
    .pc(pc),
    .instr(instr),
    .alu_result(alu_result),
    .zero(zero_net),
    .lt(lt_net),
    .ltu(ltu_net),
    .write_data(write_data),
    .clk(clk),
    .rst_n(rst_n),
    .pc_src(pc_src_net),
    .result_src(result_src_net),
    .alu_control(alu_control_net),
    .alu_src_a(alu_src_a_net),
    .alu_src_b(alu_src_b_net),
    .imm_src(imm_src_net),
    .reg_write(reg_write_net),
    .read_data(read_data),
    .stall(stall)
);

control_unit control_unit(
    .pc_src(pc_src_net),
    .result_src(result_src_net),
    .mem_write(mem_write),
    .mem_read(mem_read),
    .alu_src_a(alu_src_a_net),
    .alu_src_b(alu_src_b_net),
    .imm_src(imm_src_net),
    .reg_write(reg_write_net),
    .alu_control(alu_control_net),
    .op(instr[6:0]),
    .funct3(instr[14:12]),
    .funct7(instr[30]),
    .zero(zero_net),
    .lt(lt_net),
    .ltu(ltu_net)
);

endmodule