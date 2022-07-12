.model small
.stack 100h
.data

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, 5
    cmp ax, 0
    js LonHOn
    je BangNhau
    jl NhoHon
    LonHon:
        mov cx, 1
        jmp ra
    BangNhau:
        mov cx,0
        jmp ra
    NhoHon:
        mov cx, -1
    ra:    
    
    mov ah, 2
    mov dl, cx
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main