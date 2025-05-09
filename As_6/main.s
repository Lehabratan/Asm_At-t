.global _start

.section .bss
buf_1: .skip 27       # буфер под 26 символов + 0

.section .text

_start:
    input
    toNumber         # результат в %rax (n)
    mov %rax, %rcx   # сохраним n в %rcx

    mov $buf_1, %rsi   # указатель на буфер
    mov $97, %al     # ASCII 'a'

.loop_a:
    movb %al, (%rsi) # записываем символ в буфер
    inc %rsi         # следующий байт
    inc %al          # следующая буква
    loop .loop_a     # уменьшаем rcx, продолжаем если не 0

    movb $0, (%rsi)  # нуль-терминатор строки

    mov $buf_1, %rsi
    print

    mov $60, %rax
    xor %rdi, %rdi
    syscall
