.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "ASCIIs from 0 to 255 are: $"
newline db 10,13,"$"
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov cx, 255
mov bl, 0
showAscii:
	mov ah, 09h
	mov dx, offset newline
	int 21h
	mov ah, 02h
	mov dl, bl
	int 21h
	inc bl
	loop showAscii
	
mov ah, 04ch
int 21h
main endp
include io.lib
end