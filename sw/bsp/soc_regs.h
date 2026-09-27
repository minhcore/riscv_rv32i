#ifndef SOC_REGS_H
#define SOC_REGS_H

#include <stdint.h>

/* =========================================================================
 * System Memory Map (from docs/sheet.xlsx)
 * ========================================================================= */
#define RAM_BASE_ADDR 0x00000000
#define RAM_SIZE_BYTES 4096

#define GPIO_BASE_ADDR 0x00800000
#define GPIO_SIZE_BYTES 256

/* =========================================================================
 * GPIO Register Map
 * Offset 0x0000: DOUT[15:0] (Read / Write) - Output LED data
 * Offset 0x0004: DIN[15:0]  (Read Only)    - Input Switch data
 * ========================================================================= */
#define GPIO_REG_DOUT_OFFSET 0x0000
#define GPIO_REG_DIN_OFFSET 0x0004

#define GPIO_DOUT_ADDR (GPIO_BASE_ADDR + GPIO_REG_DOUT_OFFSET)
#define GPIO_DIN_ADDR (GPIO_BASE_ADDR + GPIO_REG_DIN_OFFSET)

#define GPIO_DOUT (*(volatile uint32_t *)(GPIO_DOUT_ADDR))
#define GPIO_DIN (*(volatile uint32_t *)(GPIO_DIN_ADDR))

#endif /* SOC_REGS_H */
