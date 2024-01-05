.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter number: $"
msg2 db "Largest digit = $"
lg dw 0
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h 
mov dx, offset msg1
int 21h

call getNum
mov ax, pno
compute:
	mov dx, 0
	div ten
	cmp lg, dx
	jg skip
	mov lg, dx
	cmp ax, 0
	jne compute
	skip:
		cmp ax, 0
		jne compute
	

mov ah, 09h
mov dx, offset msg2
int 21h
mov dx, lg
mov pno, dx
call showNum

mov ah, 04ch
int 21h
main endp
include io.lib
end