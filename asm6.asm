section .data
    roman_map:
        db 'I', 1, 0, 0, 0
        db 'V', 5, 0, 0, 0
        db 'X', 10, 0, 0, 0
        db 'L', 50, 0, 0, 0
        db 'C', 100, 0, 0, 0
        db 'D', 500, 0, 0, 0
        db 'M', 1000, 0, 0, 0
    roman_map_size equ ($ - roman_map) / 5

    input_prompt db "Введите римское число: ", 0
    input_buffer times 256 db 0
    output_format db "%d", 10, 0

section .text
    global main
    extern printf
    extern scanf
    extern strlen

main:
    push rbp
    mov rbp, rsp
    sub rsp, 32

    lea rdi, [input_prompt]
    xor eax, eax
    call printf

    lea rdi, [input_buffer]
    lea rsi, [input_buffer]
    xor eax, eax
    call scanf

    lea rdi, [input_buffer]
    call strlen
    mov r12, rax
    mov r13, 0
    mov r14, 0

convert_loop:
    cmp r14, r12
    jge convert_done

    lea rbx, [input_buffer]
    add rbx, r14
    movzx r15, byte [rbx]

    mov rcx, roman_map
    mov rdx, 0
find_char:
    cmp dl, byte [rcx]
    je found_char
    add rcx, 5
    inc dh
    cmp dh, roman_map_size
    jb find_char
    jmp next_iter

found_char:
    movzx r8, byte [rcx+1]

    mov r9, r14
    inc r9
    cmp r9, r12
    jge add_value

    lea rbx, [input_buffer]
    add rbx, r9
    movzx r10, byte [rbx]

    mov rcx, roman_map
    mov rdx, 0
find_next_char:
    cmp dl, byte [rcx]
    je found_next_char
    add rcx, 5
    inc dh
    cmp dh, roman_map_size
    jb find_next_char
    jmp add_value

found_next_char:
    movzx r9, byte [rcx+1]

    cmp r8, r9
    jge add_value
    sub r13, r8
    jmp next_iter

add_value:
    add r13, r8

next_iter:
    inc r14
    jmp convert_loop

convert_done:
    mov rdi, output_format
    mov rsi, r13
    xor eax, eax
    call printf

    mov rsp, rbp
    pop rbp
    xor eax, eax
    ret

