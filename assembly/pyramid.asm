dosseg
.model small
.stack 100h
.data
    var1 dw 1
    var2 db 10,13,'$'  
    asterisk db '*$'
	var3 db "Github @ mzeeshanzafar28$"
.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 5
    loop1:
        push cx
        mov cx, var1
        loop2:
            mov ah, 09h
            mov dx, offset asterisk  
            int 21h
        loop loop2
        inc var1
        pop cx
        mov ah, 09h
        mov dx, offset var2  
        int 21h
        loop loop1

	mov ah, 09h
	mov dx, offset var3  
	int 21h
    mov ah, 04ch
    int 21h

main endp
end main
