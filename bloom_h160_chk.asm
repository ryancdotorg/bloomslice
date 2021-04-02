CPU X64

%include "hash.mac"

;%macro mpush 1-*
;  %rep %0
;    push %1
;    %rotate 1
;  %endrep
;%endmacro
;
;%macro mpop 1-*
;  %rep %0
;    %rotate -1
;    pop %1
;  %endrep
;%endmacro

global bloom_h160_chk:function

global data1sT
global data2bT
global data2sT
global data3sT

global hash1sN
global hash2bN
global hash2sN
global hash3sN

global hashJ
global hashD

section .text

; int32_t bloom_h160h_chk(const uint8_t *mem, const uint8_t *h160, uint8_t n, uint64_t mask);
; WARNING: PARAMETERS ARE *NOT* VALIDATED FOR SANITY
; rdi = *mem, rsi = *h160, rdx = n, rcx = mask

bloom_h160_chk:
  lea rax, [rel hashJ]         ; load start of jump table
  lea rax, [rax + rdx * 8]     ; calculate offset address in jump table
  jmp [rax]                    ; jump to target

  %include "legacy.inc"
  jmp bloom_hit
  %include "hash1s.inc"
  jmp bloom_hit
  %include "hash2b.inc"
  jmp bloom_hit
  %include "hash2s.inc"
  jmp bloom_hit
  %include "hash3s.inc"
  jmp bloom_hit

; just compare two 160 bit values
single:
  mov rax, [rdi]
  cmp rax, [rsi]
  jnz bloom_miss
  mov rax, [rdi+8]
  cmp rax, [rsi+8]
  jnz bloom_miss
  mov eax, dword [rdi+16]
  cmp eax, dword [rsi+16]
  jnz bloom_miss
; fall through to bloom_hit

bloom_hit:
  mov eax, 1
  ret

bloom_miss:
  xor eax, eax
  ret

bloom_error:
  mov eax, -1
  ret

bloom_abort:
  mov rax, 1                   ; sys_write
  mov rdi, 2                   ; stderr
  mov rsi, [rel abort_msg]
  mov rdx, 13                  ; length
  syscall
  mov rax, 60                  ; sys_exit
  mov rdi, 255                 ; error_code
  syscall
  ret                          ; should not actually be reached

section .rodata
; easter egg ;-)
  align 16, db 0xff
  %include "art.asm"

; strings
  abort_msg: db "Bad hash id!", 0x0a, 0

; jump table
  align 16, db 0
  db "== jump table =="

hashJ:
  dq legacy
  dq single

%assign I 1
%rep hash1s_n
  %defstr num I
  dq hash1s%[I]
  %assign I I+1
%endrep

%assign I 1
%rep hash2b_n
  %defstr num I
  dq hash2b%[I]
  %assign I I+1
%endrep

%assign I 1
%rep hash2s_n
  %defstr num I
  dq hash2s%[I]
  %assign I I+1
%endrep

%assign I 1
%rep hash3s_n
  %defstr num I
  dq hash3s%[I]
  %assign I I+1
%endrep

; handle invalid n values
%rep (254-(1+hash1s_n+hash2b_n+hash2s_n+hash3s_n))
  dq bloom_abort
%endrep
  dq bloom_error

; description table
  align 8, db 0xff

hashD:
  db "legacy", 0, 0
  db "single", 0, 0

%assign I 1
%rep hash1s_n
  %defstr num I
  db "h1s", num
  align 8, db 0
  %assign I I+1
%endrep

%assign I 1
%rep hash2b_n
  %defstr num I
  db "h2b", num, 0
  align 8, db 0
  %assign I I+1
%endrep

%assign I 1
%rep hash2s_n
  %defstr num I
  db "h2s", num, 0
  align 8, db 0
  %assign I I+1
%endrep

%assign I 1
%rep hash3s_n
  %defstr num I
  db "h3s", num
  align 8, db 0
  %assign I I+1
%endrep

%rep (254-(1+hash1s_n+hash2b_n+hash2s_n+hash3s_n))
  db "abort", 0, 0, 0
%endrep
  db "error", 0, 0, 0

; data tables
  align 16, db 0xff
  db 'data1sT', 0
hash1sN:
  db hash1s_n
  align 8, db 0
data1sT:
  %include "data1s.inc"

  align 16, db 0xff
  db 'data2bT', 0
hash2bN:
  db hash2b_n
  align 8, db 0
data2bT:
  %include "data2b.inc"

  align 16, db 0xff
  db 'data2sT', 0
hash2sN:
  db hash2s_n
  align 8, db 0
data2sT:
  %include "data2s.inc"

  align 16, db 0xff
  db 'data3sT', 0
hash3sN:
  db hash3s_n
  align 8, db 0
data3sT:
  %include "data3s.inc"

  db 0xff
  align 16, db 0xff

; vim:ai:sw=2:ts=2:et:syntax=nasm:filetype=nasm
