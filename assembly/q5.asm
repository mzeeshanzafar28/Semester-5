.model small
.stack 100h
.data
msg1 db "Enter a string: $"
msg2 db "Length = $"
cno dw 0
pno dw 0
ten dw 10
arr dw 50 dup("$")
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov si, offset arr
mov cx, 0
takeInp:
	mov ah, 01h
	int 21h
	cmp al, 13
	je endInp
	mov [si], al
	add si, 2
	inc cx
	jmp takeInp
	
endInp:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	mov pno, cx
	call showNum
	
	mov ah, 04ch
	int 21h
main endp
include io.lib
end