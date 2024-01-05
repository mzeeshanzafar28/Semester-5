.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter Filename $"
msg2 db "Enter Data: $"
msg3 db "Data Encypted and Saved Successfully$"
filename db 50 dup(?), 0
arr1 db 1000 dup(?)
handler dw ?

.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov si, offset filename
takeName:
	mov ah, 01h
	int 21h
	cmp al, 13
	je terminate
	mov [si], al
	inc si
	jmp takeName
	
terminate:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	mov si, offset arr1
	mov cx, 0
	takeData:
		mov ah, 01h
		int 21h
		cmp al, 13
		je save
		add al, 28
		mov [si], al
		inc si
		inc cx
		jmp takeData
	save:
		mov ah, 03dh
		mov dx, offset filename
		mov al, 1
		int 21h
		mov handler, ax
		
		mov ah, 040h
		mov bx, handler
		mov dx, offset arr1
		int 21h
		
	mov ah, 09h
	mov dx, offset msg3
	int 21h

mov ah, 04ch
int 21h
main endp
include io.lib
end