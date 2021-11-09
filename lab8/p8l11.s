# Factorial Example - Non-Leaf Procedure

.data

data1:  .word   3
msg1:   .asciiz "\nFactorial of "
msg2:   .asciiz " = "


.text
main:   li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 1
        la $s0, data1
        lw $a0, 0($s0)
        syscall

        li $v0, 4
        la $a0, msg2
        syscall

        lw $a0, data1
        jal fact

        move $a0, $v0
        li $v0, 1
        syscall

        li $v0, 10
        syscall

fact:   addi $sp, $sp, -8
        sw $a0, 4($sp)
        sw $ra, 0($sp)

        li $t0, 1
        bge $a0, $t0, next

        li $v0, 1
        addi $sp, $sp, 8
        jr $ra

next:   addi $a0, $a0, -1
        jal fact

        lw $a0, 4($sp)
        lw $ra, 0($sp)
        addi $sp, $sp, 8

        mul $v0, $a0, $v0
        jr $ra