#include "../bsp/soc_regs.h"

int main() {
  volatile int count = 0;
  GPIO_DOUT = 0x00;
  while (1) {
    if (count >= 3500000) {
      GPIO_DOUT = (~GPIO_DOUT) & 0x01;
      count = 0;
    } else {
      count++;
    }
  }
  return 0;
}
