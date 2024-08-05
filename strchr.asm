BITS 64         ; Mode 64 BITS

SECTION .text   ; code section
GLOBAL strchr   ; export strchr

strchr:
    xor rax, rax    ; initialisation de rax à 0;

loop:
    cmp [rdi], BYTE 0
    je check

    cmp [rdi], sil    ; comparaison du caractere de la chaine avec le char stocké dans le registre SIL
    je found

    inc rdi
    jmp loop

found:                   ; le char recherché a été trouvé
    mov rax, rdi         ; stock, l'adresse du char trouvé dans rax
    ret

not_found:
    xor rax, rax        ; on retourne 0
    ret

check:
    cmp sil, 0
    je found
    jne not_found