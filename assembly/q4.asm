.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
fname db 30 dup(?), 0
fsize dw 0
lcs dw 0
ucs dw 0
dgts dw 0
spcs dw 0
handler dw ?
buf db 1000 dup("$")
msg1 db "Enter Filename: $"
msg2 db "File Size = $"
msg3 db 10,13,"LowerCase Letters = $"
msg4 db 10,13,"UpperCase Letters = $"
msg5 db 10,13,"Digits = $"
msg6 db 10,13,"Spaces = $"
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov si, offset fname
take:
	mov ah, 01h
	int 21h
	cmp al, 13
	je cont
	mov [si], al
	inc si
	jmp take
	
cont:
	mov ah, 03dh
	mov dx, offset fname
	mov al, 2
	int 21h
	mov handler, ax
	
	mov ah, 03fh
	mov bx, handler
	mov cx, 999
	mov dx, offset buf
	int 21h
	
	mov ah, 03eh
	mov bx, handler
	int 21h
	
	mov cx, 999
	mov si, offset buf
	total:
		mov al, [si]
		cmp al, "$"
		je next
		inc fsize
		inc si
		loop total
	
	next:
	
		mov si, offset buf
		mov cx, 999
		UpperCase:
			mov al, [si]
			cmp al, 65
			jl skip
			cmp al, 90
			jg skip
			inc ucs
			skip:
				inc si
				loop UpperCase
				
		mov si, offset buf
		mov cx, 999
		LowerCase:
			mov al, [si]
			cmp al, 97
			jl skip2
			cmp al, 122
			jg skip2
			inc lcs
			skip2:
				inc si
				loop LowerCase
				

		mov si, offset buf
		mov cx, 999
		DgtsFind:
			mov al, [si]
			cmp al, 48
			jl skip3
			cmp al, 57
			jg skip3
			inc dgts
			skip3:
				inc si
				loop DgtsFind
				
				
		mov si, offset buf
		mov cx, 999
		Spaces:
			mov al, [si]
			cmp al, 32
			jne skip4
			inc spcs
			skip4:
				inc si
				loop Spaces
	
		mov ah, 09h
		mov dx, offset msg2
		int 21h		
		mov ax, fsize
		mov pno, ax
		call showNum
		
		mov ah, 09h
		mov dx, offset msg3
		int 21h		
		mov ax, lcs
		mov pno, ax
		call showNum
		
		mov ah, 09h
		mov dx, offset msg4
		int 21h		
		mov ax, ucs
		mov pno, ax
		call showNum
		
		mov ah, 09h
		mov dx, offset msg5
		int 21h		
		mov ax, dgts
		mov pno, ax
		call showNum
		
		mov ah, 09h
		mov dx, offset msg6
		int 21h		
		mov ax, spcs
		mov pno, ax
		call showNum
		

mov ah, 04ch
int 21h
main endp
include io.lib
end