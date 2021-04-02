; should compatible with the old fixed parameter bloom filter from brainflayer

%macro check_bit_reg 1 ; check whether bit rax of the bloom filter is set
  mov   rdx, rax       ; copy hash
  shr   rax, 3         ; byte to check in rax
  and   edx, 7         ; mask off bit to check
  mov    al, [rdi+rax] ; load byte to check from memory
  bt     ax, dx        ; bit test against bloom filter (set carry flag)
  jnc   bloom_miss     ; jump to return a 'miss' if bit isn't set
%endmacro              ; rax and rdx are clobbered

legacy:
  ; load hash into registers
  mov ecx,  [rsi+0x00]
  mov r8d,  [rsi+0x04]
  mov r9d,  [rsi+0x08]
  mov r10d, [rsi+0x0c]
  mov r11d, [rsi+0x10]
  ; do hashing
  mov eax, ecx  ; BH00(N) (N[0])
  check_bit
  mov eax, r8d  ; BH01(N) (N[1])
  check_bit
  mov eax, r9d  ; BH02(N) (N[2])
  check_bit
  mov eax, r10d ; BH03(N) (N[3])
  check_bit
  mov eax, r11d ; BH04(N) (N[4])
  check_bit

  mov eax, ecx  ; BH05(N) (N[0]<<16|N[1]>>16)
  mov edx, r8d
  shl eax, 16
  shr edx, 16
  or  eax, edx
  check_bit
  mov eax, r8d  ; BH06(N) (N[1]<<16|N[2]>>16)
  mov edx, r9d
  shl eax, 16
  shr edx, 16
  or  eax, edx
  check_bit
  mov eax, r9d  ; BH07(N) (N[2]<<16|N[3]>>16)
  mov edx, r10d
  shl eax, 16
  shr edx, 16
  or  eax, edx
  check_bit
  mov eax, r10d ; BH08(N) (N[3]<<16|N[4]>>16) 
  mov edx, r11d
  shl eax, 16
  shr edx, 16
  or  eax, edx
  check_bit
  mov eax, r11d ; BH09(N) (N[4]<<16|N[0]>>16)
  mov edx, ecx
  shl eax, 16
  shr edx, 16
  or  eax, edx
  check_bit

  mov eax, ecx  ; BH10(N) (N[0]<< 8|N[1]>>24)
  mov edx, r8d
  shl eax, 8
  shr edx, 24
  or  eax, edx
  check_bit
  mov eax, r8d  ; BH11(N) (N[1]<< 8|N[2]>>24)
  mov edx, r9d
  shl eax, 8
  shr edx, 24
  or  eax, edx
  check_bit
  mov eax, r9d  ; BH12(N) (N[2]<< 8|N[3]>>24)
  mov edx, r10d
  shl eax, 8
  shr edx, 24
  or  eax, edx
  check_bit
  mov eax, r10d ; BH13(N) (N[3]<< 8|N[4]>>24)
  mov edx, r11d
  shl eax, 8
  shr edx, 24
  or  eax, edx
  check_bit
  mov eax, r11d ; BH14(N) (N[4]<< 8|N[0]>>24)
  mov edx, ecx
  shl eax, 8
  shr edx, 24
  or  eax, edx
  check_bit

  mov eax, ecx  ; BH15(N) (N[0]<<24|N[1]>> 8)
  mov edx, r8d
  shl eax, 24
  shr edx, 8
  or  eax, edx
  check_bit
  mov eax, r8d  ; BH16(N) (N[1]<<24|N[2]>> 8)
  mov edx, r9d
  shl eax, 24
  shr edx, 8
  or  eax, edx
  check_bit
  mov eax, r9d  ; BH17(N) (N[2]<<24|N[3]>> 8)
  mov edx, r10d
  shl eax, 24
  shr edx, 8
  or  eax, edx
  check_bit
  mov eax, r10d ; BH18(N) (N[3]<<24|N[4]>> 8)
  mov edx, r11d
  shl eax, 24
  shr edx, 8
  or  eax, edx
  check_bit
  mov eax, r11d ; BH19(N) (N[4]<<24|N[0]>> 8)
  mov edx, ecx
  shl eax, 24
  shr edx, 8
  or  eax, edx
  check_bit

; vim:ai:sw=2:ts=2:et:syntax=nasm:filetype=nasm
