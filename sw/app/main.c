#include "../bsp/soc_regs.h"

int main() {
  volatile int count = 0;
  GPIO_DOUT = 0x00;
  while (1) {
    if (!(GPIO_DIN & 0x01)) {
      GPIO_DOUT = 0b00111111;
    } else {
      GPIO_DOUT = 0b00101010;
    }
  }
  return 0;
}
