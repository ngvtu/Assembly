; Bai 2
; Dem so luong so chia het cho 8

.model small
.stack 100
.data
    tb1 db 10,13,'Nhap vao chuoi so: $'
    str db 100 dup('$')
    so8 dw 8 
    so10 dw 10
    tb2 db 10,13,'SL so chia het cho 8: $'
    tb3 db 10,13, 'Nhap n, de ktra chia het cho n: $'   
    
.code
    mov ax,@data
    mov ds,ax
    nhapchuoi:
    mov ah,9                
        lea dx,tb1
        int 21h
      
        mov ah,0ah
        lea dx,str
        int 21h
      
        mov cx,0
        mov cl,[str+1]
        lea si,[str+2]
        mov ax,0
        mov bx,0
  
    ktrachuoi:
    mov dx,[si]
        cmp dl,','
        je tinh
        cmp dl, '-'
        je  soam
        mul so10
        mov dx,[si]
        mov dh,0
        sub dl,30h
        add ax,dx
        inc si
        jmp ktrachuoi

    soam:
        mov ah, 9
        
        
         
tinh:
    mov dx,0
    div so8
    cmp dl,0
    je find  
    
    jmp dem
     
find:
    inc bx
   
dem:
    inc si
    mov ax,0
    cmp cl,0
    je exit
    loop nhapchuoi
    
exit:
    mov ah,9
    lea dx,tb2
    int 21h
    mov cx,0
    mov ax,bx
     
nhap:
    mov dx,0
    div so10
    add dx,30h
    push dx
    inc cx
    cmp ax,0
    jne nhap
      
xuat:
    pop dx
    mov ah,2
    int 21h
    loop xuat
      
   mov ah,4ch
   int 21h
end




