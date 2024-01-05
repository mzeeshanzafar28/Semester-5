.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter first number: $"
msg2 db "Enter second number: $"
msg3 db "Product of numbers = $"
product dw 0
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h 
mov dx, offset msg1
int 21h

call getNum
mov ax, pno
mov product, ax

mov ah, 09h 
mov dx, offset msg2
int 21h

call getNum
mov ax, pno
mul product
mov product, ax

mov ah, 09h 
mov dx, offset msg3
int 21h

mov dx, product
mov pno, dx
call showNum

mov ah, 04ch
int 21h
main endp
include io.lib
end