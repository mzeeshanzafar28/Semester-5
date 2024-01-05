.model small
.stack 100h
.data
fnm db "new.txt",0
fh dw 0
msg db "Bismillah"
.code
main proc
mov ax,@data
mov ds,ax

mov ah, 03ch
mov dx, offset fnm
mov cx, 0h
int 21h

mov fh, ax

mov ah, 040h
mov bx, fh
mov cx, 9
mov dx, offset msg
int 21h

mov ah, 03eh
mov bx, fh
int 21h

mov ah, 04ch
int 21h
main endp
end main