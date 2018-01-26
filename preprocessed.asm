%line 1+1 bloom_h160_chk.asm
[cpu X64]

%line 1+1 hash.mac













%line 31+1 hash.mac

%line 55+1 hash.mac

%line 64+1 hash.mac


%line 4+1 bloom_h160_chk.asm

[global bloom_h160_chk:function]

[global data1sT]
[global data2bT]
[global data2sT]
[global data3sT]

[global hash1sN]
[global hash2bN]
[global hash2sN]
[global hash3sN]

[global hashT]
[global hashD]
[section .text]





bloom_h160_chk:


 shl edx, 1


 jmp [hashT + edx * 8]

%line 1+1 legacy.inc

legacy:
 mov eax, [rsi+0x00]
 mov rdx, rax
%line 4+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 5+1 legacy.inc
 mov eax, [rsi+0x04]
 mov rdx, rax
%line 6+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 7+1 legacy.inc
 mov eax, [rsi+0x08]
 mov rdx, rax
%line 8+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 9+1 legacy.inc
 mov eax, [rsi+0x0c]
 mov rdx, rax
%line 10+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 11+1 legacy.inc
 mov eax, [rsi+0x10]
 mov rdx, rax
%line 12+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 13+1 legacy.inc

 mov ax, [rsi+0x06]
 shl eax, 16
 mov ax, [rsi+0x00]
 mov rdx, rax
%line 17+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 18+1 legacy.inc
 mov ax, [rsi+0x0a]
 shl eax, 16
 mov ax, [rsi+0x04]
 mov rdx, rax
%line 21+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 22+1 legacy.inc
 mov ax, [rsi+0x0e]
 shl eax, 16
 mov ax, [rsi+0x08]
 mov rdx, rax
%line 25+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 26+1 legacy.inc
 mov ax, [rsi+0x12]
 shl eax, 16
 mov ax, [rsi+0x0c]
 mov rdx, rax
%line 29+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 30+1 legacy.inc
 mov ax, [rsi+0x02]
 shl eax, 16
 mov ax, [rsi+0x10]
 mov rdx, rax
%line 33+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 34+1 legacy.inc

 mov al, [rsi+0x07]
 shl eax, 16
 mov ax, [rsi+0x00]
 shl eax, 8
 mov al, [rsi+0x02]
 mov rdx, rax
%line 40+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 41+1 legacy.inc
 mov al, [rsi+0x0b]
 shl eax, 16
 mov ax, [rsi+0x04]
 shl eax, 8
 mov al, [rsi+0x06]
 mov rdx, rax
%line 46+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 47+1 legacy.inc
 mov al, [rsi+0x0f]
 shl eax, 16
 mov ax, [rsi+0x08]
 shl eax, 8
 mov al, [rsi+0x0a]
 mov rdx, rax
%line 52+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 53+1 legacy.inc
 mov al, [rsi+0x13]
 shl eax, 16
 mov ax, [rsi+0x0c]
 shl eax, 8
 mov al, [rsi+0x0e]
 mov rdx, rax
%line 58+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 59+1 legacy.inc
 mov al, [rsi+0x03]
 shl eax, 16
 mov ax, [rsi+0x10]
 shl eax, 8
 mov al, [rsi+0x12]
 mov rdx, rax
%line 64+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 65+1 legacy.inc

 mov eax, [rsi+0x05]
 mov al, [rsi+0x00]
 mov rdx, rax
%line 68+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 69+1 legacy.inc
 mov eax, [rsi+0x09]
 mov al, [rsi+0x04]
 mov rdx, rax
%line 71+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 72+1 legacy.inc
 mov eax, [rsi+0x0d]
 mov al, [rsi+0x08]
 mov rdx, rax
%line 74+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 75+1 legacy.inc
 mov ax, [rsi+0x11]
 shl eax, 16
 mov ah, [rsi+0x13]
 mov al, [rsi+0x0c]
 mov rdx, rax
%line 79+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 80+1 legacy.inc
 mov eax, [rsi+0x01]
 mov al, [rsi+0x10]
 mov rdx, rax
%line 82+0 legacy.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 83+1 legacy.inc


%line 34+1 bloom_h160_chk.asm
 jmp bloom_hit
%line 2+1 hash1s.inc

%line 2+0 hash1s.inc




hash1s10:
 mov ax, [rsi+8]
 and rax, rcx
%line 3+1 hash1s.inc
 mov rdx, rax
%line 3+0 hash1s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 4+1 hash1s.inc

%line 4+0 hash1s.inc




hash1s9:
 mov ax, [rsi+0]
 and rax, rcx
%line 5+1 hash1s.inc
 mov rdx, rax
%line 5+0 hash1s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 6+1 hash1s.inc

%line 6+0 hash1s.inc




hash1s8:
 mov ax, [rsi+2]
 and rax, rcx
%line 7+1 hash1s.inc
 mov rdx, rax
%line 7+0 hash1s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 8+1 hash1s.inc

%line 8+0 hash1s.inc




hash1s7:
 mov ax, [rsi+6]
 and rax, rcx
%line 9+1 hash1s.inc
 mov rdx, rax
%line 9+0 hash1s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 10+1 hash1s.inc

%line 10+0 hash1s.inc




hash1s6:
 mov ax, [rsi+16]
 and rax, rcx
%line 11+1 hash1s.inc
 mov rdx, rax
%line 11+0 hash1s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 12+1 hash1s.inc

%line 12+0 hash1s.inc




hash1s5:
 mov ax, [rsi+14]
 and rax, rcx
%line 13+1 hash1s.inc
 mov rdx, rax
%line 13+0 hash1s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 14+1 hash1s.inc

%line 14+0 hash1s.inc




hash1s4:
 mov ax, [rsi+12]
 and rax, rcx
%line 15+1 hash1s.inc
 mov rdx, rax
%line 15+0 hash1s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 16+1 hash1s.inc

%line 16+0 hash1s.inc




hash1s3:
 mov ax, [rsi+18]
 and rax, rcx
%line 17+1 hash1s.inc
 mov rdx, rax
%line 17+0 hash1s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 18+1 hash1s.inc

%line 18+0 hash1s.inc




hash1s2:
 mov ax, [rsi+10]
 and rax, rcx
%line 19+1 hash1s.inc
 mov rdx, rax
%line 19+0 hash1s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 20+1 hash1s.inc

%line 20+0 hash1s.inc




hash1s1:
 mov ax, [rsi+4]
 and rax, rcx
%line 21+1 hash1s.inc
 mov rdx, rax
%line 21+0 hash1s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 22+1 hash1s.inc
hash1s0:


%line 36+1 bloom_h160_chk.asm
 jmp bloom_hit
%line 2+1 hash2b.inc

%line 2+0 hash2b.inc




hash2b96:
 mov ah, [rsi+9]
 mov al, [rsi+2]
 and rax, rcx
%line 3+1 hash2b.inc
 mov rdx, rax
%line 3+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 4+1 hash2b.inc

%line 4+0 hash2b.inc




hash2b95:
 mov ah, [rsi+10]
 mov al, [rsi+15]
 and rax, rcx
%line 5+1 hash2b.inc
 mov rdx, rax
%line 5+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 6+1 hash2b.inc

%line 6+0 hash2b.inc




hash2b94:
 mov ah, [rsi+3]
 mov al, [rsi+17]
 and rax, rcx
%line 7+1 hash2b.inc
 mov rdx, rax
%line 7+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 8+1 hash2b.inc

%line 8+0 hash2b.inc




hash2b93:
 mov ah, [rsi+19]
 mov al, [rsi+7]
 and rax, rcx
%line 9+1 hash2b.inc
 mov rdx, rax
%line 9+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 10+1 hash2b.inc

%line 10+0 hash2b.inc




hash2b92:
 mov ah, [rsi+16]
 mov al, [rsi+5]
 and rax, rcx
%line 11+1 hash2b.inc
 mov rdx, rax
%line 11+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 12+1 hash2b.inc

%line 12+0 hash2b.inc




hash2b91:
 mov ah, [rsi+14]
 mov al, [rsi+6]
 and rax, rcx
%line 13+1 hash2b.inc
 mov rdx, rax
%line 13+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 14+1 hash2b.inc

%line 14+0 hash2b.inc




hash2b90:
 mov ah, [rsi+1]
 mov al, [rsi+12]
 and rax, rcx
%line 15+1 hash2b.inc
 mov rdx, rax
%line 15+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 16+1 hash2b.inc

%line 16+0 hash2b.inc




hash2b89:
 mov ah, [rsi+8]
 mov al, [rsi+0]
 and rax, rcx
%line 17+1 hash2b.inc
 mov rdx, rax
%line 17+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 18+1 hash2b.inc

%line 18+0 hash2b.inc




hash2b88:
 mov ah, [rsi+4]
 mov al, [rsi+9]
 and rax, rcx
%line 19+1 hash2b.inc
 mov rdx, rax
%line 19+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 20+1 hash2b.inc

%line 20+0 hash2b.inc




hash2b87:
 mov ah, [rsi+2]
 mov al, [rsi+18]
 and rax, rcx
%line 21+1 hash2b.inc
 mov rdx, rax
%line 21+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 22+1 hash2b.inc

%line 22+0 hash2b.inc




hash2b86:
 mov ah, [rsi+11]
 mov al, [rsi+13]
 and rax, rcx
%line 23+1 hash2b.inc
 mov rdx, rax
%line 23+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 24+1 hash2b.inc

%line 24+0 hash2b.inc




hash2b85:
 mov ah, [rsi+15]
 mov al, [rsi+10]
 and rax, rcx
%line 25+1 hash2b.inc
 mov rdx, rax
%line 25+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 26+1 hash2b.inc

%line 26+0 hash2b.inc




hash2b84:
 mov ah, [rsi+17]
 mov al, [rsi+3]
 and rax, rcx
%line 27+1 hash2b.inc
 mov rdx, rax
%line 27+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 28+1 hash2b.inc

%line 28+0 hash2b.inc




hash2b83:
 mov ah, [rsi+5]
 mov al, [rsi+7]
 and rax, rcx
%line 29+1 hash2b.inc
 mov rdx, rax
%line 29+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 30+1 hash2b.inc

%line 30+0 hash2b.inc




hash2b82:
 mov ah, [rsi+16]
 mov al, [rsi+19]
 and rax, rcx
%line 31+1 hash2b.inc
 mov rdx, rax
%line 31+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 32+1 hash2b.inc

%line 32+0 hash2b.inc




hash2b81:
 mov ah, [rsi+14]
 mov al, [rsi+6]
 and rax, rcx
%line 33+1 hash2b.inc
 mov rdx, rax
%line 33+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 34+1 hash2b.inc

%line 34+0 hash2b.inc




hash2b80:
 mov ah, [rsi+0]
 mov al, [rsi+12]
 and rax, rcx
%line 35+1 hash2b.inc
 mov rdx, rax
%line 35+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 36+1 hash2b.inc

%line 36+0 hash2b.inc




hash2b79:
 mov ah, [rsi+9]
 mov al, [rsi+10]
 and rax, rcx
%line 37+1 hash2b.inc
 mov rdx, rax
%line 37+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 38+1 hash2b.inc

%line 38+0 hash2b.inc




hash2b78:
 mov ah, [rsi+18]
 mov al, [rsi+1]
 and rax, rcx
%line 39+1 hash2b.inc
 mov rdx, rax
%line 39+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 40+1 hash2b.inc

%line 40+0 hash2b.inc




hash2b77:
 mov ah, [rsi+4]
 mov al, [rsi+8]
 and rax, rcx
%line 41+1 hash2b.inc
 mov rdx, rax
%line 41+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 42+1 hash2b.inc

%line 42+0 hash2b.inc




hash2b76:
 mov ah, [rsi+2]
 mov al, [rsi+11]
 and rax, rcx
%line 43+1 hash2b.inc
 mov rdx, rax
%line 43+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 44+1 hash2b.inc

%line 44+0 hash2b.inc




hash2b75:
 mov ah, [rsi+7]
 mov al, [rsi+13]
 and rax, rcx
%line 45+1 hash2b.inc
 mov rdx, rax
%line 45+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 46+1 hash2b.inc

%line 46+0 hash2b.inc




hash2b74:
 mov ah, [rsi+17]
 mov al, [rsi+3]
 and rax, rcx
%line 47+1 hash2b.inc
 mov rdx, rax
%line 47+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 48+1 hash2b.inc

%line 48+0 hash2b.inc




hash2b73:
 mov ah, [rsi+12]
 mov al, [rsi+15]
 and rax, rcx
%line 49+1 hash2b.inc
 mov rdx, rax
%line 49+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 50+1 hash2b.inc

%line 50+0 hash2b.inc




hash2b72:
 mov ah, [rsi+19]
 mov al, [rsi+16]
 and rax, rcx
%line 51+1 hash2b.inc
 mov rdx, rax
%line 51+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 52+1 hash2b.inc

%line 52+0 hash2b.inc




hash2b71:
 mov ah, [rsi+5]
 mov al, [rsi+6]
 and rax, rcx
%line 53+1 hash2b.inc
 mov rdx, rax
%line 53+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 54+1 hash2b.inc

%line 54+0 hash2b.inc




hash2b70:
 mov ah, [rsi+0]
 mov al, [rsi+14]
 and rax, rcx
%line 55+1 hash2b.inc
 mov rdx, rax
%line 55+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 56+1 hash2b.inc

%line 56+0 hash2b.inc




hash2b69:
 mov ah, [rsi+9]
 mov al, [rsi+18]
 and rax, rcx
%line 57+1 hash2b.inc
 mov rdx, rax
%line 57+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 58+1 hash2b.inc

%line 58+0 hash2b.inc




hash2b68:
 mov ah, [rsi+1]
 mov al, [rsi+10]
 and rax, rcx
%line 59+1 hash2b.inc
 mov rdx, rax
%line 59+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 60+1 hash2b.inc

%line 60+0 hash2b.inc




hash2b67:
 mov ah, [rsi+8]
 mov al, [rsi+4]
 and rax, rcx
%line 61+1 hash2b.inc
 mov rdx, rax
%line 61+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 62+1 hash2b.inc

%line 62+0 hash2b.inc




hash2b66:
 mov ah, [rsi+11]
 mov al, [rsi+2]
 and rax, rcx
%line 63+1 hash2b.inc
 mov rdx, rax
%line 63+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 64+1 hash2b.inc

%line 64+0 hash2b.inc




hash2b65:
 mov ah, [rsi+13]
 mov al, [rsi+7]
 and rax, rcx
%line 65+1 hash2b.inc
 mov rdx, rax
%line 65+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 66+1 hash2b.inc

%line 66+0 hash2b.inc




hash2b64:
 mov ah, [rsi+3]
 mov al, [rsi+14]
 and rax, rcx
%line 67+1 hash2b.inc
 mov rdx, rax
%line 67+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 68+1 hash2b.inc

%line 68+0 hash2b.inc




hash2b63:
 mov ah, [rsi+16]
 mov al, [rsi+5]
 and rax, rcx
%line 69+1 hash2b.inc
 mov rdx, rax
%line 69+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 70+1 hash2b.inc

%line 70+0 hash2b.inc




hash2b62:
 mov ah, [rsi+15]
 mov al, [rsi+12]
 and rax, rcx
%line 71+1 hash2b.inc
 mov rdx, rax
%line 71+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 72+1 hash2b.inc

%line 72+0 hash2b.inc




hash2b61:
 mov ah, [rsi+17]
 mov al, [rsi+19]
 and rax, rcx
%line 73+1 hash2b.inc
 mov rdx, rax
%line 73+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 74+1 hash2b.inc

%line 74+0 hash2b.inc




hash2b60:
 mov ah, [rsi+1]
 mov al, [rsi+6]
 and rax, rcx
%line 75+1 hash2b.inc
 mov rdx, rax
%line 75+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 76+1 hash2b.inc

%line 76+0 hash2b.inc




hash2b59:
 mov ah, [rsi+11]
 mov al, [rsi+9]
 and rax, rcx
%line 77+1 hash2b.inc
 mov rdx, rax
%line 77+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 78+1 hash2b.inc

%line 78+0 hash2b.inc




hash2b58:
 mov ah, [rsi+8]
 mov al, [rsi+4]
 and rax, rcx
%line 79+1 hash2b.inc
 mov rdx, rax
%line 79+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 80+1 hash2b.inc

%line 80+0 hash2b.inc




hash2b57:
 mov ah, [rsi+0]
 mov al, [rsi+16]
 and rax, rcx
%line 81+1 hash2b.inc
 mov rdx, rax
%line 81+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 82+1 hash2b.inc

%line 82+0 hash2b.inc




hash2b56:
 mov ah, [rsi+10]
 mov al, [rsi+18]
 and rax, rcx
%line 83+1 hash2b.inc
 mov rdx, rax
%line 83+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 84+1 hash2b.inc

%line 84+0 hash2b.inc




hash2b55:
 mov ah, [rsi+14]
 mov al, [rsi+13]
 and rax, rcx
%line 85+1 hash2b.inc
 mov rdx, rax
%line 85+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 86+1 hash2b.inc

%line 86+0 hash2b.inc




hash2b54:
 mov ah, [rsi+3]
 mov al, [rsi+5]
 and rax, rcx
%line 87+1 hash2b.inc
 mov rdx, rax
%line 87+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 88+1 hash2b.inc

%line 88+0 hash2b.inc




hash2b53:
 mov ah, [rsi+2]
 mov al, [rsi+7]
 and rax, rcx
%line 89+1 hash2b.inc
 mov rdx, rax
%line 89+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 90+1 hash2b.inc

%line 90+0 hash2b.inc




hash2b52:
 mov ah, [rsi+15]
 mov al, [rsi+12]
 and rax, rcx
%line 91+1 hash2b.inc
 mov rdx, rax
%line 91+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 92+1 hash2b.inc

%line 92+0 hash2b.inc




hash2b51:
 mov ah, [rsi+19]
 mov al, [rsi+17]
 and rax, rcx
%line 93+1 hash2b.inc
 mov rdx, rax
%line 93+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 94+1 hash2b.inc

%line 94+0 hash2b.inc




hash2b50:
 mov ah, [rsi+0]
 mov al, [rsi+1]
 and rax, rcx
%line 95+1 hash2b.inc
 mov rdx, rax
%line 95+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 96+1 hash2b.inc

%line 96+0 hash2b.inc




hash2b49:
 mov ah, [rsi+6]
 mov al, [rsi+9]
 and rax, rcx
%line 97+1 hash2b.inc
 mov rdx, rax
%line 97+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 98+1 hash2b.inc

%line 98+0 hash2b.inc




hash2b48:
 mov ah, [rsi+11]
 mov al, [rsi+15]
 and rax, rcx
%line 99+1 hash2b.inc
 mov rdx, rax
%line 99+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 100+1 hash2b.inc

%line 100+0 hash2b.inc




hash2b47:
 mov ah, [rsi+8]
 mov al, [rsi+4]
 and rax, rcx
%line 101+1 hash2b.inc
 mov rdx, rax
%line 101+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 102+1 hash2b.inc

%line 102+0 hash2b.inc




hash2b46:
 mov ah, [rsi+18]
 mov al, [rsi+17]
 and rax, rcx
%line 103+1 hash2b.inc
 mov rdx, rax
%line 103+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 104+1 hash2b.inc

%line 104+0 hash2b.inc




hash2b45:
 mov ah, [rsi+10]
 mov al, [rsi+16]
 and rax, rcx
%line 105+1 hash2b.inc
 mov rdx, rax
%line 105+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 106+1 hash2b.inc

%line 106+0 hash2b.inc




hash2b44:
 mov ah, [rsi+14]
 mov al, [rsi+13]
 and rax, rcx
%line 107+1 hash2b.inc
 mov rdx, rax
%line 107+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 108+1 hash2b.inc

%line 108+0 hash2b.inc




hash2b43:
 mov ah, [rsi+5]
 mov al, [rsi+3]
 and rax, rcx
%line 109+1 hash2b.inc
 mov rdx, rax
%line 109+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 110+1 hash2b.inc

%line 110+0 hash2b.inc




hash2b42:
 mov ah, [rsi+7]
 mov al, [rsi+2]
 and rax, rcx
%line 111+1 hash2b.inc
 mov rdx, rax
%line 111+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 112+1 hash2b.inc

%line 112+0 hash2b.inc




hash2b41:
 mov ah, [rsi+12]
 mov al, [rsi+19]
 and rax, rcx
%line 113+1 hash2b.inc
 mov rdx, rax
%line 113+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 114+1 hash2b.inc

%line 114+0 hash2b.inc




hash2b40:
 mov ah, [rsi+9]
 mov al, [rsi+15]
 and rax, rcx
%line 115+1 hash2b.inc
 mov rdx, rax
%line 115+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 116+1 hash2b.inc

%line 116+0 hash2b.inc




hash2b39:
 mov ah, [rsi+11]
 mov al, [rsi+8]
 and rax, rcx
%line 117+1 hash2b.inc
 mov rdx, rax
%line 117+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 118+1 hash2b.inc

%line 118+0 hash2b.inc




hash2b38:
 mov ah, [rsi+0]
 mov al, [rsi+6]
 and rax, rcx
%line 119+1 hash2b.inc
 mov rdx, rax
%line 119+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 120+1 hash2b.inc

%line 120+0 hash2b.inc




hash2b37:
 mov ah, [rsi+3]
 mov al, [rsi+13]
 and rax, rcx
%line 121+1 hash2b.inc
 mov rdx, rax
%line 121+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 122+1 hash2b.inc

%line 122+0 hash2b.inc




hash2b36:
 mov ah, [rsi+4]
 mov al, [rsi+18]
 and rax, rcx
%line 123+1 hash2b.inc
 mov rdx, rax
%line 123+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 124+1 hash2b.inc

%line 124+0 hash2b.inc




hash2b35:
 mov ah, [rsi+1]
 mov al, [rsi+17]
 and rax, rcx
%line 125+1 hash2b.inc
 mov rdx, rax
%line 125+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 126+1 hash2b.inc

%line 126+0 hash2b.inc




hash2b34:
 mov ah, [rsi+7]
 mov al, [rsi+10]
 and rax, rcx
%line 127+1 hash2b.inc
 mov rdx, rax
%line 127+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 128+1 hash2b.inc

%line 128+0 hash2b.inc




hash2b33:
 mov ah, [rsi+14]
 mov al, [rsi+16]
 and rax, rcx
%line 129+1 hash2b.inc
 mov rdx, rax
%line 129+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 130+1 hash2b.inc

%line 130+0 hash2b.inc




hash2b32:
 mov ah, [rsi+19]
 mov al, [rsi+12]
 and rax, rcx
%line 131+1 hash2b.inc
 mov rdx, rax
%line 131+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 132+1 hash2b.inc

%line 132+0 hash2b.inc




hash2b31:
 mov ah, [rsi+2]
 mov al, [rsi+5]
 and rax, rcx
%line 133+1 hash2b.inc
 mov rdx, rax
%line 133+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 134+1 hash2b.inc

%line 134+0 hash2b.inc




hash2b30:
 mov ah, [rsi+6]
 mov al, [rsi+15]
 and rax, rcx
%line 135+1 hash2b.inc
 mov rdx, rax
%line 135+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 136+1 hash2b.inc

%line 136+0 hash2b.inc




hash2b29:
 mov ah, [rsi+8]
 mov al, [rsi+17]
 and rax, rcx
%line 137+1 hash2b.inc
 mov rdx, rax
%line 137+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 138+1 hash2b.inc

%line 138+0 hash2b.inc




hash2b28:
 mov ah, [rsi+13]
 mov al, [rsi+11]
 and rax, rcx
%line 139+1 hash2b.inc
 mov rdx, rax
%line 139+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 140+1 hash2b.inc

%line 140+0 hash2b.inc




hash2b27:
 mov ah, [rsi+0]
 mov al, [rsi+9]
 and rax, rcx
%line 141+1 hash2b.inc
 mov rdx, rax
%line 141+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 142+1 hash2b.inc

%line 142+0 hash2b.inc




hash2b26:
 mov ah, [rsi+7]
 mov al, [rsi+5]
 and rax, rcx
%line 143+1 hash2b.inc
 mov rdx, rax
%line 143+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 144+1 hash2b.inc

%line 144+0 hash2b.inc




hash2b25:
 mov ah, [rsi+3]
 mov al, [rsi+18]
 and rax, rcx
%line 145+1 hash2b.inc
 mov rdx, rax
%line 145+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 146+1 hash2b.inc

%line 146+0 hash2b.inc




hash2b24:
 mov ah, [rsi+1]
 mov al, [rsi+4]
 and rax, rcx
%line 147+1 hash2b.inc
 mov rdx, rax
%line 147+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 148+1 hash2b.inc

%line 148+0 hash2b.inc




hash2b23:
 mov ah, [rsi+16]
 mov al, [rsi+14]
 and rax, rcx
%line 149+1 hash2b.inc
 mov rdx, rax
%line 149+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 150+1 hash2b.inc

%line 150+0 hash2b.inc




hash2b22:
 mov ah, [rsi+19]
 mov al, [rsi+12]
 and rax, rcx
%line 151+1 hash2b.inc
 mov rdx, rax
%line 151+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 152+1 hash2b.inc

%line 152+0 hash2b.inc




hash2b21:
 mov ah, [rsi+2]
 mov al, [rsi+10]
 and rax, rcx
%line 153+1 hash2b.inc
 mov rdx, rax
%line 153+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 154+1 hash2b.inc

%line 154+0 hash2b.inc




hash2b20:
 mov ah, [rsi+9]
 mov al, [rsi+6]
 and rax, rcx
%line 155+1 hash2b.inc
 mov rdx, rax
%line 155+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 156+1 hash2b.inc

%line 156+0 hash2b.inc




hash2b19:
 mov ah, [rsi+8]
 mov al, [rsi+4]
 and rax, rcx
%line 157+1 hash2b.inc
 mov rdx, rax
%line 157+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 158+1 hash2b.inc

%line 158+0 hash2b.inc




hash2b18:
 mov ah, [rsi+13]
 mov al, [rsi+7]
 and rax, rcx
%line 159+1 hash2b.inc
 mov rdx, rax
%line 159+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 160+1 hash2b.inc

%line 160+0 hash2b.inc




hash2b17:
 mov ah, [rsi+0]
 mov al, [rsi+18]
 and rax, rcx
%line 161+1 hash2b.inc
 mov rdx, rax
%line 161+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 162+1 hash2b.inc

%line 162+0 hash2b.inc




hash2b16:
 mov ah, [rsi+11]
 mov al, [rsi+14]
 and rax, rcx
%line 163+1 hash2b.inc
 mov rdx, rax
%line 163+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 164+1 hash2b.inc

%line 164+0 hash2b.inc




hash2b15:
 mov ah, [rsi+15]
 mov al, [rsi+12]
 and rax, rcx
%line 165+1 hash2b.inc
 mov rdx, rax
%line 165+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 166+1 hash2b.inc

%line 166+0 hash2b.inc




hash2b14:
 mov ah, [rsi+1]
 mov al, [rsi+3]
 and rax, rcx
%line 167+1 hash2b.inc
 mov rdx, rax
%line 167+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 168+1 hash2b.inc

%line 168+0 hash2b.inc




hash2b13:
 mov ah, [rsi+16]
 mov al, [rsi+17]
 and rax, rcx
%line 169+1 hash2b.inc
 mov rdx, rax
%line 169+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 170+1 hash2b.inc

%line 170+0 hash2b.inc




hash2b12:
 mov ah, [rsi+10]
 mov al, [rsi+2]
 and rax, rcx
%line 171+1 hash2b.inc
 mov rdx, rax
%line 171+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 172+1 hash2b.inc

%line 172+0 hash2b.inc




hash2b11:
 mov ah, [rsi+5]
 mov al, [rsi+19]
 and rax, rcx
%line 173+1 hash2b.inc
 mov rdx, rax
%line 173+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 174+1 hash2b.inc

%line 174+0 hash2b.inc




hash2b10:
 mov ah, [rsi+13]
 mov al, [rsi+8]
 and rax, rcx
%line 175+1 hash2b.inc
 mov rdx, rax
%line 175+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 176+1 hash2b.inc

%line 176+0 hash2b.inc




hash2b9:
 mov ah, [rsi+9]
 mov al, [rsi+5]
 and rax, rcx
%line 177+1 hash2b.inc
 mov rdx, rax
%line 177+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 178+1 hash2b.inc

%line 178+0 hash2b.inc




hash2b8:
 mov ah, [rsi+0]
 mov al, [rsi+17]
 and rax, rcx
%line 179+1 hash2b.inc
 mov rdx, rax
%line 179+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 180+1 hash2b.inc

%line 180+0 hash2b.inc




hash2b7:
 mov ah, [rsi+12]
 mov al, [rsi+11]
 and rax, rcx
%line 181+1 hash2b.inc
 mov rdx, rax
%line 181+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 182+1 hash2b.inc

%line 182+0 hash2b.inc




hash2b6:
 mov ah, [rsi+15]
 mov al, [rsi+18]
 and rax, rcx
%line 183+1 hash2b.inc
 mov rdx, rax
%line 183+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 184+1 hash2b.inc

%line 184+0 hash2b.inc




hash2b5:
 mov ah, [rsi+3]
 mov al, [rsi+1]
 and rax, rcx
%line 185+1 hash2b.inc
 mov rdx, rax
%line 185+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 186+1 hash2b.inc

%line 186+0 hash2b.inc




hash2b4:
 mov ah, [rsi+4]
 mov al, [rsi+16]
 and rax, rcx
%line 187+1 hash2b.inc
 mov rdx, rax
%line 187+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 188+1 hash2b.inc

%line 188+0 hash2b.inc




hash2b3:
 mov ah, [rsi+6]
 mov al, [rsi+7]
 and rax, rcx
%line 189+1 hash2b.inc
 mov rdx, rax
%line 189+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 190+1 hash2b.inc

%line 190+0 hash2b.inc




hash2b2:
 mov ah, [rsi+10]
 mov al, [rsi+2]
 and rax, rcx
%line 191+1 hash2b.inc
 mov rdx, rax
%line 191+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 192+1 hash2b.inc

%line 192+0 hash2b.inc




hash2b1:
 mov ah, [rsi+14]
 mov al, [rsi+19]
 and rax, rcx
%line 193+1 hash2b.inc
 mov rdx, rax
%line 193+0 hash2b.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 194+1 hash2b.inc
hash2b0:


%line 38+1 bloom_h160_chk.asm
 jmp bloom_hit
%line 2+1 hash2s.inc

%line 2+0 hash2s.inc




hash2s45:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+4]
 and rax, rcx
%line 3+1 hash2s.inc
 mov rdx, rax
%line 3+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 4+1 hash2s.inc

%line 4+0 hash2s.inc




hash2s44:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 5+1 hash2s.inc
 mov rdx, rax
%line 5+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 6+1 hash2s.inc

%line 6+0 hash2s.inc




hash2s43:
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 7+1 hash2s.inc
 mov rdx, rax
%line 7+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 8+1 hash2s.inc

%line 8+0 hash2s.inc




hash2s42:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+8]
 and rax, rcx
%line 9+1 hash2s.inc
 mov rdx, rax
%line 9+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 10+1 hash2s.inc

%line 10+0 hash2s.inc




hash2s41:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 11+1 hash2s.inc
 mov rdx, rax
%line 11+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 12+1 hash2s.inc

%line 12+0 hash2s.inc




hash2s40:
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 13+1 hash2s.inc
 mov rdx, rax
%line 13+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 14+1 hash2s.inc

%line 14+0 hash2s.inc




hash2s39:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 15+1 hash2s.inc
 mov rdx, rax
%line 15+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 16+1 hash2s.inc

%line 16+0 hash2s.inc




hash2s38:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 17+1 hash2s.inc
 mov rdx, rax
%line 17+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 18+1 hash2s.inc

%line 18+0 hash2s.inc




hash2s37:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 19+1 hash2s.inc
 mov rdx, rax
%line 19+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 20+1 hash2s.inc

%line 20+0 hash2s.inc




hash2s36:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 21+1 hash2s.inc
 mov rdx, rax
%line 21+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 22+1 hash2s.inc

%line 22+0 hash2s.inc




hash2s35:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 23+1 hash2s.inc
 mov rdx, rax
%line 23+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 24+1 hash2s.inc

%line 24+0 hash2s.inc




hash2s34:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 25+1 hash2s.inc
 mov rdx, rax
%line 25+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 26+1 hash2s.inc

%line 26+0 hash2s.inc




hash2s33:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+8]
 and rax, rcx
%line 27+1 hash2s.inc
 mov rdx, rax
%line 27+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 28+1 hash2s.inc

%line 28+0 hash2s.inc




hash2s32:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 29+1 hash2s.inc
 mov rdx, rax
%line 29+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 30+1 hash2s.inc

%line 30+0 hash2s.inc




hash2s31:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 31+1 hash2s.inc
 mov rdx, rax
%line 31+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 32+1 hash2s.inc

%line 32+0 hash2s.inc




hash2s30:
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 33+1 hash2s.inc
 mov rdx, rax
%line 33+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 34+1 hash2s.inc

%line 34+0 hash2s.inc




hash2s29:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 35+1 hash2s.inc
 mov rdx, rax
%line 35+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 36+1 hash2s.inc

%line 36+0 hash2s.inc




hash2s28:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 37+1 hash2s.inc
 mov rdx, rax
%line 37+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 38+1 hash2s.inc

%line 38+0 hash2s.inc




hash2s27:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 39+1 hash2s.inc
 mov rdx, rax
%line 39+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 40+1 hash2s.inc

%line 40+0 hash2s.inc




hash2s26:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 41+1 hash2s.inc
 mov rdx, rax
%line 41+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 42+1 hash2s.inc

%line 42+0 hash2s.inc




hash2s25:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 43+1 hash2s.inc
 mov rdx, rax
%line 43+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 44+1 hash2s.inc

%line 44+0 hash2s.inc




hash2s24:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+4]
 and rax, rcx
%line 45+1 hash2s.inc
 mov rdx, rax
%line 45+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 46+1 hash2s.inc

%line 46+0 hash2s.inc




hash2s23:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+8]
 and rax, rcx
%line 47+1 hash2s.inc
 mov rdx, rax
%line 47+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 48+1 hash2s.inc

%line 48+0 hash2s.inc




hash2s22:
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 49+1 hash2s.inc
 mov rdx, rax
%line 49+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 50+1 hash2s.inc

%line 50+0 hash2s.inc




hash2s21:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 51+1 hash2s.inc
 mov rdx, rax
%line 51+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 52+1 hash2s.inc

%line 52+0 hash2s.inc




hash2s20:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+6]
 and rax, rcx
%line 53+1 hash2s.inc
 mov rdx, rax
%line 53+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 54+1 hash2s.inc

%line 54+0 hash2s.inc




hash2s19:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+8]
 and rax, rcx
%line 55+1 hash2s.inc
 mov rdx, rax
%line 55+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 56+1 hash2s.inc

%line 56+0 hash2s.inc




hash2s18:
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 57+1 hash2s.inc
 mov rdx, rax
%line 57+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 58+1 hash2s.inc

%line 58+0 hash2s.inc




hash2s17:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 59+1 hash2s.inc
 mov rdx, rax
%line 59+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 60+1 hash2s.inc

%line 60+0 hash2s.inc




hash2s16:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 61+1 hash2s.inc
 mov rdx, rax
%line 61+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 62+1 hash2s.inc

%line 62+0 hash2s.inc




hash2s15:
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 63+1 hash2s.inc
 mov rdx, rax
%line 63+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 64+1 hash2s.inc

%line 64+0 hash2s.inc




hash2s14:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 65+1 hash2s.inc
 mov rdx, rax
%line 65+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 66+1 hash2s.inc

%line 66+0 hash2s.inc




hash2s13:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+6]
 and rax, rcx
%line 67+1 hash2s.inc
 mov rdx, rax
%line 67+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 68+1 hash2s.inc

%line 68+0 hash2s.inc




hash2s12:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 69+1 hash2s.inc
 mov rdx, rax
%line 69+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 70+1 hash2s.inc

%line 70+0 hash2s.inc




hash2s11:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 71+1 hash2s.inc
 mov rdx, rax
%line 71+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 72+1 hash2s.inc

%line 72+0 hash2s.inc




hash2s10:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 73+1 hash2s.inc
 mov rdx, rax
%line 73+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 74+1 hash2s.inc

%line 74+0 hash2s.inc




hash2s9:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 75+1 hash2s.inc
 mov rdx, rax
%line 75+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 76+1 hash2s.inc

%line 76+0 hash2s.inc




hash2s8:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 77+1 hash2s.inc
 mov rdx, rax
%line 77+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 78+1 hash2s.inc

%line 78+0 hash2s.inc




hash2s7:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 79+1 hash2s.inc
 mov rdx, rax
%line 79+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 80+1 hash2s.inc

%line 80+0 hash2s.inc




hash2s6:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+2]
 and rax, rcx
%line 81+1 hash2s.inc
 mov rdx, rax
%line 81+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 82+1 hash2s.inc

%line 82+0 hash2s.inc




hash2s5:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 83+1 hash2s.inc
 mov rdx, rax
%line 83+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 84+1 hash2s.inc

%line 84+0 hash2s.inc




hash2s4:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 85+1 hash2s.inc
 mov rdx, rax
%line 85+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 86+1 hash2s.inc

%line 86+0 hash2s.inc




hash2s3:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 87+1 hash2s.inc
 mov rdx, rax
%line 87+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 88+1 hash2s.inc

%line 88+0 hash2s.inc




hash2s2:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+6]
 and rax, rcx
%line 89+1 hash2s.inc
 mov rdx, rax
%line 89+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 90+1 hash2s.inc

%line 90+0 hash2s.inc




hash2s1:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 91+1 hash2s.inc
 mov rdx, rax
%line 91+0 hash2s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 92+1 hash2s.inc
hash2s0:


%line 40+1 bloom_h160_chk.asm
 jmp bloom_hit
%line 2+1 hash3s.inc

%line 2+0 hash3s.inc




hash3s96:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+8]
 and rax, rcx
%line 3+1 hash3s.inc
 mov rdx, rax
%line 3+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 4+1 hash3s.inc

%line 4+0 hash3s.inc




hash3s95:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+6]
 and rax, rcx
%line 5+1 hash3s.inc
 mov rdx, rax
%line 5+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 6+1 hash3s.inc

%line 6+0 hash3s.inc




hash3s94:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+0]
 and rax, rcx
%line 7+1 hash3s.inc
 mov rdx, rax
%line 7+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 8+1 hash3s.inc

%line 8+0 hash3s.inc




hash3s93:
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+4]
 and rax, rcx
%line 9+1 hash3s.inc
 mov rdx, rax
%line 9+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 10+1 hash3s.inc

%line 10+0 hash3s.inc




hash3s92:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 11+1 hash3s.inc
 mov rdx, rax
%line 11+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 12+1 hash3s.inc

%line 12+0 hash3s.inc




hash3s91:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+8]
 and rax, rcx
%line 13+1 hash3s.inc
 mov rdx, rax
%line 13+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 14+1 hash3s.inc

%line 14+0 hash3s.inc




hash3s90:
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+0]
 and rax, rcx
%line 15+1 hash3s.inc
 mov rdx, rax
%line 15+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 16+1 hash3s.inc

%line 16+0 hash3s.inc




hash3s89:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 17+1 hash3s.inc
 mov rdx, rax
%line 17+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 18+1 hash3s.inc

%line 18+0 hash3s.inc




hash3s88:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 19+1 hash3s.inc
 mov rdx, rax
%line 19+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 20+1 hash3s.inc

%line 20+0 hash3s.inc




hash3s87:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+2]
 and rax, rcx
%line 21+1 hash3s.inc
 mov rdx, rax
%line 21+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 22+1 hash3s.inc

%line 22+0 hash3s.inc




hash3s86:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+8]
 and rax, rcx
%line 23+1 hash3s.inc
 mov rdx, rax
%line 23+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 24+1 hash3s.inc

%line 24+0 hash3s.inc




hash3s85:
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 25+1 hash3s.inc
 mov rdx, rax
%line 25+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 26+1 hash3s.inc

%line 26+0 hash3s.inc




hash3s84:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 27+1 hash3s.inc
 mov rdx, rax
%line 27+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 28+1 hash3s.inc

%line 28+0 hash3s.inc




hash3s83:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+4]
 and rax, rcx
%line 29+1 hash3s.inc
 mov rdx, rax
%line 29+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 30+1 hash3s.inc

%line 30+0 hash3s.inc




hash3s82:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 31+1 hash3s.inc
 mov rdx, rax
%line 31+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 32+1 hash3s.inc

%line 32+0 hash3s.inc




hash3s81:
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+0]
 and rax, rcx
%line 33+1 hash3s.inc
 mov rdx, rax
%line 33+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 34+1 hash3s.inc

%line 34+0 hash3s.inc




hash3s80:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+2]
 and rax, rcx
%line 35+1 hash3s.inc
 mov rdx, rax
%line 35+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 36+1 hash3s.inc

%line 36+0 hash3s.inc




hash3s79:
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 37+1 hash3s.inc
 mov rdx, rax
%line 37+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 38+1 hash3s.inc

%line 38+0 hash3s.inc




hash3s78:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+6]
 and rax, rcx
%line 39+1 hash3s.inc
 mov rdx, rax
%line 39+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 40+1 hash3s.inc

%line 40+0 hash3s.inc




hash3s77:
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+2]
 and rax, rcx
%line 41+1 hash3s.inc
 mov rdx, rax
%line 41+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 42+1 hash3s.inc

%line 42+0 hash3s.inc




hash3s76:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 43+1 hash3s.inc
 mov rdx, rax
%line 43+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 44+1 hash3s.inc

%line 44+0 hash3s.inc




hash3s75:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 45+1 hash3s.inc
 mov rdx, rax
%line 45+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 46+1 hash3s.inc

%line 46+0 hash3s.inc




hash3s74:
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+4]
 and rax, rcx
%line 47+1 hash3s.inc
 mov rdx, rax
%line 47+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 48+1 hash3s.inc

%line 48+0 hash3s.inc




hash3s73:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 49+1 hash3s.inc
 mov rdx, rax
%line 49+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 50+1 hash3s.inc

%line 50+0 hash3s.inc




hash3s72:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 51+1 hash3s.inc
 mov rdx, rax
%line 51+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 52+1 hash3s.inc

%line 52+0 hash3s.inc




hash3s71:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+8]
 and rax, rcx
%line 53+1 hash3s.inc
 mov rdx, rax
%line 53+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 54+1 hash3s.inc

%line 54+0 hash3s.inc




hash3s70:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+4]
 and rax, rcx
%line 55+1 hash3s.inc
 mov rdx, rax
%line 55+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 56+1 hash3s.inc

%line 56+0 hash3s.inc




hash3s69:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+2]
 and rax, rcx
%line 57+1 hash3s.inc
 mov rdx, rax
%line 57+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 58+1 hash3s.inc

%line 58+0 hash3s.inc




hash3s68:
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 59+1 hash3s.inc
 mov rdx, rax
%line 59+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 60+1 hash3s.inc

%line 60+0 hash3s.inc




hash3s67:
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+0]
 and rax, rcx
%line 61+1 hash3s.inc
 mov rdx, rax
%line 61+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 62+1 hash3s.inc

%line 62+0 hash3s.inc




hash3s66:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 63+1 hash3s.inc
 mov rdx, rax
%line 63+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 64+1 hash3s.inc

%line 64+0 hash3s.inc




hash3s65:
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 65+1 hash3s.inc
 mov rdx, rax
%line 65+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 66+1 hash3s.inc

%line 66+0 hash3s.inc




hash3s64:
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+0]
 and rax, rcx
%line 67+1 hash3s.inc
 mov rdx, rax
%line 67+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 68+1 hash3s.inc

%line 68+0 hash3s.inc




hash3s63:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 69+1 hash3s.inc
 mov rdx, rax
%line 69+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 70+1 hash3s.inc

%line 70+0 hash3s.inc




hash3s62:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+2]
 and rax, rcx
%line 71+1 hash3s.inc
 mov rdx, rax
%line 71+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 72+1 hash3s.inc

%line 72+0 hash3s.inc




hash3s61:
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 73+1 hash3s.inc
 mov rdx, rax
%line 73+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 74+1 hash3s.inc

%line 74+0 hash3s.inc




hash3s60:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+6]
 and rax, rcx
%line 75+1 hash3s.inc
 mov rdx, rax
%line 75+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 76+1 hash3s.inc

%line 76+0 hash3s.inc




hash3s59:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+0]
 and rax, rcx
%line 77+1 hash3s.inc
 mov rdx, rax
%line 77+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 78+1 hash3s.inc

%line 78+0 hash3s.inc




hash3s58:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 79+1 hash3s.inc
 mov rdx, rax
%line 79+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 80+1 hash3s.inc

%line 80+0 hash3s.inc




hash3s57:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 81+1 hash3s.inc
 mov rdx, rax
%line 81+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 82+1 hash3s.inc

%line 82+0 hash3s.inc




hash3s56:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 83+1 hash3s.inc
 mov rdx, rax
%line 83+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 84+1 hash3s.inc

%line 84+0 hash3s.inc




hash3s55:
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 85+1 hash3s.inc
 mov rdx, rax
%line 85+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 86+1 hash3s.inc

%line 86+0 hash3s.inc




hash3s54:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+2]
 and rax, rcx
%line 87+1 hash3s.inc
 mov rdx, rax
%line 87+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 88+1 hash3s.inc

%line 88+0 hash3s.inc




hash3s53:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 89+1 hash3s.inc
 mov rdx, rax
%line 89+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 90+1 hash3s.inc

%line 90+0 hash3s.inc




hash3s52:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+6]
 and rax, rcx
%line 91+1 hash3s.inc
 mov rdx, rax
%line 91+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 92+1 hash3s.inc

%line 92+0 hash3s.inc




hash3s51:
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+4]
 and rax, rcx
%line 93+1 hash3s.inc
 mov rdx, rax
%line 93+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 94+1 hash3s.inc

%line 94+0 hash3s.inc




hash3s50:
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 95+1 hash3s.inc
 mov rdx, rax
%line 95+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 96+1 hash3s.inc

%line 96+0 hash3s.inc




hash3s49:
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 97+1 hash3s.inc
 mov rdx, rax
%line 97+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 98+1 hash3s.inc

%line 98+0 hash3s.inc




hash3s48:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+0]
 and rax, rcx
%line 99+1 hash3s.inc
 mov rdx, rax
%line 99+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 100+1 hash3s.inc

%line 100+0 hash3s.inc




hash3s47:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+2]
 and rax, rcx
%line 101+1 hash3s.inc
 mov rdx, rax
%line 101+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 102+1 hash3s.inc

%line 102+0 hash3s.inc




hash3s46:
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 103+1 hash3s.inc
 mov rdx, rax
%line 103+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 104+1 hash3s.inc

%line 104+0 hash3s.inc




hash3s45:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+4]
 and rax, rcx
%line 105+1 hash3s.inc
 mov rdx, rax
%line 105+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 106+1 hash3s.inc

%line 106+0 hash3s.inc




hash3s44:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 107+1 hash3s.inc
 mov rdx, rax
%line 107+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 108+1 hash3s.inc

%line 108+0 hash3s.inc




hash3s43:
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 109+1 hash3s.inc
 mov rdx, rax
%line 109+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 110+1 hash3s.inc

%line 110+0 hash3s.inc




hash3s42:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+8]
 and rax, rcx
%line 111+1 hash3s.inc
 mov rdx, rax
%line 111+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 112+1 hash3s.inc

%line 112+0 hash3s.inc




hash3s41:
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 113+1 hash3s.inc
 mov rdx, rax
%line 113+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 114+1 hash3s.inc

%line 114+0 hash3s.inc




hash3s40:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 115+1 hash3s.inc
 mov rdx, rax
%line 115+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 116+1 hash3s.inc

%line 116+0 hash3s.inc




hash3s39:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 117+1 hash3s.inc
 mov rdx, rax
%line 117+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 118+1 hash3s.inc

%line 118+0 hash3s.inc




hash3s38:
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 119+1 hash3s.inc
 mov rdx, rax
%line 119+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 120+1 hash3s.inc

%line 120+0 hash3s.inc




hash3s37:
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 121+1 hash3s.inc
 mov rdx, rax
%line 121+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 122+1 hash3s.inc

%line 122+0 hash3s.inc




hash3s36:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 123+1 hash3s.inc
 mov rdx, rax
%line 123+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 124+1 hash3s.inc

%line 124+0 hash3s.inc




hash3s35:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 125+1 hash3s.inc
 mov rdx, rax
%line 125+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 126+1 hash3s.inc

%line 126+0 hash3s.inc




hash3s34:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 127+1 hash3s.inc
 mov rdx, rax
%line 127+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 128+1 hash3s.inc

%line 128+0 hash3s.inc




hash3s33:
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+8]
 and rax, rcx
%line 129+1 hash3s.inc
 mov rdx, rax
%line 129+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 130+1 hash3s.inc

%line 130+0 hash3s.inc




hash3s32:
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 131+1 hash3s.inc
 mov rdx, rax
%line 131+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 132+1 hash3s.inc

%line 132+0 hash3s.inc




hash3s31:
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 133+1 hash3s.inc
 mov rdx, rax
%line 133+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 134+1 hash3s.inc

%line 134+0 hash3s.inc




hash3s30:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 135+1 hash3s.inc
 mov rdx, rax
%line 135+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 136+1 hash3s.inc

%line 136+0 hash3s.inc




hash3s29:
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 137+1 hash3s.inc
 mov rdx, rax
%line 137+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 138+1 hash3s.inc

%line 138+0 hash3s.inc




hash3s28:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 139+1 hash3s.inc
 mov rdx, rax
%line 139+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 140+1 hash3s.inc

%line 140+0 hash3s.inc




hash3s27:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 141+1 hash3s.inc
 mov rdx, rax
%line 141+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 142+1 hash3s.inc

%line 142+0 hash3s.inc




hash3s26:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 143+1 hash3s.inc
 mov rdx, rax
%line 143+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 144+1 hash3s.inc

%line 144+0 hash3s.inc




hash3s25:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 145+1 hash3s.inc
 mov rdx, rax
%line 145+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 146+1 hash3s.inc

%line 146+0 hash3s.inc




hash3s24:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+4]
 and rax, rcx
%line 147+1 hash3s.inc
 mov rdx, rax
%line 147+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 148+1 hash3s.inc

%line 148+0 hash3s.inc




hash3s23:
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+8]
 and rax, rcx
%line 149+1 hash3s.inc
 mov rdx, rax
%line 149+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 150+1 hash3s.inc

%line 150+0 hash3s.inc




hash3s22:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 151+1 hash3s.inc
 mov rdx, rax
%line 151+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 152+1 hash3s.inc

%line 152+0 hash3s.inc




hash3s21:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 153+1 hash3s.inc
 mov rdx, rax
%line 153+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 154+1 hash3s.inc

%line 154+0 hash3s.inc




hash3s20:
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+6]
 and rax, rcx
%line 155+1 hash3s.inc
 mov rdx, rax
%line 155+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 156+1 hash3s.inc

%line 156+0 hash3s.inc




hash3s19:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+8]
 and rax, rcx
%line 157+1 hash3s.inc
 mov rdx, rax
%line 157+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 158+1 hash3s.inc

%line 158+0 hash3s.inc




hash3s18:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 159+1 hash3s.inc
 mov rdx, rax
%line 159+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 160+1 hash3s.inc

%line 160+0 hash3s.inc




hash3s17:
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 161+1 hash3s.inc
 mov rdx, rax
%line 161+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 162+1 hash3s.inc

%line 162+0 hash3s.inc




hash3s16:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 163+1 hash3s.inc
 mov rdx, rax
%line 163+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 164+1 hash3s.inc

%line 164+0 hash3s.inc




hash3s15:
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 165+1 hash3s.inc
 mov rdx, rax
%line 165+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 166+1 hash3s.inc

%line 166+0 hash3s.inc




hash3s14:
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+10]
 and rax, rcx
%line 167+1 hash3s.inc
 mov rdx, rax
%line 167+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 168+1 hash3s.inc

%line 168+0 hash3s.inc




hash3s13:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+6]
 and rax, rcx
%line 169+1 hash3s.inc
 mov rdx, rax
%line 169+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 170+1 hash3s.inc

%line 170+0 hash3s.inc




hash3s12:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 171+1 hash3s.inc
 mov rdx, rax
%line 171+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 172+1 hash3s.inc

%line 172+0 hash3s.inc




hash3s11:
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 173+1 hash3s.inc
 mov rdx, rax
%line 173+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 174+1 hash3s.inc

%line 174+0 hash3s.inc




hash3s10:
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 175+1 hash3s.inc
 mov rdx, rax
%line 175+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 176+1 hash3s.inc

%line 176+0 hash3s.inc




hash3s9:
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 177+1 hash3s.inc
 mov rdx, rax
%line 177+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 178+1 hash3s.inc

%line 178+0 hash3s.inc




hash3s8:
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 179+1 hash3s.inc
 mov rdx, rax
%line 179+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 180+1 hash3s.inc

%line 180+0 hash3s.inc




hash3s7:
 mov ax, [rsi+16]
 shl rax, 16
 mov ax, [rsi+6]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 181+1 hash3s.inc
 mov rdx, rax
%line 181+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 182+1 hash3s.inc

%line 182+0 hash3s.inc




hash3s6:
 mov ax, [rsi+14]
 shl rax, 16
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+2]
 and rax, rcx
%line 183+1 hash3s.inc
 mov rdx, rax
%line 183+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 184+1 hash3s.inc

%line 184+0 hash3s.inc




hash3s5:
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+8]
 shl rax, 16
 mov ax, [rsi+14]
 and rax, rcx
%line 185+1 hash3s.inc
 mov rdx, rax
%line 185+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 186+1 hash3s.inc

%line 186+0 hash3s.inc




hash3s4:
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+18]
 and rax, rcx
%line 187+1 hash3s.inc
 mov rdx, rax
%line 187+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 188+1 hash3s.inc

%line 188+0 hash3s.inc




hash3s3:
 mov ax, [rsi+10]
 shl rax, 16
 mov ax, [rsi+4]
 shl rax, 16
 mov ax, [rsi+16]
 and rax, rcx
%line 189+1 hash3s.inc
 mov rdx, rax
%line 189+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 190+1 hash3s.inc

%line 190+0 hash3s.inc




hash3s2:
 mov ax, [rsi+12]
 shl rax, 16
 mov ax, [rsi+2]
 shl rax, 16
 mov ax, [rsi+6]
 and rax, rcx
%line 191+1 hash3s.inc
 mov rdx, rax
%line 191+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 192+1 hash3s.inc

%line 192+0 hash3s.inc




hash3s1:
 mov ax, [rsi+18]
 shl rax, 16
 mov ax, [rsi+0]
 shl rax, 16
 mov ax, [rsi+12]
 and rax, rcx
%line 193+1 hash3s.inc
 mov rdx, rax
%line 193+0 hash3s.inc
 shr rax, 3
 and edx, 7
 mov al, [rdi+rax]
 bt ax, dx
 jnc bloom_miss
%line 194+1 hash3s.inc
hash3s0:


%line 42+1 bloom_h160_chk.asm
 jmp bloom_hit

single:

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
 mov rax, 1
 mov rdi, 2
 mov rsi, abort_msg
 mov rdx, 13
 syscall
 mov rax, 60
 mov rdi, 255
 syscall
 ret

[section .rodata]

[sectalign 16]
%line 81+0 bloom_h160_chk.asm
times (((16) - (($-$$) % (16))) % (16)) db 0xff
%line 1+1 art.asm
dq 0, 0
dq 6872316147973234720, 729618461984055135, 2314885539627409440,
dq 729618522331815968, 2340781289023483680, 729684432900726908,
dq 2340847199373500463, 746506960586682236, 2331774029421092988,
dq 755514159841419311, 8944184440039550844, 755580139163557920,
dq 8944184247793441884, 733857350952951840, 2314885530818468896,
dq 729634954658455584, 2823229338763927584, 729618857121030190,
dq 2340781624064487200, 729684433694367868, 2340781623818854524,
dq 755514554984439932, 2340781623818854524, 755514554984439932,
dq 2316871643955670652, 755529583075012135, 3255394979272490108,
dq 755615314917227566, 3341719470063693607, 731588787828105248,
dq 2314885646782570536, 729684707677842471, 2318840525902130471,
dq 732221006006991648, 6642014916320436256, 729628474006580283,
dq 2314885530818453536, 729618526863309660, 2314885530818453536,
dq 729618461985021984, 2314885530818453536, 729618461984038944,
dq 0, 0

%line 83+1 bloom_h160_chk.asm


 abort_msg: db "Bad hash id!", 0x0a, 0


[sectalign 16]
%line 88+0 bloom_h160_chk.asm
times (((16) - (($-$$) % (16))) % (16)) db 0xff
%line 89+1 bloom_h160_chk.asm
 db 'data1sT', 0
hash1sN:
 db 10
[sectalign 8]
%line 92+0 bloom_h160_chk.asm
times (((8) - (($-$$) % (8))) % (8)) db 0
%line 93+1 bloom_h160_chk.asm
data1sT:
%line 1+1 data1s.inc
 db 2
 db 5
 db 9
 db 6
 db 7
 db 8
 db 3
 db 1
 db 0
 db 4


%line 95+1 bloom_h160_chk.asm

[sectalign 16]
%line 96+0 bloom_h160_chk.asm
times (((16) - (($-$$) % (16))) % (16)) db 0xff
%line 97+1 bloom_h160_chk.asm
 db 'data2bT', 0
hash2bN:
 db 96
[sectalign 8]
%line 100+0 bloom_h160_chk.asm
times (((8) - (($-$$) % (8))) % (8)) db 0
%line 101+1 bloom_h160_chk.asm
data2bT:
%line 1+1 data2b.inc
 db 14, 19
 db 10, 2
 db 6, 7
 db 4, 16
 db 3, 1
 db 15, 18
 db 12, 11
 db 0, 17
 db 9, 5
 db 13, 8
 db 5, 19
 db 10, 2
 db 16, 17
 db 1, 3
 db 15, 12
 db 11, 14
 db 0, 18
 db 13, 7
 db 8, 4
 db 9, 6
 db 2, 10
 db 19, 12
 db 16, 14
 db 1, 4
 db 3, 18
 db 7, 5
 db 0, 9
 db 13, 11
 db 8, 17
 db 6, 15
 db 2, 5
 db 19, 12
 db 14, 16
 db 7, 10
 db 1, 17
 db 4, 18
 db 3, 13
 db 0, 6
 db 11, 8
 db 9, 15
 db 12, 19
 db 7, 2
 db 5, 3
 db 14, 13
 db 10, 16
 db 18, 17
 db 8, 4
 db 11, 15
 db 6, 9
 db 0, 1
 db 19, 17
 db 15, 12
 db 2, 7
 db 3, 5
 db 14, 13
 db 10, 18
 db 0, 16
 db 8, 4
 db 11, 9
 db 1, 6
 db 17, 19
 db 15, 12
 db 16, 5
 db 3, 14
 db 13, 7
 db 11, 2
 db 8, 4
 db 1, 10
 db 9, 18
 db 0, 14
 db 5, 6
 db 19, 16
 db 12, 15
 db 17, 3
 db 7, 13
 db 2, 11
 db 4, 8
 db 18, 1
 db 9, 10
 db 0, 12
 db 14, 6
 db 16, 19
 db 5, 7
 db 17, 3
 db 15, 10
 db 11, 13
 db 2, 18
 db 4, 9
 db 8, 0
 db 1, 12
 db 14, 6
 db 16, 5
 db 19, 7
 db 3, 17
 db 10, 15
 db 9, 2


%line 103+1 bloom_h160_chk.asm

[sectalign 16]
%line 104+0 bloom_h160_chk.asm
times (((16) - (($-$$) % (16))) % (16)) db 0xff
%line 105+1 bloom_h160_chk.asm
 db 'data2sT', 0
hash2sN:
 db 45
[sectalign 8]
%line 108+0 bloom_h160_chk.asm
times (((8) - (($-$$) % (8))) % (8)) db 0
%line 109+1 bloom_h160_chk.asm
data2sT:
%line 1+1 data2s.inc
 db 0, 6
 db 1, 3
 db 2, 8
 db 5, 9
 db 4, 7
 db 0, 1
 db 3, 9
 db 4, 8
 db 5, 7
 db 2, 6
 db 1, 7
 db 4, 6
 db 2, 3
 db 0, 5
 db 8, 9
 db 1, 8
 db 3, 7
 db 6, 9
 db 2, 4
 db 0, 3
 db 5, 8
 db 6, 7
 db 1, 4
 db 0, 2
 db 4, 9
 db 3, 5
 db 0, 7
 db 1, 6
 db 2, 5
 db 7, 8
 db 1, 9
 db 3, 6
 db 0, 4
 db 2, 9
 db 3, 8
 db 4, 5
 db 2, 7
 db 5, 6
 db 0, 9
 db 6, 8
 db 1, 5
 db 3, 4
 db 7, 9
 db 0, 8
 db 1, 2


%line 111+1 bloom_h160_chk.asm

[sectalign 16]
%line 112+0 bloom_h160_chk.asm
times (((16) - (($-$$) % (16))) % (16)) db 0xff
%line 113+1 bloom_h160_chk.asm
 db 'data3sT', 0
hash3sN:
 db 96
[sectalign 8]
%line 116+0 bloom_h160_chk.asm
times (((8) - (($-$$) % (8))) % (8)) db 0
%line 117+1 bloom_h160_chk.asm
data3sT:
%line 1+1 data3s.inc
 db 9, 0, 6
 db 6, 1, 3
 db 5, 2, 8
 db 1, 5, 9
 db 2, 4, 7
 db 7, 0, 1
 db 8, 3, 9
 db 0, 4, 8
 db 4, 5, 7
 db 3, 2, 6
 db 8, 1, 7
 db 2, 4, 6
 db 4, 2, 3
 db 7, 0, 5
 db 6, 8, 9
 db 5, 1, 8
 db 9, 3, 7
 db 1, 6, 9
 db 0, 2, 4
 db 6, 0, 3
 db 3, 5, 8
 db 0, 6, 7
 db 9, 1, 4
 db 1, 0, 2
 db 5, 4, 9
 db 2, 3, 5
 db 3, 0, 7
 db 4, 1, 6
 db 7, 2, 5
 db 5, 7, 8
 db 8, 1, 9
 db 8, 3, 6
 db 6, 0, 4
 db 1, 2, 9
 db 0, 3, 8
 db 3, 4, 5
 db 9, 2, 7
 db 7, 5, 6
 db 2, 0, 9
 db 4, 6, 8
 db 7, 1, 5
 db 0, 3, 4
 db 8, 7, 9
 db 5, 0, 8
 db 3, 1, 2
 db 6, 4, 9
 db 2, 7, 1
 db 4, 1, 0
 db 9, 3, 6
 db 6, 5, 8
 db 7, 8, 2
 db 0, 5, 3
 db 4, 2, 9
 db 5, 4, 1
 db 9, 6, 7
 db 2, 3, 8
 db 0, 1, 8
 db 2, 7, 6
 db 4, 9, 0
 db 1, 5, 3
 db 9, 4, 8
 db 2, 5, 1
 db 3, 7, 6
 db 7, 4, 0
 db 9, 5, 8
 db 2, 1, 6
 db 9, 3, 0
 db 7, 8, 6
 db 0, 5, 1
 db 3, 9, 2
 db 3, 8, 4
 db 4, 1, 7
 db 0, 6, 5
 db 6, 8, 2
 db 4, 9, 7
 db 2, 0, 5
 db 8, 3, 1
 db 5, 9, 3
 db 6, 4, 7
 db 2, 8, 1
 db 9, 5, 0
 db 1, 3, 7
 db 0, 6, 2
 db 4, 3, 9
 db 7, 0, 8
 db 5, 6, 4
 db 2, 4, 1
 db 1, 7, 9
 db 5, 3, 6
 db 8, 2, 0
 db 1, 8, 4
 db 3, 7, 5
 db 6, 9, 2
 db 2, 7, 0
 db 1, 9, 3
 db 0, 5, 4


%line 119+1 bloom_h160_chk.asm


[sectalign 16]
%line 121+0 bloom_h160_chk.asm
times (((16) - (($-$$) % (16))) % (16)) db 0xff
%line 122+1 bloom_h160_chk.asm
hashD:
 db "legacy", 0, 0
hashT:
 dq legacy
 db "single", 0, 0
 dq single
%line 135+1 bloom_h160_chk.asm
 db "h1s", '1'
%line 135+0 bloom_h160_chk.asm
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash1s1
 db "h1s", '2'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash1s2
 db "h1s", '3'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash1s3
 db "h1s", '4'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash1s4
 db "h1s", '5'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash1s5
 db "h1s", '6'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash1s6
 db "h1s", '7'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash1s7
 db "h1s", '8'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash1s8
 db "h1s", '9'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash1s9
 db "h1s", '10'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash1s10
%line 143+1 bloom_h160_chk.asm
 db "h2b", '1', 0
%line 143+0 bloom_h160_chk.asm
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b1
 db "h2b", '2', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b2
 db "h2b", '3', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b3
 db "h2b", '4', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b4
 db "h2b", '5', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b5
 db "h2b", '6', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b6
 db "h2b", '7', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b7
 db "h2b", '8', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b8
 db "h2b", '9', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b9
 db "h2b", '10', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b10
 db "h2b", '11', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b11
 db "h2b", '12', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b12
 db "h2b", '13', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b13
 db "h2b", '14', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b14
 db "h2b", '15', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b15
 db "h2b", '16', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b16
 db "h2b", '17', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b17
 db "h2b", '18', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b18
 db "h2b", '19', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b19
 db "h2b", '20', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b20
 db "h2b", '21', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b21
 db "h2b", '22', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b22
 db "h2b", '23', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b23
 db "h2b", '24', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b24
 db "h2b", '25', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b25
 db "h2b", '26', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b26
 db "h2b", '27', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b27
 db "h2b", '28', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b28
 db "h2b", '29', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b29
 db "h2b", '30', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b30
 db "h2b", '31', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b31
 db "h2b", '32', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b32
 db "h2b", '33', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b33
 db "h2b", '34', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b34
 db "h2b", '35', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b35
 db "h2b", '36', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b36
 db "h2b", '37', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b37
 db "h2b", '38', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b38
 db "h2b", '39', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b39
 db "h2b", '40', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b40
 db "h2b", '41', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b41
 db "h2b", '42', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b42
 db "h2b", '43', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b43
 db "h2b", '44', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b44
 db "h2b", '45', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b45
 db "h2b", '46', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b46
 db "h2b", '47', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b47
 db "h2b", '48', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b48
 db "h2b", '49', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b49
 db "h2b", '50', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b50
 db "h2b", '51', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b51
 db "h2b", '52', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b52
 db "h2b", '53', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b53
 db "h2b", '54', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b54
 db "h2b", '55', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b55
 db "h2b", '56', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b56
 db "h2b", '57', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b57
 db "h2b", '58', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b58
 db "h2b", '59', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b59
 db "h2b", '60', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b60
 db "h2b", '61', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b61
 db "h2b", '62', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b62
 db "h2b", '63', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b63
 db "h2b", '64', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b64
 db "h2b", '65', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b65
 db "h2b", '66', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b66
 db "h2b", '67', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b67
 db "h2b", '68', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b68
 db "h2b", '69', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b69
 db "h2b", '70', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b70
 db "h2b", '71', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b71
 db "h2b", '72', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b72
 db "h2b", '73', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b73
 db "h2b", '74', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b74
 db "h2b", '75', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b75
 db "h2b", '76', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b76
 db "h2b", '77', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b77
 db "h2b", '78', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b78
 db "h2b", '79', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b79
 db "h2b", '80', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b80
 db "h2b", '81', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b81
 db "h2b", '82', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b82
 db "h2b", '83', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b83
 db "h2b", '84', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b84
 db "h2b", '85', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b85
 db "h2b", '86', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b86
 db "h2b", '87', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b87
 db "h2b", '88', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b88
 db "h2b", '89', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b89
 db "h2b", '90', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b90
 db "h2b", '91', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b91
 db "h2b", '92', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b92
 db "h2b", '93', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b93
 db "h2b", '94', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b94
 db "h2b", '95', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b95
 db "h2b", '96', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2b96
%line 151+1 bloom_h160_chk.asm
 db "h2s", '1', 0
%line 151+0 bloom_h160_chk.asm
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s1
 db "h2s", '2', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s2
 db "h2s", '3', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s3
 db "h2s", '4', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s4
 db "h2s", '5', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s5
 db "h2s", '6', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s6
 db "h2s", '7', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s7
 db "h2s", '8', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s8
 db "h2s", '9', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s9
 db "h2s", '10', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s10
 db "h2s", '11', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s11
 db "h2s", '12', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s12
 db "h2s", '13', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s13
 db "h2s", '14', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s14
 db "h2s", '15', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s15
 db "h2s", '16', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s16
 db "h2s", '17', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s17
 db "h2s", '18', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s18
 db "h2s", '19', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s19
 db "h2s", '20', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s20
 db "h2s", '21', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s21
 db "h2s", '22', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s22
 db "h2s", '23', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s23
 db "h2s", '24', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s24
 db "h2s", '25', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s25
 db "h2s", '26', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s26
 db "h2s", '27', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s27
 db "h2s", '28', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s28
 db "h2s", '29', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s29
 db "h2s", '30', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s30
 db "h2s", '31', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s31
 db "h2s", '32', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s32
 db "h2s", '33', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s33
 db "h2s", '34', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s34
 db "h2s", '35', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s35
 db "h2s", '36', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s36
 db "h2s", '37', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s37
 db "h2s", '38', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s38
 db "h2s", '39', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s39
 db "h2s", '40', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s40
 db "h2s", '41', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s41
 db "h2s", '42', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s42
 db "h2s", '43', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s43
 db "h2s", '44', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s44
 db "h2s", '45', 0
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash2s45
%line 159+1 bloom_h160_chk.asm
 db "h3s", '1'
%line 159+0 bloom_h160_chk.asm
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s1
 db "h3s", '2'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s2
 db "h3s", '3'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s3
 db "h3s", '4'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s4
 db "h3s", '5'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s5
 db "h3s", '6'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s6
 db "h3s", '7'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s7
 db "h3s", '8'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s8
 db "h3s", '9'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s9
 db "h3s", '10'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s10
 db "h3s", '11'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s11
 db "h3s", '12'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s12
 db "h3s", '13'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s13
 db "h3s", '14'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s14
 db "h3s", '15'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s15
 db "h3s", '16'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s16
 db "h3s", '17'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s17
 db "h3s", '18'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s18
 db "h3s", '19'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s19
 db "h3s", '20'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s20
 db "h3s", '21'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s21
 db "h3s", '22'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s22
 db "h3s", '23'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s23
 db "h3s", '24'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s24
 db "h3s", '25'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s25
 db "h3s", '26'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s26
 db "h3s", '27'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s27
 db "h3s", '28'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s28
 db "h3s", '29'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s29
 db "h3s", '30'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s30
 db "h3s", '31'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s31
 db "h3s", '32'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s32
 db "h3s", '33'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s33
 db "h3s", '34'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s34
 db "h3s", '35'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s35
 db "h3s", '36'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s36
 db "h3s", '37'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s37
 db "h3s", '38'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s38
 db "h3s", '39'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s39
 db "h3s", '40'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s40
 db "h3s", '41'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s41
 db "h3s", '42'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s42
 db "h3s", '43'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s43
 db "h3s", '44'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s44
 db "h3s", '45'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s45
 db "h3s", '46'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s46
 db "h3s", '47'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s47
 db "h3s", '48'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s48
 db "h3s", '49'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s49
 db "h3s", '50'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s50
 db "h3s", '51'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s51
 db "h3s", '52'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s52
 db "h3s", '53'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s53
 db "h3s", '54'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s54
 db "h3s", '55'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s55
 db "h3s", '56'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s56
 db "h3s", '57'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s57
 db "h3s", '58'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s58
 db "h3s", '59'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s59
 db "h3s", '60'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s60
 db "h3s", '61'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s61
 db "h3s", '62'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s62
 db "h3s", '63'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s63
 db "h3s", '64'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s64
 db "h3s", '65'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s65
 db "h3s", '66'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s66
 db "h3s", '67'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s67
 db "h3s", '68'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s68
 db "h3s", '69'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s69
 db "h3s", '70'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s70
 db "h3s", '71'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s71
 db "h3s", '72'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s72
 db "h3s", '73'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s73
 db "h3s", '74'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s74
 db "h3s", '75'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s75
 db "h3s", '76'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s76
 db "h3s", '77'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s77
 db "h3s", '78'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s78
 db "h3s", '79'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s79
 db "h3s", '80'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s80
 db "h3s", '81'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s81
 db "h3s", '82'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s82
 db "h3s", '83'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s83
 db "h3s", '84'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s84
 db "h3s", '85'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s85
 db "h3s", '86'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s86
 db "h3s", '87'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s87
 db "h3s", '88'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s88
 db "h3s", '89'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s89
 db "h3s", '90'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s90
 db "h3s", '91'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s91
 db "h3s", '92'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s92
 db "h3s", '93'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s93
 db "h3s", '94'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s94
 db "h3s", '95'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s95
 db "h3s", '96'
[sectalign 8]
times (((8) - (($-$$) % (8))) % (8)) db 0
 dq hash3s96
%line 163+1 bloom_h160_chk.asm
 db "abort", 0, 0, 0
%line 163+0 bloom_h160_chk.asm
 dq bloom_abort
 db "abort", 0, 0, 0
 dq bloom_abort
 db "abort", 0, 0, 0
 dq bloom_abort
 db "abort", 0, 0, 0
 dq bloom_abort
 db "abort", 0, 0, 0
 dq bloom_abort
 db "abort", 0, 0, 0
 dq bloom_abort
 db "abort", 0, 0, 0
 dq bloom_abort
%line 164+1 bloom_h160_chk.asm
 db "error", 0, 0, 0
 dq bloom_error


; vim:ai:sw=2:ts=2:et:syntax=nasm:filetype=nasm
