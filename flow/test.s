.text
.globl _start
_start:
	# t0 = address of gpio base = 0x00800000
	# t1 = value of gpio output = 0x55 (8'b0101_0101)

	lui t0, 0x800
	addi t1, zero, 0x55
	sw t1, 0(t0)

	# Load input value from GPIO DIN (offset 0x04)
	lw t2, 4(t0)

loop:
	j loop

.end