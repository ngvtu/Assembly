;Viet chuong trinh su dung h?m 7, ngat 21h de nhan 1 ky tu tu b?n phim,
;dung 1 bien de luu tru ky tu nhan duoc, sau do su dung h?m ngat 21h 
;de in ra m?n hinh ky tu nhan duoc dang luu trong bien ay. 
;Chuong trinh phai co du cac cau thong bao nhap v? xuat.
;Vi du: Hay go 1 phim: B
;Ky tu nhan duoc la: B

.model small
.stack 50
.data
    tem DB ? 
    str1 DB 10,13,'Nhap 1 ky tu:$'
    str2 DB 10,13,'Ky tu nhan duoc la:$'    
.code
    main proc
        mov ax, @data
        mov ds,ax   
        
        ;hien thi thong bao             
        mov ah,09h
        lea dx,str1
        int 21h
        
        ;nhap ky tu vao
        mov ah,07h
        int 21h
       
        ;gan ky tu cho bien tam
        mov tem,al
        
        ;thong bao ky tu nhan duoc
        mov ah,09
        lea dx,str2
        int 21h
        
        ;hien thi ky tu duoc nhap vao
        mov ah,02h
        mov dl,tem
        int 21h
        
        mov ah,4CH
        int 21h    
        
        
        
    main endp
    end main