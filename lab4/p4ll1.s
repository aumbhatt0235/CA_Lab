.data

msg1:	.asciiz	"Length : "
msg2:	.asciiz	"\nArray : \n"
lf:	.asciiz "\n"

length:	.word	10
array:	.word	1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554

.text

main:	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 1
	la $a1, length
	lw $a0, ($a1)
	syscall

	move $t1, $a0

	li $v0, 4
	la $a0, msg2
	syscall

	addi $t0, $zero, 1
	la $a0, length

	la $a1, array

loop1:	bgt $t0, $t1, exit

	lw $a0, ($a1)
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, lf
	syscall

	addi $a1, $a1, 4
	addi $t0, $t0, 1

	j loop1

exit:	li $v0, 10
	syscall
