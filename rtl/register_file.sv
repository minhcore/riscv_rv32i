module register_file (
    output logic [31:0] rd1,
    output logic [31:0] rd2,

    input logic         clk,
    input logic         rst_n,
    input logic [4:0]   a1,
    input logic [4:0]   a2,
    input logic [4:0]   a3,
    input logic [31:0]  wd3,
    input logic         we3   
);

logic [31:0] internal_register[32];

assign rd1 = (a1 == 0) ? 32'd0 : internal_register[a1];
assign rd2 = (a2 == 0) ? 32'd0 : internal_register[a2];

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // reset what?
    end
    else if (we3) begin
        internal_register[a3] <= wd3;
    end
end

endmodule