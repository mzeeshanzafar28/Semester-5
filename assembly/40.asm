;Assembly program to input only and convert lowercase letters to uppercase.
.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Start Entering: $"
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

start:
	mov ah, 07h
	int 21h
	cmp al, 13
	je endInp
	cmp al, 122
	jg skip
	cmp al, 97
	jl skip
	mov ah, 02h
	mov dl, al
	sub dl, 32
	int 21h
	skip:
		jmp start

endInp:
mov ah, 04ch
int 21h
main endp
include io.lib
end