module program_counter (
    output logic [31:0] pc,

    input logic         clk,
    input logic         rst_n,
    input logic [31:0]  pc_next  
);

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // reset pc to what?
    end
    else begin
        pc <= pc_next;
    end
end

endmodule