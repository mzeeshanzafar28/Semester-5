;Assembly program to take username and password and display it.

dosseg
.model small
.stack 100h
.data
msg1 db "Please enter your username: $"
msg2 db "Please enter your password: $"
msg3 db 10,13,"Dear $"
msg4 db " your password is $"
arr1 db 20 dup("$")
arr2 db 12 dup("$")
.code
main proc

mov ax, @data
mov ds, ax

mov dx, offset msg1
mov ah, 09h
int 21h

mov si, offset arr1

label1:
	mov ah, 01h
	int 21h
	cmp al, 13
	je label2
	mov [si], al
	inc si
	jmp label1

label2:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	mov si, offset arr2
	jmp label3

label3:
	mov ah, 07h
	int 21h
	cmp al, 13
	je label4
	mov [si], al
	inc si
	mov dl, "*"
	mov ah, 02h
	int 21h
	jmp label3

label4:
	mov ah, 09h
	mov dx, offset msg3
	int 21h
	mov dx, offset arr1
	mov ah, 09h
	int 21h
	mov ah, 09h
	mov dx, offset msg4
	int 21h
	mov dx, offset arr2
	mov ah, 09h
	int 21h

	
	

mov ah, 04ch
int 21h

main endp
end main