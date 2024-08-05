BITS 64         ; Mode 64 BITS

SECTION .text   ; code section
GLOBAL memcpy   ; export memcpy

memcpy:
    cmp rsi, 0
    je null

    cmp rdi, 0
    je null

    cmp rdx, 0
    jle null

    xor rcx, rcx

loop:

    mov al, [rsi + rcx] ; deplacement du contenu de rsi dans al
    mov [rdi + rcx], al ; stock la valeur du registre al dans rdi
    inc rcx
    cmp rcx, rdx ;Comparaison avec rdx
    jne loop ; copier si rcx n'est pas null

null:
    mov rax, rdi
    ret
