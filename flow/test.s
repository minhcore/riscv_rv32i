.text
.align 2
.globl main

main:
    addi t0, zero, 1
    addi t1, zero, 2
    addi t2, zero, -16
    slli a0, t0, 3
    slli a1, t1, 4
    sll a2, t0, t1
    srli a3, a0, 1
    srl a4, a1, t1
    srai a5, t2, 2
    sra a6, t2, t1
    srli a7, t2, 2

loop:
    beq zero, zero, loop
