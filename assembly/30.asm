.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
res dw 1
msg1 db "Enter a number: $"
msg2 db "Factorial = $"
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
	dec pno
	mov res, ax
	loop fact
	
mov dx, res
mov pno, dx
mov ah, 09h
mov dx, offset msg2
int 21h
call showNum

mov ah, 04ch
int 21h
main endp
include io.lib
end