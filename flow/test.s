.text
.align 2
.globl main

main:
    
    addi t0, zero, 15
    addi t1, zero, 16
    bne t0, t1, loop
    addi t0, zero, 11

loop:
    beq  zero, zero, loop  
