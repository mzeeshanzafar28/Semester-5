.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
newline db 10,13,"$"
msg1 db "Numbers from 1 to 100 are: $"
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov pno, 1
mov cx, 100
iterate:
	call showNum
	mov ah, 09h
	mov dx, offset newline
	int 21h
	inc pno
	loop iterate


mov ah, 04ch
int 21h
main endp
include io.lib
end