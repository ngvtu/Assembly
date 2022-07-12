.model
.stack 100h
.data
    str db 13, 10, 'Hello Nguyen Van Tu$'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 0
    lap:
        cmp cx, 5     
        je  break
        
        mov ah, 9 
        lea dx, str
        int 21h
        
        inc cx
        jmp lap
    
    break:
    mov ah, 4ch
    int 21h
main endp
end main