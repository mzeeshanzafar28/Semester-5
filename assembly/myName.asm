;Assembly program to print my name

dosseg
.model small
.stack 100h
.data

msg1 db "My Name is Zeeshan$"

.code
main proc

mov ax, @data
mov ds, ax

mov dx, offset msg1
mov ah, 09h
int 21h

mov ah, 04ch
int 21h

main endp
end main