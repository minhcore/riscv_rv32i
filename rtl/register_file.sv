module register_file (
    output logic [31:0] rd1,
    output logic [31:0] rd2,

    input logic         clk,
    input logic         rst_n,
    input logic [31:0]  a1,
    input logic [31:0]  a2,
    input logic [31:0]  a3,
    input logic [31:0]  wd3,
    input logic         we3   
);

logic [31:0] reg[32];

assign rd1 = reg[a1];
assign rd2 = reg[a2];

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // reset what?
    end
    else if (we3) begin
        reg[a3] <= wd3;
    end
end

endmodule