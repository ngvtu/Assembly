.model small 
.stack 100h
.data
    
    crlf db 13, 10, '$'
    chaoTay db 'Hello!$'
    chaoTa db 13, 10, 'Xin Chao!$'  
    str db 'Kien TRuc MaY TiNh'
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, chaoTay
    mov ah, 9
    int 21h
    
    lea dx, chaoTa
    int 21h       
        
    mov ah, 4ch
    int 21h
main endp

end main