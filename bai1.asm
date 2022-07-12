.model small
.stack 100h
.data
    tbNhapMsv db 'Nhap ma sinh vien: $'
    msv db 100 dup ('$')
    tbMsv db 13, 10, 'Ma sinh vien la: $'
    tbTenSv db 13, 10, 'Ten sv: Nguyen Van Tu$'
    
    tbNhapN db 13, 10, 'Nhap vao so n: $'
    tbN db 13, 10, 'n! = $'    
    so10 dw 10
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, tbNhapMsv
    int 21h
    
    mov ah, 0ah
    lea dx, msv
    int 21h ;Nhap ten tu ban phim
    
    mov ah, 9
    lea dx, tbMsv
    int 21h ;in thong bao MSV    
    
    lea dx, [msv+2]
    int 21h ; in MSV
    
    lea dx, tbTenSv
    int 21h ;in thong bao Ten
    
    ;===============================
    mov ah, 9
    lea dx, tbNhapN
    int 21h ;in thong bao nhap n
    
    mov ah, 1
    int 21h ; nhap n tu ban phim
    
    sub al, 30h ;chuyen dag chu thanh so '0' --> 0
    
    mov cx, 0
    mov cl, al
    
    mov ah, 9
    lea dx, tbN
    int 21h
    
    mov ax, 1 ;khoi tao gia tri ban dau    
    mov bx, 1 ;bien tang dan
    
    giaiThua:
        mul bx  ; ax=ax*bx
        inc bx  ; bx++
        cmp bx, cx
        jbe giaiThua ; cx <=bx thi tinh giai thua  
    mov cx, 0
    
    nhap:
        mov dx, 0
        div so10 ;dx=dxax%10
        add dx, 30h ; doi tu 3 --> '3' 
        push dx    ; day dx vao ngan xep
        inc cx
        cmp ax, 0
        jne nhap ; neu ax khac 0 
    xuat:
        pop dx
        mov ah, 2
        int 21h
        loop xuat
        
    mov ah, 4ch
    int 21h
main endp
end main