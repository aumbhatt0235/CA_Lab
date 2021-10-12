.data

msg1:   .asciiz "Enter a message : "
msg2:   .asciiz "\nMessage : "
msg3:  .space  50

.text

main:   li $v0, 4
        la $a0, msg1
        syscall

        li $v0, 8
        la $a0, msg3
        li $a1, 50
        syscall

        li $v0, 4
        la $a0, msg2
        syscall

        li $v0, 4
        la $a0, msg3
        syscall

        li $v0, 10
        syscall