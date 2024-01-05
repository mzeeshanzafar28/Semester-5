.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter First Filename: $"
msg2 db "Enter Second Filename: $"
filename1 db 30 dup(?),0
filename2 db 30 dup(?),0
arr1 db 50 dup("$")
handler dw ?
file1size dw 14
.code
main proc
mov ax, @data
mov ds, ax

	mov ah, 09h
	mov dx, offset msg1
	int 21h
	mov si, offset filename1
takeInp:
		mov ah, 01h
		int 21h
		cmp al, 13
		je take2
		mov [si], al
		inc si
		jmp takeInp

take2:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	mov si, offset filename2
	takeInp2:
		mov ah, 01h
		int 21h
		cmp al, 13
		je continue
		mov [si], al
		inc si
		jmp takeInp2
		
continue:
	mov ah, 03dh
	mov dx, offset filename1
	mov al, 2
	int 21h
	mov handler, ax
	
	mov ah, 03fh
	mov bx, handler
	mov cx, file1size
	mov dx, offset arr1
	int 21h
	
	mov ah, 03eh
	mov bx, handler
	int 21h
	
	mov ah, 03dh
	mov dx, offset filename2
	mov al, 2
	int 21h
	mov handler, ax
	
	mov ah, 040h
	mov bx, handler
	mov cx, file1size
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