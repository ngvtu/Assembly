	.model small
	.stack 50
	.data
	    gm DB 10,13, 'Good Morning!$'
	    ga DB 10,13, 'Good Afternoon!$'
	    ge DB 10,13, 'Good Everning!$'
	    str DB 10,13,'Nhap ky tu:$'     
	.code
	    main proc
	        mov ax, @data
	        mov ds,ax   
	        
	        mov ah,09h
	        lea dx,str
	        int 21h    
	        mov ah,01
	        int 21h
	               
	        cmp al,'S'
	        Je Morning
	        cmp al,'s'
	        je Morning
	               
	        cmp al,'C'
	        Je Afternoon
	        cmp al,'c'
	        je Afternoon
	        
	        cmp al,'T'
	        Je Everning
	        cmp al,'t'
	        je Everning
	        jmp thoat 
	Morning: 
	        mov ah,09h
	        lea dx,gm
	        int 21h 
	        jmp Thoat
	Afternoon:
	        mov ah,09h
	        lea dx,ga
	        int 21h  
	        jmp Thoat
	Everning:
	        mov ah,09h
	        lea dx,ge
	        int 21h  
	        jmp Thoat
	Thoat:        
	        mov ah,4CH
	        int 21h    
	        
	        
	        
	    main endp
	    end main

