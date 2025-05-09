.global _start

.section .data
    msg_1:     .asciz " h "
    msg_2:     .asciz " m "
    msg_3:     .asciz " s "
    t:      .quad 37934
    h:      .byte 0  #часы
    m:      .byte 0  #минуты 
    s:      .byte 0   #секунды 

.section .text

_start:
    mov t(%rip), %rax
    mov $3600, %rbx 
    xor %rdx, %rdx 
    div %rbx   # В rax сейчас t //  3600, в rdx остаток 
    mov %al, h(%rip) # Сохраняю часы в переменную h

    mov %rdx, %rax # в rax теперь остаток от деления лежит то есть секунды которве остались от часа
    mov $60, %rbx
    xor %rdx, %rdx
    div %rbx # Теперь получили минуты и в rdx лежат секунды
    mov %al, m(%rip)
    mov %dl, s(%rip)

    movzbq h(%rip), %rax # movzbq - потому что rax - 64 битный регистр
    toStr
    print

    # Печать символа h 
    mov $1, %rax
    mov $1, %rdi
    lea msg_1(%rip), %rsi
    mov $3, %rdx
    syscall

    movzbq m(%rip), %rax 
    toStr
    print

    # Печать символа m
    mov $1, %rax
    mov $1, %rdi
    lea msg_2(%rip), %rsi
    mov $3, %rdx
    syscall

    movzbq s(%rip), %rax
    toStr
    print

    # Печать символа s
    mov $1, %rax
    mov $1, %rdi
    lea msg_3(%rip), %rsi
    mov $3, %rdx
    syscall

    mov $60, %rax 
    xor %rdi, %rdi
    syscall
