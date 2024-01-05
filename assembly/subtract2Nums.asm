;Assembly program to subtract two small numbers.

dosseg
.model small
.stack 100h
.data

msg1 db "Enter first Number: $"
msg2 db 10,13,"Enter second Number: $"
msg3 db 10,13,"Your answer is $"

.code
main proc

mov ax, @data
mov ds, ax

mov dx, offset msg1
mov ah, 09h
int 21h

mov ah, 01h
int 21h

mov bl, al

mov dx, offset msg2
mov ah, 09h
int 21h

mov ah, 01h
int 21h

sub bl, al
add bl, 48

mov dx, offset msg3
mov ah, 09h
int 21h

mov ah, 02h
mov dl, bl
int 21h

mov ah, 04ch
int 21h

main endp
end main