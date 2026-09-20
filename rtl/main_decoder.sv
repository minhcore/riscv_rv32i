module main_decoder(
    output logic        branch,
    output logic        jump,
    output logic        jumpr,
    output logic [1:0]  result_src,
    output logic        mem_write,
    output logic        alu_src,
    output logic [2:0]  imm_src,
    output logic        reg_write,
    output logic [1:0]  alu_op,

    input logic [6:0]   op
);

always_comb begin
    case(op)
    7'b0000011: begin // lw
        reg_write   = 1;
        imm_src     = 3'b000;
        alu_src     = 1;
        mem_write   = 0;
        result_src  = 2'b01;
        branch      = 0;
        alu_op      = 2'b00;
        jump        = 0;
        jumpr       = 0;
    end
    7'b0100011: begin // sw
        reg_write   = 0;
        imm_src     = 3'b001;
        alu_src     = 1;
        mem_write   = 1;
        result_src  = 2'b00;
        branch      = 0;
        alu_op      = 2'b00;
        jump        = 0;
        jumpr       = 0;
    end
    7'b0110011: begin // R-type
        reg_write   = 1;
        imm_src     = 3'b000;
        alu_src     = 0;
        mem_write   = 0;
        result_src  = 2'b00;
        branch      = 0;
        alu_op      = 2'b10;
        jump        = 0;
        jumpr       = 0;
    end
    7'b1100011: begin // beq
        reg_write   = 0;
        imm_src     = 3'b010;
        alu_src     = 0;
        mem_write   = 0;
        result_src  = 2'b00;
        branch      = 1;
        alu_op      = 2'b01;
        jump        = 0;
        jumpr       = 0;
    end
    7'b0010011: begin // addi
        reg_write   = 1;
        imm_src     = 3'b000;
        alu_src     = 1;
        mem_write   = 0;
        result_src  = 2'b00;
        branch      = 0;
        alu_op      = 2'b10;
        jump        = 0;
        jumpr       = 0;
    end
    7'b1101111: begin // jal
        reg_write   = 1;
        imm_src     = 3'b011;
        alu_src     = 0;
        mem_write   = 0;
        result_src  = 2'b10;
        branch      = 0;
        alu_op      = 2'b10;
        jump        = 1;
        jumpr       = 0;
    end
    7'b1100111: begin // jalr
        reg_write   = 1;
        imm_src     = 3'b000;
        alu_src     = 1;
        mem_write   = 0;
        result_src  = 2'b10;
        branch      = 0;
        alu_op      = 2'b10;
        jump        = 0;
        jumpr       = 1;
    end
    7'b0110111: begin // lui
        reg_write   = 1;
        imm_src     = 3'b100;
        alu_src     = 0;
        mem_write   = 0;
        result_src  = 2'b11;
        branch      = 0;
        alu_op      = 2'b00;
        jump        = 0;
        jumpr       = 0;
    end
    default: begin
        reg_write   = 0;
        imm_src     = 3'b000;
        alu_src     = 0;
        mem_write   = 0;
        result_src  = 2'b00;
        branch      = 0;
        alu_op      = 2'b00;
        jump        = 0;
        jumpr       = 0;
    end
    endcase
end

endmodule