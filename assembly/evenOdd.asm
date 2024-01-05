;Assembly program to tell whether a number is even or odd.
.model small
.stack 100h
.data

msg1 db "Enter a number to check whether it is even or odd: $"
msg2 db 10,13,"The given number is even$"
msg3 db "The given number is odd$"
arr1 db 10 dup("$")

.code
main proc

mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

mov si, offset arr1

label1:
	mov ah, 01h
	int 21h
	cmp al, 13
	je label2
	sub al, 48
	mov [si], al
	inc si
	jmp label1

label2:
    dec si
    mov al, [si] 
    mov bl, 2     
    div bl
    cmp ah, 0 
    jne odd

even:
    mov ah, 09h
    mov dx, offset msg2
    int 21h
    jmp end_program

odd:
    mov ah, 09h
    mov dx, offset msg3
    int 21h	

end_program:
	mov ah, 04ch
	int 21h

main endp
end main