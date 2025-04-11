.section .rodata
input_format:  .asciz "%d"
output_format: .asciz "%d "

.section .text
.globl main
main:
    pushq %rbp
    movq %rsp, %rbp
    subq $16, %rsp

read_loop:
    leaq -4(%rbp), %rsi
    leaq input_format(%rip), %rdi
    xorl %eax, %eax
    call scanf@PLT
    cmpl $1, %eax
    jne exit
    movl -4(%rbp), %ebx
    testl %ebx, %ebx
    je read_loop
    movl %ebx, %ecx
    movl $10, %edx
    movl $1, %esi

check_digits:
    testl %ecx, %ecx
    je check_ok
    movl %ecx, %eax
    movl $10, %edi
    xorl %r8d, %r8d
    divl %edi
    cmpl %edx, %edx
    jl digit_ok
    movl $0, %esi
    jmp check_ok

digit_ok:
    movl %edx, %edx
    movl %eax, %ecx
    jmp check_digits

check_ok:
    testl %esi, %esi
    je read_loop
    movl %ebx, %ecx
    xorl %r9d, %r9d

reverse_loop:
    testl %ecx, %ecx
    je print_rev
    movl %r9d, %eax
    movl $10, %edi
    imull %edi
    movl %ecx, %r8d
    xorl %edx, %edx
    divl %edi
    addl %edx, %eax
    movl %eax, %r9d
    movl %ecx, %eax
    xorl %edx, %edx
    divl %edi
    movl %eax, %ecx
    jmp reverse_loop

print_rev:
    movl %r9d, %esi
    leaq output_format(%rip), %rdi
    xorl %eax, %eax
    call printf@PLT
    jmp read_loop

exit:
    xorl %eax, %eax
    leave
    ret

