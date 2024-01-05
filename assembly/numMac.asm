dosseg
include macros.asm
.model small
.stack 100h
.data
no1 dw 4
no2 dw 2

.code
main proc
mov ax, @data
mov ds, ax

sumNums no1, no2
mov dx,10
mov ah,02h
int 21h
mov dx,13
mov ah,02h
int 21h

mov no1, 4
mov no2, 2

subNums no1, no2 
mov dx,10
mov ah,02h
int 21h
mov dx,13
mov ah,02h
int 21h

mov no1, 4
mov no2, 2

mulNums no1, no2
mov dx,10
mov ah,02h
int 21h
mov dx,13
mov ah,02h
int 21h

mov no1, 4
mov no2, 2

divNums no1, no2

mov ah, 04ch
int 21h

main endp
end main