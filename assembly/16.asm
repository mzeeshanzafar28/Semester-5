.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter a number: $"
msg2 db "Sum of digits = $"
sum dw 0
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
	add sum, dx
	cmp ax, 0
	jne compute

mov ah, 09h 
mov dx, offset msg2
int 21h

mov dx, sum
mov pno, dx
call showNum

mov ah, 04ch
int 21h
main endp
include io.lib
end