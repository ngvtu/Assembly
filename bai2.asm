.model small
.stack 100h
.data
    tb1 db 'Nhap chuoi so (VD: 1,2,3,4): $'
    tb2 db 13, 10, 'Tong chuoi: $' 
    str db 50 dup ('$')
    sum dw 0
    so10 dw 10 
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, tb1
    int 21h
    
    mov ah, 0ah
    lea dx, str
    int 21h
    
    lea si, [str+2]   ;1,2,3,4,D0h$$$$$$$$$
    
    mov ax, 0
    
    nhapchuoi: 
        mov dx, [si]   ; [si] luu vao dl
        cmp dl, 0Dh    ; so sanh dl voi 0Dh
        je exit
        cmp dl, ','    ; neu gap ',' thi hoan thien so
        je calc        ; neu bang chuyen sang tinh toan
        mul so10       ; ax +=10 
        mov dx, [si]   ; gan lai gtri cho dx
        mov dh, 0
        sub dl, 30h    ; chuyen tu '0' -> 0
        add ax, dx     ; 
        jmp pass
    
        pass:
            inc si
            jmp nhapchuoi  ; quay lai nhap chuoi     
        calc:              ; tang si++
            add sum, ax
            mov ax, 0
            inc si
            jmp nhapchuoi
                                   
    exit:
        add sum, ax
        mov ah, 9
        lea dx, tb2
        int 21h
        mov cx, 0
        mov ax, sum
    
    nhap:         ; vd ax = 16
        mov dx, 0
        div so10  ;dx = dxax%10 = 6 ax = dxax/6
        add dx, 30h; chuyen ax = 6 -> dx = '6'
        push dx    ; dua vao ngan xep
        inc cx
        cmp ax, 0
        jne nhap   ; ax != 0 thi lap tiep
    
    xuat: 
        pop dx
        mov ah, 2h
        int 21h
        loop xuat
                    
    mov ah, 4ch
    int 21h
main endp
end main