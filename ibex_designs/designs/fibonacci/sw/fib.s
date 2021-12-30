.globl _start
j _start
.align 7
_start: j _reset_entry
.align 2
j mtvec_handler
.align 2
j mtvec_handler
.align 2
j mtvec_handler


_reset_entry:
	li fp, 0x80000000
	addi fp, fp, 0x400
	mv a0, zero
	mv a1, zero
        mv a3, zero
        li a4, 100
	add a1, a1, 1

loop:
	add a2, a1, a0
	sw a2, 0(fp)
	addi fp, fp, 4
	mv a0, a1
	mv a1, a2
        addi a3, a3, 1
        bne a3, a4, loop

done:
        li x1, 0x80F600D0
        li x2, 0x0000DEAD
        sw x2, (x1)
        j done

mtvec_handler:
	j mtvec_handler
