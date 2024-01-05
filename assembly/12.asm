dosseg
.model small
.stack 100h
.data
msg1 db "Enter number: $"
msg3 db "Sum is $"
cno dw 0
pno dw 0
ten dw 10
.code
main proc
mov ax, @data
mov ds, ax
mov bx, 0
mov cx, 2
start:
mov ah, 09h
mov dx, offset msg1  
int 21h

Again:
	mov ah, 01h
	int 21h
	cmp al, 13
	je EndInput
	mov ah, 0
	sub al, 48
	mov cno, ax
	mov ax, pno
	mul ten
	add ax, cno
	mov pno, ax
	jmp Again
	
EndInput:
	add bx, pno
	dec cx
	mov cno, 0
	mov pno, 0
	cmp cx, 0
	jne start
	
	mov ah, 09h
	mov dx, offset msg3
	int 21h
	mov pno, bx
	mov ax, pno
	divAgain:
		mov dx, 0
		div ten
		push dx
		inc cx
		cmp ax, 0
		jne divAgain
		
	showNow:
		mov ah, 02h
		pop dx
		add dx, 48
		int 21h
		loop showNow
		

mov ah, 04ch
int 21h
main endp
end