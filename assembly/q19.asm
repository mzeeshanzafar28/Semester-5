.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
msg1 db "Enter String: $"
msg2 db "Total Vowels in string = $"

.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov cx, 0
takeStr1:
	mov ah, 01h
	int 21h
	cmp al, 13
	je showRes
	cmp al, "a"
	je vowel
	cmp al, "e"
	je vowel
	cmp al, "i"
	je vowel
	cmp al, "o"
	je vowel
	cmp al, "u"
	je vowel
	cmp al, "A"
	je vowel
	cmp al, "E"
	je vowel
	cmp al, "I"
	je vowel
	cmp al, "O"
	je vowel
	cmp al, "U"
	je vowel
	jmp skip
	vowel:
		inc cx
	skip:
		jmp takeStr1
	
showRes:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	mov pno, cx
	call showNum
	
	
mov ah, 04ch
int 21h
main endp
include io.lib
end