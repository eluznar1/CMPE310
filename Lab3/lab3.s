    .section .bss

.lcomm strA, 256
.lcomm strB, 256
.lcomm outBuff, 32

    .section    .data 

promptA: .asciz "Enter first string: "
promptB: .asciz "Enter second string: "
finalMSG: .asciz "Haming Distance: "
newLine: .asciz "\n"

    .section .text
    .global _start 

_start:
mov $1, %rax
mov $1, %rdi
lea promptA(%rip), %rsi
mov $20, %rdx
syscall

mov $0, %rax
mov $0, %rdi
lea strA(%rip), %rsi
mov $255, %rdx
syscall

mov %rax, %r8 
lea strA(%rip), %r12 
cmp $0, %r8 
je read_second 
mov %r8, %rcx 
dec %rcx 
movzbq (%r12, %rcx, 1), %rbx 
cmp $10, %bl 
jne read_second
movb $0, (%r12,%rcx,1)
dec %r8


read_second:
mov $1, %rax
mov $1, %rdi
lea promptB(%rip), %rsi
mov $21, %rdx
syscall

mov $0, %rax
mov $0, %rdi
lea strB(%rip), %rsi
mov $255, %rdx
syscall

mov %rax, %r9
lea strB(%rip), %r13
cmp $0, %r9
je set_min
mov %r9, %rcx
dec %rcx
movzbq (%r13, %rcx, 1), %rbx
cmp $10, %bl
jne set_min
movb $0, (%r13, %rcx, 1)
dec %r9

set_min:
mov %r8, %r10
cmp %r9, %r10
jbe compare_strings
mov %r9, %r10 

compare_strings:
xor %r14, %r14 
xor %r11, %r11

character_compare:
cmp %r10, %r11
je print_final

mov (%r12, %r11, 1), %al
xor (%r13, %r11, 1), %al

mov $8, %cl 

count_num_bits:
shr $1, %al 
jnc bit_zero
inc %r14
bit_zero:
dec %cl 
jnz count_num_bits

inc %r11
jmp character_compare

print_final:
mov $1, %rax
mov $1, %rdi
lea finalMSG(%rip), %rsi
mov $19, %rdx
syscall

lea outBuff(%rip), %rsi
add $31, %rsi
movb $0, (%rsi)
mov %r14, %rax
cmp $0, %rax
jne make_digits
dec %rsi
movb $'0', (%rsi)
jmp write_digits

make_digits: 
mov $10, %rbx

digits_loop:
xor %rdx, %rdx
div %rbx
add $'0', %dl 
dec %rsi
mov %dl, (%rsi)
cmp $0, %rax
jne digits_loop

write_digits:
lea outBuff(%rip), %rcx
add $31, %rcx
sub %rsi, %rcx

mov $1, %rax
mov $1, %rdi
mov %rsi, %rsi
mov %rcx, %rdx
syscall

mov $1, %rax
mov $1, %rdi
lea newLine(%rip), %rsi
mov $1, %rdx
syscall

mov $60, %rax
xor %rdi, %rdi
syscall






















