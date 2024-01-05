;Assembly program to print the Largest digit in a given number.
.model small
.stack 100h
.data
pno dw 0
cno dw 0
ten dw 10
lgno dw 0
message db "Largest Digit is $"
message2 db "Enetr Number: $"
.code
main proc
mov ax, @data
mov ds, ax

mov dx, offset message2
mov ah, 09h
int 21h
call getno

mov ax, pno
label1:
	cmp ax, 0
	je EndInp
	mov dx, 0
	div ten
	cmp lgno, dx
	jle swap
	jmp label1
	swap:
		mov lgno, dx
		jmp label1
EndInp:
	mov ah, 09h
	mov dx, offset message
	int 21h
	mov ah, 02h
	mov dx, lgno
	add dx, 48
	int 21h
	
	mov ah, 04ch
	int 21h
	
main endp
include io.lib
end main