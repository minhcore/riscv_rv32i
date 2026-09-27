module memory_controller (
    output logic    stall,
    
    input logic     clk,
    input logic     rst_n,
    input logic     mem_read
);

logic waiting;

always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        waiting <= 0;
    end
    else begin
        if (mem_read && !waiting) waiting <= 1;
        else waiting <= 0;
    end
end

assign stall = mem_read && !waiting;

endmodule