.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter Message: $"
msg2 db "Accepted Message = $"
arr1 dw 50 dup("$")
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov si, offset arr1
takeInp:
	mov ah, 07h
	int 21h
	cmp al, 13
	je endInp
	cmp al, 90
	jg skip
	cmp al, 65
	jl skip
	add al, 32
	skip:
		mov dl, al
		mov ah, 02h
		int 21h
		jmp takeInp
endInp:
mov ah, 04ch
int 21h
main endp
include io.lib
end