module alu(
    output logic [31:0] alu_result,
    output logic        zero,
    output logic        lt,
    output logic        ltu,

    input logic [31:0]  src_a,
    input logic [31:0]  src_b,
    input logic [2:0]   alu_control
);

assign zero = (alu_result == 32'd0);
assign lt = ($signed(src_a) < $signed(src_b));
assign ltu = (src_a < src_b);

always_comb begin
    case(alu_control)
    3'b000: alu_result = src_a + src_b;
    3'b001: alu_result = src_a - src_b;
    3'b010: alu_result = src_a & src_b;
    3'b011: alu_result = src_a | src_b;
    3'b101: alu_result = ($signed(src_a) < $signed(src_b));
    default: alu_result = 0;
    endcase
end

endmodule