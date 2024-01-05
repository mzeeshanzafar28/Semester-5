.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter Number : $"
msg2 db "Smallest digit = $"
sm dw 0
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h
call getNum

mov ax, pno
mov dx, 0
div ten
mov sm, dx
divShow:
	cmp ax,0
	je endNow
	mov dx, 0
	div ten
	cmp dx, sm
	jg skip
	mov sm, dx
	skip:
		jmp divShow
	
endNow:
	mov dx, sm
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