BITS 64         ; Mode 64 BITS

SECTION .text   ; code section
GLOBAL strrchr   ; export strrchr

strrchr:
    xor rax, rax

loop:
    cmp [rdi], BYTE 0
    je check

    cmp [rdi], sil     ; Comparaison du char actuel avec celui qu'on cherche
    je found           ; Si c'est le même, passe à l'étiquette found

    inc rdi             ; Passe au caractère suivant
    jmp loop

found:
    mov rax, rdi        ; Stocke l'adresse de cette occurrence dans rax
    inc rdi             ; Passe au caractère suivant
    jmp loop           ; Répète la boucle

check_found:
    mov rax, rdi        ; Stocke l'adresse de cette occurrence dans rax
    ret

end:
    ret

check:
    cmp sil, 0
    je check_found
    jne end