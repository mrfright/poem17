;
; The Magic Number, Morgan Reece Phillips
; Linux Poem Number 16 (http://linux-poetry.com)
;

[org 0x7c00]            ; make nasm aware of the boot sector offset

mov bp, 0x8000          ; move the base of the stack pointer beyond the boot sector offset
mov sp, bp              ; move the top and bottom stack pointers to the same spot

mov bx, poem
call print_str

jmp $                   ; loop forever

print_str:              ; define a print "function" for null terminated strings
  mov al, [bx]          ; print that low bit, then that high bit
  cmp al, 0
  je the_end
  mov ah, 0x0e          ; set up the scrolling teletype interrupt
  int 0x10              ; call interupt handler
  add bx, 0x1
  jmp print_str 
  the_end:
    ret

poem:
  db 0xA, 0xD, \
  '/*****************************', \
  0xA, 0xD, \
  '** The Magic Number: 0xAAFF', \
  0xA, 0xD, \
  '******************************/', \
  0xA, 0xD, \
  0xA, 0xD, \
  'A word gives life to bare metal', \
  0xA, 0xD, \
  0xA, 0xD, \
  'Bytes inviting execution', \
  0xA, 0xD, \
  0xA, 0xD, \
  'Guide to a sector to settle', \
  0xA, 0xD, \
  0xA, 0xD, \
  'A word gives life, to bare metal', \
  0xA, 0xD, \
  0xA, 0xD, \
  'The bootloader', 0x27, 's role is vital', \
  0xA, 0xD, \
  0xA, 0xD, \
  'Denoted by its locution--', \
  0xA, 0xD, \
  0xA, 0xD, \
  'A word gives life to bare metal', \
  0xA, 0xD, \
  0xA, 0xD, \
  'Bytes inviting execution', \
  0xA, 0xD, \
  0xA, 0xD, \
  '// @linuxpoetry (linux-poetry.com)', \
  0 

times 510-($-$$) db 0   ; write zeros to the first 510 bytes
dw 0xaa55               ; write the magic number
