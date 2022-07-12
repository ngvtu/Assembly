.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi so: $'
    tb2 db 13, 10, 'So so am: $'
    tb3 db 13, 10, 'So so duong: $'
    strNum db 100 dup ('$')
    so10 dw 10
    soAm dw 0
    so dw 1
.code
    main proc
    mov ax, data
    mov ds, ax
    
    mov ah, 9
    lea dx, tb1
    int 21h
    
    mov ah, 0ah
    lea dx, strNum
    int 21h
    
    lea si, [strNum+2]
    
    nhapchuoi:
        mov dx, [si];
        cmp dl, '$'
        je calc
        cmp dl, '-'
        je demsoam
        cmp dl, ','
        je demso
        inc si
        jmp nhapchuoi
    
    demsoam:
        inc soam
        inc si
        jmp nhapchuoi
    demso:
        inc so
        inc si
        jmp nhapchuoi
    calc:
        mov ah, 9
        lea dx, tb2
        int 21h
        
        mov ax, soam
        call convert
        
        mov ah, 9
        lea dx, tb3
        int 21h
        
        mov ax, so
        sub ax, soam ; so duong = so cac so - so am                        
        call convert
        
        mov ah, 04Ch
        int 21h
main endp 
    convert:
        mov cx, 0
        pushso:
            mov dx, 0
            div so10
            add dx, 30h
            push dx
            inc cx
            cmp ax, 0
            jne pushso
        popso:
            pop dx
            mov ah, 2
            int 21h
            loop popso
        ret                                        
end main    