;Assembly program to input a large string, append to array and display it.

.model small
.stack 100h
.data

msg1 db "Enter a string: $"
msg2 db "Your Entered string is: $"
arr1 db 30 dup("$")

.code
main proc

mov ax, @data
mov ds, ax

label1:
	mov ah, 09h
	mov dx, offset msg1
	int 21h

mov si, offset arr1

label2:
	mov ah, 01h
	int 21h
	cmp al, 13
	je label3
	mov [si], al
	inc si
	jmp label2

label3:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	mov dx, offset arr1
	mov ah, 09h
	int 21h

mov ah, 04ch
int 21h

main endp
end main