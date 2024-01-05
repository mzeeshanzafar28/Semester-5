.model small
.stack 100h
.data
msg1 db "Enter a Number: $"
msg2 db "You Entered $"
pno dw 0
cno dw 0
ten dw 10
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

call getNum

mov ah, 09h
mov dx, offset msg2
int 21h

call showNum

mov ah, 04ch
int 21h

main endp
include io.lib
end