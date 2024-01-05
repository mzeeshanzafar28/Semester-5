.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter first number: $"
msg2 db "Enter second number: $"
msg3 db "Sum is $"
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h
call getNum
mov bx, pno
mov pno, 0
mov cno, 0
mov ah, 09h
mov dx, offset msg2
int 21h
call getNum
add bx, pno
mov cno, 0
mov pno, bx
mov ah, 09h
mov dx, offset msg3
int 21h
call showNum

mov ah, 04ch
int 21h
main endp
include io.lib
end