include \masm32\include\masm32rt.inc

.data

w32fd WIN32_FIND_DATA <>
file_handle HANDLE ?
line_break db 10,13,0
file_ext db "*.*"
.code

start:

find_first_file:
    push offset w32fd
    push offset file_ext
    call FindFirstFile
    
    mov file_handle, eax
    
 
    
    
find_next_file:
    invoke StdOut, offset w32fd.cFileName
    invoke StdOut, offset line_break
    
    push offset w32fd
    push file_handle
    call FindNextFile
    
    cmp eax, 0
    jne find_next_file
    
    exit
end start