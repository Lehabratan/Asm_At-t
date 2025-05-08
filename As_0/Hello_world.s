.global _start

.section .data
    msg: .asciz "Hello, World!\n"

.section .text
_start:

    mov $1, %rax #syscall write 
    mov $1, %rdi # файловый дискриптор 
    lea msg(%rip), %rsi # адрес строки 
    mov $14 , %rdx # длина строки 
    syscall

    mov $60, %rax # syscall exit
    xor %rdi, %rdi
    syscall

