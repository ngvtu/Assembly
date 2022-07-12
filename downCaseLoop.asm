.model small
.stack 100h
.data

    str db 'NguyeN Van TU$'
    
.code
main proc 
    mov ax, @data
    mov ds, ax
    
    mov cx, 13
    lea si, str
    lap:         
        cmp [si], 'A'
        jl continue
        
        cmp [si], 'Z'
        jg continue
        
        add [si], 32
        
        continue:
            mov ah, 2
            mov dl, [si]
            int 21h
        inc si
                    
        loop lap
                    
    mov ah, 4ch
    int 21h
main endp
end main