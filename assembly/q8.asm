.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter First String: $"
msg2 db "Enter Second String: $"
msg3 db "Strings are Equal$"
msg4 db "Strings are not Equal$"
arr1 dw 50 dup("$")
arr2 dw 50 dup("$")

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
	je takeStr2
	mov [si], al
	add si, 2
	inc cx
	jmp takeStr1
	
takeStr2:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	mov bx, 0
	mov di, offset arr2
	takeNow:
		mov ah, 01h
		int 21h
		cmp al, 13
		je endNow
		mov [di], al
		add di, 2
		inc bx
		jmp takeNow
		
endNow:
	mov si, offset arr1
	mov di, offset arr2
	cmp cx, bx
	jl swap
	jmp equate
	swap:
		mov cx, bx
	equate:
		mov dl, [si]
		cmp [di], dl
		jne notEqual
		add si, 2
		add di, 2
		loop equate
	jmp Equal
	notEqual:
		mov ah, 09h
		mov dx, offset msg4
		int 21h
		jmp ending
	Equal:
		mov ah, 09h
		mov dx, offset msg3
		int 21h
	
ending:	
	mov ah, 04ch
	int 21h
main endp
include io.lib
end