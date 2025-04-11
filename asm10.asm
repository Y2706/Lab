section .data
    input_format db "%d", 0
    output_format db "%d", 10, 0

section .bss
    N resd 1
    Nf resd 1
    i resd 1

section .text
    global main
    extern scanf, printf

main:
    push rbp
    mov rbp, rsp

    mov rdi, input_format
    mov rsi, N
    xor eax, eax
    call scanf

    mov dword [Nf], 0
    mov dword [i], 5

.loop:
    mov eax, [i]
    cmp eax, [N]
    jg .end_loop

    mov eax, [N]
    xor edx, edx
    div dword [i]
    add [Nf], eax

    mov eax, [i]
    imul eax, 5
    mov [i], eax

    jmp .loop

.end_loop:

    mov rdi, output_format
    mov esi, [Nf]
    xor eax, eax
    call printf

    xor eax, eax
    mov rsp, rbp
    pop rbp
    ret

