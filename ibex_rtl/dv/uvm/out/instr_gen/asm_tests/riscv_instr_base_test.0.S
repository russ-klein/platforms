.macro init
.endm
.section .text.init
.globl _start
j _start
.align 7
_start: j _reset_entry
.align 2
j mtvec_handler
.align 2
j mtvec_handler
.align 2
j mtvec_handler
_reset_entry:
                  li x0, 0x7458aa7b
                  li x1, 0x0
                  li x2, 0x0
                  li x3, 0x80000000
                  li x4, 0x0
                  li x5, 0xc
                  li x6, 0xf
                  li x7, 0xe
                  li x8, 0xc31a7a7c
                  li x9, 0x0
                  li x10, 0xe
                  li x11, 0x0
                  li x12, 0xfb23d38f
                  li x13, 0xe
                  li x14, 0x80000000
                  li x15, 0xf0ed6ba6
                  li x16, 0x80000000
                  li x17, 0xc
                  li x18, 0x1
                  li x19, 0xfc020551
                  li x20, 0xa
                  li x21, 0x80000000
                  li x22, 0x80000000
                  li x23, 0x7
                  li x24, 0x5c3e70f4
                  li x25, 0x0
                  li x26, 0x80000000
                  li x27, 0x80000000
                  li x28, 0x80000000
                  li x29, 0x0
                  li x30, 0x1e870e76
                  li x31, 0xf6a8197d
kernel_sp:        
                  la tp, _kernel_stack_end

trap_vec_init:    
                  la a0, mtvec_handler
                  csrw 0x305, a0 # MTVEC

mepc_setup:       
                  la x10, _init
                  csrw mepc, x10
                  j init_machine_mode

_init:            
                  la sp, _user_stack_end
_main:            lui        a0, 563354
                  auipc      s0, 308014
                  c.slli     a3, 12
                  sll        a0, t0, t4
                  c.addi     s2, 10
                  lui        s11, 795851
                  auipc      a7, 129639
                  c.addi     t5, 23
                  c.addi     t4, 4
                  la         t5, sub_1
                  c.srli     a2, 25
                  c.srai     a0, 26
                  c.addi     s5, -24
                  addi       t5, t5, -495
                  bne        t5, s4, j__main_sub_1_3 #branch to jump instr
                  auipc      a2, 618454
                  c.addi     a5, -11
j__main_sub_1_3:  jalr       ra, t5, 495
                  lui        s10, 211269
                  c.lui      a2, 21
                  c.srli     s0, 24
                  c.addi     a4, -26
                  auipc      t4, 221991
                  auipc      a6, 175640
                  ori        a0, s10, -210
j__main_sub_2_1:  jal        ra, sub_2
                  or         s4, s0, s11
                  c.addi     a6, 31
                  c.or       s0, s1
                  c.or       a2, a2
                  srl        gp, sp, tp
                  c.addi     a6, 14
                  c.lui      a0, 24
                  c.srli     a0, 31
                  mulhsu     a4, t5, s9
                  auipc      s10, 23148
j__main_sub_3_2:  jal        ra, sub_3
                  c.addi     t1, -9
                  lui        a1, 936072
                  c.srai     a5, 6
                  lui        a0, 66760
                  auipc      a0, 506310
test_done:        
                  li gp, 1
                  ecall
sub_1:            bge        tp, a2, sub_1_stack_p
sub_1_stack_p:    addi       sp, sp, -44
                  sw         ra, 4(sp)
                  c.srai     a5, 14
                  sw         t0, 8(sp)
                  sw         t6, 12(sp)
                  sw         s6, 16(sp)
                  sw         s9, 20(sp)
                  srl        s7, s11, t4
                  sw         t2, 24(sp)
                  sw         t3, 28(sp)
                  auipc      a5, 184149
                  rem        a7, a5, t1
                  sw         s3, 32(sp)
                  c.srai     a2, 14
                  c.addi     s1, -16
                  mul        t5, a7, gp
                  auipc      s4, 394530
                  c.addi     s10, -18
                  c.addi     t5, 27
                  auipc      s2, 417546
                  c.srli     a3, 18
                  bltu       s7, s11, 15f
                  divu       s4, a4, t3
                  c.addi     a4, -6
                  auipc      s5, 274042
                  c.addi     a0, -30
                  andi       s0, a5, -973
                  lui        s4, 232168
                  auipc      s4, 953903
15:               c.mv       s10, s6
                  bgeu       t0, t0, 26f
                  lui        t4, 654843
                  lui        t4, 636433
                  c.addi     s2, -17
                  lui        s8, 704729
                  c.lui      t4, 14
                  auipc      a4, 199765
                  auipc      gp, 208775
                  c.srli     a2, 19
                  c.addi     a2, -12
26:               lui        s11, 210614
                  lui        s2, 233794
                  c.addi     a0, -3
                  c.slli     a4, 28
                  auipc      s1, 579216
                  c.lui      s0, 6
                  c.addi     gp, 7
                  c.nop
                  c.addi     s5, 16
                  c.andi     a1, -27
                  c.addi     a0, -11
                  c.srli     a5, 7
                  ori        a6, t1, -611
                  c.slli     a7, 9
                  c.addi     s11, -27
                  c.srai     a1, 20
                  c.slli     a0, 31
                  andi       a6, a1, -106
                  auipc      zero, 996173
                  c.srli     a0, 17
                  c.srai     a3, 7
                  c.slli     s10, 18
                  auipc      a4, 337223
                  c.addi     s8, 15
                  c.addi     a7, 14
                  blt        s5, a0, 70f
                  c.lui      a3, 8
                  auipc      s11, 352863
                  c.addi     s7, -25
                  lui        a0, 737042
                  auipc      s5, 93051
                  fence
                  c.addi     s7, 30
                  remu       zero, t0, s8
                  c.addi     s0, 3
                  c.or       a1, a3
                  lui        a1, 355182
                  c.bnez     a1, 83f
                  c.addi     a4, 26
                  c.lui      s8, 4
                  c.slli     s10, 12
                  c.lui      a3, 14
                  lui        a7, 549712
                  c.beqz     s0, 78f
70:               c.sub      a5, a3
                  c.srli     a5, 16
                  auipc      s4, 354726
                  c.addi     s10, -3
                  c.srli     s1, 21
                  c.lui      s1, 22
                  auipc      s10, 801385
                  c.srli     a1, 23
78:               auipc      t5, 339485
                  auipc      gp, 424360
                  remu       s0, sp, sp
                  c.srli     a5, 9
                  c.srai     a3, 25
83:               slt        a6, s6, s6
                  auipc      s10, 1002133
                  c.addi     t5, -25
                  c.addi     s4, 8
                  c.or       s1, a2
                  lui        s4, 639845
                  c.addi     s8, 4
                  c.addi     s1, 6
                  lui        a7, 258860
                  c.srai     a1, 25
                  c.addi     a1, 26
                  c.addi     a1, -6
                  auipc      s4, 972026
                  lui        gp, 602675
                  c.addi     a1, -12
                  mulhu      t4, s7, s3
                  lui        s7, 152600
                  add        s5, a4, a0
                  lui        s8, 905697
                  auipc      a6, 636044
                  c.lui      t5, 16
                  auipc      a2, 536966
                  c.addi     s8, 3
                  c.add      s0, s0
                  lw         ra, 4(sp)
                  lui        s4, 414854
                  c.srli     a1, 13
                  mulh       s7, a7, s8
                  lw         t0, 8(sp)
                  c.srli     a0, 20
                  lw         t6, 12(sp)
                  lw         s6, 16(sp)
                  lw         s9, 20(sp)
                  lw         t2, 24(sp)
                  lw         t3, 28(sp)
                  c.lui      a0, 7
                  lw         s3, 32(sp)
                  addi       sp, sp, 44
                  sra        a3, s4, t6
                  c.lui      s7, 2
138:              ret
sub_4:            bltu       s5, t4, sub_4_stack_p
                  sltiu      s10, zero, 407
                  sltu       t4, a5, s8
sub_4_stack_p:    addi       sp, sp, -32
                  sw         ra, 4(sp)
                  lui        s7, 484600
                  div        zero, s1, s0
                  sw         t0, 8(sp)
                  sw         t6, 12(sp)
                  sw         s6, 16(sp)
                  sw         s9, 20(sp)
                  sw         t2, 24(sp)
                  sw         t3, 28(sp)
                  sw         s3, 32(sp)
                  srai       a1, t2, 26
                  lui        a7, 415270
                  c.or       a0, a4
                  c.addi     s0, 7
                  c.lui      a2, 6
                  c.lui      s8, 16
                  c.srli     a1, 23
                  auipc      s11, 524644
                  slli       s11, a7, 11
                  c.addi     t4, 30
                  c.addi     a1, 12
                  blt        s0, s0, j_sub_4_sub_5_6 #branch to jump instr
                  auipc      t5, 108212
                  c.lui      a2, 25
                  c.addi     s10, 3
                  lui        a6, 842386
j_sub_4_sub_5_6:  jal        ra, sub_5
                  auipc      a0, 30406
                  srl        s4, s6, a7
                  auipc      a7, 1036217
                  c.srai     s1, 3
                  lui        gp, 857560
                  c.and      s0, a4
                  c.slli     s2, 16
                  c.addi     a5, -8
                  lui        s1, 403161
                  slli       s8, a3, 7
                  lui        a7, 940697
                  c.addi     a4, 25
                  c.srai     s0, 4
                  c.slli     gp, 25
                  c.andi     a2, 16
                  c.mv       s4, gp
                  auipc      a3, 908291
                  c.addi     a1, -8
                  auipc      gp, 444159
                  srai       gp, s4, 18
                  c.addi     s8, 28
                  lui        t1, 1004816
                  c.addi     s10, -11
                  xor        s11, s10, zero
                  auipc      t5, 219757
                  c.lui      a4, 4
                  add        t1, a6, a7
                  lui        a7, 569338
                  la         s10, sub_5
                  c.add      s1, s0
                  lui        a3, 939704
                  lui        a3, 412270
                  srai       t1, t0, 28
                  srl        a6, s1, t3
                  c.srai     s0, 24
                  c.srli     a5, 31
                  addi       s10, s10, 457
                  c.addi     a2, -32
                  remu       a2, a2, a5
j_sub_4_sub_5_7:  jalr       ra, s10, -457
                  c.srai     s0, 27
                  auipc      s0, 471003
                  c.addi     s10, -29
                  c.slli     t4, 29
                  c.srli     a5, 25
                  lw         ra, 4(sp)
                  lw         t0, 8(sp)
                  slti       a6, a2, 298
                  c.lui      a5, 23
                  lw         t6, 12(sp)
                  lw         s6, 16(sp)
                  lw         s9, 20(sp)
                  lw         t2, 24(sp)
                  lw         t3, 28(sp)
                  nop
                  lw         s3, 32(sp)
                  addi       sp, sp, 32
                  c.addi     s10, 28
89:               ret
sub_3:            addi       sp, sp, -40
                  c.addi     a0, -15
                  auipc      s10, 631061
                  c.addi     a3, -4
                  sw         ra, 4(sp)
                  sw         t0, 8(sp)
                  sw         t6, 12(sp)
                  sw         s6, 16(sp)
                  c.addi     s5, -2
                  sw         s9, 20(sp)
                  c.addi     a2, 14
                  auipc      a1, 615505
                  sw         t2, 24(sp)
                  lui        s1, 147974
                  xor        a0, a5, t4
                  sw         t3, 28(sp)
                  sw         s3, 32(sp)
                  c.addi     s4, -32
                  mulhsu     s5, sp, s3
                  auipc      a0, 17012
                  or         a4, tp, a1
                  div        a1, a7, a7
                  c.slli     s7, 30
                  c.slli     a2, 18
                  c.addi     a1, 28
                  c.lui      t1, 14
                  c.slli     t4, 22
                  auipc      t5, 155495
                  c.slli     a1, 20
                  c.addi     a2, -1
                  c.addi     a2, -19
                  la         a6, sub_4
                  mulhsu     zero, t1, a3
                  c.srli     a1, 12
                  addi       a6, a6, -401
                  c.srai     s1, 5
                  c.lui      a5, 5
                  blt        a7, a4, j_sub_3_sub_4_5 #branch to jump instr
                  auipc      a5, 68233
                  mulhsu     s10, s10, s10
j_sub_3_sub_4_5:  jalr       ra, a6, 401
                  c.addi     a3, 20
                  auipc      t5, 236333
                  mulhu      s4, gp, gp
                  c.srai     a4, 12
                  c.srli     a4, 2
                  c.srai     a3, 7
                  c.srai     a0, 15
                  c.slli     s4, 19
                  c.addi     t4, -9
                  lw         ra, 4(sp)
                  lw         t0, 8(sp)
                  nop
                  lw         t6, 12(sp)
                  lw         s6, 16(sp)
                  c.lui      a2, 19
                  c.srai     a5, 19
                  lw         s9, 20(sp)
                  lw         t2, 24(sp)
                  c.add      s0, a1
                  lw         t3, 28(sp)
                  lw         s3, 32(sp)
                  auipc      a0, 926232
                  addi       sp, sp, 40
                  c.addi     a6, -18
65:               ret
sub_5:            addi       sp, sp, -32
                  sw         ra, 4(sp)
                  sw         t0, 8(sp)
                  c.addi     t5, -9
                  auipc      t5, 273084
                  c.addi     s0, 8
                  c.addi     a7, -28
                  auipc      s0, 81402
                  c.addi     a7, -16
                  sw         t6, 12(sp)
                  sw         s6, 16(sp)
                  sw         s9, 20(sp)
                  sw         t2, 24(sp)
                  sw         t3, 28(sp)
                  sw         s3, 32(sp)
                  lui        s0, 541200
                  c.addi     a2, 18
                  c.lui      s11, 19
                  add        a0, a7, s1
                  lui        a1, 183684
                  c.srai     s0, 27
                  c.slli     s4, 31
                  c.slli     s4, 11
                  lui        s8, 460552
                  c.lui      s5, 28
                  auipc      s7, 1047650
                  auipc      a5, 115527
                  auipc      s4, 9990
                  ori        a6, a6, 667
                  c.addi     t1, -30
                  c.addi     s10, -31
                  c.srli     a4, 10
                  c.sub      a0, a3
                  c.slli     s5, 20
                  c.slli     a4, 7
                  lui        a0, 573680
                  auipc      a6, 747808
                  c.addi     s0, 5
                  c.addi     a2, 24
                  lui        s2, 555801
                  c.lui      s10, 31
                  c.addi     s0, -5
                  c.lui      a3, 26
                  slti       a4, zero, 146
                  c.addi     s5, 25
                  lw         ra, 4(sp)
                  auipc      s5, 102875
                  srli       a7, s1, 6
                  lw         t0, 8(sp)
                  c.addi     a6, -13
                  c.lui      a0, 18
                  lw         t6, 12(sp)
                  lw         s6, 16(sp)
                  c.addi     t5, 16
                  lw         s9, 20(sp)
                  lw         t2, 24(sp)
                  auipc      a7, 274120
                  lw         t3, 28(sp)
                  c.addi     s2, 4
                  lw         s3, 32(sp)
                  addi       sp, sp, 32
                  divu       s2, s3, s8
                  c.xor      s0, s1
                  slli       a0, s0, 7
64:               ret
sub_2:            c.addi     t1, 31
                  auipc      t1, 691343
                  addi       sp, sp, -60
                  srai       t1, gp, 2
                  lui        a6, 553976
                  sw         ra, 4(sp)
                  c.addi     a2, 3
                  sw         t0, 8(sp)
                  sw         t6, 12(sp)
                  sw         s6, 16(sp)
                  sw         s9, 20(sp)
                  sw         t2, 24(sp)
                  c.addi     s8, -30
                  sw         t3, 28(sp)
                  c.slli     t4, 17
                  sw         s3, 32(sp)
                  c.srli     a1, 22
                  c.srli     a5, 31
                  auipc      a5, 1005931
                  c.srai     a4, 24
                  lui        a4, 125953
                  la         s7, sub_4
                  c.addi     a2, -6
                  c.addi     a0, 9
                  c.srli     a1, 19
                  auipc      s5, 183751
                  lui        gp, 350566
                  c.addi     s0, -22
                  addi       s7, s7, 645
                  c.lui      a1, 30
j_sub_2_sub_4_4:  jalr       ra, s7, -645
                  c.addi     a0, -14
                  auipc      a3, 634843
                  auipc      s7, 153688
                  c.slli     a3, 18
                  lw         ra, 4(sp)
                  lw         t0, 8(sp)
                  lw         t6, 12(sp)
                  lw         s6, 16(sp)
                  lw         s9, 20(sp)
                  lw         t2, 24(sp)
                  c.srli     a5, 25
                  lw         t3, 28(sp)
                  lw         s3, 32(sp)
                  addi       sp, sp, 60
                  auipc      t5, 832155
                  c.addi     s0, -15
                  c.slli     a0, 5
                  mulhu      zero, t3, sp
49:               ret
init_machine_mode:
                  li a0, 0x201900
                  csrw 0x300, a0 # MSTATUS
                  mret
write_tohost:     
                  sw gp, tohost, t5

_exit:            
                  j write_tohost

.data
.pushsection .tohost,"aw",@progbits;
.align 6; .global tohost; tohost: .dword 0;
.align 6; .global fromhost; fromhost: .dword 0;
.popsection;
.align 4;
data_page_0:
.align 12
.word 0x8d78216c, 0x167587d9, 0x7c0bc412, 0x3cc8e54f, 0x761ea181, 0x16802206, 0x6c3012aa, 0x4e1b0316
.word 0x10d632ef, 0x21ce25d5, 0x02d0f331, 0xeaf8d825, 0xa6b9338e, 0xf2719ef4, 0xe079b3a3, 0xc2d7d3f7
.word 0x037353de, 0xfa11e622, 0x00743525, 0xe9cac151, 0xe8d765dc, 0x742222cf, 0xd4d29fd0, 0x2c10fb02
.word 0xffa64fc5, 0x96e23b12, 0x1853f0ec, 0xfae3dffd, 0x8722b1d3, 0x9130650d, 0xc69257f2, 0x14d38790
.word 0xb5314061, 0xb6e96c74, 0x7d865a16, 0xa8e3c081, 0x631de8f2, 0x64456ee7, 0x85f6dc40, 0xfa9727de
.word 0x27dce6f6, 0x939e22fe, 0x1fa3ad94, 0xc314580a, 0x0d57eaed, 0xa6f96cd8, 0x47d08f65, 0x4034540c
.word 0x1dc563d5, 0x78c1dfa1, 0xfaa99791, 0xc59ee2d2, 0x4af01c6b, 0x559363f5, 0xace6bd93, 0x8656441f
.word 0xe99a3683, 0x7d4ad9d5, 0xe305b46a, 0x6d912221, 0x43e845dc, 0xdf723fb0, 0x52fab3f5, 0x3f32a281
.word 0xb6a37aa3, 0xfd0f2392, 0x9619701a, 0xeebdee60, 0xd3ee41bb, 0x0c2a0992, 0x72ea7fe0, 0x2e4c60c5
.word 0x99959d0e, 0x607b9b7b, 0xf6af27b9, 0xfaa8d57c, 0x3622d826, 0xa3cbb177, 0x7abeb0e7, 0xc7e8144a
.word 0x76fd9bde, 0xd8f05de7, 0x72e01a6c, 0xb63334ce, 0x93cd40e8, 0xa7dad002, 0xcfc1c35a, 0x3be8e5b4
.word 0x9ded4f8d, 0xb2783879, 0xe2cacbad, 0x92da3e92, 0x8417126c, 0x457f7499, 0x461b6d01, 0x2cc4e30f
.word 0x41d47592, 0xffc20225, 0x9617de22, 0x7d6d021f, 0xa09d4265, 0x5535b2e9, 0x3f73ce76, 0xc025e173
.word 0xe8e2e684, 0x95eff3f8, 0xe1df655a, 0x10d20e98, 0xb6f97126, 0x0c231a50, 0x0799511c, 0x0f133cc1
.word 0xce691a45, 0x647454cf, 0x0e9d1910, 0x5fa2cb02, 0xb7696868, 0x55b8eed0, 0xa40c2cee, 0x36aa3c7f
.word 0x916091b2, 0x05d815bd, 0x4668a426, 0xea2f0029, 0x3020aba2, 0x948de1a7, 0xdf0375b0, 0x167fbd18
.word 0xcc740473, 0x031b0662, 0x3f40e3ab, 0x25a95ee2, 0x87713f91, 0x61a96a83, 0xfb6ab796, 0xc9431783
.word 0x6e02faeb, 0x4e7348c6, 0x2412f50b, 0x4e8425f7, 0x974e9606, 0xac12785f, 0xb9beab36, 0x284702e2
.word 0x3de36fcf, 0x7bc230a6, 0x4a042896, 0x0734e012, 0xb2f325a6, 0x42d67a20, 0x8b3094cd, 0xe8ec79f3
.word 0x06e0dfe8, 0x137f30af, 0x4cee1267, 0xc1aa7403, 0x7d318886, 0x496eed52, 0x945caee6, 0x51a3d61c
.word 0x9e4e0fc4, 0x87db532a, 0x30675189, 0x79727335, 0xaae9e6e0, 0x133ee922, 0x4b62f225, 0xeb2186c7
.word 0xd8e28f49, 0x5ac6be2c, 0x7af8ea8f, 0x385fda50, 0x19bf7d36, 0xcb34e249, 0xa7d0f04f, 0xc648fc7c
.word 0x9d264a97, 0x082e3b76, 0x6be2bc27, 0x93fdf532, 0xf4c17c7a, 0x65e79a1b, 0x29f8c6ae, 0x1e7fbb32
.word 0x020fe117, 0xa30f8eea, 0x9039e367, 0x9c3bdab9, 0x7836febd, 0x6dea98b4, 0xb08dbce0, 0xeb48cc1d
.word 0x4d5c5e13, 0x25d2f037, 0xab88e19d, 0xc7a8681a, 0xe07b43e7, 0x424dccc2, 0x36177ce8, 0xc59df480
.word 0x1e899fa6, 0xa1e50937, 0x7fe6c635, 0x3b8edf5d, 0x16550d38, 0x095ca8d5, 0x1df79f31, 0xf2b5ef82
.word 0x7d29f9b6, 0xb29e63d1, 0x172cc098, 0x900eea63, 0x8f42dcec, 0xdfb4ab50, 0x82a64c17, 0x3b8c0869
.word 0x9498b070, 0x174cccd5, 0xf50f8790, 0xb7dbc168, 0x82dcf389, 0x3d391d52, 0x7481639b, 0x3ec5d2fd
.word 0x5b50272e, 0x62943edd, 0x79830e12, 0x5aacb143, 0x8765d90c, 0xdee1a7b0, 0x036f3214, 0x3014324d
.word 0xf10a0221, 0xe7d5f58d, 0x2d08b43a, 0x692898de, 0x2a0652e9, 0xe445ac21, 0x655cbe42, 0xa4d0ad3d
.word 0x78beafce, 0xd7603ddf, 0x3d951dfd, 0x88e8396e, 0x72ec1ddd, 0xe3bf791a, 0xe0a64683, 0xf19b5b98
.word 0xa29abeee, 0xb27bf1cb, 0x92e8ee8f, 0x54593840, 0x40a67974, 0xaa72923b, 0x35a6a4c2, 0x96a325d5
.word 0xc22a9aee, 0x8298c1dc, 0x569e15e1, 0x768faca6, 0xc45a4f1c, 0xf11c3f6b, 0x55136390, 0x674f7b32
.word 0x9f21e7d1, 0x0afbe890, 0x8a4e02fd, 0x657aa3c2, 0x76939698, 0xadac4d1b, 0x5da943b3, 0x3d6efe0b
.word 0x19bbd493, 0x7f2265dc, 0x794160fe, 0xf04a6df6, 0xc427e886, 0x87a60bee, 0x75e07428, 0x4e562643
.word 0x6fd7de6c, 0x91d9dd18, 0x89308b92, 0x93115959, 0x46b295d7, 0xbdfc02b5, 0x265b16a1, 0x012defc0
.word 0xe1c3da99, 0xa462c008, 0x55dfc907, 0x0da83309, 0xcadc978a, 0x20296c30, 0xd01c716c, 0x8176220a
.word 0xe1578d26, 0xdb5f2532, 0x5660cb74, 0x81d2de4d, 0x99226e85, 0x7a06cd40, 0xdbd48f7f, 0xf6277d9a
.word 0x04611cb7, 0x45c822d9, 0xa30bea3c, 0x6b331ffb, 0xe5451da6, 0xc36cf39c, 0x05f04ccc, 0x568a0e44
.word 0xf5d05b4d, 0x3c333f9f, 0x85480233, 0xb23f04b0, 0xb8c5e1a5, 0x03e15942, 0x8e68cd24, 0xfe5e6922
.word 0x493198a7, 0x2006bf6b, 0xe9870496, 0xbd77673d, 0x410e2b04, 0xff627896, 0xe471a5a1, 0xd064fdfb
.word 0xa8bace6c, 0xeea4e872, 0xfc2d8cc0, 0x7b4debbc, 0xa906dc50, 0x25744909, 0x5f0bb7e8, 0x8dad8060
.word 0x74d4b329, 0x94a653ae, 0xcc3a75ca, 0xac029ccd, 0x1144ae46, 0xdd45e276, 0x0b1d3154, 0x004f6a4d
.word 0x9941319a, 0x23a0c086, 0x98afce6e, 0xe745da6d, 0xdaa759c3, 0x2ff8c16e, 0x7372737f, 0xd071402d
.word 0xc7f41231, 0x8e5ec9d6, 0x36d9444a, 0x296f21c4, 0xf0417d45, 0x4e26c109, 0x291ebd4d, 0xf54d9a7c
.word 0xbc6886c1, 0x8d31d4d9, 0xc57f4cf4, 0x4244fc46, 0x22a63fd7, 0x8ce86253, 0x8a5645d8, 0xfa60d073
.word 0x7cf6825e, 0x290ad3ad, 0x1aec5ce8, 0xc349855b, 0x5158f85b, 0xa038a942, 0x3e19ac3d, 0x6ef26363
.word 0x4496f758, 0xf19185ec, 0xc681885c, 0x15b2550f, 0x8c0353ab, 0x877e7b6e, 0x311329ec, 0x3f01cc31
.word 0x4a537af3, 0xb96d1949, 0xb9166e60, 0x7e7cc397, 0x5778aff9, 0xd24aa805, 0x2f0158b6, 0x178c164e
.word 0x910ecaab, 0xb36d1492, 0x4775b8bf, 0x93f8bef3, 0x2abd999c, 0xceee3756, 0xbb977b66, 0xbb972fd8
.word 0x1f26b143, 0xc632983f, 0x89a45a25, 0x420a7346, 0xb52051a8, 0x48795ddf, 0x1708bd43, 0x9dae09e0
.word 0xec20a1ec, 0x8df32f3e, 0xedc0b2c9, 0xe9e46ca2, 0xa423b4bb, 0xc078392f, 0x9f57e24b, 0x1aacb4fd
.word 0xb4b1db1c, 0x24cf663c, 0xf7136acb, 0x63b61961, 0xb648ad67, 0x2b4040b6, 0x3efcc21d, 0x82895c04
.word 0x2755ebc2, 0x9df98e53, 0x8d46dc0f, 0x7ef36ff4, 0x4cca3270, 0xed5b0b70, 0xb1563bb5, 0xaf303e7c
.word 0x4cdf1b37, 0x89c5cc7a, 0x9bf4d171, 0x76338efe, 0xd1b88a01, 0x754b2275, 0x00c030d0, 0x5ea23fdd
.word 0x6bc90e6f, 0xd59631e7, 0xe400305f, 0x4f304a32, 0xb76ddc8d, 0xa88c8e5c, 0x9e20dcea, 0xb1c2955d
.word 0xf216c6fb, 0x83a9c92e, 0x45d7ef08, 0x5f73fbb3, 0x82e1ab88, 0xc04766c7, 0x501bf61c, 0x36c1bbd0
.word 0xa05de072, 0xb24004b7, 0xa94ea2d1, 0x8abb90c5, 0xede09eb8, 0x17ccbb2c, 0x65e49f98, 0x9aafe298
.word 0x4b0bd029, 0x0ede5ce9, 0xfa81a141, 0x8c196ff4, 0x05023740, 0xa03a5dca, 0x6fcec2e4, 0x89a5fcfa
.word 0x88b0779c, 0x4fd4fa69, 0x32b5826f, 0x62b5c8ea, 0x86750105, 0xd92d5fff, 0xdcc99dde, 0xdcd16694
.word 0x2bfb2094, 0x8db813e8, 0x989ea8e4, 0x2772e867, 0x4ff4e473, 0xbff4938b, 0x0ae0eeef, 0x03e524be
.word 0x01b0d420, 0x99cda91f, 0x41d80e50, 0x86eedf29, 0x868c784d, 0x37ce9179, 0x7a2b9d8f, 0xec57d7f9
.word 0x94bbb496, 0xbee49450, 0xa3d61f5e, 0xfdb7199d, 0x0b4f436e, 0x711118f4, 0x4812a64b, 0xb51e6568
.word 0xbf46faf2, 0x55bf4d17, 0xff5b617f, 0xf87d0cc2, 0x9cca0ac4, 0x6153915e, 0xeea842fe, 0x1883ea60
.word 0xfde9086e, 0xee225ccc, 0x6511d249, 0xd4df99a5, 0x13e5af35, 0x38d6b9b7, 0xca3d64a4, 0x3fb4ae9c
.word 0xffcb73be, 0x8ff4938a, 0xc14813c7, 0x721e1fe5, 0xb9efda72, 0xb9aad9d6, 0x1bfe07cc, 0xf40dceb4
.word 0xd5d74eb0, 0xe412834b, 0xddd4fee1, 0xc9ebc10e, 0x50033886, 0x6350782b, 0x89108165, 0xf52c9174
.word 0x70404de1, 0x06d7890c, 0x99cbc181, 0x063d1875, 0xb250ebb8, 0x0e27d927, 0x02dd60ba, 0x0eda98d4
.word 0x5277e9c6, 0xe9e77da8, 0x6068fedb, 0x933aba8a, 0xe9d27ffe, 0xb658d5cf, 0x1ed9fc49, 0xd96af8d5
.word 0xd691fb57, 0x0b586f0c, 0x44ef4fbb, 0x65641529, 0x7bedc5fe, 0x38e4b15a, 0x411cf80c, 0x1e4aa561
.word 0x44f69583, 0x45c51ad6, 0x09757ba8, 0xcbcbb1f9, 0xcfd5a770, 0xcfad1d84, 0x2642aebd, 0x9dacac85
.word 0xa09eecd5, 0x5e06dd95, 0xcba80741, 0x11e1839b, 0xe2c9ff38, 0xfbbd5a71, 0x0b4a6862, 0xa03ab5cd
.word 0x352aaf2d, 0xd0529b16, 0x27dd526a, 0xf750e714, 0x61313596, 0x77fbe651, 0x6d696cb7, 0x90f79db9
.word 0x11e4b8e1, 0x92223895, 0x6bc5eb7a, 0xa84ce8b2, 0xf1dbc5db, 0x00f94667, 0x4793ba6b, 0x03929f37
.word 0xb2772fb1, 0x7687e213, 0xb83231b3, 0x22553a71, 0xe8306b1d, 0x471b1709, 0x2b5987d0, 0xb8414563
.word 0x2481b365, 0x1f8f341c, 0xe1ab0a40, 0x1b56a1a6, 0xbb5c4232, 0x9e13ab01, 0x853cb948, 0x48ca7554
.word 0x098766e2, 0xaf30cdb4, 0xc1dbe350, 0xf7cc0e93, 0x49aa80cf, 0xe1b52741, 0x8a92c563, 0xdf40ff08
.word 0x20c23cd3, 0x881e0b7d, 0xcdb80510, 0x996edf5d, 0x7166335c, 0xad00c235, 0xaa2f855c, 0x4a4a217b
.word 0xe4bca73d, 0xe3324684, 0x0d24a254, 0x36352a37, 0x6a1197e4, 0x152a1450, 0x34606559, 0x4a0b786a
.word 0x36aa899c, 0x4291f808, 0x16bf5919, 0xb85f4c28, 0xee9e3dda, 0x66ff103c, 0xe79da014, 0xad3f1f30
.word 0x9196d91f, 0xf22147d3, 0xba62d13b, 0x1b6becd6, 0x50c4a6de, 0xd658d809, 0x3336e037, 0xcfbead3f
.word 0x6da0918c, 0x98e25bf9, 0x91fb7b51, 0x77862c73, 0x5209407d, 0xb06d558d, 0x45ccc40d, 0x2204cb41
.word 0xdb849b25, 0x8a7634d6, 0xe94bdd5c, 0x01b2ff4b, 0x73801444, 0x938d4209, 0x2e60e0d6, 0x46a11e52
.word 0xc1a38625, 0x12a50738, 0x7776ee56, 0x2a3679db, 0x1ff97be3, 0x78971acc, 0xa315d5bd, 0x675c5559
.word 0x7f72a765, 0x328ba493, 0x430cac9f, 0x76a449f7, 0x5d86b688, 0x60dcd170, 0x4d4c657a, 0x72345f60
.word 0x3d1ec30d, 0xa8c8c523, 0xdc3d84c0, 0x8fd5b66a, 0x1a0198af, 0x96d3d7e5, 0xd7e60a4b, 0xb690978c
.word 0x54e5e4ca, 0xa2e957f7, 0xd68d3a07, 0xf830103e, 0xcd9c9879, 0x3ab894be, 0x57a45afc, 0xa5b74c22
.word 0xc3526383, 0xc0c48713, 0x9e8cb098, 0x50505a22, 0x594a0a9c, 0x30645dca, 0x2516f67e, 0x59250135
.word 0x99aa01ec, 0x8037fdfa, 0x9af275b7, 0xdf72a718, 0xe041a59c, 0x3f77e555, 0x5899fa69, 0x01530f45
.word 0x9e9e670a, 0x0fe5671b, 0xa1891315, 0x5d838580, 0xa1c96d93, 0x0b87ce4e, 0xeee351d2, 0x8ae5b842
.word 0x8a0a3955, 0x323bbcfd, 0xf89100a1, 0x000c9874, 0xf5246b47, 0x2f643175, 0x3bd96127, 0x93ffec81
.word 0x1273d4c3, 0x421d52ed, 0xa4f2b0fe, 0x3966de95, 0xb96da614, 0xb39c470c, 0xd587708f, 0xaf167067
.word 0xa6020276, 0x56b7c92f, 0x9ec838cb, 0x9388ddc1, 0x41431a20, 0x9e99bcc9, 0x4e68ed4b, 0x0e766cbc
.word 0xb069c3b3, 0xc86b172e, 0x7c323b70, 0x2e0ccb1d, 0x0025fe8e, 0x439281ce, 0xd9f3dc42, 0x5486eeac
.word 0x7d1f0054, 0xe88f8700, 0x2ea2183b, 0x6a886cf5, 0x94bd9086, 0x7276ab5a, 0x032e5edc, 0x5bbc5410
.word 0xf2fadbc3, 0xe31a748e, 0x2e451a61, 0x90c0194f, 0x541d62a0, 0x2c37a9ec, 0x11d51853, 0xc36bc815
.word 0xf6c244a7, 0x4f55e20b, 0x3ded689b, 0xaae2b0a0, 0xd10d3d19, 0x90f5c795, 0xfd751b20, 0x09f68304
.word 0xb9683449, 0x9894f4bb, 0x607d9274, 0x446e1f71, 0x1ec13fd0, 0x97705f2d, 0x4e16a4da, 0x270476d4
.word 0x827a132e, 0xcc2400ba, 0x3793fd4d, 0x63ccdd49, 0x2a53dc82, 0x65d85c09, 0x9bf841e5, 0x1328bbb9
.word 0xec6f097d, 0x5d562d9d, 0x3fcd4fe8, 0x1569c64d, 0x9a3b4a5a, 0x2313b72c, 0x1edeeac6, 0xd4a25dc9
.word 0x4f1cdf95, 0x8ef1ac59, 0x5efb27e0, 0x44af996e, 0xd9e36bb3, 0x32dbc593, 0x9696fdf5, 0xf91f65cc
.word 0x772d654d, 0xfe8fd5b0, 0xb2071643, 0x1a6303a8, 0x85290372, 0x23349e8a, 0xdb34593b, 0x43d8199a
.word 0x2a0a1518, 0xaf14c54b, 0x8cd1cd47, 0xf20a1bc8, 0xba385f78, 0x274217ce, 0x67c4dcaf, 0x4ad4563e
.word 0x3e90bad0, 0x704b1bc0, 0x3ff15dfd, 0x993763c9, 0x18cb897f, 0xd80879ce, 0xaeaf94c1, 0x040f4594
.word 0xc664e546, 0x470ddff5, 0x45a0a378, 0x0afe38ad, 0x4b889f01, 0x820a58db, 0xc5eec3aa, 0x95b524af
.word 0xe8ffba0a, 0x515dcd4f, 0xf4d387a8, 0x18a34aeb, 0x61804ede, 0xa94d237a, 0x3d527dc0, 0x2eed5304
.word 0x1949a23e, 0xf8bd9b61, 0x56b92eaf, 0x56022fbd, 0xb1a1235a, 0x25661462, 0xb78cb27e, 0xfa0c8697
.word 0x0afc1e78, 0x240275f9, 0x46eaeca5, 0xba935541, 0x7fa6f3ad, 0xf81af66e, 0xb70d52dd, 0xfc56861c
.word 0x6e06d3cf, 0xdc5814e2, 0x595f779d, 0x7c41b93f, 0xc421ee7c, 0x93cb2db5, 0x5ee5da8f, 0x77f28c6c
.word 0x90bfece8, 0xb90d5aac, 0xe4355f87, 0x105212a3, 0x913d918a, 0x05374d2c, 0x462317d0, 0x9a36a717
.word 0x50a4ed52, 0x0bb75931, 0xaf363c5e, 0x45b5d6f3, 0x561a27da, 0x27b3672a, 0x5cb9b980, 0xa590aad1
.word 0x7e587d17, 0x55254e88, 0x389987be, 0x4d11cf95, 0x224cede3, 0xb5b2725a, 0x754f960d, 0x3acdfbe6
.word 0x75d608cb, 0xd0763460, 0xe65c37db, 0xbe90305a, 0xb062f4b6, 0x7fc1049c, 0x5001c0ae, 0xa78379d9
.word 0xb288005e, 0xd8f9e6aa, 0xef2ecca0, 0x0b55132d, 0x20e9464a, 0xb0150703, 0xc41beb9c, 0x6a79b325
.word 0xd9a20a51, 0x304e510a, 0xdb7dd606, 0xd90e8466, 0x7d64170f, 0x65006dcf, 0x86b1d743, 0xdfda86bd
.word 0xc5fe2710, 0x96fb4262, 0x7018a953, 0x77c8e95e, 0x8ec37271, 0xd3f04e7a, 0x6ca2e990, 0x957ac907
.word 0x97a7a39d, 0xd40ad5e1, 0xd4566fab, 0x29a72a88, 0x8df60aa2, 0xb0fd6eec, 0x7bd68326, 0x668c87b3
.word 0xaed2ded7, 0x07329292, 0x1e94c53c, 0xb9a06bfe, 0x0548e766, 0xada89ea1, 0xa4fcdcc6, 0x7bd6570a
.word 0x2b359b2f, 0x8a483293, 0x74374634, 0x59b05495, 0x8a3f4108, 0xf3e21bc9, 0x19fe49a4, 0x8c9d305e
.word 0xebe3398d, 0xf12c62e0, 0xdf6efdc9, 0x9952c7e9, 0x3a0c3675, 0xaf2ed74d, 0x78606300, 0xbe6f2a04
.word 0x5daca76c, 0x07f744a6, 0x4434be8b, 0x5cc351a4, 0x4444caaa, 0x39b25890, 0xa9f3112f, 0xbf7efd4d
.word 0x723a3568, 0x17b88ae9, 0x5c6b6ce6, 0x7aba1db7, 0xd212cce2, 0xf9453c46, 0xf4a8290d, 0xb65c494c
.word 0x7c0c3cab, 0x3a692184, 0xf7086b2e, 0x085f8bec, 0x57bdd066, 0xb5c705c4, 0x8ad71430, 0x697bd6ac
.word 0xec808c9c, 0x54557e23, 0x17cdf537, 0x4f5f1f00, 0x0e0cb4f6, 0xf34e77ba, 0xe941a84d, 0x78b1727c
.word 0x71519280, 0x1b659754, 0x79041e96, 0x42beb5ed, 0x5b3da740, 0x80f03691, 0xbe21297e, 0xb7c32468
.word 0x8c83b6b1, 0xfde4a494, 0x61aca32c, 0xbf000f4f, 0x6af15c81, 0x794929c5, 0xe7ee839d, 0x1b235d86
.word 0x0c8c6b81, 0x87a49fba, 0x26b2ea63, 0x7b8f2b04, 0x64bb827c, 0x4ba9b0ef, 0xd03e997f, 0x041b2d8b
.word 0x89332209, 0x8d559eb9, 0x60057459, 0x34fcd868, 0x4618a155, 0xd9dc1ce8, 0x4ae2c092, 0x8b7f4789
data_page_1:
.align 12
.word 0xfb8ed690, 0xea46ad9f, 0xe0d08600, 0x7d46215e, 0x31f60d6b, 0xa1e7ca18, 0xa9388a3f, 0x2a007836
.word 0x5094a473, 0x9d6d4509, 0xfbb886bd, 0xbf75f6b7, 0x679b1402, 0xc633237a, 0x1f1b723d, 0x1f55b1ca
.word 0x5f2f8953, 0x6b7410bc, 0xf410a928, 0xe4316c73, 0x5074702c, 0x6f524fd1, 0x3929ca93, 0xa7274903
.word 0x61b3d67c, 0xcb81797c, 0xdfd37336, 0xaabb0893, 0x2f53f039, 0xf6316eef, 0x126baf2e, 0x1e3ecee2
.word 0xdcb96178, 0x4e3f95ad, 0x61ca2452, 0xbdcc8291, 0x9a3a98dd, 0x28c328a1, 0x7d39385e, 0xa49ca463
.word 0xdd2498bc, 0x30e6a349, 0x16cd4a71, 0x068a58e1, 0x97204dbb, 0x2d33bbd1, 0xedd943fe, 0x06cb8608
.word 0x42a1d5a1, 0x550c89fc, 0x58682282, 0x7bef4f8f, 0x3d47e892, 0xce4b7501, 0x6fb01ff5, 0x25ea9874
.word 0x7aa61537, 0xfb9fef2c, 0x8fc0db49, 0x44aa159f, 0x23cf6460, 0xc155594c, 0x6f7f854f, 0x448416ee
.word 0xe787348f, 0x751af910, 0xbbca5f29, 0x2419e917, 0xa2262826, 0xd269ffee, 0xec5d7d0b, 0x7cf21909
.word 0x067cfed6, 0x070dc74e, 0xbecf459e, 0xa5490a8d, 0xe7b0c80a, 0x2f75856a, 0x8a36fc31, 0x3f36fbc7
.word 0xb5ee96f3, 0xc9a8fdf5, 0xbf41b61b, 0x238d3094, 0x8ed292b5, 0x2b504d31, 0x291c1940, 0xfd02eec0
.word 0x79c10b73, 0x339a1875, 0xb311b40b, 0xbdb747ee, 0x300df5ef, 0xcdd09799, 0x8dc96d6a, 0xa9717954
.word 0x2f019422, 0x2bf645b1, 0x3f9406fd, 0xe66ca864, 0x4df82602, 0x40cb6525, 0xf96be0d4, 0x1ebc41e1
.word 0x329041bc, 0xd9e09617, 0xc93af80b, 0x870fba1e, 0x9b089e50, 0xad128fdc, 0x3916ef20, 0x5d79efc0
.word 0x65c3433c, 0x0fa36e71, 0x2ca127de, 0xc8ee6c12, 0xffa9e281, 0x9a7ab3d4, 0x9b1fa20a, 0x2ad7a916
.word 0x8d24c429, 0x048eb0d4, 0xdb4b2d1b, 0x85408cae, 0x00e316a4, 0x80440de4, 0x69ef6de2, 0x87c9df58
.word 0xbe367976, 0x21bc2c67, 0xeec6a543, 0xe0ef07cd, 0xc7afcf30, 0x6afb9983, 0xcef20d29, 0x841b561f
.word 0xa59c9e80, 0xe12554e6, 0x620fd642, 0x7bff11ee, 0x46fbffc9, 0x8494ae36, 0x4327e9d9, 0x8151a407
.word 0x126f69e7, 0x3e3a1a2d, 0x43b608dc, 0xf76199f8, 0x5e00c762, 0x5f85db95, 0x731bcda6, 0x4c970a90
.word 0x80cb6e20, 0x5c5b2c89, 0x03786789, 0x54b23bde, 0xb4ab2337, 0x7f0c7e29, 0x5635d4a0, 0xec08fa33
.word 0xa1b33fa6, 0xe6dca000, 0x3a4ff9b0, 0xfd959960, 0xa0cce0d4, 0xf55ca454, 0xd34ded0e, 0x495bbab6
.word 0x5c082ee0, 0xee2baf69, 0x6f4d10fe, 0x13a85e8a, 0x852b94ab, 0xc97d9da4, 0x1d64a951, 0xc53d4f11
.word 0x460a5b0f, 0xfc1dfb52, 0x97e0465b, 0x5f379237, 0xabffe0e4, 0x7021a04f, 0x609f0ce1, 0x373c3304
.word 0x53794c98, 0x59c2dd53, 0x3425cd5f, 0x8fd925e7, 0x6dd17489, 0xeab75f00, 0xf19118d4, 0xe178858e
.word 0x629f9499, 0x5ffe983c, 0x7302b6f0, 0x46fca950, 0x6fe0584a, 0xbebf5103, 0xd433c827, 0x12e339aa
.word 0x4ade4a63, 0xf34d4fdd, 0xc618c2f4, 0x12a86370, 0x3c15a5e8, 0xfe7020a4, 0xfa96f3a1, 0xa8c39f7d
.word 0x64874138, 0x5a6609cb, 0xcbf9ead7, 0xdc88e23e, 0xc996f975, 0x32cf1f64, 0x57411f09, 0xd3689096
.word 0xa6147aa7, 0x06dd1b1b, 0x1126cc2c, 0xae21e927, 0x5a8e90ee, 0x46441d8c, 0x18fe4920, 0x88a19b72
.word 0x7a69ea47, 0x32bfcaf4, 0x599f9ff3, 0x6c3b5d14, 0xf8771999, 0x7ddd4cf1, 0xe092d62c, 0x5395bd57
.word 0xeb99b27e, 0x48456bf8, 0xde85fba9, 0x67f2b174, 0xd31414ba, 0x69c98c02, 0x8322d6a1, 0x6a55581e
.word 0xf90f55f2, 0x4efd28f5, 0x6cae59fb, 0x6bcbd5d3, 0xc169ddea, 0xe1a3223b, 0xa8c4224a, 0xf62e6590
.word 0x8376bcb2, 0x047faad9, 0x49027e80, 0x39647ae0, 0x9301dd08, 0x1b8f7c78, 0x4fe3a6e2, 0x23f733f5
.word 0xe969d848, 0x78c6a682, 0xfe2de92e, 0x509890d5, 0xbf268a0a, 0x57eb48c8, 0x492c4aff, 0x6dca3624
.word 0x151f7bb5, 0xa30306b5, 0xd86e5a70, 0x2616a1a8, 0xab2135bc, 0x96c72cda, 0x7dd13d55, 0x20613161
.word 0xe6d1d809, 0x1efb147c, 0xf1356267, 0xf666e05e, 0xe222a195, 0x657ff485, 0x155479b2, 0xab326f0d
.word 0xe6443821, 0xf85b3345, 0xbab44d6f, 0x5dd34612, 0xce947000, 0xa2f14bbd, 0xbe59d8e4, 0x0b6cc990
.word 0x9cf96dbc, 0xab082a48, 0x9b986629, 0x82ecec18, 0xa1996c4f, 0xc3553b6b, 0xfa5754d0, 0xf89a9d5b
.word 0x89b48fe6, 0xb1b8dac9, 0x2b2ae873, 0x61fff094, 0xf7d5cccd, 0xc80ac51f, 0xa381ea24, 0xd2068214
.word 0x38fa5157, 0xc95685be, 0xcf0b4816, 0xb8a73d9a, 0x93ca5665, 0x27f15fff, 0x5af314a1, 0x2a253413
.word 0x8cb948dd, 0xe5cbac31, 0x3e67f308, 0xa2b8c48f, 0x70867065, 0x565db243, 0xf45558c9, 0x32d8526a
.word 0x282c81e9, 0x6b1ae0a1, 0x6038a1b7, 0xcb63ce18, 0x7d8edd66, 0x75d06be7, 0x06ffa1dd, 0x490dfa56
.word 0x5ddf42e6, 0x677ba136, 0x5775a95e, 0x085403f9, 0x2143c068, 0x35b2947b, 0xd688b02f, 0x2141d939
.word 0x3394f961, 0x54975a98, 0x78b2c977, 0xa8cb62c8, 0x0919d39c, 0xa489dd0f, 0xfb069c80, 0x71891b95
.word 0x38b670bf, 0xbe4e78fa, 0xdce35f21, 0x9f187b12, 0xd13f452f, 0x3394dfaa, 0xfd66a114, 0x85d11a57
.word 0xa1bf8e06, 0xa8aee732, 0x74649853, 0xc39ef33e, 0xbf47d3ae, 0xf8526503, 0x8c2bde86, 0x9154fa3c
.word 0x0df34658, 0x18573295, 0x4d01b54b, 0x3bb55d1b, 0x9f0fe090, 0x4597517e, 0x09551b85, 0xee2a909a
.word 0x70cd2fa2, 0x0f0b9407, 0xafeed3d2, 0x167caff9, 0x1335c40d, 0xa006aaf6, 0x5405c488, 0x1ca0b910
.word 0xea35bb48, 0x3e419b6e, 0x6c6b1f57, 0xc73928fb, 0x1a9fb704, 0xcdc0b2dd, 0x01cd2ab2, 0x8c203aa1
.word 0xbcf99c93, 0x144ff10d, 0x4bd02572, 0x56b97ce5, 0xfb7cf8df, 0x00f0db6b, 0xc823c95c, 0x9cc5b30d
.word 0xf72355f7, 0x3e9e897f, 0x9a5e3fae, 0x16d8c60a, 0x6409c240, 0x542eb712, 0xf2f99f57, 0x5eb88bef
.word 0x641bb30b, 0xadc1e8db, 0xd6695def, 0xf8231e70, 0x17b02453, 0x6a340ed6, 0xd07df655, 0xe90f0741
.word 0x5937eedd, 0xe43b3641, 0x7c88ccc6, 0xa29df833, 0x9e88ec8d, 0xbb6635bf, 0x776a7f79, 0x746a9cc6
.word 0x76b7326b, 0x17b379e3, 0x979e4b42, 0x05459c37, 0x43cd2577, 0x9878f262, 0x6dd582ae, 0x43f73536
.word 0xdef15e37, 0xa7fa3da0, 0xda2dbd67, 0x234baeac, 0x470dc41f, 0x9447209b, 0xd1a7ea50, 0xb472e7e3
.word 0x3610f8a1, 0x158a92c7, 0x0728a5e5, 0x681f50f7, 0xd3d78c7a, 0xc101ddbc, 0x40ac7920, 0x8323b8ce
.word 0xaf462281, 0x4ffb2a7b, 0x01b7c5bb, 0xc421c529, 0x4589573c, 0x7c0f0d94, 0x2ce4e469, 0x38a83400
.word 0xf7a2662d, 0xee5ce0cd, 0x6049aa46, 0x1eadb4ab, 0x0ded2047, 0x223af411, 0x102e9649, 0x5e90a6c7
.word 0x128cc746, 0x83fc586a, 0xf4563538, 0x01a6bc55, 0xce1ae075, 0x0961e401, 0xa01efe00, 0x884188ae
.word 0x8ae6ab3c, 0x96d23307, 0xc30a450d, 0x31badcaa, 0xce5d9f8b, 0x6f58f470, 0x4fcc5fc3, 0x38bb90c4
.word 0x62aa8a55, 0x9c923772, 0xd71ec100, 0x8dd77264, 0xdd2701f1, 0x7d519929, 0x36110830, 0x6cf88e13
.word 0xca7df8ca, 0x6fb7c243, 0x4c8a58de, 0x146e4601, 0xdf8604eb, 0xe2fffaed, 0x5ff1a912, 0xb751d9c7
.word 0x579f4633, 0x9aa20c07, 0xa4bb5407, 0x1c12e655, 0x27a3c6ea, 0xcbeaf205, 0x1fa1ff13, 0x619c62a3
.word 0x02b85333, 0xec95a616, 0x3076769b, 0x375fe073, 0xcb1a79ac, 0x79f7a895, 0xe8594e98, 0x7e028c31
.word 0x552ef913, 0x04508cf6, 0xcb60e0e1, 0x21714489, 0x57592e71, 0xb6aec801, 0xc3f7806d, 0xc7ef5f2f
.word 0xcb014c08, 0xb51c3a35, 0xc1acd14f, 0x93dad519, 0xa3a5ccca, 0xf4f8a555, 0xe21f1b3c, 0x06edf80e
.word 0xbf22d587, 0x61c56aee, 0x36dd337e, 0x37a74bb4, 0x1d02cc17, 0x967eb442, 0x15a1e7d7, 0x1a3e4469
.word 0x8c7cef3f, 0xfaf2b975, 0xca910e34, 0x0696f59a, 0x12c5dacf, 0xf9691f9a, 0xadc42244, 0x75a074c6
.word 0x6b6e4e3e, 0x4a1e0486, 0xb6654017, 0x94073f63, 0x05731ef2, 0x4cd17204, 0xa5021dac, 0x42dac08f
.word 0xaa4a30d5, 0x9f693040, 0x3ceb685a, 0xa51c2305, 0xc4ba80a3, 0xd5e16f66, 0x96f4b416, 0xfb59d219
.word 0x009fddb6, 0xfe68a731, 0x669235a3, 0x995b8e21, 0x210c45a8, 0xc3d4e925, 0xa60b5973, 0x20027181
.word 0xac177358, 0x12cbce3e, 0xb67d2dc4, 0x91c9cbbf, 0x081c87bd, 0x1d23338e, 0xd59660c7, 0x06dffc64
.word 0xd0cdd368, 0x153cbb5e, 0x8944f80c, 0xbc5537c1, 0x39233ae6, 0x8c84a59c, 0x9ae2f969, 0x3c535d85
.word 0xe55f3795, 0x0ee21aca, 0x20f116ad, 0x8c78acc7, 0x00aff10d, 0xcce02cf3, 0x265b3dc1, 0x97915895
.word 0x634d0849, 0xfd26cacd, 0xcf4ceaed, 0x6567a3ac, 0xbe3b65ff, 0x2042bc7d, 0x2dd68622, 0xa19ea0f7
.word 0x804bbfb4, 0x38abc24c, 0xf7c4a700, 0x187dcb3f, 0x4db105ce, 0x67caa5df, 0x1aaa48e0, 0x6b13b28a
.word 0x4befc49e, 0x8f3dff4d, 0x53785d44, 0xda3a2ef3, 0xaa06f9b4, 0xba4edb9c, 0xec027f26, 0x404377a7
.word 0x0f950409, 0x181c0031, 0x4e983769, 0x2f9f6ecb, 0x3096ec46, 0x7bb759e9, 0xd9bb1fee, 0xef1215bb
.word 0x421c0618, 0xff30b28b, 0xfe3a588e, 0x3e208dc2, 0xc7fd53cb, 0x51dd231b, 0xb8939b2a, 0xaa52a603
.word 0xc5330496, 0x04280b50, 0x8b2655ed, 0xfa0dd8f4, 0xadddd55f, 0xafbd3e00, 0x99e198ae, 0x18393b0b
.word 0xad80e913, 0x7afefacc, 0xb50dbdd5, 0x488a728b, 0x99cb87e3, 0x389c1cf7, 0x9546c94b, 0xb699c834
.word 0x2273011a, 0x9bd89818, 0x29b304e9, 0x0225096b, 0xc9f72a7b, 0xc5c97e73, 0x9fbc3cc3, 0x8011d7cc
.word 0xe8e49fe4, 0xb4f2024a, 0xb3ba00a2, 0x24e42204, 0xa3ef998b, 0x8669423f, 0xfa8f2bc3, 0x9231ee96
.word 0x985b7764, 0x7e8df03c, 0x6756ffad, 0xd8cfbab0, 0x0f8010a3, 0xf5df0cdc, 0x0d8f76c5, 0x51ff2618
.word 0xd75685a7, 0xde860b9f, 0x2d471f3b, 0x17b7e341, 0x2b637aae, 0x0fc088a6, 0x99195cad, 0x027fe752
.word 0xc09817c0, 0x2f1bd81e, 0x8af2e372, 0xfc521dda, 0x1e9cf141, 0x12d3749e, 0x83cb5be7, 0x8588869d
.word 0x9ce8bf4b, 0xef4484cd, 0xcc2b0d33, 0x2018d8e4, 0x9c8239a8, 0xc087d2c8, 0xd2c6f8c1, 0x52c6add8
.word 0xf1926e28, 0xeb7c2eb5, 0x2d9189d0, 0xc123e6b2, 0xe664c906, 0xf7fe3a5b, 0xa79388f2, 0x08bceecb
.word 0x7b8b3c2b, 0xae492682, 0xf00a8d2e, 0xb6ea7a29, 0xebf60cde, 0xe333848a, 0xaa2a178c, 0x24df7ab0
.word 0xf6906403, 0xfb1dd24e, 0x1fdf8c30, 0xe2eba2c1, 0x9262a9e5, 0x27c9880a, 0xadd9f2cd, 0xae3a41d2
.word 0x574347d6, 0xd7c86e07, 0x1956a56c, 0x5be88ed2, 0xe551b8db, 0x5cf47b13, 0x14999777, 0x5b790d4f
.word 0xd37dec66, 0xcd909452, 0x0f661270, 0x9affda5d, 0x1dab78d5, 0x270116ee, 0xb2ef5627, 0x0e1f4cbf
.word 0x7cc90768, 0x44f3c0d9, 0x5033216f, 0x480beabd, 0x812934f6, 0x505dae3a, 0xd4e53f07, 0xb7ac00c3
.word 0x8efd85f4, 0x05cb08d3, 0xc5133daa, 0xecc2c8bd, 0xb1ba44ce, 0x4de2df26, 0x7e53758e, 0x69b26363
.word 0xf621f8a7, 0xf25178dc, 0x04c754d3, 0xc0d6f5db, 0x093a302d, 0xd5761ece, 0xec1341bd, 0xe9e9b1ad
.word 0x83ca741c, 0xdf48f542, 0xc604be3a, 0xfb027ed5, 0x8bbab077, 0x75e3fe6f, 0xf982024b, 0x0e9a91d5
.word 0x27c1a700, 0xb7d05d4d, 0xde5675b7, 0xa78414d6, 0x8a961e2e, 0x4680e6d2, 0xe59897d4, 0x13f4f436
.word 0x906e57de, 0xa7409dca, 0x8e1b6970, 0x1ee52d05, 0xbfa252b5, 0x19f1bb04, 0xeda2f043, 0x2691037b
.word 0x38d537b8, 0xfad14c80, 0xdc1b18e0, 0xa23b57b7, 0x3dbe8eac, 0xc18d96e1, 0x46d55375, 0x549346e8
.word 0x56a632aa, 0x3acc4529, 0x3c58c129, 0x092d6ab7, 0x5d811fb0, 0x692d8afc, 0x02a054fa, 0xc74ae716
.word 0x8077b00d, 0x85da4c90, 0x3ff213ae, 0x3d2b2271, 0x8ff1ec9a, 0xfd00b0dc, 0xb05ae149, 0xa8441faa
.word 0xdd32f4f4, 0xc9df1579, 0xe3c43d1f, 0xede317b8, 0xa328f2f5, 0x6c4b3354, 0x0fa11b1c, 0x6411655f
.word 0x917f8a78, 0x83e90926, 0xbfde9e00, 0xca2886e0, 0x03a08d26, 0x4b4930d5, 0x2eeb5899, 0x152617f5
.word 0x7caed43e, 0x887a3fe0, 0xf999a7b5, 0xc5dda169, 0x429750f6, 0x9bd48582, 0x31b65131, 0xe4864968
.word 0x2a285ccc, 0xd8b9a5fd, 0x7ddb1136, 0x7eda04e4, 0x6c94d604, 0x0b1a3635, 0xcd48c39b, 0x31f0fc84
.word 0x18e9293a, 0x0b349474, 0x92d5dd2e, 0xe34118fe, 0xd6c6194d, 0x7cb239b3, 0xb6a4397a, 0x57db1b33
.word 0x0bb6f8b2, 0x638fec95, 0x4d670df1, 0x0e8ce83f, 0x7c5ae809, 0x73621251, 0x01c9ef12, 0xfb4165b6
.word 0xc4d4dcbf, 0xe45df0de, 0xac72c7b4, 0xf1af1b44, 0xb8050413, 0x9567014e, 0x125c0aff, 0x9ba31f3d
.word 0x6ea1a6d2, 0x16721dea, 0x141e6986, 0x2078e6ed, 0x0e8d082d, 0x566bd38a, 0x86dd2e28, 0xa60a717c
.word 0x3ecfdecc, 0x865245f9, 0x3285f23a, 0x5a241e2b, 0x31b33a7e, 0x7d76d7b1, 0x1e6b4624, 0xfc755c70
.word 0x80524211, 0xf4de437f, 0xdaba7180, 0x442c759c, 0x3b2ab47f, 0x4b6feea5, 0x387f6fe9, 0x0c1bbe5a
.word 0x24780e3d, 0x7dd32304, 0x09065b7c, 0xa66e0585, 0x0782908b, 0x65e3a43c, 0x190db2c9, 0x87313422
.word 0x29541468, 0x2a500e21, 0x84f4976a, 0xbf0d7fe7, 0x9ff6ff92, 0xa8c04f1e, 0x65355e9d, 0xb4848fcf
.word 0x45ff3f12, 0x44af11f8, 0x6aadfa7a, 0x8a75a26c, 0xc029cc76, 0xb684c092, 0x6b9cdfaa, 0x4ea3a313
.word 0x06fc5a1e, 0x8006beb7, 0xe013ae3e, 0x7feae876, 0x95a62891, 0x87cfd584, 0xe2ab6004, 0xb91a4757
.word 0x6811620f, 0x3c046db5, 0x536b68cc, 0x560f2d3f, 0x2f32dffd, 0xb2350e45, 0x0bbd7261, 0x2ec3fdd1
.word 0x678b872b, 0xf48db1d7, 0xdf9a2579, 0x1ba4e794, 0x6b48e898, 0x38697108, 0xbc23e3ff, 0x209c9552
.word 0xb77218ca, 0xfe674479, 0xa1b319f7, 0xc4b4efc2, 0xe7b6a7f3, 0x56a63aa6, 0x5c67d20d, 0xbdfe9dac
.word 0x3b0983fd, 0xe11307fa, 0x7ab6b9de, 0x27e32b3c, 0x0d9c9632, 0x18dc9ebe, 0x88c60fe7, 0x3a344a8a
.word 0x51bb4700, 0xa07d5d90, 0x6ed1e81a, 0xd9d8f9f9, 0x4c4d4ac0, 0xd6a7a649, 0x9621f32f, 0xfd9a5c12
.word 0xb2878921, 0xe60e7dcf, 0x70c0f102, 0x11b512aa, 0x7ff0d6e5, 0xbef266c6, 0x3000c2d3, 0x132d8f6e
.word 0x231cc7dc, 0x6e31f566, 0x8b448e91, 0x05f3b7af, 0xbb1d58ef, 0xedc646f5, 0x68b05ae1, 0x1aa6a8f1
.word 0x157d6c3c, 0x37accd86, 0x47bd822a, 0xd873df83, 0x62254fd5, 0x58c99683, 0xae99d57e, 0xdee1df7c
.word 0xb6150d44, 0xea902685, 0x6596fbd0, 0x18f02844, 0x8126195c, 0x716fe68e, 0x307be502, 0xef743c3d
.word 0x705e0ead, 0x687ab929, 0xeb3d6780, 0x549cb63f, 0x5f560a69, 0x53337511, 0x12f26746, 0xb69e218f
.word 0x9fd7b152, 0x34a21ecd, 0xfb348c55, 0x1afe734a, 0x7067ecd6, 0xe168b970, 0x88bb7e37, 0x331f25a9
.word 0xe5330571, 0x92681620, 0xf2efec9c, 0xa4339252, 0x384835c1, 0xe1b3ba5b, 0x15e59cd4, 0x6a908ead
.word 0x43d09e53, 0x5c9da69e, 0x546ccd51, 0x0918e24d, 0x2541cc3e, 0x7578a726, 0xa75231b5, 0x1b6c6cef
.word 0x7d7ecb9e, 0x07d033bc, 0x4a4e0e56, 0x506fa149, 0x6ca1d629, 0x9837ef0a, 0x1887e9ad, 0x5e5c655f
data_page_2:
.align 12
.word 0xa31ee0ff, 0x6062788c, 0x285a4af5, 0x5d7fd9ec, 0xfa73f829, 0x8bc11759, 0x9bf68358, 0xf152823b
.word 0xb76be5e1, 0xddbcb69f, 0xb2b263a4, 0x08dc2bf4, 0x37c87f83, 0x81aae54f, 0x2dd5c69d, 0xc9495172
.word 0x7f8bf12a, 0x5ea411f8, 0x8c8b6801, 0x7bd9fc83, 0xfaa33631, 0x3c0ad610, 0x7819e40d, 0x1b113383
.word 0x5f4d0c91, 0x8f12e155, 0xea6972d3, 0x51fd9a32, 0x7682d952, 0xaf6ce4ba, 0x88134cbe, 0x78a1da00
.word 0x8c8db401, 0xcc7118dc, 0x3ea58141, 0xd3b5e387, 0x99a8c170, 0xb07a346c, 0xfae99c09, 0xb41511b8
.word 0xe7e5096d, 0x742d7b40, 0x5c41781a, 0x839730c3, 0xa6c9a385, 0x25147340, 0x85178f95, 0x77e8b9d3
.word 0xc0297d49, 0x25739947, 0xefba3788, 0x50dfea46, 0x52263cb8, 0x75315e94, 0x90ecc092, 0x89d9a764
.word 0x9755fbcd, 0x847e7bae, 0xef7ddde6, 0x82a1765c, 0xf2ee167e, 0x7ce5e594, 0x5845110f, 0x7d0b91cb
.word 0x30927d5e, 0x6f9d4fb3, 0xb5fcee8b, 0xaf031087, 0x76f695ae, 0x753025fa, 0x27c7ff58, 0xa4803090
.word 0x1860612c, 0x86476c93, 0xea229abc, 0xae16ba7a, 0x26b8fb77, 0xe82c1632, 0x91e24eed, 0xa46d7862
.word 0x082c6a7d, 0x75cf8645, 0x20a0a98c, 0xcaaca76f, 0x73fdf278, 0x8106288a, 0xd7d08631, 0x9fb5e7e0
.word 0xa844b304, 0x52b4353d, 0x89bcbd41, 0x23b80c99, 0x664e6694, 0x8925f217, 0x21acf261, 0xe69395c2
.word 0x1481b851, 0x7b3b2c22, 0x98e7d8c5, 0x49978913, 0xfef85adb, 0x1edfda69, 0xcad6f99b, 0x692aaf6b
.word 0x1f9cc3ab, 0xcc5cf0a6, 0x0331674e, 0x0c050fbf, 0x33c0205b, 0xa8db57ad, 0x3d7300b1, 0x30797f46
.word 0xfc2fdbf7, 0x917f32bb, 0x802aa486, 0x37d8f475, 0x4ec6a5a5, 0x9f4e763d, 0x74fe0912, 0x400252aa
.word 0xbb0ad45d, 0x15829615, 0x6a1a1890, 0x276cbd85, 0xbec226f3, 0x8696ddb5, 0x40369748, 0x2e82c446
.word 0xbafcc878, 0xaef4fe08, 0xcf56fca7, 0x39ae5f98, 0x1b153b18, 0x0357a835, 0xe9df4467, 0x9a087f5e
.word 0x763da119, 0x320e4eef, 0x93ba6236, 0x51bafa5f, 0x233da509, 0xfe892360, 0x4e18646b, 0x7cb1c345
.word 0x422dd7b3, 0x038fcee9, 0xf30ecafb, 0x813cae68, 0x25bbbef6, 0x18188949, 0xe11a34ea, 0x9c4170f7
.word 0xb2136855, 0xda6f941f, 0x1052422e, 0xac97fa60, 0xe0398310, 0x31c91d9d, 0x78a24641, 0x6ce204f1
.word 0xb2e7a231, 0x3b337072, 0x1b8efd7b, 0xefa9706b, 0x1e0937e8, 0x4e846c97, 0xdd817e41, 0xcf281874
.word 0x2531cc0d, 0x1f158fef, 0x5e7bab55, 0xd25cde92, 0xef292269, 0x4b058108, 0xf127cde5, 0x020bd59e
.word 0x0f5367ba, 0x87ccbe1c, 0x0a751cff, 0x79afc1f4, 0x587a3a97, 0xd1fab064, 0x7a234325, 0x15a3ad1e
.word 0x646280dd, 0xc85d64e9, 0x4e0d305d, 0x19855299, 0x350bcbea, 0x90f074c9, 0x4c789713, 0x77d33022
.word 0xcf74a186, 0x6363be23, 0x98f3c2d9, 0x1e5e2dde, 0x507796b7, 0xeef95365, 0xb0c59d3a, 0xdaa9ae9f
.word 0xbd33a914, 0xf0962125, 0x04da9f5c, 0xdb262a73, 0xdcbd9b04, 0x5c7383ac, 0x6e1481c9, 0xf05ae800
.word 0x02fbc5a9, 0x3dc4f69e, 0x5580dd6e, 0x7d1752ee, 0x07e243cd, 0x8887f630, 0x1a8e7abf, 0x9df87696
.word 0x745092bd, 0x1cc86f9a, 0x9378f5eb, 0xcffda553, 0x2c53dc9d, 0xe44af1ad, 0x767c80d8, 0xf2ec7a97
.word 0x1840f2c5, 0x0450c656, 0x4f16c84c, 0xa5db6332, 0x345b446d, 0x47c56a41, 0x4d5301dc, 0x22eecb44
.word 0xd89d8ab1, 0xc100aca9, 0xc4a9b7e1, 0xee1a8aea, 0x94390378, 0x03650746, 0x5649b1e0, 0x816645f2
.word 0xe6a01d54, 0x3390eea1, 0x24b9954c, 0x31d0f427, 0xe5bf5cb2, 0xe15f4e34, 0xf67bbdf8, 0x92a15923
.word 0x58a90233, 0xc090497a, 0x579941ad, 0xae115690, 0x02b3d2be, 0x4ce60db7, 0x273c3a5f, 0x16e558cc
.word 0xc3208782, 0x642d0d75, 0x6dfc69fa, 0xd0f23607, 0xd1de3540, 0x6efc46d1, 0x4df15f2a, 0x32bc9d0e
.word 0xfc7dc16b, 0x2a6918d4, 0xfdaadec0, 0xe8d49d04, 0x7d6a52a3, 0xe9b77f56, 0x05f503da, 0xb01aaf13
.word 0x7b4429b5, 0x5f05e171, 0x477b0633, 0xdc451cd7, 0x786c5ed3, 0xe1fc601a, 0x064b0d93, 0x7d0f2227
.word 0x674dd625, 0x67deca4b, 0x5b12dd63, 0xbd91f82c, 0x08460558, 0xd52d5b28, 0x3c15e58a, 0xe221b451
.word 0x9673d4c6, 0xf462cf14, 0xb10374a8, 0xd3116f9e, 0x57c31fb4, 0xd3fa8554, 0xdde16f82, 0xe79016a0
.word 0x5996eb1d, 0x0e898ebf, 0xb96eba92, 0xca23db46, 0xca0b4b36, 0xcc8b77f8, 0x934a8202, 0x9fcec4e4
.word 0xa4c2da35, 0x55c2d887, 0x6a5369bf, 0xe03ac7e5, 0x5e233f5a, 0x7975df95, 0x1487f71d, 0x0f591a65
.word 0xdb3ed5f9, 0x1d16de78, 0xefce6113, 0xbc13d03c, 0x0e8e1bcf, 0xf69e846f, 0x4f59d84c, 0xa92e78e4
.word 0x3a89edb6, 0x9fb2f4b0, 0xe92937e5, 0xe020b8b6, 0x7b6d6ea8, 0xf9abd719, 0xc0c0a5fe, 0x66eed6f1
.word 0x956b7583, 0xfb0954b6, 0x49b074f8, 0x6746becb, 0x08508fb3, 0x9c749d67, 0xcda35cc1, 0x5b8817d3
.word 0xa51ed12b, 0x0cf94a9e, 0x93ffd024, 0xa3dde81b, 0x22ca96e4, 0x29127e0a, 0xcc507b3c, 0x39c62331
.word 0x77399edc, 0xe20eaa25, 0x9138fe9a, 0xd2288e19, 0x0036188e, 0xb39f96f6, 0xdab4411b, 0x3d30d515
.word 0x24d0a45b, 0xad0ec537, 0x715db47c, 0x2d7de22b, 0xb739dc98, 0xce1c9922, 0x60976a91, 0x3d134329
.word 0xeb1818c6, 0xb1f2d110, 0x4e0c4939, 0xe29fd283, 0x9b3167f6, 0x0a934a3b, 0x4ec70449, 0x7b98791a
.word 0xba1acdd5, 0x11a01c3f, 0x0aa0233b, 0x740b69a9, 0x247cb14a, 0x3fbc7e27, 0x83515231, 0x46c84d13
.word 0x3eef8964, 0x0b58d307, 0x10e21107, 0xc15dbbc5, 0xf2b79a9b, 0xf5b42228, 0x1326d5ca, 0xc896d73c
.word 0x2993c044, 0x3817e391, 0x6749b3f7, 0x12a23721, 0x3c729906, 0xfa379783, 0x233d394d, 0x80b74ddb
.word 0xcf75e3f7, 0x144b341d, 0x2c0c6561, 0x72b75d53, 0x182c22d1, 0x6b9bc319, 0xf1f0aea4, 0x2cb3abc5
.word 0x04f30bf3, 0xf9149e92, 0xcd6af048, 0x99566f80, 0xa4bbdf82, 0xccf5eb50, 0xdceeddbb, 0x9638ef51
.word 0xea4a4446, 0x63ab42a3, 0x185c2ae9, 0xaf5dd878, 0xd16e06f9, 0xff192396, 0xa848dbc7, 0x1d8731c9
.word 0xf9ba5e0a, 0xda842fbe, 0x392d3fe7, 0x305b27ac, 0xa475ae90, 0x793e774b, 0xa76c3340, 0x923b7981
.word 0xfa8bdd7d, 0xb7494577, 0x8aaa2c16, 0x1e4397cd, 0x3d97ea70, 0x6c0ce6b3, 0xa941cc3c, 0x93c559a6
.word 0xb6195da1, 0x5a29458c, 0x2a4982fe, 0xd143df39, 0x8921f46f, 0xc8983875, 0xd68c9441, 0x0d422d91
.word 0x06e993ed, 0xeb3e7832, 0x06cf00a3, 0x6dd4ee57, 0x30d7c2f5, 0xb6d0e209, 0xe0edd981, 0xdecc2a5f
.word 0x981d9314, 0x98ad33da, 0x760bd620, 0x4f19536b, 0x9a3cedf6, 0x0a659a5a, 0x7c9a5c25, 0xa12f4f39
.word 0xb2923f75, 0x4ebbfc17, 0xfb0f8557, 0x98ba71e9, 0xa99e48c9, 0xb3e60b52, 0xf0ee40f5, 0xc42c8fdc
.word 0xb642cf91, 0xdd0ae8d7, 0x8d8ba7ae, 0x36333f18, 0x05740628, 0xe01b5c3c, 0x92cf20bd, 0x4c97e3e4
.word 0x1aa0a304, 0x3dee4625, 0x29fe68b7, 0xdd3079b5, 0x4fb2b591, 0xa0748f4f, 0x5cc0a2a0, 0x0c426387
.word 0x458a316e, 0x394500e5, 0xa1c0326d, 0x402ec832, 0xdb1bc825, 0x6832475e, 0x3d50bb58, 0x6d771111
.word 0xfc658b5f, 0x7e4f5a2b, 0xca87c0e9, 0xfd70665b, 0x40ccd071, 0x76e298ca, 0xaf2fbd34, 0x3dde6868
.word 0xc7b2d50f, 0x1e542b0e, 0x25b68f83, 0x3cc1cf75, 0x0cb09182, 0x3200b593, 0xcf76eb88, 0xb1cebe9f
.word 0xd3ecb42f, 0xa0dbf1be, 0x877c1f56, 0x61cd09e1, 0x30532443, 0xfbcd5306, 0x90bdeeee, 0x09e36d1b
.word 0xd6e90323, 0xfb4c3c0b, 0x19035730, 0x118b0a85, 0xac3ebb5a, 0xcc941ae8, 0xcd88c4c1, 0x27512611
.word 0xf615360a, 0x2614925f, 0x3ae0183c, 0x40ffd526, 0xa9d4d8b9, 0x062f656d, 0x881008ad, 0x6540b1eb
.word 0xa53ffa60, 0xa1ea6a8f, 0x60f8e339, 0x49f1d320, 0xc6c4c611, 0xae7c709e, 0x867035e3, 0xe66bf59a
.word 0x80fde2cb, 0x75aaebe7, 0x5037972c, 0x6d7da583, 0xc9d11786, 0x33b5de70, 0xf003c24e, 0xb70113ed
.word 0x72201cc4, 0x8169eb8f, 0x4112c548, 0x88b38d5a, 0xe73cb531, 0xb1bf7a0b, 0xb285ef03, 0x34b88333
.word 0x7a9c2155, 0x85649097, 0xfd4fe7ba, 0xc963a2dc, 0xf881d4f5, 0x09535ade, 0xdd612eb2, 0xf2d7abbf
.word 0x19277e83, 0xcfb61f25, 0x8667cb76, 0x923a78ea, 0x9cb4cbcf, 0xf7ecb169, 0x3564149f, 0x85b28c1d
.word 0x4223f981, 0x9cdb05c4, 0x8a0d44e4, 0xb66c0b31, 0x5c01dde3, 0x58da45b0, 0x38814c46, 0x9476971b
.word 0x2505e1dc, 0x526568fa, 0xf0831dfa, 0x6dac83ee, 0xa0f65379, 0x9559537d, 0x23d9980e, 0xc685be04
.word 0x0fd93700, 0x9fc93ecb, 0xcb8e4b62, 0xf3ead865, 0x8e21c8b9, 0xc3deb356, 0xd0335743, 0x5ae9df77
.word 0x2db88de0, 0x17fdce3a, 0x00805700, 0xa3192050, 0x2c6b8808, 0x29991e1e, 0x07e722ec, 0x9eec0998
.word 0xf4a3ab65, 0x0394d5bf, 0x92c55dd5, 0x52ecc856, 0x27a94364, 0x4a16f001, 0x0f6c24d0, 0x3c3175cb
.word 0x56749085, 0x47b14321, 0xa344a123, 0x0b62984d, 0xd012bed0, 0x54ef0813, 0x9810acaf, 0x11d4eb54
.word 0xc74330d0, 0xdf7e4033, 0x2f773276, 0xa8c8fcf3, 0x7dd159e5, 0xd2c2a106, 0x6c99761f, 0x78dc7c94
.word 0xc300de6e, 0x5c2b6afd, 0x624c7113, 0xc8e4f0e7, 0x54455d81, 0x81c80247, 0xdfdc026b, 0xde5b9905
.word 0x2177d305, 0x1975a914, 0x8027666a, 0x17907b8c, 0x6c6d908d, 0xa7305968, 0x228d4c10, 0x65bc4714
.word 0x7abc4796, 0xb5a43b68, 0xe48dd447, 0xabe56544, 0x467e30c4, 0xf98817c2, 0x98cc43a7, 0xb34ca7af
.word 0xd03627af, 0x99ce20ec, 0x240ee4be, 0x020d67d9, 0x74aef8ea, 0x855b92fb, 0xf43d6003, 0x01014ebb
.word 0xdb8925ac, 0xb8efc0ae, 0x498c172a, 0x01bb5d21, 0x54ad716b, 0x05005408, 0x16b4b517, 0x840755ff
.word 0xe06e2b97, 0xa5a2569e, 0xc65017db, 0xa7140521, 0x526ce1b2, 0x93db854f, 0x88bdc0b3, 0xce911ef1
.word 0xbc2243d2, 0x70a102b6, 0x719a25b2, 0xfd8ed325, 0xc277e299, 0xf96f3518, 0xe944b9ea, 0x5e170692
.word 0x0ae883fe, 0xdb7cb12d, 0xb67cfdb1, 0xadd34117, 0xb40ff8c8, 0xd718a815, 0xfd9ac4be, 0x528d149e
.word 0x7828715f, 0x2d1e7947, 0x19dc20ed, 0x6340c8d2, 0x02e84d74, 0x29c26ce4, 0x74027f87, 0x6a56a15f
.word 0x32622a50, 0xc7923da1, 0x0a2b54de, 0x5db902ba, 0xdf1c379d, 0xe03c1e0f, 0xdc1a96d1, 0xcf5d3b2b
.word 0xe56ae4b9, 0xf7411e72, 0xbf9b0d61, 0x42b29bc0, 0xc2617f17, 0x17c96ff8, 0x7e8f090e, 0xc4be81f3
.word 0xaf68b961, 0x66d1d256, 0x8fc02643, 0x763e3783, 0x0c6f27de, 0xd8fc2b42, 0xd0abe110, 0x96950363
.word 0x7f2532f9, 0x00c4e73e, 0xa15a4e0a, 0xe1503277, 0x8b9d58ac, 0x1506bbf2, 0x8d1f32b4, 0x856dc24f
.word 0x2134f4ef, 0xb3acc441, 0x26a69308, 0x14d6a14d, 0xc598a4c9, 0x74bb1c19, 0x16b3603d, 0x9e1a1502
.word 0x3dc0ac20, 0xe1639b47, 0x013c589b, 0x58593485, 0xed79f24c, 0x9766dfca, 0x659029a7, 0x790ecbf7
.word 0xa77474a3, 0xcb93d043, 0x90c158b7, 0x5120f4f6, 0x8944622b, 0x76f28743, 0x20416446, 0xb5b705fa
.word 0x03ddaa3a, 0xca17e88f, 0xadc84324, 0x1af73cde, 0x58a501df, 0x8e4071c0, 0xcde454e3, 0x47cc8c6d
.word 0x96c788ef, 0xe264ef71, 0x7bd79676, 0xffb36823, 0xd53bdbc3, 0x5707390e, 0x78f3b501, 0x198728b6
.word 0x99d30221, 0xd8a2ef3c, 0xaf473381, 0x24a1e5ba, 0x9ebf9a9b, 0x48046e14, 0xda207943, 0x92b01b8a
.word 0x73064706, 0x6d8888eb, 0x9f9a20ef, 0xfe0afefe, 0xfaf59c01, 0xecc93aa3, 0xea590820, 0xe853360a
.word 0xe03a16b1, 0x1641065a, 0x4b051b26, 0xa160d692, 0xec688cbc, 0x423d3944, 0x5cae650c, 0xc8fb50d5
.word 0xe7d7565a, 0x4a3f08ba, 0xab371bd9, 0xcfea5527, 0x4ee306fe, 0x033bd229, 0x212c33d4, 0xefea046e
.word 0x42004f56, 0x41ad06f8, 0xc91f1fe0, 0xfb8ce245, 0x291b2c58, 0x8302084b, 0x989515e6, 0xb28bf759
.word 0xb79e69bb, 0xd207bcdc, 0x72ff9237, 0x4c323acc, 0x895e4c9b, 0x3b2edcf9, 0x0f6f9879, 0x1dc20f4d
.word 0x91f364b9, 0x95cdef9a, 0xaed6a4b3, 0x179ed0bc, 0xdc8c52b3, 0xc277f353, 0x6bdb27e2, 0x4af6061a
.word 0xacd4596d, 0xdefca47a, 0xb9029652, 0xb5102c17, 0x09bef0a2, 0x38c626ff, 0x16e47742, 0xe35cae60
.word 0xafd213c7, 0x93cdc32b, 0xb629c045, 0x0c26dd6c, 0xcd721a7c, 0x7c72d2d0, 0x18c07ba8, 0xcfdfb91b
.word 0x023a577d, 0x6dbec0c9, 0xb065b503, 0xc16616c0, 0x6677337b, 0xa9bc1c3e, 0xef0377fa, 0x37f3ff36
.word 0xdc88ad96, 0x71671d61, 0x5d3ed9b4, 0x463a2e40, 0x083df8ec, 0xc056b364, 0x30a86335, 0x8a185c09
.word 0xfa1302cc, 0x6e28d33e, 0x8c6fa119, 0x098b703c, 0x6cf66939, 0x1bd0ae57, 0x55debd25, 0xe61c4284
.word 0x186ab7c0, 0x136f68f7, 0x82b7a6c2, 0xe0d13eae, 0xcd2f975c, 0xa4b05a17, 0x4ec61b01, 0x15ad330b
.word 0x0cddae9b, 0xe318d615, 0x9bdc3684, 0x2e4e2788, 0x08ee5c8a, 0x9415aa1b, 0xe3bbdf27, 0x7c2a3feb
.word 0x10248a92, 0xbe668920, 0xe4394c22, 0x565dbbc5, 0x59a0ea33, 0x652adccd, 0x6a7fb466, 0x37afcd3b
.word 0xfc043e00, 0x780d82d6, 0xb5e35091, 0x107f31da, 0xeaf1eda2, 0x84045f73, 0xa71c00e5, 0xf459354a
.word 0xe1b65c64, 0xc0eefbab, 0x0896a924, 0x6a9b81ef, 0xdf431280, 0x684a19d8, 0xd24ea1a8, 0x637621cc
.word 0xa6fcc84f, 0xbb417daa, 0x697a54a2, 0xcb53687c, 0x167d889f, 0x604a6dcd, 0xf08f6cf8, 0xc3315e95
.word 0x9eb1ff41, 0xd0e4cada, 0x3dff11a1, 0x5b03305f, 0xc627385a, 0x7e96c5e3, 0x5498efb9, 0x0221e263
.word 0x367f8e81, 0x93e765cd, 0xd75ed3ac, 0x87afd918, 0xdc2fc2d5, 0x8a63557c, 0x2b8291f5, 0x443ce5a1
.word 0x3164d370, 0x70eebd74, 0xcf68fa36, 0xe3030ece, 0xb3fca499, 0xabd3c256, 0xb6eb6ace, 0x01b032f3
.word 0x69785fbd, 0x7a3b7914, 0x922176bf, 0x423a0ed4, 0xcf239925, 0x6365592a, 0xe86e5922, 0x536d4965
.word 0x66804906, 0xcdcb6ea7, 0x085423a1, 0xe23f423d, 0x0e3da5f9, 0x6b2ecf3f, 0x9125f64b, 0xf4e8403d
.word 0xd18b714e, 0x30f52933, 0xde6e2580, 0x73bc6818, 0x36a39d03, 0x1af8cd86, 0x6ee859b3, 0x4990bab2
.word 0xe4e04683, 0xc62727de, 0x84629456, 0x5f01717e, 0x10bae388, 0x82f8901c, 0x1af8ceab, 0x1ad0a1a7
.word 0x961b86ee, 0xb082ea22, 0xb0eede74, 0xde9a3649, 0xad1d1124, 0x63a21613, 0x80e3b08c, 0x47388f3e
.word 0xb430d078, 0xdd5190f9, 0xafe8e13b, 0x139a6fc3, 0x3cb3f45a, 0x0c09c291, 0x24fcf916, 0x05c4a5a7
.word 0xf51cd27e, 0x8b651608, 0x31e13dc2, 0xf80fa4dc, 0x59b0562f, 0x44eb29da, 0x891aa5b2, 0x112c6abb
.word 0x1e5dff85, 0x78b4df67, 0x1d58dde4, 0x6472923b, 0xb88c7128, 0x9bea0593, 0x1150336a, 0xf2a8985a
.word 0x7a8c68bd, 0xf29d7b19, 0xf81c19e3, 0x369d2bc5, 0x10babff2, 0xe4801c35, 0xee8282e3, 0xa567386b
.word 0x4b1d2a56, 0x31ce65a6, 0xe0a477f7, 0x7d3579a1, 0x17444b9e, 0xb69c2c7c, 0xd87272e9, 0x13666dff
.word 0x10dfc86e, 0x8e926ac3, 0x8d21be6d, 0xce8c1487, 0xa4ee55c7, 0xcd47ddda, 0xae180f93, 0xf1edd103
data_page_3:
.align 12
.word 0xb5b258e1, 0x119b92f7, 0xbc46957a, 0x25fe980f, 0x7af45415, 0xf591db76, 0xfe2bc4c9, 0xfdbc4e3a
.word 0x5a70663a, 0x9a2ad55b, 0x96938b79, 0xdf975ec6, 0xc3e62f5a, 0x919ad8e5, 0x6df8d39d, 0x56d0cd67
.word 0xab3b784f, 0xfd98fae2, 0x2ea22c40, 0xc613cb2c, 0x4896c887, 0xecd61993, 0x2f5e4fb0, 0x607e9a97
.word 0xb08460b5, 0xee4c7a66, 0x3100e04a, 0xebef5e7a, 0x9c206e11, 0x2b8cb479, 0xa9c853c2, 0x43b61acd
.word 0x83ad93da, 0xef593bd9, 0x8c3b6640, 0xa21e13bd, 0xa4a0fb3b, 0x0f5dff95, 0x0cfd174d, 0xe42072a5
.word 0xf511b5d7, 0xb996590e, 0xc37c6f02, 0xe1adbd50, 0x85d5e7ef, 0x3ed03dca, 0x1f2dfbd7, 0x4e51880c
.word 0x74d68b36, 0x15f1eb1e, 0xe9036e53, 0xc763892f, 0xfd57b59b, 0xcba42617, 0xca21ac6c, 0x683e3ad1
.word 0x8287ad20, 0xf36de6f6, 0x545502c2, 0x8fadc7c2, 0xde21c7d2, 0xd9cae210, 0xdc9d5ee2, 0x7e6df483
.word 0xfd76c303, 0xed044d9f, 0x6c35934f, 0x057c91ef, 0x6df988fe, 0x1def33a3, 0x1761ddf2, 0x8fa6e99d
.word 0x5b6f884c, 0x08698d5d, 0x9c03a4a5, 0xe8693075, 0x01390984, 0xc63a0971, 0x426eb1d1, 0x99877d6e
.word 0xc41e8970, 0x75bb09f7, 0x02865f28, 0x08f444c5, 0xa22c98f8, 0x3705bc81, 0xbfb13724, 0xc720b415
.word 0x74b76168, 0x3dd2d1ee, 0x6c1f57bc, 0xb8b5b785, 0x51b1db14, 0xf4e8c040, 0x7122b696, 0x01bc0302
.word 0x6ef325dc, 0x0cd5253b, 0x5a0c2f17, 0x117e078c, 0x75a3fe84, 0x35f77df3, 0xbaf03936, 0x2c79c809
.word 0xa2afc3f0, 0xa5514681, 0xca733457, 0xb9480434, 0xd98f39e2, 0x4a7401bd, 0x852bf068, 0x0d904e81
.word 0x3f2628c2, 0x6b00abd3, 0x1ea937c2, 0x2de2a56c, 0xa670afac, 0x8859fe92, 0x60668935, 0x3c0c4dcf
.word 0xd89a296d, 0x97564dc2, 0xf06165f3, 0xcee7ee0e, 0xce87aa4f, 0xbcae2a98, 0x3b615408, 0x12c4e40e
.word 0xf93726e0, 0x32a66654, 0x923421d8, 0x075c3524, 0xb45fef90, 0x67301907, 0x36ae530a, 0x6e7010f5
.word 0x06c70ff7, 0xa30c3ada, 0x9fa9e894, 0x6d07eae8, 0xa1fd1311, 0x3ed7ace8, 0xabefe651, 0x4c39cbe5
.word 0xfd1470ea, 0x562c7143, 0x745ad32b, 0xb94fe61a, 0xb14c22f2, 0x8b2432ae, 0x6af5520c, 0xd6a1c42d
.word 0x63ca111f, 0xa0fa2db3, 0x5bd35110, 0xd5435ee6, 0x4152ecda, 0x72c0bcf2, 0x4812ce87, 0x4e3af71a
.word 0x6fa74a05, 0x65a07d5d, 0x40a3401e, 0xbabca586, 0x4fc1dfcc, 0x0411f673, 0x1f178227, 0x5740dff3
.word 0xe4f12ef8, 0x6407c314, 0x10ccdf57, 0xbbc38547, 0xbaa7010e, 0x78312fe7, 0x797f073a, 0xed86a5ef
.word 0x7ff16b0a, 0x5251ae66, 0x36ed652b, 0xb5c570df, 0xee89aa0c, 0x66881f40, 0xcfc8f203, 0xdd5e6219
.word 0x8852cef6, 0x76a7814f, 0x33fbac91, 0x3f2b6806, 0xcf3a3d6c, 0x68a2d0d4, 0x4b466ea2, 0xd3607960
.word 0x0bd69cef, 0xab46cb9c, 0xecc68785, 0xc359758a, 0xf56a784e, 0x1464bcbb, 0x9b10c982, 0x73bb6d3d
.word 0x5aca74b9, 0x849f69f8, 0x7edfae93, 0x4f55f675, 0xeda56164, 0x8e3ed791, 0xa26707e3, 0xbf9eb9db
.word 0x97f5febf, 0xc3777353, 0xcede12ec, 0x3db59643, 0xec6fd6d9, 0xdc032261, 0x337cac37, 0x03d0b301
.word 0x20ab1e5d, 0x22d23ca0, 0xb7d25efe, 0xfa9c81a2, 0xb13ebbab, 0xdef8567b, 0x12f79cc0, 0x1730074d
.word 0xf8c7638a, 0xfde736c4, 0x96a32dbf, 0xb1574573, 0x22092994, 0x728e3e82, 0x18408b80, 0x31d8a387
.word 0xda05b365, 0xf497cd33, 0x590d444b, 0x07134b68, 0xad287dee, 0x3d04c9f6, 0x9b010ec9, 0xab9288d6
.word 0xafe8069c, 0x71897896, 0x28bdf2f3, 0x3e9645cf, 0xf1e95b6f, 0x13a16c87, 0xbcd73343, 0xc52c7b61
.word 0x212c2cf8, 0x8c7eb527, 0x102201d2, 0x51df4a11, 0xc179b755, 0x1a43bd53, 0x1882521c, 0x7d021b51
.word 0x4f632457, 0x719ba2b9, 0x23391f8c, 0x8ca21916, 0xbf2536e4, 0xce6fc549, 0x6fd695a5, 0x672a1708
.word 0x8b61196c, 0x42e5f29a, 0xc75692e4, 0x0f80ec1b, 0x287191fc, 0x6557331a, 0xc569d6f9, 0x8b1e6e54
.word 0x4df88741, 0xc1831502, 0x802faf41, 0x87a9300e, 0xf928a56d, 0x51b9220f, 0x20dee6d6, 0x75596e75
.word 0xa8a4689c, 0xa06feea1, 0x8cc29978, 0xc6584208, 0xc1069e02, 0xd5630c78, 0x9fdcba1f, 0x7fc92b04
.word 0x63d940e8, 0x625e04fe, 0xdec13740, 0x24b0f350, 0x9f50f045, 0x53353f58, 0x40b8761c, 0xab6a2fa3
.word 0xad2911b0, 0xef61c271, 0x981099be, 0x69624a90, 0xad15e008, 0x2e7b09ab, 0x2b9545a9, 0x13742e6b
.word 0x1cfbf69f, 0x73b0a14c, 0x4ac20b59, 0x8fc2f4f7, 0x90574fd2, 0xb67f438e, 0x190961e7, 0x906aee3d
.word 0xfdd7889f, 0x4be94d14, 0xb82880a7, 0xa57a5f5a, 0x3e3419f9, 0xbc192274, 0x3a460166, 0x4700cc37
.word 0xb6f2324f, 0x99d83c44, 0xe9d41d2c, 0x22ce4318, 0x148bf145, 0x0316f502, 0x3b684dd5, 0x4e7971be
.word 0xd6d31c0e, 0x5420518c, 0x0d7d7aaf, 0xb5a406ac, 0xec1cb35e, 0x5da204c6, 0x43d3770a, 0x84ce63ad
.word 0x49b767dc, 0x51ef25ea, 0xf83bdbbe, 0x08b794f8, 0x1e4e0aaa, 0x09e8634a, 0xec84a975, 0xbc454f35
.word 0x769cd7d0, 0x6394e141, 0x8b23f8e3, 0x6f9750e2, 0xff62e598, 0x95abd2a7, 0x6f82a1c4, 0xc476f7b3
.word 0xb2fa299d, 0xf53b4755, 0x31f3719a, 0x9ec52d83, 0xca19add6, 0x00b8c67f, 0x3d36a8da, 0x0afe4276
.word 0xd231d6ea, 0x25fa52fe, 0xed58463f, 0xefd50dab, 0xd5c41b0b, 0x2bc24b3b, 0x4300cad7, 0x5812462b
.word 0x0b8c3a26, 0xbbe696ae, 0xfa54be89, 0x60674d99, 0x4d671b8c, 0x1ea0bcc5, 0xd0750704, 0x71a67074
.word 0x7c091d5c, 0xeb1b37da, 0xa473f2d7, 0x49de89ae, 0x88b85202, 0x23560ef0, 0x0d0a82ce, 0x850094ba
.word 0xe5a609b9, 0xc715b31b, 0xf4b607ac, 0x81f4f153, 0xedb37919, 0xd3ecba63, 0x7ca67c4d, 0xe8e09825
.word 0x92b31561, 0xd36fd262, 0xbbef0eaa, 0xae1d6164, 0x561bcf0c, 0xeec37263, 0x4746f9d7, 0x44bc7e2c
.word 0xcec86561, 0x4b22c106, 0x82b1673d, 0xa9395050, 0x959fe303, 0x546e671c, 0x5be493a3, 0x3e4b536a
.word 0xa1ae45ca, 0x0322b08d, 0x27ca1ad6, 0x466bd021, 0xb60e83ea, 0xb4af777c, 0x6df8a81d, 0x1856ed56
.word 0xbeac54e5, 0x26923885, 0xaf136c00, 0x01eb7b07, 0x1d83c0ac, 0xfeedb8c0, 0x9e87a3b2, 0xc567c4af
.word 0xc94df03b, 0xea14fe70, 0xd811f1c7, 0xe200e5fe, 0xa8cd047e, 0x97e6f374, 0x7be76425, 0x395eef8d
.word 0xd00f2b88, 0x085379d4, 0x1eeba99f, 0xbf06b4d8, 0x19eb7dc9, 0x9f8d063a, 0x506e939b, 0xb6383fd6
.word 0x70172864, 0xb3b63c66, 0xfb918791, 0x844c1720, 0xa02c7911, 0xb78c4290, 0x35937b83, 0xc012698a
.word 0x4c796972, 0xed6ec4fd, 0xbc125a8f, 0x83b50e76, 0x69082bc4, 0xd7ab8509, 0x6d0a6bb9, 0x10a7877d
.word 0xbffcbb06, 0x6c6c307f, 0x6f9cecf9, 0x57e82611, 0xccee5943, 0x16ddefc2, 0x75be6146, 0x231dea73
.word 0x3e7e9eed, 0xcf80c395, 0xe69e573a, 0x87b0fc22, 0x5f3f86ff, 0xab248a8a, 0xae39786e, 0x4bdc6292
.word 0x4f4e54cf, 0xf56cdd4d, 0x6a2f78e3, 0x5133e1e6, 0x82b413d8, 0xbc1167dd, 0x9c529dad, 0xf153047c
.word 0xcc528e74, 0xca92e729, 0x85c55b32, 0xbd865e60, 0xa8361885, 0x6b921f9e, 0xd7b7fa4b, 0x568a93bf
.word 0xe123caba, 0x53be9261, 0x0dbbda1a, 0xc7065641, 0xc5964798, 0x977ddc02, 0x917aa857, 0xc4498440
.word 0x907d37a5, 0xd4c4722e, 0xb6cbed48, 0x26277067, 0xec5e2dbe, 0x382a8a99, 0xaf65ca45, 0x9f7e924a
.word 0x40744328, 0xb70dcbee, 0x63d9556c, 0x3b85780d, 0xb17f8875, 0x1652d471, 0xcef28067, 0x21329bbb
.word 0xe6262fea, 0xe19dda95, 0x5f21f235, 0xcfbbfa5e, 0x05277417, 0x153e51f9, 0x2c455b8e, 0x8e14ed1c
.word 0xb4d17740, 0x00fc1cd2, 0xa0c44d59, 0x1a8a5eac, 0xbc914694, 0xd04324c1, 0x8d41cade, 0xb89e4392
.word 0x51a941ac, 0x2e7d6835, 0x4e85e3c0, 0x4d5d03fe, 0x5301431b, 0xff82dbd1, 0xbd9596f8, 0x02ca4451
.word 0xa561c587, 0x9b117538, 0x8e33f838, 0x74fff2ec, 0x9488ccea, 0x7d2995e9, 0x6ad575f3, 0xc212ad3b
.word 0xde31fb39, 0xc6779d05, 0xce032d86, 0x64713ea8, 0x28f88158, 0xfe972e82, 0x28a72983, 0x176c9002
.word 0xc640ddd7, 0x320fdc78, 0x8db41914, 0xf17793df, 0xa1a221fd, 0xd90bfeb3, 0x3d7b8d14, 0x98f7885f
.word 0x71ddd9ff, 0xea209946, 0x15440b9f, 0x23fbd22a, 0x9c3d6370, 0xadc32289, 0x831b3445, 0xbb5f4271
.word 0xc81a3648, 0x06b3a1e4, 0xa9e079bd, 0x56084a0f, 0xa9813af8, 0x676eaaa7, 0x6f459589, 0xec0392a1
.word 0x1066cfae, 0x1c9d7423, 0xa2ac5297, 0xcc447093, 0xd1c2b62c, 0x94563349, 0x478b2576, 0xf513dfae
.word 0xdee9d31a, 0x1cd88534, 0x30c9e012, 0xf2751ce4, 0xf8722047, 0x283e4806, 0x35b56ba7, 0x596ea71e
.word 0x4384c04d, 0x5df68a7d, 0xf94ac31c, 0x596e68dd, 0x7f3eefab, 0x8f23ffb8, 0xee560773, 0xb156d889
.word 0xbfcc83cc, 0x8889db6e, 0xddad68da, 0x773467df, 0x65efdc04, 0xeb6d81fa, 0xde90b9c9, 0x2bac50d5
.word 0x9ddd9745, 0xba555208, 0xf4a38558, 0x1725d37a, 0x88fbf61c, 0x5cc62f35, 0x3a8bdf29, 0x4edea37c
.word 0x18cfde59, 0xdb25fefc, 0xdf4f2d70, 0x2ff27964, 0x28f8a970, 0xc7481c26, 0x77a9eb53, 0x692cac99
.word 0x9f732a99, 0x5103e685, 0xd6c288cc, 0x6def3f4f, 0x7188ebe5, 0xb7300ad2, 0xb858966c, 0xe481a840
.word 0xb5f7ef41, 0x6698290d, 0x4fdd9f6a, 0x67fe697b, 0xa32d8106, 0xb0e6df3d, 0xd8aee670, 0x8ce71d32
.word 0xb8ea43f5, 0x5ce1f4e7, 0x45e01f68, 0x8a9d8769, 0x67ee5a78, 0x5b98ba3f, 0x38f0bafa, 0xeadc1c25
.word 0xe8c9ef59, 0x66e6a7c4, 0x45f9a276, 0xd35d52f1, 0x9f40bc19, 0xc4f379e4, 0xe3849405, 0xd2d75131
.word 0xd601c5e7, 0x6e12b7ce, 0x3f985091, 0xd12bba13, 0xb2bda394, 0x24169db0, 0x45fb0cf1, 0x95a430f8
.word 0xcf50c270, 0xbb91f887, 0xbc9c2dd8, 0x37377e92, 0x4c16a7e2, 0x1336c200, 0x6ccd5106, 0xd00ae649
.word 0x94df7e4b, 0x29c1f35b, 0xd9aab9a8, 0xc13360d5, 0x69f1e839, 0x08e45348, 0x45fd194a, 0xae10516a
.word 0x09157f1b, 0xed374fc5, 0x1b4fb381, 0x96c2c6c2, 0x5e13d6f5, 0x3cb7322f, 0x55793aa6, 0xb38ea9f7
.word 0x3d58173b, 0xdf71c634, 0x2472eb5a, 0x28bb6dc4, 0x7b3a7355, 0x640f6c56, 0x45bfc049, 0xd263301b
.word 0x107fea51, 0xc3a54a78, 0x2642299e, 0xa89c8db4, 0xd8ee011f, 0xcb2050ac, 0xa80b1219, 0x1734f9ca
.word 0x791d9b6e, 0x9d88c9a8, 0x1a54b9f2, 0x3cb77d9c, 0x190d0d62, 0x8bf9a985, 0xd0739225, 0x68f81b1b
.word 0x05accd3b, 0x13f15139, 0xdd6aeef0, 0xc848aa5d, 0x6da09b29, 0xb2e9f841, 0x995cca1e, 0xf80367f1
.word 0x0ee916e5, 0x16be656c, 0x59a42386, 0x0fce9d57, 0x88841eec, 0x1772d2c5, 0x17d033ae, 0x733def39
.word 0x40458e98, 0x805fad4d, 0x42698b11, 0x6c91ac58, 0xf2e8edd8, 0x5dcd0a8e, 0xab004a8c, 0x07340ed0
.word 0x61654000, 0x12b72956, 0xef4cdb60, 0x669881bf, 0x58822595, 0x91171f06, 0x3e74f5b8, 0x48f24872
.word 0x2cebf7be, 0xe4a797a3, 0x6767a9dc, 0x64789693, 0xbc855ccc, 0xad8eb2ed, 0x6a4382d0, 0xe8401291
.word 0xa3077432, 0x502b1564, 0x8554b73c, 0x1f09c2f4, 0xadae0437, 0xefb424e2, 0xde89e423, 0xca20ff1b
.word 0x509da719, 0x1acba576, 0xe65e3014, 0x10d7bb64, 0x279a913b, 0xd43b36e8, 0x279c0300, 0x7947c09f
.word 0x96fd4ab5, 0x4cc6068a, 0xbf97b221, 0x284578be, 0x4956c6ae, 0xc97c7125, 0x0458118e, 0xe1a01fd6
.word 0xb26adfa6, 0xb8f9e78a, 0xd8d360a2, 0x6ab53ba6, 0x19ee5587, 0x2fcb5510, 0xcd1cc2a6, 0xfbf653c3
.word 0xbea5b718, 0x9f7a44ff, 0x7a72c496, 0x7d40c7ea, 0x44506627, 0xf3e0387b, 0xc187862c, 0x3d3ed223
.word 0x80eb3cd5, 0x13d4609d, 0xda8a1324, 0x42e8d63a, 0xb2585fbf, 0xf82c2715, 0x0ac0551e, 0x0ee8f949
.word 0x62e58a64, 0x14f4c652, 0xdc05d846, 0x6bbcdc3c, 0x256d5125, 0xf937b825, 0xa8a01354, 0x8245d5de
.word 0xcf77956b, 0x364db7cc, 0x7dea887f, 0xfcd355ca, 0x3a063cf2, 0xf9eae979, 0x993aa66e, 0x64d6a60c
.word 0x137846e6, 0x5de7890a, 0x557f7c28, 0x46e05110, 0x324d59d0, 0x3717769a, 0x1dada16e, 0x7b83d6ed
.word 0xaf00aca1, 0x53f21dba, 0x78bfd3c7, 0x08aafdb6, 0x1f0f1134, 0x649cf65c, 0x8ed5f25d, 0xcf49e00b
.word 0xb731bf13, 0x1b72913d, 0x27aa5f46, 0xea42d1c0, 0xd4e9ed22, 0xd93da887, 0x5c717eec, 0x42cbc503
.word 0x11f0b3ad, 0xefe3b181, 0x2a29b2a0, 0x0b5aa9ce, 0x513d4598, 0xa83972a4, 0x57843197, 0xc0278048
.word 0xce702115, 0xdaa430a2, 0x7391fb01, 0xcd6269dd, 0x0a859816, 0x35ea993a, 0x5b320e2c, 0x07c1e26b
.word 0x4e5a08e2, 0x0c9950e6, 0x525d7a78, 0xa26988fb, 0x75ec0cff, 0xb8648c69, 0x4f7ee798, 0x879c9319
.word 0x939fa93e, 0x4678c441, 0x24c9cbad, 0xddf1abd9, 0x913e1eed, 0x3c8c9b49, 0xff9d58ff, 0x9bc71e9c
.word 0x7cae1ba9, 0x3420b607, 0x7e7871be, 0x5029667f, 0xceb919fd, 0x27976323, 0x6c598737, 0x16a7bc5a
.word 0xd4c0e90a, 0xa89f1eba, 0x1d16123a, 0xd338c118, 0x0eea269d, 0x60958430, 0xb10cc555, 0x8c88218e
.word 0x8b9df667, 0x687b98b3, 0x29d8409f, 0x543614b1, 0x28ce260d, 0xe56525f7, 0x32c8e50e, 0xb0ff46f7
.word 0xe0efba93, 0xffc4ecb4, 0x7561da88, 0x30241b9e, 0xc9e6cdc1, 0xcc18d8a1, 0x63b61234, 0x89499fe9
.word 0xcc89aa32, 0x90a598ba, 0xf3982654, 0xc25c5891, 0xd2ce72fd, 0xbd2ef325, 0x90264739, 0x0f1600b6
.word 0xaffc2bb7, 0x4f665739, 0x283d05d1, 0xa99ccaad, 0x27bcdeb5, 0xe15449fc, 0x37011d4b, 0x5ad538b5
.word 0x221eb382, 0xafef8685, 0x92a4d82d, 0x7ea44f8d, 0x1f39fbe4, 0xa8b00757, 0xf5c8bb53, 0xdd1b12a3
.word 0xd69de0c4, 0x7e7e9608, 0xbb7ccea5, 0x0c0ee36a, 0xc295cf9d, 0x0c87675d, 0x1c5c7d47, 0x1d934963
.word 0xc6c505fb, 0x22f8effa, 0xe9d04271, 0xb7501ddb, 0x0d9e8da0, 0xb1516f75, 0x151eec9f, 0x6dd824b1
.word 0xed1cf8b4, 0x3ac67c2c, 0x214bbf27, 0xb38fc4ce, 0x4ea444be, 0x1e7a3bf8, 0x30f60a54, 0x51442cca
.word 0x527888fc, 0xc083935d, 0xf6c292c4, 0x31e69d1f, 0x89203044, 0xcbc20d46, 0x7e146e22, 0x9d312fee
.word 0x48f1c96b, 0xe706aa9f, 0x225e288e, 0x9dd0eba3, 0xc9f96613, 0xb227fa36, 0x67088f29, 0x6277d6d4
.word 0xbb083f39, 0x8c00d7ad, 0x622cb41f, 0xa04a7873, 0xcc35d747, 0x1f67172e, 0xe9147617, 0xab6b7186
.word 0xe35d1e24, 0x618ddbaa, 0x1210eb01, 0xdc9418c3, 0x8732facd, 0xb4af2715, 0xa62a87a5, 0xcb58ede8
.word 0x391a4ec7, 0x3a2865fb, 0x302d7542, 0xda9cfcde, 0x31e507d7, 0xc7b34e7a, 0x93b861a5, 0xb43a4291
.word 0x5e337247, 0xd52881f4, 0xb1ccad64, 0xeabd5fde, 0x9a6c96d0, 0x729ec8ed, 0xfd07a40f, 0x46a8c9e8
.word 0x44f13e6c, 0x9446f2fa, 0x8e05d05e, 0xa58a2bf8, 0x7f35c0c5, 0xab4bf5e9, 0x967a8dca, 0xb8fd05f5
.word 0x37527c39, 0x1dc26cfb, 0xb4aa2e6f, 0xea9080e2, 0x3724389f, 0x62e39c07, 0x4c351487, 0x8191c325
.word 0xa94ebb28, 0xd33f30db, 0x13716bba, 0x2e87b6f9, 0x5c2f0808, 0x02c0058c, 0x818dd726, 0x8a40d6bb
.align 4;
.align 5
_user_stack_start:
.rept 4999
.4byte 0x0
.endr
_user_stack_end:
.4byte 0x0
_kernel_start: .align 12
smode_accessible_umode_program:blt        t0, a6, smode_accessible_umode_program_stack_p
smode_accessible_umode_program_stack_p:addi       sp, sp, -60
                  sw         ra, 4(sp)
                  rem        a2, t3, s5
                  c.addi     a6, 28
                  c.lui      a5, 12
                  sw         t0, 8(sp)
                  c.addi     t1, -23
                  sw         t6, 12(sp)
                  sw         s6, 16(sp)
                  sw         s9, 20(sp)
                  sw         t2, 24(sp)
                  c.srai     a4, 26
                  sw         t3, 28(sp)
                  lui        a5, 910351
                  sw         s3, 32(sp)
                  c.addi     s7, 30
                  c.addi     gp, 12
                  auipc      zero, 929484
                  c.addi     t4, 8
                  c.lui      a5, 19
                  c.addi     s5, -26
                  lui        s10, 536172
                  c.lui      s0, 11
                  slli       s7, s8, 13
                  c.lui      a6, 6
                  c.lui      t5, 29
                  divu       s8, s5, a6
                  c.lui      s1, 13
                  auipc      zero, 938847
                  auipc      zero, 235851
                  c.addi     s7, -24
                  c.slli     s4, 25
                  xori       s8, a7, 358
                  auipc      s10, 993134
                  auipc      t5, 490428
                  c.addi     s7, 27
                  auipc      s11, 380332
                  c.srai     a1, 31
                  auipc      s8, 3394
                  lui        a7, 325801
                  c.addi     gp, 13
                  auipc      s1, 40448
                  sra        a6, t0, s11
                  auipc      s4, 1039750
                  c.lui      s11, 19
                  c.addi     a0, -19
                  c.addi     a0, -29
                  c.lui      a0, 3
                  sra        s7, a4, a4
                  c.addi     s7, 15
                  xori       a3, sp, -271
                  lui        s5, 229890
                  c.bnez     s1, 35f
35:               c.addi     s0, 1
                  lui        s0, 30084
                  c.addi     s0, 30
                  bgeu       t1, s3, 46f
                  c.lui      s0, 31
                  c.addi     s5, -12
                  c.srai     a3, 9
                  c.nop
                  c.srli     a2, 21
                  lui        a3, 613503
                  c.nop
46:               c.srai     a3, 15
                  c.lui      s0, 14
                  auipc      t1, 977966
                  c.add      s0, a5
                  c.addi     s2, 5
                  sltiu      a5, s3, -373
                  c.addi     a7, 24
                  auipc      s11, 537337
                  c.nop
                  lui        s8, 407950
                  auipc      t1, 874165
                  auipc      s7, 518643
                  auipc      t4, 271591
                  or         a4, a4, s7
                  remu       a0, t0, zero
                  lui        a3, 790600
                  c.addi     t1, -8
                  c.lui      a2, 27
                  c.addi     a6, 19
                  c.add      a5, a2
                  c.addi     a0, -10
                  srli       a7, s8, 20
                  c.addi     t1, -28
                  add        s0, s9, s3
                  c.addi     t4, -10
                  c.addi     s4, -30
                  c.addi     a7, 23
                  auipc      t4, 457303
                  c.lui      s7, 27
                  c.addi     a2, -29
                  srai       a3, s2, 31
                  auipc      s4, 932984
                  slli       a4, s8, 4
                  mulhsu     a4, t6, gp
                  c.srai     s1, 20
                  c.srai     a4, 3
                  c.sub      a3, a1
                  c.xor      s1, a1
                  c.srli     s1, 25
                  c.lui      a3, 22
                  c.lui      a7, 6
                  auipc      s10, 118528
                  c.addi     a6, 1
                  lui        s10, 168058
                  c.addi     s11, 6
                  c.addi     s4, 6
                  c.addi     s5, 28
                  lui        s4, 741427
                  c.mv       t5, s7
                  auipc      s4, 768869
                  auipc      s8, 859768
                  auipc      s0, 130332
                  lui        s4, 572520
                  sra        a2, ra, sp
                  auipc      s8, 414444
                  c.and      s0, s0
                  c.slli     s7, 2
                  c.lui      s10, 19
                  c.addi     s8, 14
                  mul        a4, gp, gp
                  auipc      t5, 548137
                  sltu       s0, s1, t6
                  lui        zero, 121556
                  and        zero, zero, t0
                  andi       s5, a7, -429
                  c.srli     s1, 5
                  c.bnez     s0, 124f
                  lui        s11, 210317
                  c.addi     t1, -9
                  andi       a2, zero, 874
                  auipc      t1, 354016
                  blt        s5, t0, 128f
                  auipc      a2, 344600
                  c.or       a2, a1
                  srli       a3, a1, 26
                  c.addi     a3, 29
                  auipc      s1, 751661
                  c.addi     s5, 3
124:              lui        zero, 485109
                  c.addi     s8, -9
                  blt        t2, s11, 140f
                  c.addi     a2, -8
128:              c.addi     t4, 21
                  c.addi     s4, -23
                  c.addi     s2, -7
                  lui        s10, 861216
                  c.srai     a2, 11
                  add        s0, t6, s3
                  auipc      a2, 538329
                  c.addi     s11, -11
                  c.addi     t1, -17
                  sltiu      s8, s0, 958
                  auipc      a4, 1021421
                  lui        a1, 344812
140:              c.addi     a0, 7
                  c.lui      a4, 16
                  lui        t5, 827688
                  div        s0, zero, t4
                  c.slli     a1, 21
                  c.addi     a4, -14
                  c.srli     a1, 4
                  c.srai     s0, 21
                  and        s8, a0, s10
                  c.addi     s8, -24
                  auipc      t1, 837610
                  beq        a1, t6, 156f
                  ori        a3, t6, -688
                  c.srli     a3, 1
                  c.bnez     a1, 174f
                  c.srli     a5, 15
156:              c.addi     s11, -31
                  lui        s10, 284284
                  c.srai     a2, 25
                  mul        t1, s0, a1
                  c.li       a6, 2
                  c.srai     a5, 26
                  auipc      a3, 788847
                  c.srai     a2, 5
                  auipc      s8, 863654
                  c.addi     a0, -10
                  c.srli     a5, 9
                  c.srli     a5, 14
                  c.slli     s4, 22
                  addi       a0, a3, -713
                  c.sub      a4, a0
                  c.addi     a5, -25
                  c.srai     a2, 13
                  c.slli     s10, 3
174:              c.addi     s10, -31
                  c.lui      a3, 30
                  c.srli     a4, 31
                  srai       s8, a5, 30
                  add        t1, a3, s4
                  c.addi     a0, 20
                  c.srai     a2, 25
                  c.srli     s0, 21
                  c.lui      s8, 22
                  c.srli     s0, 3
                  auipc      a1, 335430
                  sra        s11, s3, s2
                  or         a2, a2, s3
                  auipc      s0, 902661
                  c.slli     a3, 11
                  auipc      a6, 861855
                  c.slli     t4, 8
                  sub        a3, t4, a0
                  c.mv       a3, a3
                  sltiu      a1, a4, -179
                  auipc      a0, 108760
                  c.addi     t5, -17
                  c.srli     a4, 18
                  c.srai     a1, 23
                  auipc      s0, 875273
                  c.srai     s0, 15
                  c.addi     a7, 9
                  mul        s0, a2, t6
                  c.addi     a6, 8
                  c.addi     s10, -1
                  c.addi     t4, 3
                  c.srli     a5, 28
                  bgeu       a7, t3, 216f
                  auipc      a5, 495376
                  c.addi     a3, -23
                  lui        a5, 113001
                  c.lui      a4, 31
                  lui        a3, 26434
                  nop
                  sltiu      a4, s9, -850
                  c.mv       a4, a5
                  c.srai     a0, 9
216:              sra        a7, t1, a0
                  c.lui      t4, 3
                  c.addi     a7, -31
                  auipc      s2, 966075
                  c.beqz     s0, 224f
                  c.addi     a6, -26
                  c.beqz     a5, 238f
                  c.srli     a3, 31
224:              c.add      a3, a4
                  c.addi     s2, 26
                  auipc      s1, 442326
                  lui        t5, 52611
                  auipc      s10, 253513
                  c.slli     a6, 28
                  c.srli     s0, 13
                  lui        s10, 109462
                  remu       s11, a7, t3
                  srai       s8, a1, 25
                  c.srli     a3, 16
                  c.srai     a0, 16
                  lui        s10, 949255
                  c.slli     s7, 15
238:              c.slli     a7, 15
                  auipc      a6, 895549
                  mulh       s7, gp, sp
                  c.srli     a4, 24
                  c.slli     a3, 23
                  c.srli     a5, 13
                  c.slli     a1, 24
                  c.and      a0, a2
                  c.addi     a7, 4
                  c.addi     s11, -2
                  auipc      s10, 261109
                  c.srai     a3, 9
                  lui        a1, 311770
                  lui        a4, 413736
                  c.addi     s8, -10
                  auipc      a5, 674188
                  c.lui      s0, 19
                  c.addi     s10, -3
                  c.lui      s5, 21
                  c.bnez     a4, 272f
                  c.srli     a5, 9
                  auipc      s11, 868976
                  c.addi     a2, -1
                  c.srai     a4, 10
                  c.addi     t5, 14
                  auipc      s1, 825404
                  c.addi     a5, 22
                  c.addi     s8, -23
                  c.addi     s8, -18
                  auipc      gp, 158859
                  and        a4, t2, a3
                  c.addi     t1, 27
                  c.addi     a3, -27
                  slli       s11, t3, 19
272:              auipc      s10, 210794
                  c.addi     s7, 31
                  c.addi     a3, 15
                  c.bnez     a3, 288f
                  lui        a6, 855660
                  auipc      s0, 1042924
                  c.srai     s1, 20
                  bge        t6, a6, 290f
                  c.srli     a5, 18
                  sll        t4, a4, t2
                  c.addi     a4, 15
                  c.srai     a3, 17
                  lui        s0, 94813
                  auipc      a3, 568150
                  c.lui      s10, 9
                  c.lui      s0, 2
288:              c.srli     a5, 22
                  c.addi     a1, -26
290:              c.lui      a6, 2
                  c.lui      gp, 2
                  c.addi     a7, 7
                  c.addi     s7, -6
                  c.srai     a0, 22
                  c.srli     a2, 7
                  c.addi     s10, -27
                  c.addi     a3, 18
                  c.lui      s4, 6
                  c.lui      s10, 6
                  c.srli     a2, 5
                  c.or       a3, s0
                  bne        s8, zero, 316f
                  c.lui      s2, 24
                  auipc      a7, 1016588
                  andi       a5, s0, 954
                  c.lui      t1, 4
                  auipc      a2, 318034
                  c.lui      s5, 22
                  c.addi     a6, -3
                  c.srli     a1, 5
                  c.addi     a1, -15
                  auipc      a2, 606467
                  mul        t4, a4, a2
                  auipc      s1, 394716
                  auipc      t5, 902172
316:              c.addi     t1, -7
                  auipc      a6, 983955
                  c.addi     a4, 11
                  sub        s0, t1, s8
                  sub        s4, a6, t2
                  c.srai     s0, 8
                  c.addi     s1, -21
                  c.addi     s7, 3
                  auipc      a5, 308905
                  c.lui      a0, 24
                  auipc      a1, 102251
                  c.addi     a6, -11
                  auipc      a6, 934928
                  srli       s8, t1, 16
                  c.addi     gp, -25
                  remu       a7, s3, sp
                  xori       t1, s5, -143
                  xori       s2, zero, -1017
                  slli       a1, s7, 26
                  lui        a3, 1011642
                  c.srli     a0, 3
                  c.srai     s0, 13
                  c.lui      s1, 20
                  lui        a4, 27034
                  c.srli     a3, 12
                  c.addi     a4, 11
                  remu       s4, s3, s9
                  xor        s1, s5, s5
                  c.mv       s11, t3
                  auipc      t4, 488835
                  c.addi     s2, 17
                  c.addi     a1, -8
                  c.srli     a1, 13
                  auipc      s2, 637632
                  c.addi     a6, 16
                  c.srai     s0, 17
                  c.sub      a4, a1
                  c.addi     a6, -10
                  c.srai     s0, 31
                  lui        a0, 16522
                  or         a5, a0, s0
                  c.srai     a3, 3
                  c.slli     s10, 26
                  bne        a3, s2, 368f
                  c.and      a5, a3
                  c.srli     a2, 16
                  c.addi     gp, 26
                  c.addi     a3, -7
                  sltu       t1, s6, s11
                  c.srli     a4, 12
                  c.srli     a2, 16
                  auipc      s1, 391346
368:              and        t5, gp, a5
                  c.addi     s1, 31
                  auipc      a4, 356831
                  c.slli     s0, 14
                  c.srli     a4, 27
                  c.srai     a1, 23
                  lui        s5, 58601
                  c.lui      s10, 19
                  c.slli     t4, 15
                  c.lui      a7, 12
                  c.addi     a6, 8
                  c.srai     a3, 30
                  lui        s5, 461867
                  auipc      s4, 724242
                  c.srli     a4, 16
                  lui        a0, 950404
                  c.xor      a3, a3
                  add        a4, tp, s7
                  c.srai     a4, 21
                  c.addi     a3, 3
                  beq        a3, s3, 396f
                  c.addi     s1, 25
                  fence
                  c.lui      a1, 29
                  c.addi     s11, -21
                  lui        a6, 476335
                  c.srai     a0, 22
                  c.addi     a7, 16
396:              blt        s0, s6, 399f
                  ori        t4, s0, 893
                  c.addi     s0, -2
399:              slti       t1, a5, 516
                  lw         ra, 4(sp)
                  c.and      a4, s0
                  auipc      a0, 9097
                  lw         t0, 8(sp)
                  lw         t6, 12(sp)
                  lw         s6, 16(sp)
                  lw         s9, 20(sp)
                  auipc      s10, 284394
                  lw         t2, 24(sp)
                  lw         t3, 28(sp)
                  lw         s3, 32(sp)
                  c.addi     gp, 15
                  c.addi     s5, -3
                  addi       sp, sp, 60
                  xor        a1, s8, s5
                  lui        s4, 905728
                  c.addi     s11, -19
436:              ret
smode_program:    sub        a1, s11, s3
                  addi       sp, sp, -64
                  sw         ra, 4(sp)
                  c.addi     a4, -16
                  sw         t0, 8(sp)
                  c.addi     s8, 8
                  sw         t6, 12(sp)
                  sw         s6, 16(sp)
                  c.addi     s8, -11
                  c.add      a5, a1
                  sw         s9, 20(sp)
                  c.srli     a4, 13
                  sw         t2, 24(sp)
                  sw         t3, 28(sp)
                  sw         s3, 32(sp)
                  c.srli     a1, 1
                  c.srli     a2, 23
                  c.addi     a3, 24
                  auipc      s2, 97928
                  c.srli     a2, 28
                  lui        zero, 868721
                  c.addi     s8, -29
                  c.srai     a2, 12
                  c.addi     s7, 1
                  auipc      zero, 995338
                  auipc      a3, 626991
                  c.addi     t5, -2
                  sub        s0, t6, a1
                  c.addi     s7, -12
                  c.lui      s10, 6
                  xori       a1, t1, 301
                  lui        gp, 764450
                  lui        a7, 653896
                  c.slli     a2, 20
                  c.addi     s7, -30
                  lui        a6, 255664
                  c.addi     s8, -29
                  c.beqz     a0, 26f
                  c.li       s5, -11
                  auipc      s0, 798490
                  c.addi     a7, 27
                  andi       s0, gp, -869
                  c.addi     a1, -6
                  lui        a0, 748947
                  c.srli     a3, 24
26:               sltiu      s5, a6, -678
                  addi       a4, a0, 235
                  lui        s5, 564398
                  c.srli     a4, 25
                  xor        s4, t6, tp
                  and        s1, s7, zero
                  mulhsu     s1, s6, s11
                  xori       a0, s10, -120
                  c.lui      a3, 29
                  c.addi     a6, -16
                  c.addi     a1, 28
                  lui        s4, 807129
                  c.addi     t1, -27
                  c.addi     gp, 1
                  c.addi     s5, 15
                  auipc      a2, 251883
                  c.srai     s0, 14
                  slti       a0, t1, 77
                  ori        a4, a0, 532
                  bge        sp, s11, 55f
                  c.addi     s11, 22
                  c.slli     s10, 21
                  lui        a6, 268976
                  slli       a5, ra, 11
                  c.slli     s1, 31
                  c.addi     s8, -2
                  srai       a3, a2, 27
                  c.addi     a4, 8
                  c.addi     gp, 10
55:               c.addi     a4, -6
                  lui        s5, 975522
                  c.addi     a5, -4
                  c.addi     t4, -28
                  auipc      a3, 210036
                  c.sub      a5, s1
                  c.srli     a5, 20
                  c.li       s1, 28
                  slt        s10, a6, gp
                  c.addi     a7, -10
                  auipc      s4, 787553
                  auipc      s10, 523808
                  c.addi     s2, 18
                  mulhu      t5, s8, zero
                  c.slli     s4, 19
                  c.addi     s10, -2
                  auipc      s8, 126230
                  auipc      t5, 203265
                  auipc      t5, 526897
                  c.srli     a0, 28
                  c.addi     a6, -10
                  bge        s9, s11, 81f
                  auipc      zero, 176625
                  c.addi     a4, -9
                  mulhu      t1, zero, a0
                  c.addi     t5, -23
81:               c.lui      s1, 15
                  slt        t4, tp, s8
                  c.lui      t5, 5
                  c.bnez     s0, 98f
                  sltiu      s2, t4, -312
                  lui        s11, 658307
                  lui        t5, 749601
                  xor        gp, s3, a4
                  c.lui      a7, 19
                  beq        a1, s10, 91f
91:               c.addi     a1, -28
                  c.slli     t1, 15
                  auipc      a4, 980420
                  lui        a5, 37380
                  lui        a6, 411367
                  auipc      s0, 131997
                  bge        s4, t0, 114f
98:               remu       a6, t4, a7
                  c.add      a4, a3
                  c.addi     a2, 22
                  c.lui      a6, 17
                  auipc      zero, 269149
                  c.lui      a6, 9
                  c.addi     a2, -12
                  c.srli     a3, 21
                  c.slli     s4, 10
                  c.addi     a2, 8
                  c.slli     s4, 26
                  c.addi     a2, 26
                  auipc      a7, 940049
                  c.srli     a1, 4
                  sltu       a5, s5, tp
                  c.addi     s10, -3
114:              c.bnez     s1, 119f
                  c.srai     a3, 6
                  auipc      s10, 423146
                  c.addi     s2, 30
                  c.addi     t5, 10
119:              sub        s2, sp, gp
                  c.srai     a0, 14
                  c.andi     a3, -17
                  lui        a5, 481806
                  c.lui      a3, 4
                  c.addi     s11, -16
                  c.slli     a7, 2
                  lui        a2, 855143
                  c.addi     a6, -12
                  c.addi     t5, 16
                  auipc      s10, 943393
                  c.addi     a1, 15
                  lui        s1, 1045720
                  c.addi     s7, 19
                  c.addi     gp, -10
                  c.addi     s5, 23
                  sltiu      s10, t6, -993
                  c.addi     a2, -30
                  lui        t4, 341446
                  c.addi     a6, 25
                  lui        a4, 708869
                  c.addi     a6, -28
                  sll        zero, a0, s3
                  c.addi     a2, 26
                  lui        a7, 200545
                  lui        a7, 491431
                  c.addi     gp, -8
                  c.srai     a0, 23
                  lui        a0, 744805
                  lui        s4, 118642
                  auipc      s4, 417521
                  c.addi     s10, 22
                  auipc      zero, 1000129
                  c.addi     gp, -19
                  lui        a3, 1026299
                  c.srli     s0, 9
                  c.and      s0, s1
                  c.srai     a5, 20
                  auipc      s8, 645440
                  fence
                  c.addi     s4, 10
                  xor        s0, a5, a5
                  auipc      s10, 686962
                  xori       t1, s3, 678
                  c.addi     s11, -32
                  sub        gp, s0, s10
                  divu       s11, t4, t6
                  lui        s7, 401175
                  c.addi     s8, 31
                  nop
                  c.lui      s8, 7
                  or         a0, s0, t4
                  c.lui      a5, 31
                  lui        s8, 378367
                  c.mv       a0, a1
                  lui        s4, 267497
                  rem        a6, s1, t1
                  mulhu      a4, s5, a2
                  lui        s5, 508479
                  srli       s10, s10, 17
                  c.addi     s0, -14
                  c.lui      a0, 2
                  c.srli     a2, 3
                  sltu       a4, s7, s3
                  c.srli     a1, 1
                  c.addi     s2, 10
                  auipc      s7, 765114
                  c.xor      a1, s0
                  c.lui      s11, 12
                  lui        a4, 805046
                  c.addi     t5, -3
                  c.lui      s8, 23
                  c.addi     gp, 20
                  c.addi     a5, -12
                  c.slli     s8, 27
                  c.slli     t1, 16
                  auipc      a3, 18233
                  lui        s5, 984456
                  c.srli     a4, 18
                  beq        a1, t2, 199f
199:              lui        s1, 66190
                  c.addi     a7, 24
                  c.srli     a3, 8
                  c.addi     a5, -24
                  lui        a4, 707868
                  lui        a0, 445840
                  lui        a7, 321060
                  c.slli     a6, 22
                  lui        a1, 898432
                  c.srli     a4, 9
                  mulh       s11, a7, ra
                  auipc      a5, 674349
                  xor        s0, t1, s5
                  c.srai     a1, 3
                  c.addi     s0, 19
                  c.addi     a6, 11
                  c.addi     a6, 13
                  c.lui      a7, 17
                  bltu       t4, a3, 235f
                  auipc      a3, 64524
                  c.addi     s5, -32
                  c.addi     s1, -6
                  c.addi     a6, 28
                  auipc      a2, 433664
                  c.and      s1, a4
                  c.addi     s4, 8
                  lui        s8, 37782
                  auipc      t1, 1039566
                  c.srai     a3, 24
                  lui        a1, 547699
                  c.addi     a1, -23
                  auipc      a7, 526023
                  c.srai     a2, 31
                  xori       a4, s4, -770
                  c.srai     a0, 24
                  lui        s8, 57337
235:              srai       s10, t3, 18
                  div        t4, s3, tp
                  auipc      a5, 339763
                  mul        a2, t0, s9
                  lui        s11, 569855
                  lui        t1, 287101
                  lui        s10, 302948
                  c.nop
                  lui        a7, 313927
                  c.addi     t1, 4
                  auipc      t5, 36507
                  c.addi     a0, 29
                  auipc      a7, 849623
                  mul        zero, s8, t4
                  auipc      s8, 703600
                  lui        s1, 64813
                  c.addi     a3, -17
                  c.srai     s1, 25
                  c.addi     a6, -30
                  lui        a6, 502677
                  c.addi     s11, -1
                  divu       t5, ra, a3
                  c.srli     a3, 28
                  sltiu      s1, sp, 999
                  c.mv       s2, ra
                  nop
                  mul        a2, t5, s7
                  auipc      s2, 109518
                  c.srli     a3, 22
                  fence
                  c.lui      s8, 29
                  c.addi     a7, 1
                  c.srli     a2, 18
                  lui        a5, 109163
                  c.srli     a2, 3
                  c.slli     s1, 12
                  mul        a4, t0, t4
                  c.addi     s0, 18
                  c.srai     a2, 1
                  auipc      zero, 534427
                  c.addi     s5, -15
                  c.addi     a7, 15
                  lui        zero, 491639
                  auipc      s8, 416597
                  c.lui      s8, 25
                  and        t1, s10, s11
                  lui        s8, 243440
                  c.lui      a6, 11
                  c.nop
                  lui        a7, 188173
                  add        a4, s1, t1
                  c.slli     s5, 1
                  c.addi     t1, 5
                  andi       a7, t6, -67
                  c.li       a0, -15
                  nop
                  lui        s2, 291672
                  c.addi     gp, -20
                  c.lui      s7, 5
                  c.slli     t1, 21
                  auipc      a2, 601900
                  bge        a7, t4, 301f
                  lui        t1, 268162
                  c.lui      t1, 21
                  c.addi     a4, -30
                  c.srli     a1, 11
301:              c.slli     a1, 31
                  c.slli     a6, 5
                  c.slli     s0, 10
                  auipc      s11, 666956
                  auipc      a0, 521581
                  lui        a3, 35670
                  c.slli     s2, 11
                  blt        a5, zero, 326f
                  auipc      a6, 989407
                  c.addi     t1, -11
                  c.slli     a2, 4
                  c.lui      a7, 5
                  lui        a0, 917214
                  c.lui      s11, 25
                  sra        t4, s9, t0
                  rem        s10, a6, a5
                  nop
                  c.addi     a5, 11
                  auipc      s10, 701592
                  c.addi     s11, 17
                  mulhu      a0, tp, a4
                  lui        a4, 704484
                  c.addi     a7, 29
                  auipc      gp, 388807
                  lui        a1, 930631
326:              add        s8, t5, ra
                  lui        a4, 400909
                  c.and      a3, a4
                  lui        s8, 506615
                  auipc      s2, 316738
                  lui        a7, 560639
                  c.lui      s7, 18
                  c.srli     a5, 8
                  blt        s6, s11, 349f
                  c.slli     a1, 2
                  c.addi     a2, 21
                  add        a0, t3, a1
                  c.lui      s2, 24
                  c.addi     a4, -14
                  xor        t5, a0, a5
                  auipc      s2, 768277
                  c.add      a5, a4
                  c.addi     s2, -17
                  c.lui      t5, 26
                  lui        s2, 26354
                  c.addi     a0, 4
                  lui        s5, 184127
                  c.srli     s1, 13
349:              srl        a3, t3, a5
                  xori       t1, a2, 1014
                  c.addi     s0, 17
                  auipc      gp, 620915
                  andi       a2, s8, 944
                  c.slli     s0, 9
                  bgeu       a6, a4, 364f
                  mulh       a0, t2, t4
                  auipc      s11, 993798
                  c.addi     s4, -2
                  c.addi     a5, -20
                  remu       a1, t6, t2
                  c.srli     a3, 20
                  c.slli     s11, 29
                  remu       a4, s1, a3
364:              c.addi     gp, -27
                  rem        t4, s9, s4
                  auipc      s2, 539025
                  c.srai     a0, 23
                  c.addi     a6, 7
                  c.srli     a4, 12
                  c.addi     gp, 6
                  and        s8, sp, a3
                  c.srai     a3, 18
                  c.slli     t5, 12
                  auipc      a7, 96564
                  c.li       a6, 9
                  c.addi     a5, 22
                  c.addi     s4, 24
                  lui        s4, 794819
                  c.add      a4, s0
                  c.addi     s2, 31
                  c.addi     s11, 12
                  c.addi     s11, -29
                  lui        a7, 473096
                  c.addi     s2, -16
                  c.srli     s0, 13
                  c.addi     s7, -32
                  mul        a7, t6, a6
                  c.srli     a2, 20
                  c.addi     s0, 1
                  lui        t1, 79302
                  c.addi     a1, -28
                  auipc      s4, 475933
                  c.addi     a4, 29
                  andi       s0, t2, -809
                  c.addi     s7, 5
                  c.addi     a3, -1
                  auipc      s2, 576734
                  c.addi     s4, 19
                  c.srli     s0, 22
                  lw         ra, 4(sp)
                  lw         t0, 8(sp)
                  lw         t6, 12(sp)
                  auipc      s1, 732577
                  lw         s6, 16(sp)
                  lw         s9, 20(sp)
                  lw         t2, 24(sp)
                  lw         t3, 28(sp)
                  c.addi     a0, 1
                  lw         s3, 32(sp)
                  addi       sp, sp, 64
                  c.addi     a6, 20
431:              ret
smode_ls_umem_program:addi       sp, sp, -64
                  sw         ra, 4(sp)
                  auipc      s2, 467729
                  sw         t0, 8(sp)
                  sw         t6, 12(sp)
                  sw         s6, 16(sp)
                  sltu       s2, a0, t4
                  c.addi     t4, -30
                  sw         s9, 20(sp)
                  sw         t2, 24(sp)
                  c.addi     s5, -31
                  sw         t3, 28(sp)
                  sw         s3, 32(sp)
                  sltiu      t4, ra, -871
                  c.addi     s5, 28
                  mulhsu     a6, tp, a6
                  sub        a0, a2, sp
                  lui        s5, 329953
                  beq        sp, tp, 6f
                  auipc      a6, 400987
6:                c.and      a0, a5
                  c.addi     a7, -16
                  bgeu       s2, t3, 12f
                  lui        a1, 733047
                  c.srai     a2, 31
                  c.addi     s8, -2
12:               c.addi     s0, -15
                  c.addi     a4, 19
                  bgeu       a1, t5, 26f
                  mulh       s2, t6, a6
                  nop
                  lui        a3, 553945
                  c.addi     a0, 1
                  lui        s2, 244505
                  lui        s4, 357955
                  c.addi     a5, -19
                  c.slli     t5, 6
                  c.lui      gp, 25
                  c.addi     s2, 5
                  c.slli     s2, 17
26:               lui        s10, 464655
                  c.addi     s10, 27
                  lui        a3, 114765
                  c.slli     t5, 22
                  c.addi     s0, -9
                  c.mv       gp, s2
                  c.addi     a3, 24
                  c.addi     s10, -20
                  xor        a7, s9, zero
                  c.addi     a6, 4
                  c.srli     a4, 26
                  c.slli     s4, 29
                  c.lui      a5, 24
                  c.srli     a5, 29
                  lui        gp, 842131
                  c.addi     s5, 14
                  mulhsu     s2, a3, gp
                  slti       t4, s5, -332
                  auipc      a5, 310014
                  andi       s2, a7, 866
                  c.addi     a5, 5
                  bge        a3, a7, 57f
                  auipc      s4, 328123
                  c.addi     t4, 1
                  c.lui      a2, 21
                  auipc      gp, 273608
                  c.addi     a1, 7
                  c.lui      s0, 16
                  c.addi     a7, -26
                  c.addi     a2, -12
                  c.srai     a1, 15
57:               auipc      t5, 381508
                  c.srai     a5, 6
                  c.srli     a2, 9
                  slti       a5, a5, 160
                  c.slli     s0, 28
                  c.addi     t4, -5
                  auipc      s5, 740313
                  sra        t5, s7, gp
                  c.addi     a6, -21
                  c.addi     a0, 23
                  mul        s11, a4, s9
                  c.srai     a0, 1
                  add        s7, gp, s0
                  lui        s1, 812995
                  c.addi     gp, -6
                  c.addi     t5, 21
                  c.addi     s2, 4
                  auipc      a7, 1037385
                  lui        s5, 977287
                  c.addi     a4, -17
                  c.add      a0, s0
                  c.srai     a1, 8
                  c.addi     s4, 2
                  c.addi     s2, 6
                  c.addi     s1, 28
                  c.srai     a4, 31
                  c.addi     a0, -3
                  bne        ra, s10, 100f
                  lui        s7, 460416
                  auipc      s1, 198619
                  c.addi     s7, -22
                  c.li       s8, 29
                  xor        s2, s2, t4
                  c.lui      a1, 4
                  auipc      a0, 262432
                  c.addi     t4, 13
                  lui        s0, 133767
                  blt        s9, t1, 111f
                  lui        a1, 302076
                  c.addi     a7, -1
                  c.addi     gp, -6
                  c.addi     s10, -27
                  lui        s11, 558963
100:              bne        s8, tp, 117f
                  c.addi     s4, -5
                  auipc      a3, 220884
                  mulh       a5, s9, s3
                  c.srli     a3, 22
                  c.addi     gp, -11
                  c.add      s1, a5
                  lui        s5, 355677
                  auipc      a4, 982016
                  bltu       sp, s11, 125f
                  c.addi     s10, -13
111:              auipc      s5, 892152
                  c.addi     a1, -24
                  sll        s11, zero, t0
                  c.add      a2, a5
                  c.li       a3, -23
                  lui        a3, 386540
117:              c.add      a1, a1
                  c.srli     s1, 30
                  xori       a2, a6, 65
                  fence
                  c.srai     s0, 18
                  lui        s4, 232770
                  c.addi     t1, -32
                  lui        t5, 322494
125:              rem        s7, t5, s2
                  c.srli     a5, 20
                  c.lui      a4, 14
                  c.lui      a0, 13
                  beq        s5, s0, 144f
                  lui        zero, 24199
                  c.addi     s1, 20
                  c.srai     s0, 5
                  lui        t5, 474084
                  auipc      a7, 104700
                  c.srai     a0, 5
                  c.lui      t4, 29
                  lui        t1, 373887
                  xor        a0, s5, s5
                  lui        a0, 37524
                  c.addi     a4, 12
                  lui        a4, 999745
                  c.addi     s4, 27
                  lui        s5, 754019
144:              rem        zero, s0, zero
                  ori        s8, gp, -487
                  sub        a2, s11, a4
                  auipc      s8, 981618
                  auipc      s1, 973813
                  c.nop
                  lui        t4, 605189
                  c.addi     s8, 31
                  c.addi     s5, 25
                  c.slli     s10, 23
                  c.addi     s11, 3
                  c.slli     a1, 3
                  c.slli     s10, 22
                  auipc      t1, 565180
                  lui        a4, 914815
                  c.xor      s1, a3
                  c.addi     a0, -24
                  srai       a7, t6, 16
                  srai       s7, t6, 24
                  c.addi     a1, 31
                  c.addi     t4, -1
                  divu       s5, t6, t1
                  c.srli     a4, 19
                  nop
                  auipc      a1, 905948
                  lui        a4, 820013
                  c.srai     a0, 19
                  c.srai     a4, 3
                  c.addi     s5, -24
                  c.addi     s10, -15
                  c.addi     s4, 19
                  c.addi     a5, 25
                  lui        s2, 795349
                  auipc      t4, 275771
                  auipc      a4, 449159
                  auipc      a3, 859194
                  c.slli     s10, 5
                  lui        s2, 312761
                  lui        s11, 906803
                  c.addi     s11, -24
                  lui        t1, 799592
                  c.addi     a3, -8
                  or         t4, t5, a2
                  xori       s1, s1, -173
                  sra        s2, s1, s3
                  nop
                  c.xor      a5, a2
                  c.addi     s0, 10
                  lui        a7, 323791
                  c.and      a5, s1
                  c.addi     s2, -13
                  auipc      a7, 150551
                  auipc      a6, 772719
                  nop
                  auipc      a1, 47803
                  mul        s8, s9, s8
                  c.addi     t5, -32
                  c.lui      a6, 27
                  c.and      s0, a0
                  c.addi     s5, -13
                  c.nop
                  slt        s0, s2, ra
                  lui        s11, 699883
                  c.addi     t1, -2
                  c.srli     s1, 5
                  lui        a0, 371228
                  lui        s2, 482903
                  sub        a4, s7, a4
                  auipc      a4, 832011
                  fence
                  auipc      gp, 205748
                  or         t5, t5, s1
                  auipc      s7, 975335
                  sltiu      s11, t1, -615
                  c.addi     s7, -31
                  c.addi     s10, -23
                  c.slli     a3, 30
                  c.srai     a1, 19
                  c.addi     a0, -7
                  auipc      s1, 686399
                  c.srli     a4, 22
                  lui        gp, 941529
                  rem        s1, s1, a0
                  c.srai     a2, 2
                  c.lui      s10, 22
                  lui        s1, 1017286
                  c.srai     a0, 19
                  c.lui      s1, 17
                  c.li       gp, -19
                  c.srai     s0, 18
                  c.beqz     a5, 247f
                  beq        a1, s2, 254f
                  divu       a6, t1, s7
                  c.addi     gp, -1
                  auipc      a7, 436093
                  c.addi     a3, 6
                  c.lui      t5, 31
                  lui        s4, 247969
                  auipc      a0, 466232
                  auipc      s0, 158791
                  c.addi     s2, -13
                  c.srli     a0, 5
                  bltu       s5, sp, 250f
247:              c.srai     a3, 23
                  fence
                  c.addi     s1, 30
250:              auipc      a2, 724575
                  sub        s0, t2, s11
                  c.slli     s10, 24
                  c.srai     a4, 5
254:              lui        s1, 582028
                  c.addi     a1, 6
                  c.bnez     s0, 259f
                  c.slli     s10, 17
                  addi       a1, t0, 612
259:              and        a4, t2, s11
                  c.addi     a3, 4
                  auipc      zero, 419754
                  c.bnez     a3, 272f
                  c.addi     a5, 6
                  c.lui      gp, 11
                  remu       s10, s10, a5
                  lui        s11, 954240
                  xor        s11, a5, t6
                  c.mv       s5, tp
                  c.srli     a5, 8
                  c.addi     s11, -10
                  lui        a5, 425070
272:              mulhsu     a0, t6, s9
                  lui        a6, 590993
                  auipc      a0, 942891
                  c.mv       t1, a4
                  c.addi     s4, 24
                  c.beqz     a3, 294f
                  auipc      a4, 511642
                  c.addi     s8, 26
                  c.lui      a3, 9
                  c.lui      s11, 2
                  c.addi     a5, 28
                  sub        t1, a3, t2
                  lui        s0, 711960
                  lui        t4, 719042
                  c.srai     a0, 10
                  lui        gp, 14961
                  c.addi     a7, -23
                  c.addi     a5, 8
                  c.beqz     a5, 305f
                  blt        t0, s10, 306f
                  c.addi     s5, -23
                  c.addi     t4, 16
294:              or         s0, s10, a6
                  lui        t5, 60448
                  auipc      gp, 416177
                  auipc      s7, 474706
                  lui        a2, 1039065
                  c.addi     a4, -23
                  c.addi     s7, -8
                  c.srli     s1, 26
                  auipc      t5, 776334
                  lui        s1, 668077
                  c.srai     a5, 26
305:              c.lui      s7, 13
306:              auipc      a4, 590125
                  c.or       a2, a0
                  c.addi     a4, 5
                  auipc      a2, 730704
                  c.li       s8, 27
                  lui        s8, 322568
                  c.srai     a4, 25
                  lui        s5, 907162
                  c.addi     s2, -7
                  c.slli     t5, 24
                  c.slli     s0, 25
                  c.srai     a4, 15
                  auipc      a3, 999079
                  auipc      s5, 729076
                  c.slli     s10, 16
                  c.slli     a6, 16
                  c.addi     t4, 27
                  srl        gp, s3, s9
                  c.addi     a3, 28
                  c.addi     s5, 24
                  c.srai     a0, 15
                  c.lui      a3, 25
                  c.srli     a5, 18
                  c.addi     a2, -27
                  lui        s4, 837288
                  auipc      s8, 639627
                  c.addi     s11, -29
                  lui        s1, 785897
                  mul        t1, t3, a0
                  c.srli     a1, 21
                  rem        a7, s3, s11
                  c.addi     a1, 22
                  c.srai     s0, 29
                  lui        gp, 563182
                  bne        gp, a7, 357f
                  c.addi     a0, 11
                  lui        a6, 267311
                  c.addi     s1, 30
                  lui        t1, 396721
                  sub        s0, sp, gp
                  c.addi     a7, -29
                  lui        a6, 10743
                  c.li       s2, -3
                  c.srli     a4, 17
                  c.addi     t4, 15
                  c.srli     s1, 8
                  lui        a5, 824454
                  c.addi     s0, 10
                  srai       a4, t6, 23
                  c.srli     a1, 3
                  c.addi     t5, 10
357:              lui        a6, 10411
                  lui        s5, 502417
                  c.addi     t5, -8
                  c.addi     a3, -10
                  lui        a3, 290395
                  xori       s11, sp, -12
                  auipc      gp, 533599
                  c.addi     a6, 6
                  c.addi     a4, 15
                  c.srai     a2, 1
                  auipc      t5, 520528
                  c.addi     s0, 19
                  c.lui      a6, 16
                  c.slli     s2, 8
                  c.slli     s10, 3
                  c.addi     s2, -20
                  c.addi     s7, -1
                  lui        s10, 647469
                  auipc      a7, 829202
                  c.slli     s10, 23
                  c.addi     t4, 22
                  lui        s0, 1018447
                  c.addi     s10, 28
                  c.sub      a4, a1
                  c.srli     a2, 1
                  c.or       a0, a0
                  remu       s5, s6, zero
                  c.addi     s4, -18
                  c.li       a4, -20
                  c.addi     a6, -18
                  c.addi     a1, 19
                  bne        a6, a4, 390f
                  c.addi     gp, -32
390:              lui        s5, 306412
                  c.srli     s0, 17
                  c.srli     a4, 16
                  c.addi     a1, -22
                  c.sub      a0, a3
                  c.slli     t4, 3
                  c.andi     a3, -19
                  addi       s11, s10, 425
                  c.lui      s1, 30
                  c.srli     a2, 26
                  lw         ra, 4(sp)
                  lui        t5, 620754
                  c.slli     s0, 26
                  c.sub      a0, s0
                  auipc      s0, 939678
                  c.addi     t1, -29
                  lw         t0, 8(sp)
                  lw         t6, 12(sp)
                  srai       a7, a4, 30
                  lw         s6, 16(sp)
                  lw         s9, 20(sp)
                  auipc      a3, 819240
                  lw         t2, 24(sp)
                  lw         t3, 28(sp)
                  auipc      t4, 623258
                  lw         s3, 32(sp)
                  addi       sp, sp, 64
                  slt        a5, a5, a3
                  mulhsu     s4, a7, s11
433:              ret
.align 12
mtvec_handler:    
                  1: addi sp, sp, -128
                  sw  x0, 0(sp)
                  sw  x1, 4(sp)
                  sw  x2, 8(sp)
                  sw  x3, 12(sp)
                  sw  x4, 16(sp)
                  sw  x5, 20(sp)
                  sw  x6, 24(sp)
                  sw  x7, 28(sp)
                  sw  x8, 32(sp)
                  sw  x9, 36(sp)
                  sw  x10, 40(sp)
                  sw  x11, 44(sp)
                  sw  x12, 48(sp)
                  sw  x13, 52(sp)
                  sw  x14, 56(sp)
                  sw  x15, 60(sp)
                  sw  x16, 64(sp)
                  sw  x17, 68(sp)
                  sw  x18, 72(sp)
                  sw  x19, 76(sp)
                  sw  x20, 80(sp)
                  sw  x21, 84(sp)
                  sw  x22, 88(sp)
                  sw  x23, 92(sp)
                  sw  x24, 96(sp)
                  sw  x25, 100(sp)
                  sw  x26, 104(sp)
                  sw  x27, 108(sp)
                  sw  x28, 112(sp)
                  sw  x29, 116(sp)
                  sw  x30, 120(sp)
                  sw  x31, 124(sp)
                  csrr a1, 0x342 # MCAUSE
                  srli a1, a1, 31
                  bne a1, x0, mmode_intr_handler
                  csrr a1, 0x342 # MCAUSE
                  csrr x31, 0x341 # MEPC
                  csrr x29, 0x300 # MSTATUS
                  li a2, 0x8 # ECALL_UMODE
                  beq a1, a2, ecall_handler
                  li a2, 0x9 # ECALL_SMODE
                  beq a1, a2, ecall_handler
                  li a2, 0xb # ECALL_MMODE
                  beq a1, a2, ecall_handler
                  li a2, 0x1
                  beq a1, a2, pt_fault_handler
                  li a2, 0x5
                  beq a1, a2, pt_fault_handler
                  li a2, 0x7
                  beq a1, a2, pt_fault_handler
                  li a2, 0xc
                  beq a1, a2, pt_fault_handler
                  li a2, 0xd
                  beq a1, a2, pt_fault_handler
                  li a2, 0xf
                  beq a1, a2, pt_fault_handler
                  li a2, 0x2 # ILLEGAL_INSTRUCTION
                  beq a1, a2, illegal_instr_handler
                  csrr x30, 0x343 # MTVAL
                  1: jal x1, test_done 

ecall_handler:    
                  la x9, _start
                  sw x0, 0(x9)
                  sw x1, 4(x9)
                  sw x2, 8(x9)
                  sw x3, 12(x9)
                  sw x4, 16(x9)
                  sw x5, 20(x9)
                  sw x6, 24(x9)
                  sw x7, 28(x9)
                  sw x8, 32(x9)
                  sw x9, 36(x9)
                  sw x10, 40(x9)
                  sw x11, 44(x9)
                  sw x12, 48(x9)
                  sw x13, 52(x9)
                  sw x14, 56(x9)
                  sw x15, 60(x9)
                  sw x16, 64(x9)
                  sw x17, 68(x9)
                  sw x18, 72(x9)
                  sw x19, 76(x9)
                  sw x20, 80(x9)
                  sw x21, 84(x9)
                  sw x22, 88(x9)
                  sw x23, 92(x9)
                  sw x24, 96(x9)
                  sw x25, 100(x9)
                  sw x26, 104(x9)
                  sw x27, 108(x9)
                  sw x28, 112(x9)
                  sw x29, 116(x9)
                  sw x30, 120(x9)
                  sw x31, 124(x9)
                  j write_tohost
illegal_instr_handler:
                  csrr  x31, mepc
                  addi  x31, x31, 4
                  csrw  mepc, x31
                  lw  x0, 0(sp)
                  lw  x1, 4(sp)
                  lw  x2, 8(sp)
                  lw  x3, 12(sp)
                  lw  x4, 16(sp)
                  lw  x5, 20(sp)
                  lw  x6, 24(sp)
                  lw  x7, 28(sp)
                  lw  x8, 32(sp)
                  lw  x9, 36(sp)
                  lw  x10, 40(sp)
                  lw  x11, 44(sp)
                  lw  x12, 48(sp)
                  lw  x13, 52(sp)
                  lw  x14, 56(sp)
                  lw  x15, 60(sp)
                  lw  x16, 64(sp)
                  lw  x17, 68(sp)
                  lw  x18, 72(sp)
                  lw  x19, 76(sp)
                  lw  x20, 80(sp)
                  lw  x21, 84(sp)
                  lw  x22, 88(sp)
                  lw  x23, 92(sp)
                  lw  x24, 96(sp)
                  lw  x25, 100(sp)
                  lw  x26, 104(sp)
                  lw  x27, 108(sp)
                  lw  x28, 112(sp)
                  lw  x29, 116(sp)
                  lw  x30, 120(sp)
                  lw  x31, 124(sp)
                  addi sp, sp, 128
                  mret

pt_fault_handler: 
                  nop

.align 12
mmode_intr_handler:
                  csrr  a1, 0x300 # MSTATUS;
                  csrr  a1, 0x304 # MIE;
                  csrr  a1, 0x344 # MIP;
                  csrrc a1, 0x344, a1 # MIP;
                  lw  x0, 0(sp)
                  lw  x1, 4(sp)
                  lw  x2, 8(sp)
                  lw  x3, 12(sp)
                  lw  x4, 16(sp)
                  lw  x5, 20(sp)
                  lw  x6, 24(sp)
                  lw  x7, 28(sp)
                  lw  x8, 32(sp)
                  lw  x9, 36(sp)
                  lw  x10, 40(sp)
                  lw  x11, 44(sp)
                  lw  x12, 48(sp)
                  lw  x13, 52(sp)
                  lw  x14, 56(sp)
                  lw  x15, 60(sp)
                  lw  x16, 64(sp)
                  lw  x17, 68(sp)
                  lw  x18, 72(sp)
                  lw  x19, 76(sp)
                  lw  x20, 80(sp)
                  lw  x21, 84(sp)
                  lw  x22, 88(sp)
                  lw  x23, 92(sp)
                  lw  x24, 96(sp)
                  lw  x25, 100(sp)
                  lw  x26, 104(sp)
                  lw  x27, 108(sp)
                  lw  x28, 112(sp)
                  lw  x29, 116(sp)
                  lw  x30, 120(sp)
                  lw  x31, 124(sp)
                  addi sp, sp, 128
                  mret;

.data
.align 4;
kernel_data_page_0:
.align 12
.word 0x161d4dd1, 0xfe46dece, 0xf73f2d44, 0xbdff4d13, 0x3333eb85, 0xee85c85d, 0xafd58c44, 0x06970902
.word 0x35e1a827, 0xd425fe4b, 0x48daff7e, 0xbaf67e4d, 0xac64a699, 0x472ce7c0, 0xddf0fc25, 0x29a622a0
.word 0xef4f50ae, 0x7c0fa985, 0x16e8f656, 0xa1e0112c, 0xd205750b, 0x3d61f73d, 0x8952fdda, 0x83e43c16
.word 0x00049366, 0x8bb7dcb6, 0xbd531c2d, 0x144dda0f, 0xee354a83, 0xbcae1fb2, 0xd1d6bd9e, 0x403979bc
.word 0x79849ce4, 0xfd80e1a7, 0x67e386a8, 0x7c9d793e, 0x3ac65f87, 0x4caa87e1, 0x7f07e037, 0x37bc2ec9
.word 0x9e3fd2f4, 0xcb02b5e3, 0x5f75c13f, 0xf3afbc4a, 0x9a69bed1, 0x98985bd1, 0x66c572b8, 0x64f79a1c
.word 0xc3bedb2b, 0x79944f76, 0x9a224f20, 0xebb329b4, 0x6cd9540b, 0x31c606be, 0x401f8801, 0x7269bb15
.word 0x3c394625, 0x9108b5a3, 0xfcf40114, 0x52ff468f, 0x3f2bd64f, 0x28ec9f74, 0xb212a42d, 0xf89d182f
.word 0xd2b29beb, 0x6d9cacbe, 0x4f4dcc7d, 0xbd275ff6, 0x4e9258c4, 0x68703631, 0x2e7c099f, 0xaba47fac
.word 0x297d7f5a, 0x50526aab, 0x210d63e4, 0x33c8c6ab, 0x44ddaff4, 0xafa17817, 0xdbe1e0f0, 0xf3164273
.word 0x8853137f, 0x5e80957c, 0x727f3e24, 0x98ddfab6, 0x8fbbec5d, 0x9f4ddee7, 0xff278f35, 0xe11d6ed6
.word 0x2b74f585, 0xc6165582, 0x98af30a2, 0x5f0026d2, 0x375d9ad3, 0x3d6f3248, 0x9971606a, 0x8f49d6f0
.word 0x2a47d7a0, 0x3b569591, 0x0e2af94f, 0x803a9cd2, 0x7c148b98, 0x019134b7, 0x3857878c, 0x95bcb34e
.word 0xdb2f41fb, 0x85bdf322, 0x9cb359d2, 0x18072482, 0x5a3fe71c, 0x546c621c, 0xe8517a22, 0x21aa4100
.word 0x0d972b33, 0xad566333, 0xb7e32734, 0x6408095d, 0xdedf2d6b, 0xf95390e0, 0x83fac166, 0xb94ff68e
.word 0x26bccdd6, 0x061a8a69, 0x27e57508, 0x083ea297, 0x8b91a358, 0x78b1cd4b, 0xb0b38ae0, 0x9678ec1c
.word 0x04521ce5, 0xdb602c38, 0xd2ff52e8, 0x07ceebe7, 0x0eefb271, 0x64643c07, 0xa950e0aa, 0xdc15c510
.word 0xcec51bde, 0x473a5fd9, 0x15761444, 0x2424589f, 0xbead9aeb, 0xfff68079, 0x8f9a5a67, 0x7c4c0861
.word 0x1c9bcd4a, 0x6826fe91, 0x9d30dd03, 0x367b5f82, 0x52b42f3b, 0xab47d25d, 0x9d4dd375, 0x988a826b
.word 0x83769ffe, 0xf1a3bd99, 0xf71585dd, 0x44ee1a88, 0xb00fa1ed, 0x8fc19237, 0x784d5f10, 0x674b6580
.word 0x63ee2e90, 0x36b8bd16, 0xef73e5d0, 0x2d6be0e4, 0xd4dc5d7c, 0x5776ed45, 0x92cdd3d1, 0xc5e45633
.word 0x3ddeda08, 0xf79d71aa, 0x65837fc8, 0x106e9830, 0x9370ee76, 0x089224f3, 0xe5c73087, 0x5b4b9edd
.word 0xfb091f26, 0x412577e0, 0xbd7e1f88, 0x3ae9f80f, 0xade4f08e, 0x2b4459a4, 0x425314b7, 0x4bcd7859
.word 0x5b5ee141, 0x32dd508d, 0x4330cd3e, 0x0185baaf, 0xba9d428e, 0x61eff5ef, 0x55be27e6, 0x6702c61c
.word 0x290076e1, 0xd17230e4, 0xe89e3ad7, 0x5dead9f6, 0x8a68a3c0, 0x169bf7b9, 0xd8c45682, 0xf4412f95
.word 0x7e3a95c1, 0xa353cde8, 0x795c7bd8, 0xf9f9b6a3, 0xd859787b, 0xe27ed953, 0x5a851807, 0xf0f481fc
.word 0x22d20d6f, 0xb2b8aab0, 0x9c0bf7a1, 0x4df62943, 0x297ecb4c, 0x7b70a170, 0x9bdf4732, 0x7e4b87c5
.word 0x4a48a81e, 0xa80f3dc6, 0x3847eee1, 0xd980a7e3, 0x0df3e844, 0x8e525265, 0x49684831, 0xf5082f5c
.word 0x306b4d07, 0xe1740d8a, 0xf8a375e5, 0x031d4f40, 0x5abe1526, 0x70babcff, 0xf726609b, 0xc41c131d
.word 0x61e6691d, 0xf3af646a, 0x51767c44, 0xaa979996, 0x9a264d47, 0x9933c9cd, 0x4e73d158, 0xeaf88a07
.word 0xb8a4d64a, 0x3a3f3e17, 0x5dcc3a4f, 0x37488915, 0x2c39f148, 0x3ff3ad4f, 0xd9d10a39, 0xe01ff958
.word 0x6384ce1f, 0x8a417c68, 0x1c2ff7f9, 0xdf9669c0, 0xd777ba3f, 0x665fc975, 0xc8fa06ca, 0xce02ecc5
.word 0x473d38ad, 0xa6a882d6, 0xfaf6e919, 0x1f0a69cb, 0x2192ac5d, 0x38ed031e, 0xec14e8ea, 0x22161dcf
.word 0xe1bd1253, 0x6127d74a, 0x72ac2d2f, 0xa18acaee, 0xda2a6147, 0x77f7ed73, 0xadc61136, 0x4bacd065
.word 0xd7eaa3e3, 0xc2df1e4c, 0x8348c6ae, 0x2048bd95, 0x9da41f17, 0xebdd2b6d, 0x7cda040b, 0xf0866965
.word 0x7f8492d8, 0xcb29be23, 0x30ac7857, 0xfac5f805, 0x2bb7e0be, 0xb27f6c59, 0xb64d11c8, 0x3c06fe6a
.word 0xf899f2cc, 0x166765a1, 0x735d5952, 0xeb5b2581, 0xaf69b753, 0x197db779, 0x836e5ced, 0x96ffa974
.word 0xf4dfd5e9, 0x0abba463, 0x8aba9b3b, 0x5711c41f, 0x6958d107, 0x5b3069f6, 0x870aab9d, 0x59257b0e
.word 0x870647a7, 0x167297e5, 0x9f053b0b, 0xeacda64a, 0x3c2e97e8, 0x853142ee, 0xa6b0ac71, 0x905cab48
.word 0xbfa49b3f, 0x9d6609dc, 0x20b77bcc, 0xcae8747a, 0x386bb419, 0xa0aa85d1, 0xf9be1343, 0x6e301c9b
.word 0x1de4b4b5, 0x097c5f34, 0xbabbeaeb, 0x81239dd4, 0xf05cab4e, 0x37838032, 0x3981ba7d, 0x138a71c2
.word 0xfd7e1f48, 0x0214c249, 0x205be01f, 0x73874d07, 0x7f452d86, 0xd79f9c22, 0xa0b5c5f1, 0x0d34acd1
.word 0x86192cb2, 0xbdc5133b, 0xd5733f67, 0x42a3689c, 0x40445132, 0xcb98b530, 0x13c4656c, 0x93ce9e19
.word 0x3312b299, 0x7af7c16f, 0xc963c109, 0x628c9f5f, 0x5e180fb4, 0xed7d01c8, 0x7598c5cf, 0x98c321f5
.word 0xbc6c346d, 0x55cd2988, 0x43d713bc, 0x7d0a898b, 0x35fdb034, 0x538ba61e, 0x993bef74, 0xfa89dbf5
.word 0xadebb662, 0x9ca3920f, 0x1f2c13f8, 0x479b22bb, 0xe550f992, 0x145ab0a0, 0x92887238, 0x21b0484f
.word 0xd08ac9eb, 0x4bfde633, 0x1f56b2e1, 0xb56bc1b9, 0xc482b587, 0x0924822a, 0x7f63f60c, 0x1cb38b50
.word 0x054d7959, 0x413689c1, 0xea2a38e7, 0xaacd26df, 0xb336a902, 0x005f6bb1, 0x8c30ceae, 0x4f890f92
.word 0xfe142961, 0x6c678d0a, 0x353e9df0, 0xc7deff8a, 0xa0f03843, 0x53e7002c, 0x5d04d03f, 0x48d23150
.word 0x4974c795, 0x2f8f066d, 0xe6d6bf6a, 0xfd656ca6, 0x3cc89d1a, 0x26ee5d87, 0x69345b33, 0x324f8ca4
.word 0x3f55e943, 0xe5bcdc25, 0x67a9d0de, 0x17210771, 0x5863e386, 0x2fb0f7fe, 0xfc2e7292, 0x860b54af
.word 0xc5ca21b6, 0x07761ddb, 0xa8019736, 0xd300adb4, 0x8cf50f0e, 0xd145d159, 0x16f18e70, 0x49d5003d
.word 0x408eb70e, 0xe79e9622, 0x87c380c9, 0xa8b300fb, 0xae3ae53b, 0xb9177603, 0x3311b373, 0xe2103c1b
.word 0x33503165, 0x93c94eb5, 0x415396e4, 0x01608c72, 0xa335cce5, 0x48c09052, 0x63804cb2, 0x40788ef0
.word 0x9d3d87a3, 0x3bc32f3a, 0xe3351d0f, 0x488dc686, 0xfc059d39, 0x2ce0bc05, 0xdb249dad, 0x7ec28b50
.word 0xd70bd68c, 0xfb96bc3c, 0x6994a14a, 0x81d1233c, 0xa17586fc, 0xc1173d71, 0x03315f60, 0xdf0fe6b0
.word 0x0e5cdf2b, 0xd0948263, 0x2d62ea88, 0x3518c1bf, 0x53546d1c, 0xf3da43c2, 0x776fc0cb, 0x63d46ff1
.word 0x8d312a16, 0x9a9d2a58, 0xb4a40778, 0x96d3cd2a, 0x028b93b2, 0x61dd7175, 0x8545f348, 0x1fddffcc
.word 0x57e6f8eb, 0x87176ccc, 0x04972a44, 0xb9ad3568, 0xac44d4ab, 0x3008241b, 0x1c85a417, 0x3e4bceb9
.word 0x2af308a6, 0xce3917d2, 0xb601f69c, 0xad768b04, 0x94e253c2, 0xff4efbc7, 0x4e7e4665, 0xba27ac2a
.word 0x1c2b51df, 0x865f0a4c, 0x1977ec5b, 0x82e4c53a, 0xf6b769db, 0xc996ab2a, 0x40bac25a, 0x4604ba48
.word 0xbedd2d4a, 0xb3ea728f, 0xc348c8ad, 0xbc8884f3, 0xbac83758, 0x0f3274d7, 0x94c9034f, 0x8ac237c7
.word 0xfbb3d29c, 0x77eb1417, 0x174bc700, 0x17d06a0a, 0x8d486aa6, 0x9fcf91e9, 0xdfa1cb09, 0xc743eff0
.word 0x4a10b128, 0xfd3173c6, 0x15ca8416, 0xb958fea4, 0x10f6845c, 0x6c4297e9, 0x2260eaa4, 0xa876f9e8
.word 0x68527892, 0xfc2e12b6, 0x29b3b1ff, 0xb7cf2df8, 0x490dcdbd, 0x8f2adab5, 0x0a7bb15a, 0x9837d1cf
.word 0x7c6203bc, 0xd0765e08, 0x42baaca4, 0x7f3ae385, 0x25d30e45, 0xb0c92885, 0xf6660b46, 0x91b0b6d0
.word 0x80c9d764, 0xcfa26d5b, 0xfa940843, 0x3f90e5e1, 0x1fa37e67, 0x652a7ffc, 0x4c36f40c, 0x969d1707
.word 0x7ec2147d, 0xac45b424, 0x0b43b566, 0x3c1ee341, 0xbb2ef1bf, 0x8a184001, 0x7135555c, 0x28a524ab
.word 0xa061a44f, 0x29c03e8a, 0x766091b3, 0x0a37471a, 0xfbfa2c62, 0xfe15c694, 0xa75fece8, 0xc7789d40
.word 0x95b7e424, 0x2494c8fb, 0x007fdfaa, 0x65c8b64b, 0xd9fe0707, 0xf2ba2876, 0x34b72b06, 0x2db8099f
.word 0xdd5bd521, 0x0a62135e, 0xf140bd83, 0xf2c1a59e, 0x2af6b19c, 0x80392fc2, 0x4b534497, 0xe5dea71a
.word 0xe87c6fd5, 0xd279149d, 0xc1354660, 0x0029c6c7, 0x14f9340f, 0x43f71ac5, 0x634d9041, 0xe3dddcf2
.word 0xecff44cf, 0x9b6a410a, 0x62b35d77, 0x1fded5b1, 0xc8316b02, 0x3418d55e, 0xa3a0229e, 0x3127fded
.word 0xeac5eccd, 0xd7f1e8d3, 0xf4d54006, 0x1f15684f, 0xb154468f, 0xd8d3a8b9, 0x6b4ed035, 0xa5fa42f8
.word 0x9691cd02, 0x4ecf5790, 0x38cb2ac3, 0x7915f865, 0xe9ec9bd9, 0xc73fbf95, 0x475ba950, 0xd3f8e191
.word 0xf0a4955f, 0x45fce3d3, 0x54b2fa03, 0x3fb33cb3, 0x41ae2b81, 0xce56bf1d, 0xd5bcc24d, 0xec114312
.word 0xd2505172, 0xa44ccfc0, 0x313e852a, 0xc8b7a3fb, 0x6d6ecab8, 0x8e68da57, 0x93e6adc0, 0x45c485ae
.word 0xb66e74e6, 0x7981c61b, 0x56aaaa21, 0x4bf627d8, 0x50745dd5, 0xb510988b, 0xd9512a94, 0xd2c71a66
.word 0x5bc72c9d, 0x06914aa8, 0xe891fcd0, 0x73669c22, 0x3aca8697, 0x81ec21fd, 0x6bdf32cb, 0x9681df45
.word 0xabccb535, 0x44dd4640, 0x747acf5b, 0x675bbdbc, 0xc89a4d67, 0x087ad6b0, 0x2f5f1227, 0xe9caf0b9
.word 0x3dfa558c, 0xe15834d7, 0x34ae9607, 0xe8e64157, 0xa0e14bff, 0x7d673cbc, 0x3ba1a758, 0x24cd9a23
.word 0x967ab524, 0x992b4fc7, 0x82d0f47d, 0x36f0ad51, 0x0e69bd9f, 0x93a96bd4, 0xc10a793f, 0xbb8f9625
.word 0x4039ad69, 0x318f40d0, 0xe97d6a1f, 0x508394d1, 0xdbb16d87, 0x11d84d4c, 0x354b93a0, 0xd5d76066
.word 0x8a9eb49d, 0x0da8cb40, 0xe4f5a347, 0xea446319, 0x4b924548, 0xb66d6450, 0xf3e63454, 0x12227014
.word 0x1c4a37c1, 0xf42155cb, 0x3ac9f453, 0xa3849222, 0xecc827cf, 0xb7591436, 0x2719e311, 0xc5c6c94b
.word 0x99c0c9c1, 0xe9b87d08, 0x6c153b0f, 0x106d3b98, 0x9f2593dc, 0x12579070, 0xae5f5a24, 0x276b7dfa
.word 0xd10a6d8f, 0xdd81b704, 0xda404c89, 0xca5f7d89, 0xc1eed3a5, 0x5b40ecde, 0x5ee885c5, 0xe762c929
.word 0xf672c5f4, 0x3a82c598, 0x76819422, 0xf9c27fb8, 0x4e48b85b, 0xce623ce3, 0xefeefa11, 0x0c8b373e
.word 0x525788b3, 0xcf5dc460, 0x4f3ce2e8, 0x5f5b2408, 0x7c6b24aa, 0x5655d2d6, 0x904903cd, 0x4587410e
.word 0xc84d3192, 0x4ffbe4ec, 0x084d4c02, 0x5cff2070, 0x202d1031, 0x20324b07, 0x53864f60, 0x4e6cf013
.word 0x1e0d0044, 0x74065219, 0x2db9b554, 0x6ecd7f56, 0x3d2187b1, 0x5435955b, 0x0f4dc6ab, 0xe6f07d99
.word 0x4d13201d, 0x975ecedd, 0x3b8dcc08, 0x1d303cc1, 0xf1683883, 0x40401870, 0x22a9db99, 0x0cc9d0dc
.word 0xb193110d, 0x3e804509, 0x67fc367a, 0x8a943317, 0x5b633bbd, 0x47a28069, 0x82e9fca7, 0xb3640878
.word 0x7905e353, 0xc1cbbaf8, 0x3f613357, 0x515058a9, 0x9e47887a, 0x57394a1f, 0xa754b951, 0xa0839bd0
.word 0x980f94d9, 0xecf4df5b, 0xb745b26b, 0x0fe9bab1, 0x1925fd6b, 0x8bf781de, 0x35e307c4, 0x5898f4f7
.word 0xe56f5eec, 0x3a72b354, 0x30762b0b, 0x37bf75c7, 0xc8ce9091, 0xc17d9573, 0xd881d39b, 0xe3c5c3f1
.word 0xe0f5d338, 0x24ecd016, 0x22fe88d8, 0x60efc954, 0xf5fd212c, 0xbeb63b04, 0xfa0a2972, 0x8dd2df03
.word 0x67a03f09, 0x9cb8d99b, 0xffc1acf3, 0x4ef18f96, 0xbf2b6e3a, 0x5c6cbc47, 0x773a6d9c, 0x2a7b655f
.word 0xef6d1cac, 0x1a47dc26, 0x3db7c995, 0x4322f3b0, 0xb26ffdbd, 0x6d34e8ce, 0xa4b06f35, 0xd9dda8dc
.word 0xea49c0b4, 0x2bb7be74, 0x9f600f4e, 0xaf2fc9ae, 0x82c4d89f, 0x31789af0, 0xd7de3b39, 0xfd4f1607
.word 0xa2184602, 0xea49ecc0, 0xa7054637, 0x6195774b, 0xb3fb8748, 0x5d84df7f, 0x61f43693, 0x13b7c7aa
.word 0x1c8aa496, 0xdea1b61d, 0x41efdc38, 0x49720262, 0x111ba71c, 0x4c1ec961, 0x9675405b, 0x89451853
.word 0xd2b6dd32, 0x915d4055, 0x1a9769bb, 0x705b7cb0, 0xaee4c93d, 0x0c0e4b65, 0x3f21aa30, 0xb8a94357
.word 0x3f032c1a, 0x5975b31e, 0x8bc44dc5, 0x0336b202, 0xfbb6492c, 0xf9998762, 0x4f49ff56, 0x72154a8d
.word 0x6f8fa546, 0x2ff9344c, 0xccef4685, 0xc63eb108, 0xf878b28c, 0x6a48294d, 0x15bea71f, 0x6c68198d
.word 0x56f70e05, 0xe0fc1c53, 0x1602d414, 0xc1953ae1, 0x66d220c8, 0x6c58633d, 0x3a311fcc, 0xc80a88f9
.word 0xeb5257dc, 0x85422fcb, 0x9d3d1f13, 0xbb06e754, 0xbdbaed07, 0x1d366c62, 0xfe7fa82c, 0x0501906e
.word 0xf395c641, 0x3bd4dfba, 0x522d767a, 0x753622d2, 0xb688d519, 0x8301fd1f, 0x574dcc21, 0xf0a13f26
.word 0x9d326da0, 0xb98fb3d5, 0xb1b95c92, 0x7e00b4ac, 0xd4a29905, 0x7193c3ad, 0xac5bcf27, 0x98ed6ff5
.word 0xc090d158, 0xba13089e, 0xdcad02ef, 0x3a005a0d, 0x97625be4, 0x49496580, 0x2dc94770, 0xc7d67fa7
.word 0xe5e19dd8, 0x6eaa9510, 0xe6d1b1eb, 0x8330ccfb, 0x0d87e654, 0x9b64cfbc, 0x0800caa3, 0xd5d2a5c8
.word 0x1ed7ff8a, 0x22f6c8e0, 0xb694f2bd, 0x35cc7008, 0xcc515b17, 0xce495891, 0xa9ba9167, 0x59a74adf
.word 0x29798287, 0xe6865603, 0x0247ece9, 0xc2bd066f, 0xba4cea0c, 0x583fbe78, 0xe1a986f8, 0x1ae45015
.word 0xfbfa66af, 0x47e57f29, 0xb41febbd, 0x5d592aff, 0x5ee1a58e, 0xc8860c65, 0x93827443, 0x8ca23048
.word 0x59885e22, 0x2b22240b, 0xc5a5e780, 0x00d69d1a, 0xb762e481, 0xda579c06, 0xc9d3031a, 0xc61f7922
.word 0x62aaa5fa, 0x952490c0, 0xf3801ad6, 0xe5da5c6e, 0x2ed55018, 0x71a83f75, 0xd2a754fd, 0x94bfd431
.word 0x8b1836bb, 0x149844c2, 0xfd286ca0, 0xa9a03cf7, 0x50edc39b, 0xaaabdfe9, 0x561c232c, 0xb00ff861
.word 0x9df4847f, 0xd96197b9, 0xb198b453, 0x45b84daf, 0x50108e19, 0x2d6e07aa, 0x502a5cde, 0xf37e5ae0
.word 0x1fd9d504, 0xf006a1ba, 0xee0b5715, 0xb87b42bc, 0x0f292bbf, 0xc842dded, 0xc440a81c, 0x13005c9b
.word 0x07415b3e, 0x122d0125, 0xe8e586e9, 0x4c2b217c, 0xd41cf0ed, 0x57565c81, 0xeebf2c42, 0x282932fc
.word 0xb4ea21ec, 0x348b82aa, 0x5a3fe08f, 0xf0d00297, 0x053955fb, 0x0ad578a9, 0xbdae98d0, 0x95fa8be5
.word 0x2d49d396, 0xb34c4463, 0x291b59b2, 0xfbe35e2e, 0xc89949e7, 0xcb8c47ab, 0x30968058, 0x748bfefd
.word 0xbbf0f532, 0x5129f030, 0x22b69e71, 0x85c194b9, 0xa168d0e0, 0xbd1f0922, 0xf28c69c0, 0xd17c7985
.word 0xf3715863, 0xbc5c97ef, 0x52894ea3, 0x263bd06c, 0x570d5a15, 0x60469fe7, 0x16382698, 0x4b2d5107
.word 0x8e9ff1f6, 0xf66e6712, 0x1401f9ad, 0xaed03e01, 0x5ea4f100, 0x5902176e, 0x2a02942b, 0x262aada2
.word 0xc1f0713f, 0xe0314bbd, 0x7063c70c, 0x64ca5a1f, 0xa80789ba, 0x118e6daa, 0xe155ec40, 0x3cbd35ad
.word 0xce87509b, 0xcdf5f3de, 0xa4aebaf6, 0xa30e4a74, 0x366e293b, 0xd805d6db, 0x0597d4e1, 0x3717a632
.word 0x8812b77f, 0x2893822d, 0xe895ef99, 0xea590bc9, 0xd9bb35db, 0xdb73be76, 0x42b3424d, 0x4665a9b5
kernel_data_page_1:
.align 12
.word 0x95b88278, 0x022d40f3, 0xa9d435fb, 0xaf54b258, 0x47136d11, 0x1d5cffa1, 0xd8c14a52, 0x4ff877be
.word 0xabdda8ad, 0xdc8ad7bd, 0x45cf69bd, 0x67b8201e, 0x2bed8d9f, 0xfde92848, 0x10648390, 0xb52414ea
.word 0xf348cddf, 0x50b16999, 0xeef8c941, 0x1e158023, 0xa2e97d28, 0x77cfa30e, 0x3cebf943, 0x5a76f22e
.word 0xd5b7ee8e, 0x8c9a742a, 0xa707de01, 0xeaaaa6cc, 0xa151b49e, 0x3932c9cb, 0x75aac5c6, 0x2278482e
.word 0x1afe7b00, 0xe565b9ec, 0x3336129d, 0xdb3446a7, 0x44cc6ee2, 0x2ed3990b, 0xfc2cd587, 0x499ba073
.word 0xc255fdb6, 0xeaacf2d4, 0x1b21a8bd, 0x24d50334, 0x7b5ce4bf, 0x45f08145, 0xdf217ec0, 0xc2343b45
.word 0x8cb5c137, 0x4d4882dd, 0xb0d876a9, 0x27e6fa39, 0x47e7efc1, 0x78d755f8, 0x82ee8f1c, 0x4d1405cd
.word 0x1fb217d1, 0x7ba17b1c, 0xc7b98215, 0x111d6a3d, 0x3f54ffe7, 0x49ff63ae, 0x1ee6dcfb, 0x6f30594b
.word 0xd74c0db0, 0xca5731eb, 0x5b8cc98c, 0xa03d35f9, 0xd7165db6, 0xc7c7800a, 0x15b93a8a, 0x3b9f56f3
.word 0x6dadf294, 0xa1d645a8, 0x4717eb6e, 0x95255bb7, 0xa75fd31c, 0x22e9986f, 0x36488ff9, 0x8afb5812
.word 0xad179eb7, 0x930e8c07, 0x9229330f, 0x22828f95, 0xe1550a55, 0x9041b364, 0x1de0eff5, 0xa968fb89
.word 0x12e65c15, 0xa3bff611, 0x19efbb40, 0xd8661af6, 0xa52c923d, 0xb88b5ef8, 0xcff23af5, 0xc79ab3ed
.word 0x3763d1d8, 0xeab71cdf, 0x770ec512, 0x98aa7ee8, 0x932d0fb4, 0xe86d095e, 0x6915c605, 0x74627b2c
.word 0xe62932e1, 0x1b1fddbb, 0x83cd43fc, 0xf82e4c16, 0x40021e60, 0xfe2119fc, 0x39b41a91, 0xf680889b
.word 0x247cf9a6, 0x8314644c, 0x472add46, 0x2c55d02b, 0x30a56021, 0xf0335844, 0xde28fdde, 0x52d4ac55
.word 0xf89207fc, 0x797a023a, 0x8f1842af, 0xbbf0e28d, 0x87158120, 0x8492e06a, 0x23aca892, 0x39a7b4fb
.word 0xa6687099, 0x0b32eb9e, 0x4d531aac, 0xde80d27c, 0xd435bd64, 0x6b2fcc43, 0x3cfc07fb, 0xf4832144
.word 0xac090713, 0x1b20f745, 0xab59fdc3, 0x82df1bce, 0x62353606, 0xe24b3d09, 0x3fa34ec5, 0x4490c75b
.word 0xcb76c4ea, 0x096561e2, 0x7c28173b, 0xb6f30078, 0xf882edda, 0xab8f0132, 0xfea754a9, 0xc73b6f3d
.word 0x4293d483, 0xc979e688, 0x72a4de16, 0xbb3a5f9a, 0xe8c4d95b, 0xa1c9263b, 0xf46de502, 0x94d5096d
.word 0xbdcc9131, 0xb5f004e4, 0x49c175fd, 0x7f9e2e5f, 0x8dd3a7e2, 0x07d4c804, 0x47ba8b1a, 0x8538dc6f
.word 0xa742e077, 0x0c82d098, 0xda362fc0, 0x6e4512a0, 0x8e7417c5, 0x26b4f056, 0xb43382a3, 0x5c673560
.word 0x978fee68, 0x571927ff, 0xfa1a9ef9, 0x54225d22, 0xdeb101e3, 0xdc01257f, 0xb6b0a940, 0xd6906f95
.word 0xf6198c24, 0x0d199bdb, 0x0185c4f4, 0x7fd2dcb3, 0xd47433da, 0x34fd5500, 0x12b600fb, 0x6c4d67e2
.word 0x5968c337, 0xa8aba608, 0x88680e51, 0xf6009df0, 0xf6ecf32c, 0xcd626ec7, 0x0349435d, 0x42e45656
.word 0x1acd1ef7, 0xa860575f, 0x16f67928, 0x2564c56e, 0x4aaa9d1f, 0xf2e623d1, 0x62294a2c, 0x9e50c483
.word 0xe47e1ec7, 0xea91f651, 0xa16844f4, 0xc11378d9, 0x780a4561, 0xa251e9f4, 0x9c060603, 0x0a349253
.word 0x20c666c7, 0x4157f346, 0xfa3aca94, 0x0884760a, 0x1fe85174, 0xf79d229b, 0x4884d249, 0xf31e77a8
.word 0xde42ce76, 0xdf6fbf55, 0x2587d0b7, 0x49dd6969, 0xe47b86b8, 0x34050daf, 0xe5f4e572, 0x57741b31
.word 0xdacf99e4, 0x29a26ba1, 0x6aef06f7, 0xe0fee182, 0xfeaddd0b, 0x26712a14, 0x78f8f78c, 0x03e84636
.word 0x8b4d2678, 0xc9965db8, 0xd812a2fb, 0x2505dc4c, 0xbaffdf2a, 0x12875d6c, 0x1cc3b0a6, 0x2e4927ef
.word 0xded7a158, 0x99a7fa75, 0x20f2524b, 0x031d34ae, 0xe2ab16fe, 0x7f743f69, 0x254dd921, 0x64aabaa2
.word 0xa6e67cc4, 0x41952de9, 0xb39c1ef1, 0x226fa87a, 0xb2f1f8ec, 0xd7448c51, 0x131e5e98, 0xe2ec2d5d
.word 0x451c50c7, 0x6df57bd3, 0xc652ab3b, 0x4620a6ed, 0xbc796dd9, 0xc2b70214, 0x26b8a75c, 0xf2365b18
.word 0xa8d1f2ef, 0xc20efe63, 0x110714ec, 0xa0bf12ed, 0xbbea8aba, 0x795d8afd, 0xe46f575d, 0x0936fbd3
.word 0x852460e4, 0xf3c0d5f4, 0xe31f71e2, 0x79ce9402, 0x0f1f0036, 0x53e64be9, 0x66fb5320, 0x0b8e829d
.word 0xae5f451b, 0x1984a82c, 0x29d96117, 0xe80c380c, 0x570f380c, 0xb502bd2a, 0xb973851b, 0xb23d8de2
.word 0x6763e387, 0xecc09e04, 0xf60005f3, 0x96c98d2e, 0x6c42356f, 0xe66cd723, 0xb9cb359f, 0xab2c699e
.word 0x2df6e74b, 0xb3f6df37, 0xb0d10912, 0x953aa8c8, 0x89dc13a3, 0x46b5a828, 0x54d4a37f, 0xf2fa1a06
.word 0x40447b97, 0xd24565df, 0x8fa79c87, 0xd8eb9208, 0xf2c3c956, 0x9c88fe6f, 0x00100c47, 0xf465121e
.word 0x9d02ec5f, 0xb4d64bf5, 0x3b592004, 0xa323cad5, 0x83462c82, 0x41b59306, 0x80179aeb, 0xa79dfdc1
.word 0xe6702074, 0x5d58ae12, 0x217ff51b, 0x1ee66970, 0xa2eabea2, 0x64ea9abc, 0xbbaa33c7, 0xe6489c7e
.word 0x617bf0f8, 0x87e81435, 0x079d404c, 0x9ff4ffa0, 0x9ced49d8, 0x6931400a, 0x2c285838, 0x9fa78a07
.word 0x3385af41, 0x60ea4b6e, 0x3a7b9237, 0xccc71f83, 0x2d5b12d9, 0x1fcd7809, 0x08cc23e2, 0x314d5cda
.word 0xc19033da, 0x9be1acd7, 0x26f7c628, 0xe4880f00, 0xc5ce4597, 0x43d860f6, 0x5917a77b, 0x46944767
.word 0x0db4dcd7, 0xa3f1b08e, 0x16114c8f, 0x4a5c8980, 0xf937852c, 0xc24f42dc, 0xae5213b7, 0x4d7dd327
.word 0x921183d8, 0x3861df10, 0x8bc92587, 0x0caf7bb6, 0xfbc18bb7, 0xc572745e, 0x31a7ca0c, 0xbf13f1ca
.word 0xb9e0253f, 0x8d4d0968, 0xe1d7353a, 0xea68a379, 0xd841bb00, 0x5942e520, 0x6dadcf02, 0xfb132bfb
.word 0x4b70c00f, 0x871e945a, 0xd20af93b, 0xf04b08cd, 0x2d007d33, 0x5b0d0274, 0x23edc47e, 0x143271c4
.word 0x6ac42fbb, 0x8543a127, 0x4388d900, 0x0fd45da7, 0x9b00a8dc, 0x0c2bc356, 0xeab96500, 0x188007b2
.word 0xcc268f4f, 0x5763db42, 0x44b63fdc, 0xbef40234, 0xbadc89e2, 0x15d23998, 0xadf51f6e, 0x4dbe4d1d
.word 0x9e11f62b, 0x94f3ce87, 0xcc7dd2ef, 0x87e2c0aa, 0x5fd66039, 0x0db5310c, 0xbd191bb5, 0x78da32b2
.word 0xcb46eeb1, 0x7034229c, 0x8bba2234, 0x72e896f1, 0x97c83fc4, 0x8456bdf3, 0xa211e5ea, 0xd1fdb0f0
.word 0x438d8265, 0x9c8cb7d7, 0xb1aea0ff, 0x71273c42, 0x95918e42, 0xe79fd862, 0xf7f39969, 0xffe69258
.word 0xb5697f71, 0xcd56a28d, 0x9fc54786, 0x70dd3d51, 0xde80a4ff, 0x056a9245, 0x12b2f835, 0x5caf683a
.word 0x0c346960, 0xfa167ec4, 0x54d8d0ca, 0x73df20fe, 0x49e35ef4, 0x6676e237, 0xac2340f9, 0x82aea907
.word 0xfe9dfa0b, 0xedd4ee3a, 0xf8afb3d6, 0x5dbbbb68, 0xcb370860, 0x0f67a8fb, 0x694d3263, 0x3d07de86
.word 0xbac48fa4, 0xdb719f49, 0x2a95f07b, 0x729eceb3, 0xb77472ba, 0x77aba306, 0xae909fa3, 0x7f4e1c15
.word 0x4e2882ef, 0x5efd9ac9, 0xb15d2742, 0x685edf42, 0xc4b0101a, 0x20816145, 0x0456d0ee, 0x44084f65
.word 0x8db00b54, 0xe80250e0, 0x659b7091, 0x73e559cb, 0x42d004da, 0xed3ebc6b, 0x0533b368, 0x21f62d85
.word 0xf887d9cc, 0x16ead92a, 0xb3cb0dbb, 0xd89abcc1, 0xd9997b0b, 0x3334aed6, 0x9144ab18, 0x5497908a
.word 0x796fa3bd, 0x534b89d6, 0x37026280, 0xd892ea36, 0x206aad15, 0xc0c9fea2, 0xe4838ab7, 0xeff19b2b
.word 0x69cfc95c, 0x225b6ee2, 0xb1c1e69a, 0xbfeb2bf7, 0x644563d3, 0x976f79a8, 0x3e851e10, 0x6747e714
.word 0xa6d040e0, 0xd6a4947c, 0xb2417897, 0x1eec1fca, 0x05a3571d, 0x10bb31fd, 0xc8b8df1c, 0x10596c89
.word 0xe37b58a3, 0xfca71812, 0x86fe2762, 0x344b099e, 0xab636767, 0xbbfd3d3c, 0x820c46a7, 0x079bfd45
.word 0xec3907c2, 0xb43799db, 0x75d693f1, 0xaf634467, 0x28e3bb4b, 0xe7c55005, 0x24aa1b34, 0x8320d4d6
.word 0x565af617, 0x085cdf61, 0x9087da48, 0x823f5054, 0xb66b537a, 0x57efe529, 0x0c7a28f2, 0x952a8326
.word 0xf44162a0, 0xf1f310ab, 0x96bfde40, 0x19c3d0f5, 0xa4102364, 0x8f624e7d, 0x778f3005, 0x0029f324
.word 0xf3926a4b, 0xf1fd0a29, 0x91085afe, 0x30904417, 0x5d3c88c1, 0x69eee951, 0x0d67e65b, 0xd33d1d11
.word 0xe150adad, 0xf985475f, 0x00d1a743, 0x5ca25c0d, 0xa65bf25c, 0x8baf3e9b, 0xfa92be9f, 0x5fec8772
.word 0x39939be3, 0xb93f06dc, 0x0839c18c, 0xed69cce4, 0x171e5047, 0xba75bcf5, 0x83f2a09d, 0x713f7ce8
.word 0x3ad3a75c, 0xc5b51de3, 0x531334a6, 0x84526185, 0xaa79858b, 0xdaddbd12, 0xa9fcbf66, 0x5aa14372
.word 0xfc2b9f81, 0x63566719, 0x0b93caa6, 0xf71d4204, 0x3843d99c, 0xa760cac5, 0xdef6b013, 0xf27fff01
.word 0x88e58312, 0x16a9c559, 0x0a22a97d, 0x6e8ba48d, 0xc1dba1f1, 0x7ef01049, 0x41a325d0, 0xedcec9da
.word 0xeb5dd524, 0x6817f38a, 0xd25e143e, 0xb024877f, 0x0d850055, 0x75998f5e, 0x93090715, 0xd4cf450a
.word 0xd0328d7d, 0x13166a26, 0x430f1211, 0xbeb73596, 0x9a5b3145, 0x99b277ce, 0x266017f3, 0xef251199
.word 0xe6019cae, 0xbda92075, 0x765b909a, 0x1ac0e239, 0xbc679f5a, 0x3f1fc67e, 0xc7c82ab5, 0x6ffe17f3
.word 0x1bbd61eb, 0xf45fbb55, 0x2ed26a5f, 0x340f89ec, 0x4cbf472a, 0x1dd0030c, 0x613a350c, 0x1f176e96
.word 0x92e62fbe, 0xd37d5c93, 0x3a7a3781, 0x8cc969bb, 0xe8a70e08, 0x3d9af172, 0x4a4cdd25, 0xd7cc044f
.word 0xdf7ba6a6, 0x49c2458d, 0x1d48b997, 0x849dc018, 0xb0140b75, 0x59e542ba, 0xc17918ff, 0xafcd6174
.word 0xbb5a6120, 0x08e733b0, 0x7cb65472, 0x66ca8fe8, 0x74c75813, 0xea16eeff, 0xdf70390c, 0x7e33faef
.word 0x6e6c4f0b, 0xf4e9be03, 0xcc3cf4b9, 0x41cf2f9d, 0xbbaf073f, 0xd0592f35, 0xcbaff9fd, 0xa515ff4b
.word 0x5bd5f6c8, 0x429d28e4, 0xc6686ad5, 0xa1e50d01, 0xabe572a6, 0x13e87909, 0x9ae1dfc8, 0x93c87135
.word 0x3762c593, 0x7bfd7262, 0x58be4e18, 0x6c2c7b72, 0xca55317c, 0xa3d84306, 0x1e4b6d1a, 0xf6ddc3ab
.word 0xd18b519c, 0x8fe54dca, 0x9d3bd726, 0x0ef6a68a, 0xd54e5e21, 0xef7cf306, 0x4d6886f8, 0xfe9f22cf
.word 0xd11f1d77, 0xce178029, 0x83cecbc1, 0x47ffe0c2, 0x8712b709, 0x1dd42d42, 0xaff05d68, 0x760d4a54
.word 0xcbad1ff2, 0x583574cd, 0x55750b0c, 0x1c33d0e2, 0x8657ee4a, 0xbb958520, 0x780f7391, 0x6dd8cde6
.word 0xbe5ef1a8, 0x20e2dcad, 0x9a0ce2cd, 0x527ee40e, 0xeadf9f77, 0xf3d07b3e, 0xd477b6cd, 0xaf5ed1ac
.word 0x5911bd59, 0x56d08995, 0xf8c43fc1, 0x516c200c, 0x0091ac3e, 0x308c78c9, 0x33bff0bf, 0x11e860fa
.word 0xbcaa8f04, 0x6e177bc1, 0x3ed5a351, 0x526a761c, 0xc5e8db07, 0xef928109, 0xf37dc78a, 0x3679b19e
.word 0xa6e0a499, 0xc407e78b, 0x6aeb5a66, 0x57b303dc, 0x5932a11a, 0xe8a84673, 0x57155a25, 0xa20c933a
.word 0xb2bb147c, 0x235e87ac, 0x417cbd2f, 0xc1ba92d9, 0x337db89e, 0xb9d1a059, 0xec5c609a, 0x705ca2b3
.word 0x9613a333, 0x5bdb82fc, 0x81979210, 0x603f9485, 0x2bfc1dd5, 0xb60a94de, 0xb89d0720, 0x81d0ed27
.word 0x3ea04e7e, 0x9e916a42, 0xbf3dc13f, 0xa9f9e324, 0x795246d0, 0x5f193a1c, 0x810fedec, 0x617550f7
.word 0x0b654f87, 0x12d7f3d1, 0x1596b417, 0x31a7b07e, 0xd2a5ecb2, 0x505f99dd, 0x054af978, 0xc65d664b
.word 0x980df99e, 0xa0998769, 0x02cca362, 0x6ebe2526, 0x132d9640, 0x1cde4f5e, 0xd006e46c, 0x2612b77f
.word 0x1e3d8b45, 0xa8a4eff2, 0xf29e4b4c, 0xe0477c77, 0x3cfedf1f, 0x68716122, 0x9af3d08f, 0x6fdf5913
.word 0x37072064, 0x3ce64a76, 0xc90a291b, 0x3152ba2f, 0x3494975c, 0x59967dce, 0x5bcaa347, 0xd5fa368c
.word 0x43496ea8, 0x6829145c, 0x896f6650, 0x6fee1f9c, 0x377b7285, 0xf88bc540, 0x83be7423, 0x03a1affb
.word 0xc999070a, 0x93e51a96, 0x17bf97e0, 0xf116b0a2, 0x0603c831, 0x57074729, 0x193a6e0d, 0x7ff031b7
.word 0xbec5a786, 0x26c325bf, 0xdf94097a, 0x644aaa51, 0xe19dd6b3, 0xeb9dc588, 0x995e240c, 0xf1da857b
.word 0x5d1d1236, 0x62f79c21, 0x2915693c, 0xaf4f0d14, 0x5d79d521, 0x9701e149, 0x5590447b, 0xecaf5f91
.word 0x58b7f16f, 0xb90c14e3, 0xc16d61c6, 0x129a935b, 0xf790cc26, 0xc853a996, 0x8b5bda70, 0x24e59d81
.word 0xb2ee5385, 0x3fe2228a, 0xf07cd7da, 0x01a26c18, 0x2af45114, 0xf58fe4cd, 0xb179dea4, 0x123e7088
.word 0x7cac42c3, 0x8d9ebbe7, 0x7176d9eb, 0x4f8cb886, 0x1829ada0, 0x730b7d3b, 0xd01a6b04, 0x5fc025e8
.word 0x7d86cff9, 0x887e86d6, 0xb8ef41f4, 0x4e25d76f, 0xfb7bbfd1, 0xbc25db5a, 0x851b9de7, 0xf7a0bfcd
.word 0xb65e88d7, 0x37d237ca, 0x9f6e74e1, 0x1e04fbab, 0x00e2d3af, 0x87128975, 0xbc8818a4, 0x94a68eb6
.word 0x7079078d, 0x71ec1643, 0x91f12c75, 0x6582865c, 0xac84d797, 0xee3e9412, 0xfc9b1ec0, 0x88355c7c
.word 0xfeed36dd, 0xe9cb72e2, 0x268e58d0, 0xcdd4124a, 0x4b319daf, 0xf22b6dd3, 0x55eb1e8e, 0x52ce8216
.word 0xb77077bb, 0x6ff684f9, 0xefcb7759, 0xdcf0de19, 0xeaefe2c3, 0x40dbe686, 0x1778e7ba, 0xfba6e176
.word 0xe706d1ba, 0xbf161eed, 0x5c6de458, 0x78c0af52, 0xa7cc1993, 0xd88bf6a6, 0xfb9dcffd, 0xaaa6161c
.word 0xdf0bff8e, 0xbfa67276, 0x0e58b66b, 0x87e26b86, 0x6128b4a6, 0x97cfded9, 0xbb892fcc, 0x43d8507f
.word 0x85c937e5, 0x129b6ab5, 0x0fa30003, 0xa3398fe5, 0xbb4103cd, 0xff96e93f, 0x645f3c9b, 0x561dfc84
.word 0x263ef10c, 0x9ee5e623, 0x545d64ef, 0x1946be9e, 0xe63d34a2, 0xc05ed70b, 0xfaac9cc8, 0x353d5f94
.word 0xdbf5847a, 0xf1496be6, 0x138f4f3b, 0x023fa4ac, 0x0347e080, 0x1b3290c7, 0x463a3514, 0x377c5c47
.word 0x43160bc9, 0x4b80b9df, 0xc0bf4182, 0xc0cf1c10, 0x27a394a3, 0x745c1c3e, 0x0bee3296, 0xf41549ed
.word 0xcdd5677e, 0xaa52096d, 0xe900a2a7, 0x34e7106f, 0x33685d24, 0x81764420, 0xc102c6e8, 0xa3c9f98d
.word 0x9e1d8225, 0x356e7e5a, 0x8ac6d836, 0x0eb4f40c, 0xbeab5c1c, 0xd8797386, 0xeb886063, 0x12f8e99a
.word 0x5f26aa6a, 0xa7e1fc84, 0x5dc64ec3, 0x4c198284, 0xbd33bcdf, 0xfa13b521, 0xc77c7614, 0x7882d079
.word 0xbdde8cee, 0x38384ecd, 0xaef2ed1a, 0xcb90c1f1, 0x10a5f857, 0xbdb768f8, 0x69d98f73, 0x311871ff
.word 0x2f825512, 0xf1887481, 0x1b128af6, 0xdd7162d1, 0x6334f531, 0x32b516f1, 0x7fcd149c, 0xc0737ef2
.word 0x3aa8fa6e, 0xa5e44935, 0x312df6ad, 0x9e85eb47, 0x56e0c471, 0x81e6f0bc, 0xa84e0f23, 0x7189d4cb
.word 0xe9f328f1, 0xd8436da9, 0x79fb020b, 0x7e512122, 0xe50d8ced, 0x9058443e, 0xb562ae42, 0x1180184b
.word 0x86d3e95a, 0xbed81ac8, 0x0d375349, 0x2f9150e4, 0x73364093, 0x096567b2, 0x2fa93d5b, 0xeec014b0
.word 0x7679adb4, 0x7d8063e1, 0xf6346638, 0x73edc15e, 0xe173b416, 0xe05af601, 0x73cb2cc2, 0x649b9240
.word 0x985550f0, 0x3462c1d9, 0x77825732, 0xf8b863f3, 0x92534682, 0xa1e0e0f5, 0xb44b5afa, 0xe78e0967
.word 0x6dc634fa, 0x57333699, 0xfb1c7a6d, 0x4201546d, 0x7b1515cb, 0xd632b82e, 0x46af63b6, 0xab04b2ee
.word 0x3ddaf577, 0x2f0e6877, 0x9970e432, 0x2c78f0b8, 0xded1c284, 0x653421db, 0xf3599713, 0xf3c29a31
.align 4;
.align 5
_kernel_stack_start:
.rept 4999
.4byte 0x0
.endr
_kernel_stack_end:
.4byte 0x0
_kernel_end: nop
