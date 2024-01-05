.model small
.stack 100h
.data
fnm db "new.txt",0
fh dw 0
msgBuf db 50 dup("$")
.code
main proc
mov ax,@data
mov ds,ax

mov ah, 03dh
mov dx, offset fnm
mov al, 0
int 21h

mov fh, ax

mov ah, 03fh
mov bx, fh
mov cx, 9
mov dx, offset msgBuf
int 21h

mov ah, 09h
mov dx, offset msgBuf
int 21h

mov ah, 03eh
mov bx, fh
int 21h

mov ah, 04ch
int 21h
main endp
end main