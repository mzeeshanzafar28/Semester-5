.model small
.stack 100h
.data
msg1 db "How many elements should each array have: $"
msg2 db 10,13,"Enter first array elements: $"
msg3 db 10,13,"Enter second array elements: $"
msg4 db 10,13,"Here is the indexwise sum: $"
newline db 10,13,"$"
arr1 dw 100 dup(?)
arr2 dw 100 dup(?)
arr3 dw 100 dup(?)
els dw ?
pno dw 0
cno dw 0
ten dw 10
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h
call getNum
mov dx, pno
mov els, dx

mov ah, 09h
mov dx, offset msg2
int 21h
mov ah, 09h
mov dx, offset newline
int 21h
mov si, offset arr1
mov cx, els
takeArr1:
    call getNum
    mov dx, pno
    mov [si], dx
    add si, 2
    loop takeArr1

mov ah, 09h
mov dx, offset msg3
int 21h
mov ah, 09h
mov dx, offset newline
int 21h
mov si, offset arr2
mov cx, els
takeArr2:
    call getNum
    mov dx, pno
    mov [si], dx
    add si, 2
    loop takeArr2

mov cx, els
mov si, offset arr1
mov di, offset arr2
mov bp, offset arr3
mov ah, 09h
mov dx, offset msg4
int 21h
mov ah, 09h
mov dx, offset newline
int 21h
sumStore:
    mov ax, [si]
    mov bx, [di]
    add ax, bx
    mov [bp], ax
    mov pno, ax
    call showNum
    mov ah, 09h
    mov dx, offset newline
    int 21h
    add si, 2
    add di, 2
    add bp, 2
    loop sumStore

mov ah, 04ch
int 21h
main endp
include io.lib
end