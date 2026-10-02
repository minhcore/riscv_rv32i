module uart_tx (
    output logic        o_tx,
    output logic        o_ready,

    input logic         clk,
    input logic         rst_n,
    input logic [7:0]   i_data,
    input logic         baud_tick,
    input logic         tx_en
);

typedef enum logic [2:0] { 
    IDLE,
    START,
    DATA,
    STOP
} tx_state_e;
tx_state_e current_state = IDLE;
tx_state_e next_state;
logic [3:0] cnt;
logic [7:0] data_in;

// update outputs
always_comb begin
    if (!rst_n || !tx_en) begin
        o_tx    = 1'b1;
        o_ready = 1'b0;
    end else begin
        o_tx    = 1'b1;
        o_ready = 1'b1;

        case(current_state)
        START: begin
            /* - not yet implement consecutive transfer
               - focus on single transfer */
            o_tx    = 1'b0;
            o_ready = 1'b0;
        end

        DATA: begin
            o_ready = 1'b0;
            o_tx    = data_in[0];
        end

        STOP: begin
            o_tx    = 1'b1; 
            o_ready = 1'b0;
        end
        default: begin
            o_tx    = 1'b1;
            o_ready = 1'b1;
        end
        endcase
    end
end

// update next state
always_comb begin
    if (!rst_n  || !tx_en) begin
        next_state = IDLE;
    end
    else begin
        next_state = IDLE; // default value
        
        case(current_state)
            IDLE: begin
                if (baud_tick) next_state = START;
            end

            START: begin
                next_state = START;
                if (baud_tick) next_state = DATA;
            end

            DATA: begin
                next_state = DATA;
                if ((cnt == 4'd7) && baud_tick) next_state = STOP;
            end

            STOP: begin
                next_state = STOP;
                if (baud_tick) next_state = IDLE;
            end
            default: next_state = IDLE;
        endcase
    end
end

// latch & shift
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n || !tx_en) begin
        data_in <= 8'd0;
    end else if (current_state == START) begin
        data_in <= i_data;
    end else if ((current_state == DATA) && (baud_tick)) begin
        data_in <= data_in >> 1;
    end
end

// counter
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n || !tx_en) begin
        cnt <= 4'd0;
    end
    else if (current_state == DATA && baud_tick) begin
        if (cnt == 4'd7) cnt <= 4'd0;
        else cnt <= cnt + 4'd1;
    end
end

// update current state
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        current_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end
end

endmodule