#include "../bsp/soc_regs.h"

int main() {
  GPIO_DOUT = 0x07;
  while (1) {
  }
  return 0;
}
