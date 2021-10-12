# strcpy(x[], y[]) -> copy y[] to x[].

.data

msg1:	.asciiz	"\nArray x : "
msg2:	.asciiz	"\nArray y : "

bsp:	.asciiz	" "

x:	.space	20
y:	.byte	2, 12, 3, 1, 5

.text
main:	li $v0, 4
	la $a0, msg2
	syscall

	jal strcpy
	la $a1, x

loop2:	lbu $a0, ($a1)
	beq $a0, $zero, exit

	li $v0, 1
	syscall

	li $v0, 4
	la $a0, bsp
	syscall

	addi $a1, $a1, 1

	j loop2

exit:	li $v0, 10
	syscall

strcpy:	addi $sp, $sp, -4
	sw $ra, 0($sp)
	la $a0, x
	la $a1, y

	addi $s0, $zero, 1

loop1:	lbu $t1, 0($a1)
	beq $t1, $zero, exit1

#	add $t2, $a0, $s0

	sb $t1, ($a0)

#	addi $s0, $s0, 1

	addi $a0, $a0, 1
	addi $a1, $a1, 1

	j loop1

exit1:	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
