module alu(
    output logic [31:0] alu_result,
    output logic        zero,
    output logic        lt,
    output logic        ltu,

    input logic [31:0]  src_a,
    input logic [31:0]  src_b,
    input logic [3:0]   alu_control
);

assign zero = (alu_result == 32'd0);
assign lt = ($signed(src_a) < $signed(src_b));
assign ltu = (src_a < src_b);

always_comb begin
    case(alu_control)
    4'b0000: alu_result = src_a + src_b;
    4'b0001: alu_result = src_a - src_b;
    4'b0010: alu_result = src_a & src_b;
    4'b0011: alu_result = src_a | src_b;
    4'b0100: alu_result = src_a << src_b[4:0];
    4'b0101: alu_result = ($signed(src_a) < $signed(src_b));
    4'b0110: alu_result = src_a >> src_b[4:0];
    4'b0111: alu_result = $signed(src_a) >>> src_b[4:0];
    default: alu_result = 0;
    endcase
end

endmodule