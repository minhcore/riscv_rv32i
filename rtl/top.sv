module top(
    output logic [31:0] pc,
    output logic [31:0] alu_result, // address for memory
    output logic [31:0] write_data,
    output logic        mem_write,

    input logic         clk,
    input logic         rst_n,
    input logic [31:0]  instr,
    input logic [31:0]  read_data // data from memory
);

data_path data_path(

);

control_unit control_unit(

);

endmodule