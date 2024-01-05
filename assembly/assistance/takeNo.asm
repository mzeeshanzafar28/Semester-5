; Assembly code to take a number and output it.

.model small
.stack 100h
.data

msg1 db "Enter a Number: $"
msg2 db "You Entered: $"
pno dw 0
cno dw 0
Ten dw 10

.code
main proc

mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

label1:
	mov ah, 01h
	int 21h
	cmp al, 13
	je label2
	sub al, 48
	mov ah, 0h
	mov cno, ax
	mov ax, pno
	mul Ten
	add ax, cno
	mov pno, ax
	jmp label1
	
label2:
	mov ah, 09h
	mov dx, offset msg2
	int 21h	
	mov cx, 0
mov ax, pNO
divAgain:
	mov dx, 0h
	div Ten
	push dx
	inc cx
	cmp ax, 0h
	jne divAgain

showDigit:
	mov ah, 02h
	pop dx
	add dx, 48
	int 21h
	loop showDigit



mov ah, 04ch
int 21h

main endp
end main