.section .bcc
.global ram
.lcomm ram, 256

.section .text
.global fill_ram

fill_ram:
    mov $ram, %rbx      # RBX = base address of ram[]
    add $0x50, %rbx

    movb $0xFF, (%rbx)
    lea 1(%rbx), %rbx

    movb $0xFF, (%rbx)
    lea 1(%rbx), %rbx

    movb $0xFF, (%rbx)
    lea 1(%rbx), %rbx

    movb $0xFF, (%rbx)
    lea 1(%rbx), %rbx

    movb $0xFF, (%rbx)
    lea 1(%rbx), %rbx

    movb $0xFF, (%rbx)
    lea 1(%rbx), %rbx

    movb $0xFF, (%rbx)
    lea 1(%rbx), %rbx

    movb $0xFF, (%rbx)
    lea 1(%rbx), %rbx

    movb $0xFF, (%rbx)

    ret 

.section .note.GNU-stack,"",@progbits
