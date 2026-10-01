   .globl sum_numbers
   .text

    sum_numbers:
        xor %eax, %eax # sum set to 0
        xor %rcx, %rcx # index set to 0

    loop_begin:
        cmp %rsi, %rcx # compare n to i
        je done # stop if i is >= then n

        addl (%rdi, %rcx, 4), %eax # add the number to the sum
        inc %rcx # increment the index

        jmp loop_begin # continue the loop 

    done:
        ret

    .section .note.GNU-stack,"",@progbits


