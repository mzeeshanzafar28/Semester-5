.model small
.stack 100h
.data
msg1 db "Enter a Number: $"
msg2 db "You Entered $"
cno dw 0
pno dw 0
ten dw 10
.code
main proc

mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

Again:
	mov ah, 01h
	int 21h
	cmp al, 13
	je EndInput
	sub al, 48
	mov ah, 0
	mov cno, ax
	mov ax, pno
	mul ten
	add ax, cno
	mov pno, ax
	jmp Again
	
EndInput:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	
	mov ax, pno
	mov cx, 0
	Divider:
		mov dx, 0
		div ten
		push dx
		inc cx
		cmp ax, 0
		jne Divider
	Show:
		mov ah, 02h
		pop dx
		add dx, 48
		int 21h
		loop Show


mov ah, 04ch
int 21h

main endp
end