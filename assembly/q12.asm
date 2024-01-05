.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter First String: $"
msg2 db "Enter Second String: $"
msg3 db "Value in arr1 = $"
msg4 db 10,13,"Value in arr2 = $"
arr1 dw 50 dup("$")
arr2 dw 50 dup("$")
temp dw 50 dup("$")

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
	mov si, offset arr2
	takeNow:
		mov ah, 01h
		int 21h
		cmp al, 13
		je endNow
		mov [si], al
		add si, 2
		inc bx
		jmp takeNow
		
endNow:
	mov si, offset arr1
	mov di, offset temp
	mov ax, cx
	swap:
		mov dl, [si]
		mov [di], dl
		mov dl, "$"
		mov [si], dl
		add si, 2
		add di, 2
		loop swap
	mov cx, bx
	mov si, offset arr1
	mov di, offset arr2
	swap2:
		mov dl, [di]
		mov [si], dl
		mov dl, "$"
		mov [di], dl
		add si, 2
		add di, 2
		loop swap2
	mov cx, ax
	mov si, offset arr2
	mov di, offset temp
	swap3:
		mov dl, [di]
		mov [si], dl
		add si, 2
		add di, 2
		loop swap3
	
	mov ah, 09h
	mov dx, offset msg3
	int 21h
	mov ah, 09h
	mov dx, offset arr1
	int 21h
	
	mov ah, 09h
	mov dx, offset msg4
	int 21h
	mov ah, 09h
	mov dx, offset arr2
	int 21h
	
mov ah, 04ch
int 21h
main endp
include io.lib
end