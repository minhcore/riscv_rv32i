    .text
    .globl _start
_start:
    lw s0, 0(x0)        # s0 = mem[0]
    lw s1, 4(x0)        # s1 = mem[1]
    add s2, s0, s1      # s2 = s0 + s1 

loop:
    beq x0, x0, loop
    
.end
    