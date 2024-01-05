.model small
.stack 100h
.data
msg1 db "Even Numbers from 1 to 100 are: $" 
cno dw 0
pno dw 0
ten dw 10
two dw 2
newline db 10,13,"$"
.code
main proc

mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov cx, 100
divider:
	inc pno
	mov ax, pno
	mov dx, 0
	div two
	cmp dx, 1
	je skip
	call showNum
	mov dx, offset newline
	mov ah, 09h
	int 21h
	skip:
		loop divider
	

mov ah, 04ch
int 21h

main endp
include io.lib
end main