# Lab 3
# Program 1 : Check if 'N' is odd or even.
.data

msg1:   .asciiz "Enter N : "
msg2:   .asciiz " is odd"
msg3:   .asciiz " is even"

.text

main:   li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall

        move $t0, $v0

        addi $t1, $zero, 2
        div $t0, $t1

        li $v0, 1
        move $a0, $t0
        syscall

        mfhi $t3
        beq $t3, $zero, isEven

        li $v0, 4
        la $a0, msg2
        syscall

        j exit

isEven: li $v0, 4
        la $a0, msg3
        syscall

exit:   li $v0, 10
        syscall