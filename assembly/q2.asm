.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter your message: $"
filename db "zee1.txt",0
arr1 db 50 dup("$")
handler dw ?
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h
mov cx, 0
mov si, offset arr1
takeInp:
	mov ah, 01h
	int 21h
	cmp al, 13
	je continue
	mov [si], al
	inc cx
	inc si
	jmp takeInp

continue:
	mov ah, 03dh
	mov dx, offset filename
	mov al, 2
	int 21h
	mov handler, ax
	
	mov ah, 040h
	mov bx, handler
	mov dx, offset arr1
	int 21h
	
	mov ah, 03eh
	mov bx, handler
	int 21h




mov ah, 04ch
int 21h
main endp
include io.lib
end