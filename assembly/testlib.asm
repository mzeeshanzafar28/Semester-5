dosseg
.model small
.stack 100h
.data
msg1 db "Enter String: $"
msg2 db "You Entered : $"
msg3 db 10,13,"Enter Number: $"
arr1 db 30 dup ("$")
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
call getStr
mov ah, 09h
mov dx, offset msg2
int 21h
call coutStr
mov ah, 09h
mov dx, offset msg3
int 21h
call getno
mov ah, 09h
mov dx, offset msg2
int 21h
call showno

mov ah, 04ch
int 21h

main endp
include zeelib.lib
end main