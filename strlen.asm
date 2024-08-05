BITS 64         ; Mode 64 BITS

SECTION .text   ; code section
GLOBAL strlen   ; export strlen

strlen:
    xor rax, rax      ; initialisation de rax a 0

loop:
    cmp [rdi], BYTE 0 ; comparaison de rdi à null
    je null           ; si c'est null alors on sort de la boucle
    inc rax           ; sinon on inc rax
    inc rdi           ; et rdi
    jmp loop          ; on parcours la chaine

null:       ; fin de la boucle
    ret
