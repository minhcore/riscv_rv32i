.text
.align 2
.globl main

main:
    
    addi a0, zero, 10       # a0 = 10 

   
    jal  ra, target_func    # ra = PC + 4

    
    addi a2, zero, 99       # a2 = 99 

	lui a3, 0x12345

loop:
    beq  zero, zero, loop  

target_func:
    addi a1, zero, 20       # a1 = 20 
    
    
    
    jalr zero, 0(ra)
