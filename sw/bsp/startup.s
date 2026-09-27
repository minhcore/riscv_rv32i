.section .text
.globl _start

_start:
    # Initialize Stack Pointer to top of 4KB RAM (0x1000)
    li sp, 0x1000

    # Jump to C entry point
    call main

_exit:
    # Trap loop if main exits
    j _exit

.end
