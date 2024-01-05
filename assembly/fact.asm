dosseg
.model small
.stack 100h
.data
msg1 db "Enter number: $"
msg2 db "Factorial is $"
pno dw 0
cno dw 0
ten dw 10
res dw 1
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
	je breaklabel
	sub al, 48
	mov ah, 0
	mov cno, ax
	mov ax, pno
	mul ten
	add ax, cno
	mov pno, ax
	jmp label1
		
breaklabel:
	mov ax, res
	cmp pno, 0
	je printres
	mul pno
	mov res, ax
	sub pno, 1
	jmp breaklabel
	
	
printres:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	
mov ax, res
mov cx,0
DivAgain:
	mov dx,0h
	div ten
	push dx
	inc cx
	cmp ax,0h
	jne DivAgain
ShowNum:
	mov ah,02h
	pop dx
	add dx,48
	int 21h
	loop ShowNum
	
mov ah, 04ch
int 21h

main endp
end main