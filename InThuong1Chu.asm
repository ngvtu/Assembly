.model small
.stack 100h
.data

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
   
    
    cmp al, 'A'
    jl continue
    cmp al, 'Z'
    jg continue
    add al, 32
    
    continue:
    mov ah, 2 
    mov dl, al
    int 21h
    
    
    mov ah, 4ch
    int 21h
main endp

end main