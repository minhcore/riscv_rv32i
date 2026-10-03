#include "../bsp/soc_regs.h"

int main() {
  volatile int cnt = 0;

  // config baudrate transmit with baudrate 9600
  UART_BAUD = 352;
  UART_CONTROL = 0x3; // enable uart

  while (1) {
    if (cnt >= 3500000) {
      while (!(UART_STATUS & 0x01)) {
      }
      UART_DOUT = 'T';
      while (!(UART_STATUS & 0x01)) {
      }
      UART_DOUT = '\r';
      while (!(UART_STATUS & 0x01)) {
      }
      UART_DOUT = '\n';
      cnt = 0;
    } else {
      cnt++;
    }
  }
  return 0;
}
