.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Give Character: $"
msg2 db 10,13,"ASCII code of this character = $"
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov ah, 01h
int 21h

mov ah, 0
mov dx, ax
mov cx, 255
mov bx, 0
findAscii:
	cmp dx, bx
	je show
	inc bx
	loop findAscii

show:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	mov pno, bx
	call showNum


mov ah, 04ch
int 21h
main endp
include io.lib
end