.text
.align 2
.globl main

main:
    addi a0, zero, 0
    addi t0, zero, -5
    addi t1, zero, 5
    blt t0, t1, test_bge
    addi a0, zero, 1

test_bge:
    addi a0, zero, 10
    bge t1, t0, test_bge_eq
    addi a0, zero, 2

test_bge_eq:
    addi a0, zero, 20
    bge t1, t1, test_bltu
    addi a0, zero, 3

test_bltu:
    addi a0, zero, 30
    addi t2, zero, 1
    addi t3, zero, -1
    bltu t2, t3, test_bgeu
    addi a0, zero, 4

test_bgeu:
    addi a0, zero, 40
    bgeu t3, t2, pass
    addi a0, zero, 5

pass:
    addi a0, zero, 100

loop:
    beq zero, zero, loop
