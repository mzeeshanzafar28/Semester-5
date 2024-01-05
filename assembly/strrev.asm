dosseg
.model small
.stack 100h
.data
msg1 db "Enter String to reverse: $"
msg2 db "Reversed String is: $"
arr1 db 30 dup("$")
.code
main proc

mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov si, offset arr1
mov cx, 0
label1:
	mov ah, 01h
	int 21h
	cmp al, 13
	je printer
	mov [si], al
	inc si
	inc cx
	jmp label1
	
printer:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	dec si
	

label2:
	mov dl, [si]
	mov ah, 02h
	int 21h
	dec si
	loop label2

mov ah, 04ch
int 21h

main endp
end main