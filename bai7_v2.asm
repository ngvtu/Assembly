.model small
.stack 100h
.data
    tb1 db "Nhap chuoi hoa: $"
    str db 100 dup("$")  
    enter db 10,13,"$" 
    xoa db ''
.code

main proc
    mov ax, @data
    mov ds, ax
    
    mov ah,9
    lea dx, tb1
    int 21h
    
    lea si, str
    xor cx,cx   ; dua cx ve 0
    
nhapchuoi:
    mov ah, 1
    int 21h       ; luu al
         
    cmp al, 13    ; so sanh al vs enter(13)
    je inketqua
    mov [si], al  ; gan al -> vtri si
    inc si        ; si++
    inc cx        ; cx++
    jmp nhapchuoi

inketqua:
    mov ah, 9
    lea dx, enter   ; xuong dong
    int 21h
    
    lea si, str     ; gan str
    inchuoi:
        mov ah,2    ; ngat 2
        mov bl,[si] ; hgan [si] vs bl 
        
        cmp bl, 32  ; so sanh bl vs khoang trang
        je skip
        add bl, 32   ; chuyen tu in hoa sang in 
    skip:
        mov ah, 2    
        lea dl,bl   ; in ta man hinh 
        int 21h 
           
        inc si
        loop inchuoi    
        
    mov ah,4ch
    int 21h
end main
    
 