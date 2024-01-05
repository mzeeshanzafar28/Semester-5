.model small
.stack 100h
.data
msg1 db "Enter a number: $"
msg2 db "Given number is Prime$"
msg3 db "Given number is Composite$"
pno dw 0
cno dw 0
ten dw 10
num1 dw 2  ; Start division with 2, the first prime number
divs dw 0
.code 
main proc
mov ax, @data
mov ds, ax

mov ah, 09h 
mov dx, offset msg1
int 21h

call getNum

mov cx, pno
mov num1, 2  ; Reset num1 to 2 before the division loop
start:
	mov ax, pno
	mov dx, 0
	div num1
	cmp dx, 0
	jne notDivisible
	inc divs
	notDivisible:
	inc num1
	cmp num1, ax  ; Compare with the original number
	jbe start      ; Jump if num1 <= ax, continue dividing
	; Finished dividing, now check if it's prime or composite
	mov ax, divs
	cmp ax, 0  ; If divs == 0, the number is prime
	jz isPrime
	jmp isComposite
	
isPrime:
	mov ah, 09h
	mov dx, offset msg2
	int 21h
	jmp ending
	
isComposite:
	mov ah, 09h
	mov dx, offset msg3
	int 21h
	
ending:
	mov ah, 4ch
	int 21h
main endp
include io.lib
end
