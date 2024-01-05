.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter a number: $"
msg2 db "Reverse = $"
arr1 dw 50 dup(0)
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h
call getNum

mov ah, 09h
mov dx, offset msg2
int 21h
mov ax, pno
divDisp:
	mov dx, 0
	div ten
	mov pno, dx
	mov cno, 0
	call showNum
	cmp ax, 0
	jne divDisp



mov ah, 04ch
int 21h
main endp
include io.lib
end