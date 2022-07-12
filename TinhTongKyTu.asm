.model small
.stack 100h
.data
    tbNhapXong db 13, 10, 'So ky tu cua chuoi la: $'
    xau db dup 50 ('$')

.code
MAIN PROC
    mov ax, @data
    mov ds, ax
    
    mov cx, 0
    lea si, xau
    lap:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je nhapXong
        
        inc cx
        
        mov [si], al
        inc si
        
        jmp lap
        
    nhapXong:    
    mov ah, 9
    lea dx, tbNhapXong
    int 21h
        
    mov dl, cl
    add dl, '0'
    mov ah, 2
    int 21h                
    
    mov ah, 4ch
    int 21h
MAIN ENDP
END MAIN