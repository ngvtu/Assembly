.model small
.stack 50
.data
      mang DB 50 dup(?)  
      kt Db ?
      tb1 db 'Nhap chuoi: $'
      tb2 db 10, 13, 'So ki tu trong chuoi la: $' 
      chia db 10
.code
    main proc
        mov ax,@data
        mov ds,ax 
        lea dx, tb1  ;in ra man hinh chuoi tb1
        mov ah,9
        int 21h
        
        ;nhap mang
        Lea Si,mang
        xor cx,cx 
Lapnhap:       
        mov ah,1          ;nhap
        int 21h 
        cmp al,0Dh
        je Xuong          ; nhay neu bang
        mov [si], al
        inc si
        inc cx
        jmp Lapnhap
;xuong dong        
Xuong:  
        lea dx, tb2  
        mov ah,09h
        int 21h
;hien thi so ky tu        
        mov kt,cl
        mov al,cl
        mov ah,0
        xor cx,cx
        Lap:
            xor dx,dx
            div chia
            
            add ah,30h
            mov dl,ah
            push dx
            inc cx
            xor ah,ah
            cmp ax,0
            jne Lap
        Hienthi:
            pop dx
            mov ah,2
            int 21h
            loop Hienthi:  
;Exit            
        mov ah,4Ch
        int 21h
    
    main endp
    end main