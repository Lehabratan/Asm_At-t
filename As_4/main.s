.global _start

.section .data

.section .text

_start:
    input
    toNumber

    toStr
    print                 

  
    mov $60, %rax          
    xor %rdi, %rdi          
    syscall                
