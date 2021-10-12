.data

msg1:	.asciiz	"N = "
msg2:	.asciiz "\nFact(N) = "

N:	.word	3

.text
main:	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 1
	la $a1, N
	lw $a0, ($a1)
	syscall

# Load N
	la $a0, N
	jal fact

# Print Fact(N)

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 1
	move $a0, $s0
	syscall

	j exit

fact:	addi $sp, $sp, -8	# make space for 2 values in stack
	sw $ra, 4($sp)		# store $ra value into upper 4 bytes of stack
	sw $a0, 0($sp)		# store N value in lower 4bytes of stack

	slti $t0, $a0, 1	# if N < 1 -> $t0 = 1
	beq $t0, $zero, rec
	addi $v0, $zero ,1
	addi $sp, $sp, 8
	jr $ra

rec:	addi $a0, $a0, -1	# N = N - 1
	jal fact

	lw $a0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8

	mul $v0, $v0, $a0

	jr $ra


exit:	li $v0, 10
	syscall
