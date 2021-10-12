.data

array:	.word	1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
length:	.word	10

msg1:	.asciiz	"Length : "
msg2:	.asciiz	"\nArray : \n"
lf:	.asciiz "\n"

.text
main:	lw $t0, length	# load length from memory

	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 4
	la $a0, msg2
	syscall

	la $a1, array

	addi $t2, $zero, 0

for:	lw $a0, ($a1)
	li $v0, 1
	syscall

	li $v0, 4
	la $a0, lf
	syscall

	addi $t2, $t2, 1
	addi $a1, $a1, 4

	blt $t2, $t0, for

	li $v0, 10
	syscall
