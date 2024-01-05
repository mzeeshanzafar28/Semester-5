dosseg
.model small
.stack 100h
.data
msg1 db "Greatest num is $"
arr1 db 5,7,3,2,9
.code

main proc

mov ax, @data
mov ds, ax

mov si, offset arr1
mov cx, 5
mov bl, [si]

label1:
	cmp [si], bl
	jg label2
	cont:
	inc si
	loop label1

jmp ending

label2:
	mov bl, [si]
	jmp cont

ending:
mov ah, 09h
mov dx, offset msg1
int 21h
add bl, 48
mov dl, bl
mov ah, 02h
int 21h

mov ah, 04ch
int 21h

main endp
end main