BITS 64         ; Mode 64 BITS

SECTION .text   ; code section
GLOBAL strcmp   ; export strcmp

strcmp:
    xor rax, rax        ; on init rax à 0, pour stocker notre res

loop:
    mov al, BYTE [rsi]
    mov bl, BYTE [rdi]

    cmp al, bl           ; on compare 1 char a la fois de chaque string
    jne not_equal

    cmp al, 0            ; si c'est = 0 alors on est arrivée à la fin de notre premiere string
    je equal

    inc rsi
    inc rdi
    jmp loop

not_equal:              ; si les 2 string ne sont pas egales
    sub bl, al
    movsx rax, bl
    ret

equal:
    xor rax, rax
    ret
