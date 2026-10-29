.section .data

msg:

    .string "Max value is %d\n"

Numbers:  
   .long 1 
   .long 15 
   .long 4  
   .long 2 
   .long 7  
   .long 9  
   .long 23 
   .long 7  
   .long 3 
   .long 11 
Array_length:  
   .long 10   

max_value:
    .long 0

.section .text
.globl main

main:

movl    $1, %ecx ## index starts at 0
movl Numbers, %eax
movl %eax, max_value

L1:

cmpl Array_length, %ecx
jge L3

movl    Numbers(,%ecx,4), %eax
cmpl max_value, %eax
jle L2
movl %eax, max_value

L2:
incl %ecx
jmp L1


L3:
movl max_value, %eax
movl %eax, %esi
movl $msg, %edi
movl $0, %eax
call printf
leave 
ret

