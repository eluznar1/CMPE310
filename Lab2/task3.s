# Write a program to clear RAM locations starting at RAM address 0x50 to 0x58
# (Hint: you can mov 0x00 value)

.section .bcc
.global ram
.lcomm ram, 256

.section .text
.global clear_ram

clear_ram:
    mov $ram, %rbx      # RBX = base address of ram[]
    add $0x50, %rbx

    xorb %al, %al

    movb %al, (%rbx)
    lea 1(%rbx), %rbx

    movb %al, (%rbx)
    lea 1(%rbx), %rbx

    movb %al, (%rbx)
    lea 1(%rbx), %rbx

    movb %al, (%rbx)
    lea 1(%rbx), %rbx

    movb %al, (%rbx)
    lea 1(%rbx), %rbx

    movb %al, (%rbx)
    lea 1(%rbx), %rbx

    movb %al, (%rbx)
    lea 1(%rbx), %rbx

    movb %al, (%rbx)
    lea 1(%rbx), %rbx

    movb %al, (%rbx)

    ret

.section .note.GNU-stack,"",@progbits


