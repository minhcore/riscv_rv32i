module cpu_apb_bridge #(WIDTH = 32)(
    output logic [WIDTH-1:0]    paddr,
    output logic                penable,
    output logic                pwrite,
    output logic                psel,
    output logic [WIDTH-1:0]    pwdata,

    input logic                 pclk,
    input logic                 presetn,
    input logic [WIDTH-1:0]     prdata,
    input logic                 pslverr,
    input logic                 pready,

    output logic                cpu_stall,
    output logic                cpu_slverr,
    output logic [31:0]         cpu_read_data,

    input logic [WIDTH-1:0]     cpu_address,
    input logic [WIDTH-1:0]     cpu_write_data,
    input logic                 cpu_mem_write,
    input logic                 cpu_mem_read     
);

typedef enum logic [1:0]
{
    IDLE,
    SETUP,
    ACCESS
} state_e;
state_e current_state, next_state;
logic start_condition;

assign start_condition = (cpu_mem_write || cpu_mem_read); // need cpu address condition (not yet done)
assign psel         = (current_state == SETUP) || (current_state == ACCESS);
assign penable      = (current_state == ACCESS);
assign cpu_stall    = (current_state == IDLE && start_condition) ||
                      (current_state == SETUP) ||
                      (current_state == ACCESS && !pready);
assign paddr = cpu_address;
assign pwdata = cpu_write_data;
assign pwrite = cpu_mem_write;

always_ff @(posedge pclk or negedge presetn) begin
    if (!presetn) begin
        current_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end
end

always_comb begin
    if (!presetn) begin
        next_state = IDLE;
    end 
    else begin
        case(current_state)
        IDLE: begin
            next_state = IDLE;
            if (start_condition) begin
                next_state = SETUP;
            end
        end

        SETUP: begin
            next_state = ACCESS;
        end

        ACCESS: begin
            next_state = ACCESS;
            if (pready) begin
                next_state = IDLE;
            end
        end

        default: next_state = IDLE;
        endcase
    end
end

assign cpu_read_data = prdata;

always_ff @(posedge pclk or negedge presetn) begin
    if (!presetn) begin
        cpu_slverr      <= 1'b0;
    end
    else begin
        if (current_state == ACCESS && pready) begin
            cpu_slverr <= pslverr;
        end
    end
end

endmodule