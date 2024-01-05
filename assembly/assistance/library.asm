.model small
.stack 100h
.data
	pno dw 0
	cno dw 0
	ten dw 10
	intArray dw 5 dup(0)
	
.code
	main proc
		mov ax, @data
		mov ds, ax
		
		mov si, offset intArray
		mov cx, 5
		
		inputArray:
			call getNo
			mov ax, pno
			mov [si], ax
			add si, 2
			loop inputArray
			
		mov si, offset intArray
		mov cx, 5
		showArray:
			mov ax, [si]
			mov pno, ax
			call showNo
			add si, 2
			loop showArray
			
		mov ah, 04ch
		int 21h
		
	main endp
	include io.lib
end