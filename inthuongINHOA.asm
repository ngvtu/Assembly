.model small
.stack 100h
.data

.code
main proc 
    mov ax, @data
    mov ds, ax
    
    mov ah, 1 
    int 21h ; thuc hien ngat 1
    
    mov dl, al
    sub dl, 32 ; dl = dl - 32
    mov ah, 2
    int 21h
    
    mov ah, 4ch
    int 21h
main endp

END main