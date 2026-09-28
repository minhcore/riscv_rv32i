// ==============================================================================
// Module: fpga_top
// Description: Top-level wrapper for Sipeed Tang Nano 9K board.
// Integrates the RV32I SoC with onboard 27MHz clock, button, and LEDs.
// ==============================================================================

module fpga_top (
    input  logic       clk_27m,
    input  logic       btn_reset_n,
    input  logic       btn_user,
    output logic [5:0] leds
);

    logic [7:0] gpio_out;

    // Instantiate RV32I SoC Top Module
    top soc_inst (
        .clk(clk_27m),
        .rst_n(btn_reset_n),
        .gpio_out(gpio_out),
        .gpio_in({7'b0, btn_user})
    );

    // Tang Nano 9K onboard LEDs are Active-Low (0 = ON, 1 = OFF).
    // Invert the GPIO output bits so that a logic 1 in C turns the LED ON.
    assign leds[0] = ~gpio_out[0];
    assign leds[1] = ~gpio_out[1];
    assign leds[2] = ~gpio_out[2];
    assign leds[3] = ~gpio_out[3];
    assign leds[4] = ~gpio_out[4];
    assign leds[5] = ~gpio_out[5];

endmodule
