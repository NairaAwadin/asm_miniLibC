BITS 64         ; Mode 64 BITS

SECTION .text   ; code section
GLOBAL memset   ; export memset

memset:
    cmp rdx, 0
    je final

    cmp rdi, 0
    je final

    xor rcx, rcx

loop:
    cmp rcx, rdx
    je final
    mov [rdi + rcx], sil
    inc rcx
    jmp loop ; saut conditionnel, si le reg rcx n'est pas = 0;

final:
    mov rax, rdi
    ret
