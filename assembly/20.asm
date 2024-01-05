.model small
.stack 100h
.data
msg1 db "Enter Data: $" 
msg2 db "Reverse = $"
arr1 db 50 dup("$")
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov si, offset arr1
mov cx, 0
inp:
	mov ah, 01h
	int 21h
	cmp al,13
	je ending
	mov [si], al
	inc si
	inc cx
	jmp inp
	
ending:
	dec si
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	show:
		mov ah, 02h
		mov dh, 0
		mov dl, [si]
		int 21h
		dec si
		loop show

mov ah, 04ch
int 21h
main endp
end