.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter String: $"
msg2 db "Enter Character to find: $"
msg3 db 10,13,"Character not found$"
msg4 db 10,13,"Location = $"
arr1 dw 50 dup("$")

.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov cx, 0
mov si, offset arr1
takeStr1:
	mov ah, 01h
	int 21h
	cmp al, 13
	je takeChar
	mov [si], al
	add si, 2
	inc cx
	jmp takeStr1
	
takeChar:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	mov ah, 01h
	int 21h
	
	mov si, offset arr1
	mov bx, 0
	mov ah, 0
	compareNow:
		mov dx, [si]
		cmp dx, ax
		je showNow
		add si, 2
		inc bx
		loop compareNow
	
	mov ah, 09h
	mov dx, offset msg3
	int 21h
	jmp ending
	
	showNow:
	mov ah, 09h
	mov dx, offset msg4
	int 21h
	mov pno, bx
	call showNum
		
ending:	
	mov ah, 04ch
	int 21h
main endp
include io.lib
end