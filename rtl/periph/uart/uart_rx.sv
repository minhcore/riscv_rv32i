module uart_rx(
    output logic        o_data_valid,
    output logic [7:0]  o_data,

    input logic         clk,
    input logic         rst_n,
    input logic         rx_en,
    input logic         baud_tick,
    input logic         i_rx,
    input logic         i_read
);

typedef enum logic [2:0] {
    IDLE,
    START_HALF_BIT,
    START_SAMPLE,
    DATA_WAIT,
    DATA_SAMPLE,
    STOP_SAMPLE
} rx_state_e;
rx_state_e current_state, next_state;
logic i_rx_syn_1, i_rx_syn;
logic prev_rx;
logic [2:0] tick_cnt;
logic [3:0] data_cnt;
logic [7:0] data_in;

// fetch data & update outputs
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        data_in <= 8'd0;
        o_data_valid <= 1'b0;
        o_data <= 8'd0;
    end
    else if (!rx_en) begin // Yosys is not agree combined with rst_n
        data_in <= 8'd0;
        o_data_valid <= 1'b0;
        o_data <= 8'd0;
    end
    else begin
        if (current_state == DATA_SAMPLE) begin
            data_in <= {i_rx_syn, data_in[7:1]};
        end 
        else if (current_state == STOP_SAMPLE) begin
            if (i_rx_syn) begin
                o_data <= data_in;
                o_data_valid <= 1'b1;
            end
        end
        else if ((current_state == IDLE) && (i_read == 1'b1)) begin
            o_data_valid <= 1'b0;
        end
    end
end

// update next state
always_comb begin
    if (!rst_n || !rx_en) begin
        next_state = IDLE;
    end
    else begin
        next_state = IDLE;

        case(current_state) 
        IDLE: begin
            if ((prev_rx == 1'b1) && (i_rx_syn == 1'b0) && (o_data_valid == 1'b0)) next_state = START_HALF_BIT;
        end

        START_HALF_BIT: begin
            next_state = START_HALF_BIT;
            if (tick_cnt == 3'd4) next_state = START_SAMPLE;
        end

        START_SAMPLE: begin
            next_state = (i_rx_syn) ? IDLE : DATA_WAIT;
        end

        DATA_WAIT: begin
            next_state = DATA_WAIT;
            if ((tick_cnt == 3'd7) && (data_cnt == 4'd8) && baud_tick) next_state = STOP_SAMPLE;
            else if ((tick_cnt == 3'd7) && (data_cnt <= 4'd7) && baud_tick) next_state = DATA_SAMPLE;
        end

        DATA_SAMPLE: begin
            next_state = DATA_WAIT;
        end

        STOP_SAMPLE: begin
            next_state = IDLE;
        end

        default: next_state = IDLE;
        endcase
    end 
end

// data counter
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
       data_cnt <= 4'b0;
    end
    else if(!rx_en) begin // Yosys is not agree combined with rst_n
        data_cnt <= 4'b0;
    end
    else if (current_state == DATA_SAMPLE) begin
       data_cnt <= data_cnt + 1;
    end
    else if ((current_state == DATA_WAIT) && (data_cnt == 4'd8) && (tick_cnt == 3'd7) && baud_tick) begin
        data_cnt <= 4'b0;
    end
end

// tick counter
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
       tick_cnt <= 3'b0;
    end
    else if (!rx_en) begin // Yosys is not agree combined with rst_n
        tick_cnt <= 3'b0;
    end
    else if ((current_state == START_HALF_BIT) && baud_tick) begin
        tick_cnt <= tick_cnt + 1;
    end
    else if ((current_state == DATA_WAIT) && baud_tick) begin
        tick_cnt <= tick_cnt + 1;
    end
    else if ((current_state == START_SAMPLE) || (current_state == DATA_SAMPLE)) begin
        tick_cnt <= 3'd0;
    end
end

// update current state
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        current_state <= IDLE;
    end
    else if (!rx_en) begin // Yosys is not agree combined with rst_n
        current_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end
end

// rx synchronizer
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        i_rx_syn_1 <= 1'b0;
        i_rx_syn <= 1'b0;
    end
    else if (!rx_en) begin // Yosys is not agree combined with rst_n
        i_rx_syn_1 <= 1'b0;
        i_rx_syn <= 1'b0;
    end
    else begin
        i_rx_syn_1 <= i_rx;
        i_rx_syn <= i_rx_syn_1;
    end
end

// detect negedge rx
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        prev_rx <= 1'b0;
    end
    else if (!rx_en) begin // Yosys is not agree combined with rst_n
        prev_rx <= 1'b0;
    end
    else begin
        prev_rx <= i_rx_syn;
    end
end

endmodule