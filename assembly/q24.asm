.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter Filename $"
msg2 db "Encrypted Data: $"
filename db 50 dup(?), 0
arr1 db 1000 dup("$")
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
	
	mov ah, 03dh
	mov dx, offset filename
	mov al, 0
	int 21h
	mov handler, ax
	
	mov ah, 03fh
	mov bx, handler
	mov dx, offset arr1
	int 21h
	
	mov si, offset arr1
	decrypt:
		mov dl, [si]
		cmp dl, 36
		je ending
		sub dl, 28
		mov [si], dl
		inc si
		jmp decrypt
	
ending:
	mov ah, 09h
	mov dx, offset arr1
	int 21h

mov ah, 04ch
int 21h
main endp
include io.lib
end