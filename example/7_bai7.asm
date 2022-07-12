.model small
.stack 100
.data
;khai bao bien va hang
CRLF db 13,10,'$'
.code
main proc

    mov ax, @data
    mov ds, ax

    mov ah,1         ; Nhap
    int 21h          ; 
    mov bl,al        ;in ra man hinh
    mov ah,9         ; 
    lea dx,CRLF      ;
    int 21h
    mov ah,2
    
display:
    cmp bl,'z'
    jg Exit          ;nhay neu lon hon
    mov dl,bl        ;in ky tu
    int 21h          ;
    mov dl,20h       ;in khoang trang
    int 21h          ;
    inc bl           ; tang gia tri
    jmp display

Exit:
    mov ah, 4ch
    int 21h    

main endp
;cac chuong trinh con neu co
end main