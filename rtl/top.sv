module top #(
    RAM_DEPTH = 1024,
    ROM_DEPTH = 1024,
    DEFAULT_WIDTH = 32,
    GPIO_WIDTH = 8
)(
    
    input logic     clk,
    input logic     rst_n,

    // GPIO
    output logic [GPIO_WIDTH-1:0]   gpio_out,
    input logic [GPIO_WIDTH-1:0]    gpio_in,

    // UART
    output logic                    uart_tx,
    input logic                     uart_rx
);

logic stall_net, ram_stall, apb_stall, mem_write_net, mem_read_net, ram_sel, apb_sel, psel_net, rst_n_sync1, rst_n_sync2;
logic [DEFAULT_WIDTH-1:0] address_net, write_data_net;

// APB interface
logic [DEFAULT_WIDTH-1:0] prdata_net, pwdata_net, paddr_net;
logic pready_net, pwrite_net, penable_net, pslverr_net;
logic psel_gpio_net, psel_uart_net;
logic [DEFAULT_WIDTH-1:0] prdata_gpio_net, prdata_uart_net;
logic pready_gpio_net, pready_uart_net;
logic pslverr_gpio_net, pslverr_uart_net;

assign psel_gpio_net = psel_net && (paddr_net[19:16] == 4'h0);
assign psel_uart_net = psel_net && (paddr_net[19:16] == 4'h1);

assign prdata_net = (paddr_net[19:16] == 4'h1) ? prdata_uart_net : prdata_gpio_net;
assign pready_net = (paddr_net[19:16] == 4'h1) ? pready_uart_net : pready_gpio_net;
assign pslverr_net = (paddr_net[19:16] == 4'h1) ? pslverr_uart_net : pslverr_gpio_net;

// Address Decoding
assign ram_sel = (address_net < 32'h0080_0000);
assign apb_sel = (address_net[31:20] == 12'h008);

// Stall
assign stall_net = ram_stall | apb_stall;

// Write/Read Data From RAM or APB Bus
logic [DEFAULT_WIDTH-1:0] read_data_net, ram_read_data_net, apb_read_data_net;
logic ram_mem_write_net, ram_mem_read_net, apb_mem_write_net, apb_mem_read_net;
assign ram_mem_write_net = mem_write_net && ram_sel;
assign ram_mem_read_net = mem_read_net && ram_sel;
assign apb_mem_write_net = mem_write_net && apb_sel;
assign apb_mem_read_net = mem_read_net && apb_sel;
assign read_data_net = apb_sel ? apb_read_data_net : ram_read_data_net;

// Reset Synchronizer
always_ff @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rst_n_sync1 <= 0;
        rst_n_sync2 <= 0;
    end
    else begin
        rst_n_sync1 <= 1;
        rst_n_sync2 <= rst_n_sync1;
    end
end

// CPU Core Instruction Bus
logic [DEFAULT_WIDTH-1:0] pc_net, instr_net;

cpu cpu(
    .pc(pc_net),
    .instr(instr_net),
    .alu_result(address_net),
    .write_data(write_data_net),
    .mem_write(mem_write_net),
    .mem_read(mem_read_net),
    .clk(clk),
    .rst_n(rst_n_sync2),
    .read_data(read_data_net),
    .stall(stall_net)
);

instruction_memory #(
    .DEPTH(ROM_DEPTH),
    .MEM_FILE("sw/build/mem.h")
) rom (
    .instr(instr_net),
    .address(pc_net)
);

ram #(RAM_DEPTH) ram(
    .read_data(ram_read_data_net),
    .write_data(write_data_net),
    .address(address_net),
    .clk(clk),
    .mem_write(ram_mem_write_net),
    .mem_read(ram_mem_read_net)
);

memory_controller memory_controller(
    .stall(ram_stall),
    .clk(clk),
    .rst_n(rst_n_sync2),
    .mem_read(ram_mem_read_net)
);

cpu_apb_bridge #(DEFAULT_WIDTH) cpu_apb_bridge(
    .paddr(paddr_net),
    .penable(penable_net),
    .pwrite(pwrite_net),
    .psel(psel_net),
    .pwdata(pwdata_net),
    .pclk(clk),
    .presetn(rst_n_sync2),
    .prdata(prdata_net),
    .pslverr(pslverr_net),
    .pready(pready_net),
    .cpu_stall(apb_stall),
    .cpu_slverr(), // not yet using
    .cpu_read_data(apb_read_data_net),
    .cpu_address(address_net),
    .cpu_write_data(write_data_net),
    .cpu_mem_write(apb_mem_write_net),
    .cpu_mem_read(apb_mem_read_net)
);

gpio_apb #(.PORT_WIDTH(GPIO_WIDTH), .APB_WIDTH(DEFAULT_WIDTH)) gpio(
    .data_out_port(gpio_out),
    .data_in_port(gpio_in),
    .prdata(prdata_gpio_net),
    .pready(pready_gpio_net),
    .pslverr(pslverr_gpio_net),
    .pclk(clk),
    .presetn(rst_n_sync2),
    .psel(psel_gpio_net),
    .pwrite(pwrite_net),
    .paddr(paddr_net),
    .penable(penable_net),
    .pwdata(pwdata_net)
);

uart_apb #(DEFAULT_WIDTH) uart(
    .o_tx(uart_tx),
    .i_rx(uart_rx),
    .prdata(prdata_uart_net),
    .pready(pready_uart_net),
    .pslverr(pslverr_uart_net),
    .pclk(clk),
    .presetn(rst_n_sync2),
    .psel(psel_uart_net),
    .pwrite(pwrite_net),
    .paddr(paddr_net),
    .penable(penable_net),
    .pwdata(pwdata_net)
);

endmodule