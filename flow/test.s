    .text
    .globl _start
_start:
    lw s0, 0(zero)      # s0 = mem[0]
    addi s1, zero, 76   # s1 = 76
    add s2, s0, s1      # s2 = s0 + s1      

loop:
    beq x0, x0, loop
    
.end
    