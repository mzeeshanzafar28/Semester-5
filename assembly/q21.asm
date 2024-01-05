.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Give Code: $"
msg2 db "ASCII Char at this code = $"
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
mov ah, 02h
mov dx, pno
int 21h


mov ah, 04ch
int 21h
main endp
include io.lib
end