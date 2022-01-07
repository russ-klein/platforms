.globl _start
j _start
.align 7
_start: j _entry
.align 2
j _bad_code
.align 2
j mtvec_handler
.align 2
j mtvec_handler


_entry:
        mv x1, zero
        mv x2, zero
        mv x3, zero
        mv x4, zero
        mv x5, zero
        mv x6, zero
        mv x7, zero
        mv x8, zero
        mv x9, zero
        mv x10, zero
        mv x11, zero
        mv x12, zero
        mv x13, zero
        mv x14, zero
        mv x15, zero
        mv x16, zero
        mv x17, zero
        mv x18, zero
        mv x19, zero
        mv x20, zero
        li sp, 0x80800000
        jal main
        j done

_bad_code:
        li x2, 0x100
        li x3, 0x0b
        sll x3, x3, 8
        addi x3, x3, 0xad
        sll x3, x3, 8
        addi x3, x3, 0xc0
        sll x3, x3, 8
        addi x3, x3, 0xde
        sw x3, (x2)
        j _bad_code

mtvec_handler:
	j mtvec_handler

done:
	li x1, 0x60000000
        li x2, 0x000000FF
        sw x2, (x1)
        j done
