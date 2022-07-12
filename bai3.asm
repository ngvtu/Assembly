.model small                                           
.stack 100h
.data
    tb1 db 'Nhap MSV: $'
    tb2 db 13, 10, 'Sai thong tin! $'
    tb3 db 13, 10, 'Sinh vien: Nguyen Van Tu $'
    tb4 db 13, 10, 'Nhap vao day so: $'
    tb5 db 13, 10, 'So luong snt: $'
    strMsv db 100 dup ('$')
    strNum db 100 dup ('$')
    dem dw 0
    num dw 0 
    msv db 'AT160452'
.code
main proc    
    mov ax, data
    mov ds, ax
    mov es, ax
    nhapmsv:
        mov ah, 9
        lea dx, tb1
        int 21h 
        
        mov ah, 0ah
        lea dx, strMsv
        int 21h
    kiemtra:
        cld 
        mov cx, 8    ; gan bo dem cx = 8
        lea si, strMsv+2
        lea di, msv
        repe cmpsb
        je intb1
        
        mov ah, 9
        lea dx, tb2
        int 21h
        jmp nhapmsv    
    intb1:
        mov ah, 9 
        lea dx, tb3
        int 21h
        
    nhapchuoi:
        mov ah, 9
        lea dx, tb4
        int 21h
        
        mov ah, 0ah
        lea dx, strNum
        int 21h
        
        mov ah, 9
        lea dx, tb5
        int 21h
        
        lea si, [strNum+2]
        mov bx, 0ah        ; gan bx = xuong dong
        mov ax, 0                           
        mov cx, 2                        
        
      
    xulychuoi:     ; xu ly chuoi tu '0' -> 0, bo ','
        mov dx, [si]                    
        cmp dl, '$'
        je print
        cmp dl, 0dh
        je tinhsnt
        cmp dl, ','
        je tinhsnt
        mul bx
        mov dx, [si]
        mov dh, 0
        sub dx, 30h '0' -> 0
        add ax, dx
        inc si
        jmp xulychuoi
    
    tinhsnt:
        mov num, ax
        calc: 
            mov ax, num
            cmp ax, 2
            jb next           ;neu ax = 2 -> snt
            cmp cx, ax        ;ktra tu 2-> n: neu xuat hien nghiem != n : k phai snt 
            je endnum
            mov dx, 0         ;tra lai gtri dx = 0
            div cx            ; ax = dxax/cx dx= dxax%cx
            cmp dx, 0         ; dx = 0 -> khong la snt   
            je next
            inc cx
            jmp calc
        endnum: 
            inc dem
        next:
            inc si
            mov cx, 2
            mov ax, 0
            jmp xulychuoi
    
    print:
        mov cx, 0
        mov ax, dem
            pushdx:
                mov dx, 0
                div bx
                add dx, 30h
                push dx
                inc cx
                cmp ax, 0
                jne pushdx
            popdx:
                pop dx
                mov ah, 2
                int 21h
                loop popdx                
                                                
    mov ah, 04Ch
    int 21h
main endp
end main
