.global _start

.section .data
    h:      .byte 1  #часы
    m:      .byte 30  #минуты 
    s:      .byte 5   #секунды 
 
    buf_2:    .space 21 #максимум 21 символов
    ln:     .byte 0xA #символ новой строки 

.section .text

_start:
    movzbq h(%rip), %rax
    imul $3600, %rax 

    xor %rbx, %rbx
    movzbq m(%rip), %rbx
    imul $60, %rbx
    add %rbx, %rax

    movzbq s(%rip), %rbx 
    add %rbx, %rax

    toStr
    print

    mov $60, %rax 
    xor %rdi, %rdi
    syscall

