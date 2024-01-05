dosseg
.model small
.stack 100h
.data

msg1 db "Enter a character to see it: ", "$"
msg2 db 10,13,"The given character is: ", "$"

.code
main proc

mov ax, @data
mov ds, ax
;int 21h

lea dx, msg1
mov ah, 09h
int 21h

mov ah,01h
int 21h

lea dx,msg2
mov ah,09h
int 21h

mov dl,al
mov ah,02h
int 21h



mov ah,04ch
int 21h

main endp
end main