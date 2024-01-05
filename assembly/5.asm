.model small
.stack 100h
.data
msg1 db "Enter a number: $"
msg2 db "The given number is even $"
msg3 db "The given number is odd $"
cno dw 0
pno dw 0
ten dw 10
two dw 2
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

call getNum

mov dx, 0
mov ax, pno
div two
cmp dx, 0
je evenNo

oddNo:
	mov ah, 09h
	mov dx, offset msg3
	int 21h
	jmp EndProg
	
evenNo:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	
EndProg:
	mov ah, 04ch
	int 21h
main endp
include io.lib
end