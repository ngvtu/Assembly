 .model small 
 .stack 100h
 .data
    tb1 db 'Nhap vao MSV: $'
    tb2 db 13, 10, 'Sai thong tin! $'
    tb3 db 13, 10, 'Sinh vien: Nguyen Van Tu$'
    str db 50 dup ('$')
    msv db 'AT160452'
    
 .code
 main proc 
    mov ax, @data
    mov ds, ax
    mov es, ax 
    
    nhapmsv:
        mov ah, 9
        lea dx, tb1
        int 21h
        
        mov ah, 0ah
        lea dx, str
        int 21h
    kiemtra:
        ;cld
        mov cx, 8
        lea si, [str+2]
        lea di, msv
        repe cmpsb
        je intb1
        
        mov ah, 9
        lea dx, tb2
        int 21h
        
        jmp nhapmsv
        ;jmp thoat     
    intb1:
        mov ah, 9
        lea dx, tb3
        int 21h
    thoat:        
    mov ah, 4ch 
    int 21h
main endp
end main