.model small
.stack 100h
.data
msg1 db "File Contents: $"
filename db "zee1.txt",0
output db 30 dup("$")
newline db 10,13,"$"
handler dw ?
zero dw 0
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

continue:
	mov ah, 03dh
	mov dx, offset filename
	mov al, 2  
	int 21h
	mov handler, ax  

	mov ah, 03fh
	mov bx, handler
	mov cx, 7 
	mov dx, offset output
	int 21h

	mov ah, 09h
	mov dx, offset output
	int 21h
	
	mov ah, 03eh
	mov bx, handler
	int 21h

	mov ah, 04ch
	int 21h	
main endp
end
