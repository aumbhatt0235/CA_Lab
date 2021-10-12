# 2019A7PS0235U - Lab 3
# Practice Program 1 (Manual - Pg32): Calculate the surface area and volume of a cuboid (take dims as user input).

.data

msg1:	.asciiz	"Enter L : "
msg2:	.asciiz	"\nEnter B : "
msg3:	.asciiz	"\nEnter H : "

msg4:	.asciiz "\nVolume of Cuboid = "
msg5:	.asciiz	"\nSurface area of Cuboid : "

.text

main:	la $a0, msg1
	jal print

	jal input
	move $t0, $v0	# $t0 = L

	la $a0, msg2
	jal print

	jal input
	move $t1, $v0	# $t1 = B

	la $a0, msg3
	jal print

	jal input
	move $t2, $v0	# $t2 = H

# $t3 = Volume

	mul $t3, $t0, $t1
	mul $t3, $t3, $t2

# Print Volume
	la $a0, msg4
	jal print

	li $v0, 1
	move $a0, $t3
	syscall

# $t4 = Surface Area

	mul $t4, $t0, $t1	# l * b
	mul $t5, $t1, $t2	# b * h
	add $t4, $t4, $t5	# (l * b) + (b * h)
	mul $t5, $t0, $t2	# l * h
	add $t4, $t4, $t5	# (l * b) + (b * h) + (l * h)
	mul $t4, $t4, 2		# 2 * [ (l * b) + (b * h) + (l * h) ]

# Print Surface Area

	la $a0, msg5
	jal print

	li $v0, 1
	move $a0, $t4
	syscall

	j exit

print:	li $v0, 4
	syscall
	jr $ra

input:	li $v0, 5
	syscall
	jr $ra

exit:	li $v0, 10
	syscall

# 2019A7PS0235U - Lab 3
