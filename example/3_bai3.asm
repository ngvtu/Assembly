; ky tu ke truoc, ky tu ke sau

DSEG SEGMENT
tbaon DB 10,13, 'nhap: $'  
tbaox DB 10,13, 'Xuat: $'     
ktt DB 10, 13, 'Ky tu truoc: $'
kts DB 10, 13, 'ky tu sau: $'
temp DB ?
DSEG ENDS
CSEG SEGMENT
ASSUME CS: CSEG, DS: DSEG
start:
    mov ax, DSEG
    mov ds, ax      
    
    ;in thong bao nhap
    mov ah, 09h 
    lea dx, tbaon
    int 21h       
    
   ;nhap chuooi ky tu
    mov ah, 01h
    int 21h       
    mov temp, al

    ;in thong bao xuat
    mov ah, 09h 
    lea dx, tbaox
    int 21h  
    
    
    ; luu ky tu vao thanh ghi dl va in ra
    mov ah, 02h 
    mov dl, temp
    int 21h        
    
    
    
    ;in kts
    mov ah, 09h
    lea dx, kts
    int 21h
    
    mov ah, 02h
    add temp, 1h
    mov dl, temp
    int 21h
            
    ;in ktt
    mov ah, 09h
    lea dx, ktt
    int 21h 
    
    mov ah,02h
    sub temp,2h
    mov dl, temp
    int 21h
    
    mov ah, 4ch
    int 21h
CSEG ENDS
END start
