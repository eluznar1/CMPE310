.section .bcc
.global ram
.lcomm ram, 256

.section .text
.global sum_loop
sum_loop:
    xorb %al, %al # sum
    movb $1, %bl # counter
    mov $10, %rcx 

loop_label:
    addb %bl, %al 
    incb %bl  # increment bl
    decq %rcx #decrease rcx by 1 
    jne loop_label
  

    movq $ram, %rbx      # RBX = base address of ram[]
    add $0x50, %rbx
    movb %al, (%rbx)

    ret

.section .note.GNU-stack,"",@progbits
