.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
number dw ?
msg1 db "Enter number: $"
cross db " X $"
equal db " = $"
newline db 10,13,"$"
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

call getNum

mov dx, pno
mov number, dx

mov cx, 10
mov bx, 1
table:
    mov dx, number
    mov pno, dx
    call showNum
    mov ah, 09h
    mov dx, offset cross
    int 21h
    mov pno, bx
    call showNum
    mov ah, 09h
    mov dx, offset equal
    int 21h
    mov ax, bx
    mul number
    mov pno, ax
    call showNum
    inc bx
    mov ah, 09h
    mov dx, offset newline
    int 21h
    loop table

mov ah,04ch
int 21h
main endp
include io.lib
end