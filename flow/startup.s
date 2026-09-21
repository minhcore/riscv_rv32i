.section .text
.globl _start

_start:
    li sp, 0x100 # sp at top RAM

    call main

_done:
    j _done
