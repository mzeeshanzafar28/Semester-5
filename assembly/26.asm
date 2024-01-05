.model small
.stack 100h
.data
msg1 db "Enter Username: $"
msg2 db "Enter Password: $"
msg3 db 10,13,"Dear $"
msg4 db " Your Password is $"
arr1 db 50 dup("$")
arr2 db 50 dup("$")
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov si, offset arr1
takeUser:
	mov ah, 01h
	int 21h
	cmp al, 13
	je takePass
	mov [si], al
	inc si
	jmp takeUser
	
takePass:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	mov si, offset arr2
	start:
		mov ah, 07h
		int 21h
		cmp al, 13
		je showNow
		mov [si], al
		inc si
		mov ah, 02h
		mov dl, "*"
		int 21h
		jmp start
		
showNow:
	mov ah, 09h
	mov dx, offset msg3
	int 21h
	mov ah, 09h
	mov dx, offset arr1
	int 21h
	mov ah, 09h
	mov dx, offset msg4
	int 21h
	mov ah, 09h
	mov dx, offset arr2
	int 21h
	
mov ah, 04ch
int 21h
main endp
end