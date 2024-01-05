.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
two dw 2
arr1 dw 100 dup(0)
msg1 db "Enter Number of Elements: $"
msg2 db "Enter Elements: ",10,13,"$"
msg3 db "Sum of Odd Numbers in Array is $"
sum dw 0
els dw 0
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h
call getNum
mov cx, pno
mov els, cx

mov ah, 09h
mov dx, offset msg2
int 21h
mov si, offset arr1
takeNums:
	mov cno, 0
	mov pno, 0
	call getNum
	mov dx, pno
	mov [si], dx
	add si, 2
	loop takeNums

mov cx, els
mov si, offset arr1
results:
	mov ax, [si]
	mov dx, 0
	div two
	cmp dx, 1
	jne isEven
	mov dx, [si]
	add sum, dx
	isEven:
		add si, 2
		loop results
ending:
mov ah, 09h
mov dx, offset msg3
int 21h
mov cno, 0
mov dx, sum
mov pno, dx
call showNum

mov ah, 04ch
int 21h
main endp
include io.lib
end