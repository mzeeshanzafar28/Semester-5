sumNums Macro num1, num2
push ax
push dx
mov ax, num2
add num1, ax
mov dx, num1
add dx, 48
mov ah, 02h
int 21h
pop dx
pop ax
endm

subNums Macro num1, num2
push ax
push dx
mov ax, num2
sub num1, ax
mov dx, num1
add dx, 48
mov ah, 02h
int 21h
pop dx
pop ax
endm

mulNums Macro num1, num2
push ax
push bx
push cx
push dx
mov ax, num1
mul num2
mov num1, ax
mov dx, num1
add dx, 48
mov ah, 02h
int 21h
pop dx
pop cx
pop bx
pop ax
endm

divNums Macro num1, num2
push ax
push bx
push cx
push dx
mov ax, num1
mov dx,0
div num2
mov num1, ax
mov dx, num1
add dx, 48
mov ah, 02h
int 21h
pop dx
pop cx
pop bx
pop ax
endm