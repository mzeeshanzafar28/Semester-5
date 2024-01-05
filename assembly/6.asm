.model small
.stack 100h
.data
msg1 db "Enter a number: $"
msg2 db "Factorial is $"
cno dw 0
pno dw 0
ten dw 10
res dw 1
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

call getNum
mov cx, pno

fact:
	mov ax, res
	mul pno
	mov res, ax
	dec pno
	loop fact

mov ah, 09h
mov dx, offset msg2
int 21h

mov ax, res
mov pno, ax
call showNum

mov ah, 04ch
int 21h
main endp
include io.lib
end