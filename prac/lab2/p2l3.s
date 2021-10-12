# Lab 2
# Program 3 : Calculate the factorial of a number 'N'.
.data

msg1:   .asciiz "Enter N : "
msg2:   .asciiz "\nfact(N) : "

.text

main:   li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 5
        syscall

        move $t0, $v0

        addi $t1, $zero, 1
        addi $t3, $zero, 1

mulNum: mul $t3, $t3, $t1
        addi $t1, $t1, 1
        ble $t1, $t0, mulNum

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 1
        move $a0, $t3
        syscall

        li $v0, 10
        syscall