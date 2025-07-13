global _start

section .data

  array    dd 3, 2, 5, 9, 1, 10, 7, 4, 8, 6, 12, 15, 18, 20, 11, 14, 17, 19, 13, 16
  arr_len  equ 20                            
  
  buf   times 12 db 0 
  
  sep   db ' ', 0 
  nl    db 10,0
  
section .text

_start:
  
  lea   rdi, [rel array] 
  mov   esi, arr_len 
  call  gnome_sort
  
  mov   ecx, 0
.print_loop:
  
  cmp   ecx, arr_len
  jge   .exit
  
  mov edi, [array + rcx*4] 
  call print_int               
  
  inc   ecx
  jmp .print_loop
  
.exit:
    lea     rsi, [rel nl]    
    mov     rdx, 1           
    mov     rax, 1            
    mov     rdi, 1            
    syscall                   

    xor     edi, edi         
    mov     rax, 60       
    syscall       
    
gnome_sort:
  push  rbx
  mov ebx, 1 
  
.gs_loop:
  cmp   ebx, esi
  jge   .gs_done
  
  cmp   ebx, 0 
  je    .gs_inc
  
  mov   eax, [rdi + rbx*4]      
  mov   edx, [rdi + rbx*4 - 4]  
  
  cmp   eax, edx                
  jge   .gs_inc                 
  
  
  mov   [rdi + rbx*4 -4], eax
  mov   [rdi + rbx*4], edx
  
  dec   ebx
  jmp   .gs_loop
  
.gs_inc:
  inc   ebx
  jmp   .gs_loop
  
.gs_done:
  pop   rbx
  ret
  
print_int:

    push    rax
    push    rcx
    push    rdx
    push    rsi

    mov     rax, rdi           
    lea     rsi, [rel buf+11]  
    mov     byte [rsi], 0      
    dec     rsi                

    cmp     rax, 0            
    jne     .conv_loop         
    mov     byte [rsi], '0'    
    jmp     .conv_done        

.conv_loop:
    xor     rdx, rdx          
    mov     rcx, 10           
    div     rcx                
    add     dl, '0'            
    mov     [rsi], dl          
    dec     rsi                
    cmp     rax, 0             
    jne     .conv_loop         

.conv_done:
  
    inc     rsi               
    
    lea     rcx, [rel buf+11]  
    sub     rcx, rsi           

    mov     rax, 1             
    mov     rdi, 1             
    mov     rdx, rcx           
    syscall                    

    lea     rsi, [rel sep]    
    mov     rdx, 1            
    mov     rax, 1            
    mov     rdi, 1            
    syscall                   
    pop     rsi
    pop     rdx
    pop     rcx
    pop     rax
    ret 
  
