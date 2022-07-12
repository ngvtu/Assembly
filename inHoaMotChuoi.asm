.model small
.stack 100h
.data
    str db 'Hoc VIeN Ky thUaT mAT Ma$'
.code
main proc 
    mov ax, @data
    mov ds, ax
        
    lea si, str
    lap:
        cmp [si], '$'
        je break         
        
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
        jmp lap                                             
        
    break:     
    mov ah, 2
    int 21h   
main endp
end main