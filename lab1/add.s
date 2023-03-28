.code32

SYSWRITE = 4
STDOUT = 1
SYSEXIT = 1
EXIT_SUCCESS = 0
SYSCALL = 0x80

liczba1:
    .long 0x11111111, 0x00000006, 0x00000004, 0x00000003
liczba2:
    .long 0xFFFFFFFF, 0x00000005, 0x00000003, 0xFFFFFFFF
    
.text

# x/40x $sp - wyswietlanie stosu
# 

.global _start
_start:
movl $3, %edx
movl $4, %esi
clc
pushf

loop:
    popf
    movl liczba1(,%edx,4), %eax
    movl liczba2(,%edx,4), %ebx
    adcl %ebx, %eax
    pushl %eax
    pushf
    
    subl $1, %edx
    subl $1, %esi

    jnz loop
    popf
    jnc exit

carryflaga:
    push $1
    
nop

exit:
    mov $SYSEXIT, %eax
    mov $EXIT_SUCCESS, %ebx
    int $0x80
