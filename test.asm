.model
.stack 100h
.data

.code
main proc
    mov ax, @data
    mov ds, ax   
    
    mov ax, 20
    mov bx, 2
    add ax, bx
    
    mov ah, 4ch
    int 21h
main endp
