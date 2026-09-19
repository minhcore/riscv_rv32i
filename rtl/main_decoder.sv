module main_decoder(
    output logic        branch,
    output logic        result_src,
    output logic        mem_write,
    output logic        alu_src,
    output logic [1:0]  imm_src,
    output logic        reg_write,
    output logic [1:0]  alu_op,

    input logic [6:0]   op
);

always_comb begin
    case(op)
    7'b0000011: begin // lw
        reg_write   = 1;
        imm_src     = 2'b00;
        alu_src     = 1;
        mem_write   = 0;
        result_src  = 1;
        branch      = 0;
        alu_op      = 2'b00;
    end
    7'b0100011: begin // sw
        reg_write   = 0;
        imm_src     = 2'b01;
        alu_src     = 1;
        mem_write   = 1;
        result_src  = 0;
        branch      = 0;
        alu_op      = 2'b00;
    end
    7'b0110011: begin // R-type
        reg_write   = 1;
        imm_src     = 2'b00;
        alu_src     = 0;
        mem_write   = 0;
        result_src  = 0;
        branch      = 0;
        alu_op      = 2'b10;
    end
    7'b1100011: begin // beq
        reg_write   = 0;
        imm_src     = 2'b10;
        alu_src     = 0;
        mem_write   = 0;
        result_src  = 0;
        branch      = 1;
        alu_op      = 2'b01;
    end
    default: begin
        reg_write   = 0;
        imm_src     = 2'b00;
        alu_src     = 0;
        mem_write   = 0;
        result_src  = 0;
        branch      = 0;
        alu_op      = 2'b00;
    end
    endcase
end

endmodule