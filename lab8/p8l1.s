# Lab 8 - Binary Search - 2019A7PS0235U

.data

array:  .word   2, 4, 6, 8
length: .word   4

msg1:   .asciiz "\nElement found @ "
msg2:   .asciiz "\nElement not found"

.text

main:       la $a0, array       # $a0 -> array
            li $a1, 7           # $a1 -> srch elm = 4
            li $a2, 0           # $a2 -> low
            lw $a3, length      # $a3 -> length
            addi $a3, $a3, -1   # $a3 -> length - 1

            jal search

            li $t3, -1
            beq $t3, $v1, notFound

            li $v0, 4
            la $a0, msg1
            syscall

            li $v0, 1
            move $a0, $v1
            syscall

            j exit

notFound:   li $v0, 4
            la $a0, msg2
            syscall

exit:       li $v0, 10
            syscall

search:     addi $sp, $sp, -4
            sw $ra, 0($sp)
            ble $a2, $a3, L1
            li $v1, -1
            addi $sp, $sp, 4
            jr $ra

L1:         add $t0, $a2, $a3   # $t0 -> mid(offset) = low + high
            srl $t0, $t0, 1     # $t0 -> mid(offset) /= 2

            sll $t1, $t0, 2     # $t1 -> mid(offset) $t0 * 4 (as memory is WORD organzied)
            add $t1, $t1, $a0   # $t1 -> element location = base $a0 + mid(offset) $t1

            lw $t2, 0($t1)
            beq $a1, $t2, return   # if srch elm. == element @ location : return
            # else
            blt $a1, $t2, less_than
            addi $t0, $t0, 1
            move $a2, $t0
            jal search

            lw $ra, 0($sp)
            addi $sp, $sp, 4
            jr $ra

less_than:  addi $t0, $t0, -1
            move $a3, $t0
            jal search
            lw $ra, 0($sp)
            addi $sp, $sp, 4
            jr $ra

return:     move $v1, $t0
            addi $sp, $sp, 4
            jr $ra

