.model small
.stack 100h
.data
cno dw 0
pno dw 0
ten dw 10
lgst dw 0
els dw 0
arr1 dw 100 dup(0)
msg1 db "Enter number of elements: $"
msg2 db "Start entering elements/Numbers",10,13,"$"
msg3 db "The Largest number is $"
.code
main proc
mov ax, @data
mov ds, ax

mov ah, 09h
mov dx, offset msg1
int 21h

call getNum
mov cx, pno
mov els, cx

mov ah, 09h
mov dx, offset msg2
int 21h

mov si, offset arr1
takeNums:
	mov pno, 0
	mov cno, 0
	call getNum
	mov dx, pno
	mov [si], dx
	add si, 2
	loop takeNums
	
mov cx, els
mov si, offset arr1
mov lgst, 0 
comp:
    mov dx, [si]
    cmp dx, lgst
    jle notGreater 
    mov lgst, dx
	notGreater:
		add si, 2
		loop comp
 
mov ah, 09h
mov dx, offset msg3
int 21h

mov dx, lgst
mov pno, dx
call showNum

mov ah, 04ch
int 21h
main endp
include io.lib
end