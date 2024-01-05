.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter String: $"
msg2 db "Capitalized String = $"
arr1 dw 50 dup("$")

.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov cx, 0
mov si, offset arr1
takeStr1:
	mov ah, 01h
	int 21h
	cmp al, 13
	je Capitalize
	mov [si], al
	add si, 2
	inc cx
	jmp takeStr1
	
Capitalize:
	mov si, offset arr1
	capt:
		mov dx, [si]
		cmp dx, 122
		jg skip
		cmp dx, 97
		jl skip
		sub dx, 32
		mov [si], dx
		skip:
		add si, 2
		loop capt
		
		mov ah, 09h
		mov dx, offset msg2
		int 21h
		mov ah, 09h
		mov dx, offset arr1
		int 21h
	
	mov ah, 04ch
	int 21h
main endp
include io.lib
end