inchuoi macro chuoi
    mov ah, 09h
    lea dx, chuoi 
    int 21h
endm

.model small
.data
    tbao1 db 'Nhap vao ma SV: $'
    tbao2 db 13, 10, 'Ho ten sinh vien: $'
    tbao3 db 'Nguyen Van Tu$'
    tbao4 db 13, 10, 'Nhap sai ma sv$'
    masv db 'AT160452' 
    masv1 db 'at160452'
    max db 10  
    len db ?
    masv2 db 10 dup('$')
.code
main proc
    mov ax, @data
    mov ds, ax           
    mov es, ax
    
    inchuoi tbao1
    
    mov ah, 0Ah
    lea dx, max
    int 21h 
    
    cld
    mov cx, 8
    lea si, masv 
    lea di, masv2
    jmp thuong
    repe cmpsb
    je intbao2
    
thuong:    
    cld           
    mov cx, 8
    lea si, masv1 
    lea di, masv2
    repe cmpsb
    je intbao2
    
    inchuoi tbao4
    mov ah, 4ch
    int 21h
    
    intbao2:
        inchuoi tbao2
        inchuoi tbao3
        mov ah, 4ch
        int 21h
    
main endp
end