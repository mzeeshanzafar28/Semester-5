







;Didn't had time to debug this one, This won't run . . . Sorry :)
;Mark the Repo on Github@mzeeshanzafar28       😁 





.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
two dw 2
msg1 db "Enter String: $"
msg2 db "Binary of ASCIIs = $"
arr1 dw 1000 dup("$")
arr2 db 1000 dup()
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov si, offset arr1
mov cx, 0
take:
	mov ah, 01h
	int 21h
	cmp al, 13
	je compute
	mov [si], al
	add si, 2
	inc cx
	jmp take

compute:
mov si, offset arr1
mov di, offset arr2
mov bx, 0
compute2:
	mov ax, [si]
	mov dx, 0
	goOn:
		div two
		mov [di], dx
		inc di
		inc bx
		cmp ax, 0
		jne goOn
	add si, 2
	loop compute2

mov ah, 09h
mov dx, offset msg2
int 21h
mov cx, bx
showRes:
	mov dh, 0
	mov dl, [di]
	mov pno, dx
	call showNum
	dec di
	loop showRes

mov ah, 04ch
int 21h
main endp
include io.lib
end