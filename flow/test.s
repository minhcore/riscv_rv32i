    .text
    .globl _start
_start:
    addi s0, zero, 10   # s0 = 10
    addi s1, zero, -5   # s1 = -5
    jal s2, label       # jump to label, store next pc -> s2
    sub s8, s1, s0      # s8 = s1 - s0     
    
label:
    or s8, s2, zero

loop:
    beq x0, x0, loop


.end
    
# Result should be:
# 1. s0 = 10, s1 = -5
# 2. s8 = 0x0000000C (address of sub s8, s1, s0)