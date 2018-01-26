CPU X64

%include "hash.mac"

global bloom_h160_chk:function

global data1sT
global data2bT
global data2sT
global data3sT

global hash1sN
global hash2bN
global hash2sN
global hash3sN

global hashT
global hashD
section .text

; int32_t h160h_chk(const uint8_t *mem, const uint8_t *h160, uint8_t n, uint64_t mask);
; WARNING: PARAMETERS ARE *NOT* VALIDATED FOR SANITY
; rdi = *mem, rsi = *h160, rdx = n, rcx = mask

bloom_h160_chk:

  ; multiply edx by 2
  shl edx, 1

  ; jump to selected hash
  jmp [hashT + edx * 8]

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

single:
  ; just compare two 160 bit values
  mov rax, [rdi]
  cmp rax, [rsi]
  jnz bloom_miss
  mov rcx, [rdi+8]
  cmp rcx, [rsi+8]
  jnz bloom_miss
  mov ecx, dword [rdi+16]
  cmp ecx, dword [rsi+16]
  jnz bloom_miss

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
  mov rax, 1   ; sys_write
  mov rdi, 2   ; stderr
  mov rsi, abort_msg
  mov rdx, 13  ; length
  syscall
  mov rax, 60  ; sys_exit
  mov rdi, 255 ; error_code
  syscall
  ret

section .rodata
  ; easter egg ;-)
  align 16, db 0xff
  %include "art.asm"

  ; strings
  abort_msg: db "Bad hash id!", 0x0a, 0

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

  ; interleaved description and jump tables
  align 16, db 0xff
hashD:
  db "legacy", 0, 0
hashT:
  dq legacy
  db "single", 0, 0
  dq single
%assign I 1
%rep hash1s_n
  %defstr num I
  db "h1s", num
  align 8, db 0
  dq hash1s%[I]
  %assign I I+1
%endrep
%assign I 1
%rep hash2b_n
  %defstr num I
  db "h2b", num, 0
  align 8, db 0
  dq hash2b%[I]
  %assign I I+1
%endrep
%assign I 1
%rep hash2s_n
  %defstr num I
  db "h2s", num, 0
  align 8, db 0
  dq hash2s%[I]
  %assign I I+1
%endrep
%assign I 1
%rep hash3s_n
  %defstr num I
  db "h3s", num
  align 8, db 0
  dq hash3s%[I]
  %assign I I+1
%endrep
%rep (255-(1+hash1s_n+hash2b_n+hash2s_n+hash3s_n))
  db "abort", 0, 0, 0
  dq bloom_abort
%endrep
  db "error", 0, 0, 0
  dq bloom_error

; vim:ai:sw=2:ts=2:et:syntax=nasm:filetype=nasm
