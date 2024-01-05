.model small
.stack 100h 
.data
msg1 db "Enter a character: $"
msg2 db 10,13,"Ascii is: $"
cno dw 0
pno dw 0
ten dw 10
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov ah, 01h
int 21h

mov ah, 09h
mov dx, offset msg2
int 21h

mov ah, 0
mov pno, ax
call showNum

mov ah, 04ch
int 21h
main endp
include io.lib
end 
