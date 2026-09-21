.section .text
.globl _start

_start:
    li sp, 0x1000 # sp at top RAM

    call main

_done:
    j _done
