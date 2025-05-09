.global _start

.section .data
buf_1:      .skip 2

.section .text

_start:
    input 
    toNumber         
    add $80, %rax
    movb %al, buf_1
    mov $buf_1, %rsi   # кладем значение из буфера в регистр rsi  
    print             

    mov $60, %rax   
    xor %rdi, %rdi      
    syscall
