          .model small
.stack 100h
.data
    tb1 db "Nhap chuoi: $"
    str db 100 dup("$")
    tb2 db 10,13,"Nhap ky tu: $"
    char db ?       
    tb3 db 10,13,"Khong co ky tu $"
    tb4 db 10,13,"So ky tu trong chuoi $"     
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, tb1
    int 21h

    lea si,str
    xor cx, cx     ; dua cx ve 0
nhapchuoi:
    mov ah, 1      ;nhap 1 ktu tu ban phim   
    int 21h
    
    cmp al, 13      ; so sanh al vs enter
    je nhapkitu
     
    mov [si],al     ; gan al vao si 
    inc cx
    inc si
    jmp nhapchuoi
    
nhapkitu:
    mov ah,9
    lea dx, tb2      ;tb ky ty tim
    int 21h
    
    mov ah,1
    int 21h          ; nhan 1 ky tu tu ban phim
    mov char, al     ; gan al bang char
    
    lea si, str      ; gan str bang si
    xor ax,ax        ; dua ax ve 0
timkiem:    
    mov al,[si]      ; gan vtri [si] al
    cmp char,al      ; so sanh al vs char
    jne ko           ;
    inc bl           ; tang sl trung
    
ko:
    inc si           ;si ++
    loop timkiem     ; lap lai tim kiem va cx --       
           
inketqua:
    cmp bl,0         ; so sanh voi 0
    je khongtrung
    jmp cotrung
    



khongtrung:
    mov ah,9
    lea dx, tb3
    int 21h     
    jmp thoat
    
cotrung:
    mov ah,9
    lea dx, tb4
    int 21h  
    
    
    mov ax,bx        ; gan ax = bx  
    mov bx,10        ; gan bx = 10 
    mov cx,0    
    mov dx,0
insotrung:
    div bx           ; lay ax= dxax/10 dx= dxax%10
    push dx          ; push dx
    inc cx           ; cx ++
    cmp ax,0         ; ktra ax != 0
    je inso       
    xor dx,dx        ; 
    jmp insotrung
    
    inso:      
        pop bx       ; lay bx 
        mov ah, 2
        add bx, 30h  ; dua 0 --> '0'
        mov dx, bx   ; dua bx -> dl, dl len man hinh
        int 21h
        
        ;dec cx       ; cx--
        ;cmp cx, 0
        loop inso
        
           
thoat:    
    mov ah, 4ch
    int 21h
    
end main
    