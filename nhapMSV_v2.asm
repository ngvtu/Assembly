.model small
.stack 100h
.data
    tb1 db 'Nhap MSV: $'
    tb2 db 13, 10, 'Ten sinh vien: Nguyen Van Tu$'
    tb3 db 13, 10, 'Thong tin sai! $'
    msv db 'AT160452'
    str db 100,?,100 dup 50 ('$')
    
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es,ax
    ;nhap chuoi
    nhapmsv:
        mov ah, 9
        lea dx, tb1    
        int 21h
        
        mov ah, 0ah
        lea dx, str  ;nhap chuoi
        int 21h           
    kiemtra:  
        cld          ;chon chieu xu ly chuoi
        mov cx, 8
        lea si, [str+2];gan phan tu dau tien str --> si
        lea di, msv  ;gan phan tu dau tien msv --> di
        repe cmpsb   ;so sanh tung phan tu cua si, di
        je intb1     ;neu bang nhau chuyen sang intb1
        
        mov ah, 9
        lea dx, tb3  ;tb3
        int 21h
        
        jmp nhapmsv  ;nhay den nhapmsv
        ;jmp thoat
        
    intb1:
        mov ah, 9
        lea dx, tb2
        int 21h        
    thoat:
        mov ah, 4ch
        int 21h
main endp
end main