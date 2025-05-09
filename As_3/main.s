.global _start

.section .data
    msg_1:     .asciz "input number : "
    msg_2:     .asciz "\nMod N: "

.section .text

_start:
    mov $1, %rax
    mov $1, %rdi
    lea msg_1(%rip), %rsi
    mov $15, %rdx 
    syscall

    input
    toNumber
    mov $10, %rbx
    xor %rdx, %rdx
    div %rbx # Деление на 10 
    mov %rdx, %r10 # сделал копию
    toStr
    print
    
    # Ввод пробела
    mov $1, %rax
    mov $1, %rdi
    lea msg_2(%rip), %rsi
    mov $8, %rdx 
    syscall

    mov %r10,  %rax # Закинул копию rcx из предыдущих вычислений в rax  
    toStr
    print

    mov $60, %rax 
    xor %rdi, %rdi
    syscall
