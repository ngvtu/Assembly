.model
.stack 100h
.data
    tb1 db 13, 10, 'Nguyen Van Tu$'
.code
main proc 
    mov ax, @data
    mov ds, ax
    
    mov cx, 5
    lap:
        mov ah, 9
        lea dx, tb1
        int 21h   
        loop lap
        
    mov ah, 4ch
    int 21h
main endp
end main