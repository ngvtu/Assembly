.model small 
.stack 100h 
.data
    crlf db 13, 10, '$'
    tbNhapXong db 13, 10, 'Ky tu ban vua nhap la: $'
    xau db 50 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, xau
    lap: 
        mov ah, 1
        int 21h
        
        cmp al, 13  ; so sanh al bang 13 hay khong
        je nhapXong
        
        mov [si], al   ; chuyen al vao si
        inc si
        
        jmp lap   ; lap lai vong lap
        
    nhapXong:    
    mov ah, 9
    lea dx, tbNhapXong  ; xuat ra thong bao
    int 21h
    
    lea dx, xau ;in ra xau
    int 21h
    
    mov ah, 4ch
    int 21h  
main endp
end main