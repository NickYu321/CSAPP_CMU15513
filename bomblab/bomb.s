
bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000402000 <_init>:
  402000:	f3 0f 1e fa          	endbr64 
  402004:	48 83 ec 08          	sub    $0x8,%rsp
  402008:	48 8b 05 d1 4f 00 00 	mov    0x4fd1(%rip),%rax        # 406fe0 <__gmon_start__@Base>
  40200f:	48 85 c0             	test   %rax,%rax
  402012:	74 02                	je     402016 <_init+0x16>
  402014:	ff d0                	call   *%rax
  402016:	48 83 c4 08          	add    $0x8,%rsp
  40201a:	c3                   	ret    

Disassembly of section .plt:

0000000000402020 <getenv@plt-0x10>:
  402020:	ff 35 e2 4f 00 00    	push   0x4fe2(%rip)        # 407008 <_GLOBAL_OFFSET_TABLE_+0x8>
  402026:	ff 25 e4 4f 00 00    	jmp    *0x4fe4(%rip)        # 407010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40202c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402030 <getenv@plt>:
  402030:	ff 25 e2 4f 00 00    	jmp    *0x4fe2(%rip)        # 407018 <getenv@GLIBC_2.2.5>
  402036:	68 00 00 00 00       	push   $0x0
  40203b:	e9 e0 ff ff ff       	jmp    402020 <_init+0x20>

0000000000402040 <free@plt>:
  402040:	ff 25 da 4f 00 00    	jmp    *0x4fda(%rip)        # 407020 <free@GLIBC_2.2.5>
  402046:	68 01 00 00 00       	push   $0x1
  40204b:	e9 d0 ff ff ff       	jmp    402020 <_init+0x20>

0000000000402050 <strcasecmp@plt>:
  402050:	ff 25 d2 4f 00 00    	jmp    *0x4fd2(%rip)        # 407028 <strcasecmp@GLIBC_2.2.5>
  402056:	68 02 00 00 00       	push   $0x2
  40205b:	e9 c0 ff ff ff       	jmp    402020 <_init+0x20>

0000000000402060 <posix_spawn_file_actions_init@plt>:
  402060:	ff 25 ca 4f 00 00    	jmp    *0x4fca(%rip)        # 407030 <posix_spawn_file_actions_init@GLIBC_2.2.5>
  402066:	68 03 00 00 00       	push   $0x3
  40206b:	e9 b0 ff ff ff       	jmp    402020 <_init+0x20>

0000000000402070 <abort@plt>:
  402070:	ff 25 c2 4f 00 00    	jmp    *0x4fc2(%rip)        # 407038 <abort@GLIBC_2.2.5>
  402076:	68 04 00 00 00       	push   $0x4
  40207b:	e9 a0 ff ff ff       	jmp    402020 <_init+0x20>

0000000000402080 <__errno_location@plt>:
  402080:	ff 25 ba 4f 00 00    	jmp    *0x4fba(%rip)        # 407040 <__errno_location@GLIBC_2.2.5>
  402086:	68 05 00 00 00       	push   $0x5
  40208b:	e9 90 ff ff ff       	jmp    402020 <_init+0x20>

0000000000402090 <unlink@plt>:
  402090:	ff 25 b2 4f 00 00    	jmp    *0x4fb2(%rip)        # 407048 <unlink@GLIBC_2.2.5>
  402096:	68 06 00 00 00       	push   $0x6
  40209b:	e9 80 ff ff ff       	jmp    402020 <_init+0x20>

00000000004020a0 <_exit@plt>:
  4020a0:	ff 25 aa 4f 00 00    	jmp    *0x4faa(%rip)        # 407050 <_exit@GLIBC_2.2.5>
  4020a6:	68 07 00 00 00       	push   $0x7
  4020ab:	e9 70 ff ff ff       	jmp    402020 <_init+0x20>

00000000004020b0 <mkdir@plt>:
  4020b0:	ff 25 a2 4f 00 00    	jmp    *0x4fa2(%rip)        # 407058 <mkdir@GLIBC_2.2.5>
  4020b6:	68 08 00 00 00       	push   $0x8
  4020bb:	e9 60 ff ff ff       	jmp    402020 <_init+0x20>

00000000004020c0 <puts@plt>:
  4020c0:	ff 25 9a 4f 00 00    	jmp    *0x4f9a(%rip)        # 407060 <puts@GLIBC_2.2.5>
  4020c6:	68 09 00 00 00       	push   $0x9
  4020cb:	e9 50 ff ff ff       	jmp    402020 <_init+0x20>

00000000004020d0 <write@plt>:
  4020d0:	ff 25 92 4f 00 00    	jmp    *0x4f92(%rip)        # 407068 <write@GLIBC_2.2.5>
  4020d6:	68 0a 00 00 00       	push   $0xa
  4020db:	e9 40 ff ff ff       	jmp    402020 <_init+0x20>

00000000004020e0 <fclose@plt>:
  4020e0:	ff 25 8a 4f 00 00    	jmp    *0x4f8a(%rip)        # 407070 <fclose@GLIBC_2.2.5>
  4020e6:	68 0b 00 00 00       	push   $0xb
  4020eb:	e9 30 ff ff ff       	jmp    402020 <_init+0x20>

00000000004020f0 <posix_spawn_file_actions_destroy@plt>:
  4020f0:	ff 25 82 4f 00 00    	jmp    *0x4f82(%rip)        # 407078 <posix_spawn_file_actions_destroy@GLIBC_2.2.5>
  4020f6:	68 0c 00 00 00       	push   $0xc
  4020fb:	e9 20 ff ff ff       	jmp    402020 <_init+0x20>

0000000000402100 <getpwuid@plt>:
  402100:	ff 25 7a 4f 00 00    	jmp    *0x4f7a(%rip)        # 407080 <getpwuid@GLIBC_2.2.5>
  402106:	68 0d 00 00 00       	push   $0xd
  40210b:	e9 10 ff ff ff       	jmp    402020 <_init+0x20>

0000000000402110 <strlen@plt>:
  402110:	ff 25 72 4f 00 00    	jmp    *0x4f72(%rip)        # 407088 <strlen@GLIBC_2.2.5>
  402116:	68 0e 00 00 00       	push   $0xe
  40211b:	e9 00 ff ff ff       	jmp    402020 <_init+0x20>

0000000000402120 <__stack_chk_fail@plt>:
  402120:	ff 25 6a 4f 00 00    	jmp    *0x4f6a(%rip)        # 407090 <__stack_chk_fail@GLIBC_2.4>
  402126:	68 0f 00 00 00       	push   $0xf
  40212b:	e9 f0 fe ff ff       	jmp    402020 <_init+0x20>

0000000000402130 <getuid@plt>:
  402130:	ff 25 62 4f 00 00    	jmp    *0x4f62(%rip)        # 407098 <getuid@GLIBC_2.2.5>
  402136:	68 10 00 00 00       	push   $0x10
  40213b:	e9 e0 fe ff ff       	jmp    402020 <_init+0x20>

0000000000402140 <strchr@plt>:
  402140:	ff 25 5a 4f 00 00    	jmp    *0x4f5a(%rip)        # 4070a0 <strchr@GLIBC_2.2.5>
  402146:	68 11 00 00 00       	push   $0x11
  40214b:	e9 d0 fe ff ff       	jmp    402020 <_init+0x20>

0000000000402150 <strrchr@plt>:
  402150:	ff 25 52 4f 00 00    	jmp    *0x4f52(%rip)        # 4070a8 <strrchr@GLIBC_2.2.5>
  402156:	68 12 00 00 00       	push   $0x12
  40215b:	e9 c0 fe ff ff       	jmp    402020 <_init+0x20>

0000000000402160 <mkostemp@plt>:
  402160:	ff 25 4a 4f 00 00    	jmp    *0x4f4a(%rip)        # 4070b0 <mkostemp@GLIBC_2.7>
  402166:	68 13 00 00 00       	push   $0x13
  40216b:	e9 b0 fe ff ff       	jmp    402020 <_init+0x20>

0000000000402170 <__assert_fail@plt>:
  402170:	ff 25 42 4f 00 00    	jmp    *0x4f42(%rip)        # 4070b8 <__assert_fail@GLIBC_2.2.5>
  402176:	68 14 00 00 00       	push   $0x14
  40217b:	e9 a0 fe ff ff       	jmp    402020 <_init+0x20>

0000000000402180 <close@plt>:
  402180:	ff 25 3a 4f 00 00    	jmp    *0x4f3a(%rip)        # 4070c0 <close@GLIBC_2.2.5>
  402186:	68 15 00 00 00       	push   $0x15
  40218b:	e9 90 fe ff ff       	jmp    402020 <_init+0x20>

0000000000402190 <strcspn@plt>:
  402190:	ff 25 32 4f 00 00    	jmp    *0x4f32(%rip)        # 4070c8 <strcspn@GLIBC_2.2.5>
  402196:	68 16 00 00 00       	push   $0x16
  40219b:	e9 80 fe ff ff       	jmp    402020 <_init+0x20>

00000000004021a0 <read@plt>:
  4021a0:	ff 25 2a 4f 00 00    	jmp    *0x4f2a(%rip)        # 4070d0 <read@GLIBC_2.2.5>
  4021a6:	68 17 00 00 00       	push   $0x17
  4021ab:	e9 70 fe ff ff       	jmp    402020 <_init+0x20>

00000000004021b0 <__asprintf_chk@plt>:
  4021b0:	ff 25 22 4f 00 00    	jmp    *0x4f22(%rip)        # 4070d8 <__asprintf_chk@GLIBC_2.8>
  4021b6:	68 18 00 00 00       	push   $0x18
  4021bb:	e9 60 fe ff ff       	jmp    402020 <_init+0x20>

00000000004021c0 <__getdelim@plt>:
  4021c0:	ff 25 1a 4f 00 00    	jmp    *0x4f1a(%rip)        # 4070e0 <__getdelim@GLIBC_2.2.5>
  4021c6:	68 19 00 00 00       	push   $0x19
  4021cb:	e9 50 fe ff ff       	jmp    402020 <_init+0x20>

00000000004021d0 <signal@plt>:
  4021d0:	ff 25 12 4f 00 00    	jmp    *0x4f12(%rip)        # 4070e8 <signal@GLIBC_2.2.5>
  4021d6:	68 1a 00 00 00       	push   $0x1a
  4021db:	e9 40 fe ff ff       	jmp    402020 <_init+0x20>

00000000004021e0 <feof@plt>:
  4021e0:	ff 25 0a 4f 00 00    	jmp    *0x4f0a(%rip)        # 4070f0 <feof@GLIBC_2.2.5>
  4021e6:	68 1b 00 00 00       	push   $0x1b
  4021eb:	e9 30 fe ff ff       	jmp    402020 <_init+0x20>

00000000004021f0 <fflush@plt>:
  4021f0:	ff 25 02 4f 00 00    	jmp    *0x4f02(%rip)        # 4070f8 <fflush@GLIBC_2.2.5>
  4021f6:	68 1c 00 00 00       	push   $0x1c
  4021fb:	e9 20 fe ff ff       	jmp    402020 <_init+0x20>

0000000000402200 <__isoc99_sscanf@plt>:
  402200:	ff 25 fa 4e 00 00    	jmp    *0x4efa(%rip)        # 407100 <__isoc99_sscanf@GLIBC_2.7>
  402206:	68 1d 00 00 00       	push   $0x1d
  40220b:	e9 10 fe ff ff       	jmp    402020 <_init+0x20>

0000000000402210 <posix_spawn_file_actions_addopen@plt>:
  402210:	ff 25 f2 4e 00 00    	jmp    *0x4ef2(%rip)        # 407108 <posix_spawn_file_actions_addopen@GLIBC_2.2.5>
  402216:	68 1e 00 00 00       	push   $0x1e
  40221b:	e9 00 fe ff ff       	jmp    402020 <_init+0x20>

0000000000402220 <posix_spawnp@plt>:
  402220:	ff 25 ea 4e 00 00    	jmp    *0x4eea(%rip)        # 407110 <posix_spawnp@GLIBC_2.15>
  402226:	68 1f 00 00 00       	push   $0x1f
  40222b:	e9 f0 fd ff ff       	jmp    402020 <_init+0x20>

0000000000402230 <strsignal@plt>:
  402230:	ff 25 e2 4e 00 00    	jmp    *0x4ee2(%rip)        # 407118 <strsignal@GLIBC_2.2.5>
  402236:	68 20 00 00 00       	push   $0x20
  40223b:	e9 e0 fd ff ff       	jmp    402020 <_init+0x20>

0000000000402240 <fdopen@plt>:
  402240:	ff 25 da 4e 00 00    	jmp    *0x4eda(%rip)        # 407120 <fdopen@GLIBC_2.2.5>
  402246:	68 21 00 00 00       	push   $0x21
  40224b:	e9 d0 fd ff ff       	jmp    402020 <_init+0x20>

0000000000402250 <__printf_chk@plt>:
  402250:	ff 25 d2 4e 00 00    	jmp    *0x4ed2(%rip)        # 407128 <__printf_chk@GLIBC_2.3.4>
  402256:	68 22 00 00 00       	push   $0x22
  40225b:	e9 c0 fd ff ff       	jmp    402020 <_init+0x20>

0000000000402260 <waitpid@plt>:
  402260:	ff 25 ca 4e 00 00    	jmp    *0x4eca(%rip)        # 407130 <waitpid@GLIBC_2.2.5>
  402266:	68 23 00 00 00       	push   $0x23
  40226b:	e9 b0 fd ff ff       	jmp    402020 <_init+0x20>

0000000000402270 <open@plt>:
  402270:	ff 25 c2 4e 00 00    	jmp    *0x4ec2(%rip)        # 407138 <open@GLIBC_2.2.5>
  402276:	68 24 00 00 00       	push   $0x24
  40227b:	e9 a0 fd ff ff       	jmp    402020 <_init+0x20>

0000000000402280 <fopen@plt>:
  402280:	ff 25 ba 4e 00 00    	jmp    *0x4eba(%rip)        # 407140 <fopen@GLIBC_2.2.5>
  402286:	68 25 00 00 00       	push   $0x25
  40228b:	e9 90 fd ff ff       	jmp    402020 <_init+0x20>

0000000000402290 <perror@plt>:
  402290:	ff 25 b2 4e 00 00    	jmp    *0x4eb2(%rip)        # 407148 <perror@GLIBC_2.2.5>
  402296:	68 26 00 00 00       	push   $0x26
  40229b:	e9 80 fd ff ff       	jmp    402020 <_init+0x20>

00000000004022a0 <strtoul@plt>:
  4022a0:	ff 25 aa 4e 00 00    	jmp    *0x4eaa(%rip)        # 407150 <strtoul@GLIBC_2.2.5>
  4022a6:	68 27 00 00 00       	push   $0x27
  4022ab:	e9 70 fd ff ff       	jmp    402020 <_init+0x20>

00000000004022b0 <gethostname@plt>:
  4022b0:	ff 25 a2 4e 00 00    	jmp    *0x4ea2(%rip)        # 407158 <gethostname@GLIBC_2.2.5>
  4022b6:	68 28 00 00 00       	push   $0x28
  4022bb:	e9 60 fd ff ff       	jmp    402020 <_init+0x20>

00000000004022c0 <exit@plt>:
  4022c0:	ff 25 9a 4e 00 00    	jmp    *0x4e9a(%rip)        # 407160 <exit@GLIBC_2.2.5>
  4022c6:	68 29 00 00 00       	push   $0x29
  4022cb:	e9 50 fd ff ff       	jmp    402020 <_init+0x20>

00000000004022d0 <fwrite@plt>:
  4022d0:	ff 25 92 4e 00 00    	jmp    *0x4e92(%rip)        # 407168 <fwrite@GLIBC_2.2.5>
  4022d6:	68 2a 00 00 00       	push   $0x2a
  4022db:	e9 40 fd ff ff       	jmp    402020 <_init+0x20>

00000000004022e0 <__fprintf_chk@plt>:
  4022e0:	ff 25 8a 4e 00 00    	jmp    *0x4e8a(%rip)        # 407170 <__fprintf_chk@GLIBC_2.3.4>
  4022e6:	68 2b 00 00 00       	push   $0x2b
  4022eb:	e9 30 fd ff ff       	jmp    402020 <_init+0x20>

00000000004022f0 <clock_nanosleep@plt>:
  4022f0:	ff 25 82 4e 00 00    	jmp    *0x4e82(%rip)        # 407178 <clock_nanosleep@GLIBC_2.17>
  4022f6:	68 2c 00 00 00       	push   $0x2c
  4022fb:	e9 20 fd ff ff       	jmp    402020 <_init+0x20>

0000000000402300 <posix_spawn_file_actions_adddup2@plt>:
  402300:	ff 25 7a 4e 00 00    	jmp    *0x4e7a(%rip)        # 407180 <posix_spawn_file_actions_adddup2@GLIBC_2.2.5>
  402306:	68 2d 00 00 00       	push   $0x2d
  40230b:	e9 10 fd ff ff       	jmp    402020 <_init+0x20>

0000000000402310 <strdup@plt>:
  402310:	ff 25 72 4e 00 00    	jmp    *0x4e72(%rip)        # 407188 <strdup@GLIBC_2.2.5>
  402316:	68 2e 00 00 00       	push   $0x2e
  40231b:	e9 00 fd ff ff       	jmp    402020 <_init+0x20>

0000000000402320 <strerror@plt>:
  402320:	ff 25 6a 4e 00 00    	jmp    *0x4e6a(%rip)        # 407190 <strerror@GLIBC_2.2.5>
  402326:	68 2f 00 00 00       	push   $0x2f
  40232b:	e9 f0 fc ff ff       	jmp    402020 <_init+0x20>

0000000000402330 <sleep@plt>:
  402330:	ff 25 62 4e 00 00    	jmp    *0x4e62(%rip)        # 407198 <sleep@GLIBC_2.2.5>
  402336:	68 30 00 00 00       	push   $0x30
  40233b:	e9 e0 fc ff ff       	jmp    402020 <_init+0x20>

0000000000402340 <fstat@plt>:
  402340:	ff 25 5a 4e 00 00    	jmp    *0x4e5a(%rip)        # 4071a0 <fstat@GLIBC_2.33>
  402346:	68 31 00 00 00       	push   $0x31
  40234b:	e9 d0 fc ff ff       	jmp    402020 <_init+0x20>

0000000000402350 <__ctype_b_loc@plt>:
  402350:	ff 25 52 4e 00 00    	jmp    *0x4e52(%rip)        # 4071a8 <__ctype_b_loc@GLIBC_2.3>
  402356:	68 32 00 00 00       	push   $0x32
  40235b:	e9 c0 fc ff ff       	jmp    402020 <_init+0x20>

Disassembly of section .text:

0000000000402360 <_start>:
  402360:	f3 0f 1e fa          	endbr64 
  402364:	31 ed                	xor    %ebp,%ebp
  402366:	49 89 d1             	mov    %rdx,%r9
  402369:	5e                   	pop    %rsi
  40236a:	48 89 e2             	mov    %rsp,%rdx
  40236d:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  402371:	50                   	push   %rax
  402372:	54                   	push   %rsp
  402373:	45 31 c0             	xor    %r8d,%r8d
  402376:	31 c9                	xor    %ecx,%ecx
  402378:	48 c7 c7 46 24 40 00 	mov    $0x402446,%rdi
  40237f:	ff 15 53 4c 00 00    	call   *0x4c53(%rip)        # 406fd8 <__libc_start_main@GLIBC_2.34>
  402385:	f4                   	hlt    
  402386:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40238d:	00 00 00 

0000000000402390 <_dl_relocate_static_pie>:
  402390:	f3 0f 1e fa          	endbr64 
  402394:	c3                   	ret    
  402395:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40239c:	00 00 00 
  40239f:	90                   	nop

00000000004023a0 <deregister_tm_clones>:
  4023a0:	b8 30 73 40 00       	mov    $0x407330,%eax
  4023a5:	48 3d 30 73 40 00    	cmp    $0x407330,%rax
  4023ab:	74 13                	je     4023c0 <deregister_tm_clones+0x20>
  4023ad:	b8 00 00 00 00       	mov    $0x0,%eax
  4023b2:	48 85 c0             	test   %rax,%rax
  4023b5:	74 09                	je     4023c0 <deregister_tm_clones+0x20>
  4023b7:	bf 30 73 40 00       	mov    $0x407330,%edi
  4023bc:	ff e0                	jmp    *%rax
  4023be:	66 90                	xchg   %ax,%ax
  4023c0:	c3                   	ret    
  4023c1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  4023c8:	00 00 00 00 
  4023cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004023d0 <register_tm_clones>:
  4023d0:	be 30 73 40 00       	mov    $0x407330,%esi
  4023d5:	48 81 ee 30 73 40 00 	sub    $0x407330,%rsi
  4023dc:	48 89 f0             	mov    %rsi,%rax
  4023df:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4023e3:	48 c1 f8 03          	sar    $0x3,%rax
  4023e7:	48 01 c6             	add    %rax,%rsi
  4023ea:	48 d1 fe             	sar    %rsi
  4023ed:	74 11                	je     402400 <register_tm_clones+0x30>
  4023ef:	b8 00 00 00 00       	mov    $0x0,%eax
  4023f4:	48 85 c0             	test   %rax,%rax
  4023f7:	74 07                	je     402400 <register_tm_clones+0x30>
  4023f9:	bf 30 73 40 00       	mov    $0x407330,%edi
  4023fe:	ff e0                	jmp    *%rax
  402400:	c3                   	ret    
  402401:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  402408:	00 00 00 00 
  40240c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402410 <__do_global_dtors_aux>:
  402410:	f3 0f 1e fa          	endbr64 
  402414:	80 3d 6d 4f 00 00 00 	cmpb   $0x0,0x4f6d(%rip)        # 407388 <completed.0>
  40241b:	75 13                	jne    402430 <__do_global_dtors_aux+0x20>
  40241d:	55                   	push   %rbp
  40241e:	48 89 e5             	mov    %rsp,%rbp
  402421:	e8 7a ff ff ff       	call   4023a0 <deregister_tm_clones>
  402426:	c6 05 5b 4f 00 00 01 	movb   $0x1,0x4f5b(%rip)        # 407388 <completed.0>
  40242d:	5d                   	pop    %rbp
  40242e:	c3                   	ret    
  40242f:	90                   	nop
  402430:	c3                   	ret    
  402431:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  402438:	00 00 00 00 
  40243c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000402440 <frame_dummy>:
  402440:	f3 0f 1e fa          	endbr64 
  402444:	eb 8a                	jmp    4023d0 <register_tm_clones>

0000000000402446 <main>:
  402446:	53                   	push   %rbx
  402447:	83 ff 01             	cmp    $0x1,%edi
  40244a:	0f 84 3a 01 00 00    	je     40258a <main+0x144>
  402450:	48 89 f3             	mov    %rsi,%rbx
  402453:	83 ff 02             	cmp    $0x2,%edi
  402456:	0f 85 77 01 00 00    	jne    4025d3 <main+0x18d>
  40245c:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  402460:	48 8d 35 bb 1f 00 00 	lea    0x1fbb(%rip),%rsi        # 404422 <__PRETTY_FUNCTION__.0+0x82>
  402467:	e8 14 fe ff ff       	call   402280 <fopen@plt>
  40246c:	48 89 c7             	mov    %rax,%rdi
  40246f:	48 85 c0             	test   %rax,%rax
  402472:	0f 84 1e 01 00 00    	je     402596 <main+0x150>
  402478:	e8 dd 0e 00 00       	call   40335a <initialize_bomb>
  40247d:	48 8d 35 d4 1b 00 00 	lea    0x1bd4(%rip),%rsi        # 404058 <_IO_stdin_used+0x58>
  402484:	bf 01 00 00 00       	mov    $0x1,%edi
  402489:	b8 00 00 00 00       	mov    $0x0,%eax
  40248e:	e8 bd fd ff ff       	call   402250 <__printf_chk@plt>
  402493:	48 8d 35 fe 1b 00 00 	lea    0x1bfe(%rip),%rsi        # 404098 <_IO_stdin_used+0x98>
  40249a:	bf 01 00 00 00       	mov    $0x1,%edi
  40249f:	b8 00 00 00 00       	mov    $0x0,%eax
  4024a4:	e8 a7 fd ff ff       	call   402250 <__printf_chk@plt>
  4024a9:	e8 2c 10 00 00       	call   4034da <read_line>
  4024ae:	48 89 c7             	mov    %rax,%rdi
  4024b1:	e8 e0 01 00 00       	call   402696 <phase_1>
  4024b6:	e8 18 11 00 00       	call   4035d3 <phase_defused>
  4024bb:	48 8d 35 06 1c 00 00 	lea    0x1c06(%rip),%rsi        # 4040c8 <_IO_stdin_used+0xc8>
  4024c2:	bf 01 00 00 00       	mov    $0x1,%edi
  4024c7:	b8 00 00 00 00       	mov    $0x0,%eax
  4024cc:	e8 7f fd ff ff       	call   402250 <__printf_chk@plt>
  4024d1:	e8 04 10 00 00       	call   4034da <read_line>
  4024d6:	48 89 c7             	mov    %rax,%rdi
  4024d9:	e8 d6 01 00 00       	call   4026b4 <phase_2>
  4024de:	e8 f0 10 00 00       	call   4035d3 <phase_defused>
  4024e3:	48 8d 35 0e 1c 00 00 	lea    0x1c0e(%rip),%rsi        # 4040f8 <_IO_stdin_used+0xf8>
  4024ea:	bf 01 00 00 00       	mov    $0x1,%edi
  4024ef:	b8 00 00 00 00       	mov    $0x0,%eax
  4024f4:	e8 57 fd ff ff       	call   402250 <__printf_chk@plt>
  4024f9:	e8 dc 0f 00 00       	call   4034da <read_line>
  4024fe:	48 89 c7             	mov    %rax,%rdi
  402501:	e8 12 02 00 00       	call   402718 <phase_3>
  402506:	e8 c8 10 00 00       	call   4035d3 <phase_defused>
  40250b:	48 8d 35 0c 1b 00 00 	lea    0x1b0c(%rip),%rsi        # 40401e <_IO_stdin_used+0x1e>
  402512:	bf 01 00 00 00       	mov    $0x1,%edi
  402517:	b8 00 00 00 00       	mov    $0x0,%eax
  40251c:	e8 2f fd ff ff       	call   402250 <__printf_chk@plt>
  402521:	e8 b4 0f 00 00       	call   4034da <read_line>
  402526:	48 89 c7             	mov    %rax,%rdi
  402529:	e8 1d 03 00 00       	call   40284b <phase_4>
  40252e:	e8 a0 10 00 00       	call   4035d3 <phase_defused>
  402533:	48 8d 35 de 1b 00 00 	lea    0x1bde(%rip),%rsi        # 404118 <_IO_stdin_used+0x118>
  40253a:	bf 01 00 00 00       	mov    $0x1,%edi
  40253f:	b8 00 00 00 00       	mov    $0x0,%eax
  402544:	e8 07 fd ff ff       	call   402250 <__printf_chk@plt>
  402549:	e8 8c 0f 00 00       	call   4034da <read_line>
  40254e:	48 89 c7             	mov    %rax,%rdi
  402551:	e8 75 03 00 00       	call   4028cb <phase_5>
  402556:	e8 78 10 00 00       	call   4035d3 <phase_defused>
  40255b:	48 8d 35 de 1b 00 00 	lea    0x1bde(%rip),%rsi        # 404140 <_IO_stdin_used+0x140>
  402562:	bf 01 00 00 00       	mov    $0x1,%edi
  402567:	b8 00 00 00 00       	mov    $0x0,%eax
  40256c:	e8 df fc ff ff       	call   402250 <__printf_chk@plt>
  402571:	e8 64 0f 00 00       	call   4034da <read_line>
  402576:	48 89 c7             	mov    %rax,%rdi
  402579:	e8 9d 03 00 00       	call   40291b <phase_6>
  40257e:	e8 50 10 00 00       	call   4035d3 <phase_defused>
  402583:	b8 00 00 00 00       	mov    $0x0,%eax
  402588:	5b                   	pop    %rbx
  402589:	c3                   	ret    
  40258a:	48 8b 3d af 4d 00 00 	mov    0x4daf(%rip),%rdi        # 407340 <stdin@GLIBC_2.2.5>
  402591:	e9 e2 fe ff ff       	jmp    402478 <main+0x32>
  402596:	e8 e5 fa ff ff       	call   402080 <__errno_location@plt>
  40259b:	8b 38                	mov    (%rax),%edi
  40259d:	e8 7e fd ff ff       	call   402320 <strerror@plt>
  4025a2:	49 89 c1             	mov    %rax,%r9
  4025a5:	48 8b 0b             	mov    (%rbx),%rcx
  4025a8:	4c 8b 43 08          	mov    0x8(%rbx),%r8
  4025ac:	48 8d 15 7d 1a 00 00 	lea    0x1a7d(%rip),%rdx        # 404030 <_IO_stdin_used+0x30>
  4025b3:	be 01 00 00 00       	mov    $0x1,%esi
  4025b8:	48 8b 3d c1 4d 00 00 	mov    0x4dc1(%rip),%rdi        # 407380 <stderr@GLIBC_2.2.5>
  4025bf:	b8 00 00 00 00       	mov    $0x0,%eax
  4025c4:	e8 17 fd ff ff       	call   4022e0 <__fprintf_chk@plt>
  4025c9:	bf 08 00 00 00       	mov    $0x8,%edi
  4025ce:	e8 ed fc ff ff       	call   4022c0 <exit@plt>
  4025d3:	48 8b 0e             	mov    (%rsi),%rcx
  4025d6:	48 8d 15 27 1a 00 00 	lea    0x1a27(%rip),%rdx        # 404004 <_IO_stdin_used+0x4>
  4025dd:	be 01 00 00 00       	mov    $0x1,%esi
  4025e2:	48 8b 3d 97 4d 00 00 	mov    0x4d97(%rip),%rdi        # 407380 <stderr@GLIBC_2.2.5>
  4025e9:	b8 00 00 00 00       	mov    $0x0,%eax
  4025ee:	e8 ed fc ff ff       	call   4022e0 <__fprintf_chk@plt>
  4025f3:	bf 08 00 00 00       	mov    $0x8,%edi
  4025f8:	e8 c3 fc ff ff       	call   4022c0 <exit@plt>

00000000004025fd <func4>:
  4025fd:	48 83 ec 08          	sub    $0x8,%rsp
  402601:	48 89 d1             	mov    %rdx,%rcx
  402604:	48 29 f1             	sub    %rsi,%rcx
  402607:	48 89 c8             	mov    %rcx,%rax
  40260a:	48 c1 e8 3f          	shr    $0x3f,%rax
  40260e:	48 01 c8             	add    %rcx,%rax
  402611:	48 d1 f8             	sar    %rax
  402614:	48 01 f0             	add    %rsi,%rax
  402617:	48 39 f8             	cmp    %rdi,%rax
  40261a:	7f 0c                	jg     402628 <func4+0x2b>
  40261c:	7c 18                	jl     402636 <func4+0x39>
  40261e:	b8 00 00 00 00       	mov    $0x0,%eax
  402623:	48 83 c4 08          	add    $0x8,%rsp
  402627:	c3                   	ret    
  402628:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  40262c:	e8 cc ff ff ff       	call   4025fd <func4>
  402631:	48 01 c0             	add    %rax,%rax
  402634:	eb ed                	jmp    402623 <func4+0x26>
  402636:	48 8d 70 01          	lea    0x1(%rax),%rsi
  40263a:	e8 be ff ff ff       	call   4025fd <func4>
  40263f:	48 8d 44 00 01       	lea    0x1(%rax,%rax,1),%rax
  402644:	eb dd                	jmp    402623 <func4+0x26>

0000000000402646 <fun7>:
  402646:	48 85 ff             	test   %rdi,%rdi
  402649:	74 43                	je     40268e <fun7+0x48>
  40264b:	48 83 ec 08          	sub    $0x8,%rsp
  40264f:	48 8b 02             	mov    (%rdx),%rax
  402652:	48 c1 e0 08          	shl    $0x8,%rax
  402656:	48 03 07             	add    (%rdi),%rax
  402659:	48 89 02             	mov    %rax,(%rdx)
  40265c:	48 8b 07             	mov    (%rdi),%rax
  40265f:	48 39 f0             	cmp    %rsi,%rax
  402662:	77 0c                	ja     402670 <fun7+0x2a>
  402664:	75 18                	jne    40267e <fun7+0x38>
  402666:	b8 00 00 00 00       	mov    $0x0,%eax
  40266b:	48 83 c4 08          	add    $0x8,%rsp
  40266f:	c3                   	ret    
  402670:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  402674:	e8 cd ff ff ff       	call   402646 <fun7>
  402679:	48 01 c0             	add    %rax,%rax
  40267c:	eb ed                	jmp    40266b <fun7+0x25>
  40267e:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  402682:	e8 bf ff ff ff       	call   402646 <fun7>
  402687:	48 8d 44 00 01       	lea    0x1(%rax,%rax,1),%rax
  40268c:	eb dd                	jmp    40266b <fun7+0x25>
  40268e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402695:	c3                   	ret    

0000000000402696 <phase_1>:
  402696:	48 83 ec 08          	sub    $0x8,%rsp
  40269a:	48 8d 35 7f 4b 00 00 	lea    0x4b7f(%rip),%rsi        # 407220 <sval>
  4026a1:	e8 9c 0b 00 00       	call   403242 <strings_not_equal>
  4026a6:	84 c0                	test   %al,%al
  4026a8:	75 05                	jne    4026af <phase_1+0x19>
  4026aa:	48 83 c4 08          	add    $0x8,%rsp
  4026ae:	c3                   	ret    
  4026af:	e8 aa 0e 00 00       	call   40355e <explode_bomb>

00000000004026b4 <phase_2>:
  4026b4:	48 83 ec 48          	sub    $0x48,%rsp
  4026b8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4026bf:	00 00 
  4026c1:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
  4026c6:	31 c0                	xor    %eax,%eax
  4026c8:	48 89 e6             	mov    %rsp,%rsi
  4026cb:	e8 c2 0e 00 00       	call   403592 <read_six_numbers>
  4026d0:	48 8b 04 24          	mov    (%rsp),%rax
  4026d4:	48 83 f8 01          	cmp    $0x1,%rax
  4026d8:	75 1a                	jne    4026f4 <phase_2+0x40>
  4026da:	48 83 f8 05          	cmp    $0x5,%rax
  4026de:	7f 1e                	jg     4026fe <phase_2+0x4a>
  4026e0:	48 89 c2             	mov    %rax,%rdx
  4026e3:	48 03 54 c4 f8       	add    -0x8(%rsp,%rax,8),%rdx
  4026e8:	48 39 14 c4          	cmp    %rdx,(%rsp,%rax,8)
  4026ec:	75 0b                	jne    4026f9 <phase_2+0x45>
  4026ee:	48 83 c0 01          	add    $0x1,%rax
  4026f2:	eb e6                	jmp    4026da <phase_2+0x26>
  4026f4:	e8 65 0e 00 00       	call   40355e <explode_bomb>
  4026f9:	e8 60 0e 00 00       	call   40355e <explode_bomb>
  4026fe:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
  402703:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  40270a:	00 00 
  40270c:	75 05                	jne    402713 <phase_2+0x5f>
  40270e:	48 83 c4 48          	add    $0x48,%rsp
  402712:	c3                   	ret    
  402713:	e8 08 fa ff ff       	call   402120 <__stack_chk_fail@plt>

0000000000402718 <phase_3>:
  402718:	48 83 ec 28          	sub    $0x28,%rsp
  40271c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402723:	00 00 
  402725:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  40272a:	31 c0                	xor    %eax,%eax
  40272c:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
  402731:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  402736:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  40273b:	48 8d 35 1d 1a 00 00 	lea    0x1a1d(%rip),%rsi        # 40415f <_IO_stdin_used+0x15f>
  402742:	e8 b9 fa ff ff       	call   402200 <__isoc99_sscanf@plt>
  402747:	83 f8 02             	cmp    $0x2,%eax
  40274a:	7e 21                	jle    40276d <phase_3+0x55>
  40274c:	48 83 7c 24 08 08    	cmpq   $0x8,0x8(%rsp)
  402752:	0f 87 e4 00 00 00    	ja     40283c <phase_3+0x124>
  402758:	48 8d 15 21 1a 00 00 	lea    0x1a21(%rip),%rdx        # 404180 <_IO_stdin_used+0x180>
  40275f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  402764:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  402768:	48 01 d0             	add    %rdx,%rax
  40276b:	ff e0                	jmp    *%rax
  40276d:	e8 ec 0d 00 00       	call   40355e <explode_bomb>
  402772:	48 83 7c 24 10 35    	cmpq   $0x35,0x10(%rsp)
  402778:	75 28                	jne    4027a2 <phase_3+0x8a>
  40277a:	b8 7a 00 00 00       	mov    $0x7a,%eax
  40277f:	38 44 24 07          	cmp    %al,0x7(%rsp)
  402783:	0f 85 b8 00 00 00    	jne    402841 <phase_3+0x129>
  402789:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  40278e:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  402795:	00 00 
  402797:	0f 85 a9 00 00 00    	jne    402846 <phase_3+0x12e>
  40279d:	48 83 c4 28          	add    $0x28,%rsp
  4027a1:	c3                   	ret    
  4027a2:	e8 b7 0d 00 00       	call   40355e <explode_bomb>
  4027a7:	48 83 7c 24 10 54    	cmpq   $0x54,0x10(%rsp)
  4027ad:	75 07                	jne    4027b6 <phase_3+0x9e>
  4027af:	b8 69 00 00 00       	mov    $0x69,%eax
  4027b4:	eb c9                	jmp    40277f <phase_3+0x67>
  4027b6:	e8 a3 0d 00 00       	call   40355e <explode_bomb>
  4027bb:	48 83 7c 24 10 21    	cmpq   $0x21,0x10(%rsp)
  4027c1:	75 07                	jne    4027ca <phase_3+0xb2>
  4027c3:	b8 78 00 00 00       	mov    $0x78,%eax
  4027c8:	eb b5                	jmp    40277f <phase_3+0x67>
  4027ca:	e8 8f 0d 00 00       	call   40355e <explode_bomb>
  4027cf:	48 83 7c 24 10 5d    	cmpq   $0x5d,0x10(%rsp)
  4027d5:	75 07                	jne    4027de <phase_3+0xc6>
  4027d7:	b8 63 00 00 00       	mov    $0x63,%eax
  4027dc:	eb a1                	jmp    40277f <phase_3+0x67>
  4027de:	e8 7b 0d 00 00       	call   40355e <explode_bomb>
  4027e3:	48 83 7c 24 10 45    	cmpq   $0x45,0x10(%rsp)
  4027e9:	75 07                	jne    4027f2 <phase_3+0xda>
  4027eb:	b8 69 00 00 00       	mov    $0x69,%eax
  4027f0:	eb 8d                	jmp    40277f <phase_3+0x67>
  4027f2:	e8 67 0d 00 00       	call   40355e <explode_bomb>
  4027f7:	48 83 7c 24 10 38    	cmpq   $0x38,0x10(%rsp)
  4027fd:	75 0a                	jne    402809 <phase_3+0xf1>
  4027ff:	b8 79 00 00 00       	mov    $0x79,%eax
  402804:	e9 76 ff ff ff       	jmp    40277f <phase_3+0x67>
  402809:	e8 50 0d 00 00       	call   40355e <explode_bomb>
  40280e:	48 83 7c 24 10 1e    	cmpq   $0x1e,0x10(%rsp)
  402814:	75 0a                	jne    402820 <phase_3+0x108>
  402816:	b8 66 00 00 00       	mov    $0x66,%eax
  40281b:	e9 5f ff ff ff       	jmp    40277f <phase_3+0x67>
  402820:	e8 39 0d 00 00       	call   40355e <explode_bomb>
  402825:	48 83 7c 24 10 24    	cmpq   $0x24,0x10(%rsp)
  40282b:	75 0a                	jne    402837 <phase_3+0x11f>
  40282d:	b8 62 00 00 00       	mov    $0x62,%eax
  402832:	e9 48 ff ff ff       	jmp    40277f <phase_3+0x67>
  402837:	e8 22 0d 00 00       	call   40355e <explode_bomb>
  40283c:	e8 1d 0d 00 00       	call   40355e <explode_bomb>
  402841:	e8 18 0d 00 00       	call   40355e <explode_bomb>
  402846:	e8 d5 f8 ff ff       	call   402120 <__stack_chk_fail@plt>

000000000040284b <phase_4>:
  40284b:	48 83 ec 28          	sub    $0x28,%rsp
  40284f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402856:	00 00 
  402858:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  40285d:	31 c0                	xor    %eax,%eax
  40285f:	48 8d 4c 24 10       	lea    0x10(%rsp),%rcx
  402864:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  402869:	48 8d 35 fe 1b 00 00 	lea    0x1bfe(%rip),%rsi        # 40446e <__PRETTY_FUNCTION__.0+0xce>
  402870:	e8 8b f9 ff ff       	call   402200 <__isoc99_sscanf@plt>
  402875:	83 f8 02             	cmp    $0x2,%eax
  402878:	75 42                	jne    4028bc <phase_4+0x71>
  40287a:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  40287f:	48 85 ff             	test   %rdi,%rdi
  402882:	78 38                	js     4028bc <phase_4+0x71>
  402884:	48 83 ff 0e          	cmp    $0xe,%rdi
  402888:	7f 32                	jg     4028bc <phase_4+0x71>
  40288a:	ba 0e 00 00 00       	mov    $0xe,%edx
  40288f:	be 00 00 00 00       	mov    $0x0,%esi
  402894:	e8 64 fd ff ff       	call   4025fd <func4>
  402899:	48 83 f8 03          	cmp    $0x3,%rax
  40289d:	75 22                	jne    4028c1 <phase_4+0x76>
  40289f:	48 83 7c 24 10 03    	cmpq   $0x3,0x10(%rsp)
  4028a5:	75 1a                	jne    4028c1 <phase_4+0x76>
  4028a7:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4028ac:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  4028b3:	00 00 
  4028b5:	75 0f                	jne    4028c6 <phase_4+0x7b>
  4028b7:	48 83 c4 28          	add    $0x28,%rsp
  4028bb:	c3                   	ret    
  4028bc:	e8 9d 0c 00 00       	call   40355e <explode_bomb>
  4028c1:	e8 98 0c 00 00       	call   40355e <explode_bomb>
  4028c6:	e8 55 f8 ff ff       	call   402120 <__stack_chk_fail@plt>

00000000004028cb <phase_5>:
  4028cb:	53                   	push   %rbx
  4028cc:	48 89 fb             	mov    %rdi,%rbx
  4028cf:	e8 59 09 00 00       	call   40322d <string_length>
  4028d4:	48 83 f8 06          	cmp    $0x6,%rax
  4028d8:	75 0c                	jne    4028e6 <phase_5+0x1b>
  4028da:	ba 00 00 00 00       	mov    $0x0,%edx
  4028df:	b8 00 00 00 00       	mov    $0x0,%eax
  4028e4:	eb 1f                	jmp    402905 <phase_5+0x3a>
  4028e6:	e8 73 0c 00 00       	call   40355e <explode_bomb>
  4028eb:	48 c1 e2 04          	shl    $0x4,%rdx
  4028ef:	0f b6 0c 03          	movzbl (%rbx,%rax,1),%ecx
  4028f3:	83 e1 0f             	and    $0xf,%ecx
  4028f6:	48 8d 35 c3 18 00 00 	lea    0x18c3(%rip),%rsi        # 4041c0 <array.0>
  4028fd:	48 03 14 ce          	add    (%rsi,%rcx,8),%rdx
  402901:	48 83 c0 01          	add    $0x1,%rax
  402905:	48 83 f8 05          	cmp    $0x5,%rax
  402909:	7e e0                	jle    4028eb <phase_5+0x20>
  40290b:	48 81 fa 73 28 25 00 	cmp    $0x252873,%rdx
  402912:	75 02                	jne    402916 <phase_5+0x4b>
  402914:	5b                   	pop    %rbx
  402915:	c3                   	ret    
  402916:	e8 43 0c 00 00       	call   40355e <explode_bomb>

000000000040291b <phase_6>:
  40291b:	48 83 ec 78          	sub    $0x78,%rsp
  40291f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402926:	00 00 
  402928:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  40292d:	31 c0                	xor    %eax,%eax
  40292f:	48 89 e6             	mov    %rsp,%rsi
  402932:	e8 5b 0c 00 00       	call   403592 <read_six_numbers>
  402937:	b9 00 00 00 00       	mov    $0x0,%ecx
  40293c:	48 83 f9 05          	cmp    $0x5,%rcx
  402940:	7f 31                	jg     402973 <phase_6+0x58>
  402942:	48 8b 14 cc          	mov    (%rsp,%rcx,8),%rdx
  402946:	48 8d 42 ff          	lea    -0x1(%rdx),%rax
  40294a:	48 83 f8 05          	cmp    $0x5,%rax
  40294e:	77 09                	ja     402959 <phase_6+0x3e>
  402950:	48 83 c1 01          	add    $0x1,%rcx
  402954:	48 89 c8             	mov    %rcx,%rax
  402957:	eb 09                	jmp    402962 <phase_6+0x47>
  402959:	e8 00 0c 00 00       	call   40355e <explode_bomb>
  40295e:	48 83 c0 01          	add    $0x1,%rax
  402962:	48 83 f8 05          	cmp    $0x5,%rax
  402966:	7f d4                	jg     40293c <phase_6+0x21>
  402968:	48 3b 14 c4          	cmp    (%rsp,%rax,8),%rdx
  40296c:	75 f0                	jne    40295e <phase_6+0x43>
  40296e:	e8 eb 0b 00 00       	call   40355e <explode_bomb>
  402973:	b8 00 00 00 00       	mov    $0x0,%eax
  402978:	eb 11                	jmp    40298b <phase_6+0x70>
  40297a:	ba 07 00 00 00       	mov    $0x7,%edx
  40297f:	48 2b 14 c4          	sub    (%rsp,%rax,8),%rdx
  402983:	48 89 14 c4          	mov    %rdx,(%rsp,%rax,8)
  402987:	48 83 c0 01          	add    $0x1,%rax
  40298b:	48 83 f8 05          	cmp    $0x5,%rax
  40298f:	7e e9                	jle    40297a <phase_6+0x5f>
  402991:	b9 00 00 00 00       	mov    $0x0,%ecx
  402996:	eb 09                	jmp    4029a1 <phase_6+0x86>
  402998:	48 89 54 cc 30       	mov    %rdx,0x30(%rsp,%rcx,8)
  40299d:	48 83 c1 01          	add    $0x1,%rcx
  4029a1:	48 83 f9 05          	cmp    $0x5,%rcx
  4029a5:	7f 1c                	jg     4029c3 <phase_6+0xa8>
  4029a7:	b8 01 00 00 00       	mov    $0x1,%eax
  4029ac:	48 8d 15 ad 48 00 00 	lea    0x48ad(%rip),%rdx        # 407260 <node1>
  4029b3:	48 39 04 cc          	cmp    %rax,(%rsp,%rcx,8)
  4029b7:	7e df                	jle    402998 <phase_6+0x7d>
  4029b9:	48 8b 52 10          	mov    0x10(%rdx),%rdx
  4029bd:	48 83 c0 01          	add    $0x1,%rax
  4029c1:	eb f0                	jmp    4029b3 <phase_6+0x98>
  4029c3:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
  4029c8:	48 89 c6             	mov    %rax,%rsi
  4029cb:	ba 01 00 00 00       	mov    $0x1,%edx
  4029d0:	eb 10                	jmp    4029e2 <phase_6+0xc7>
  4029d2:	48 8b 4c d4 30       	mov    0x30(%rsp,%rdx,8),%rcx
  4029d7:	48 89 4e 10          	mov    %rcx,0x10(%rsi)
  4029db:	48 83 c2 01          	add    $0x1,%rdx
  4029df:	48 89 ce             	mov    %rcx,%rsi
  4029e2:	48 83 fa 05          	cmp    $0x5,%rdx
  4029e6:	7e ea                	jle    4029d2 <phase_6+0xb7>
  4029e8:	48 c7 46 10 00 00 00 	movq   $0x0,0x10(%rsi)
  4029ef:	00 
  4029f0:	ba 00 00 00 00       	mov    $0x0,%edx
  4029f5:	48 83 fa 04          	cmp    $0x4,%rdx
  4029f9:	7f 17                	jg     402a12 <phase_6+0xf7>
  4029fb:	48 8b 08             	mov    (%rax),%rcx
  4029fe:	48 8b 40 10          	mov    0x10(%rax),%rax
  402a02:	48 3b 08             	cmp    (%rax),%rcx
  402a05:	7c 06                	jl     402a0d <phase_6+0xf2>
  402a07:	48 83 c2 01          	add    $0x1,%rdx
  402a0b:	eb e8                	jmp    4029f5 <phase_6+0xda>
  402a0d:	e8 4c 0b 00 00       	call   40355e <explode_bomb>
  402a12:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  402a17:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  402a1e:	00 00 
  402a20:	75 05                	jne    402a27 <phase_6+0x10c>
  402a22:	48 83 c4 78          	add    $0x78,%rsp
  402a26:	c3                   	ret    
  402a27:	e8 f4 f6 ff ff       	call   402120 <__stack_chk_fail@plt>

0000000000402a2c <secret_phase>:
  402a2c:	48 83 ec 28          	sub    $0x28,%rsp
  402a30:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402a37:	00 00 
  402a39:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402a3e:	31 c0                	xor    %eax,%eax
  402a40:	e8 95 0a 00 00       	call   4034da <read_line>
  402a45:	48 89 c7             	mov    %rax,%rdi
  402a48:	48 c7 44 24 10 00 00 	movq   $0x0,0x10(%rsp)
  402a4f:	00 00 
  402a51:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
  402a56:	48 89 e2             	mov    %rsp,%rdx
  402a59:	48 8d 35 0a 17 00 00 	lea    0x170a(%rip),%rsi        # 40416a <_IO_stdin_used+0x16a>
  402a60:	b8 00 00 00 00       	mov    $0x0,%eax
  402a65:	e8 96 f7 ff ff       	call   402200 <__isoc99_sscanf@plt>
  402a6a:	83 f8 02             	cmp    $0x2,%eax
  402a6d:	75 46                	jne    402ab5 <secret_phase+0x89>
  402a6f:	48 8b 34 24          	mov    (%rsp),%rsi
  402a73:	48 8d 46 a1          	lea    -0x5f(%rsi),%rax
  402a77:	48 83 f8 7a          	cmp    $0x7a,%rax
  402a7b:	77 3d                	ja     402aba <secret_phase+0x8e>
  402a7d:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
  402a82:	48 8d 3d f7 41 00 00 	lea    0x41f7(%rip),%rdi        # 406c80 <n1>
  402a89:	e8 b8 fb ff ff       	call   402646 <fun7>
  402a8e:	48 83 f8 05          	cmp    $0x5,%rax
  402a92:	75 2b                	jne    402abf <secret_phase+0x93>
  402a94:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  402a99:	48 39 44 24 10       	cmp    %rax,0x10(%rsp)
  402a9e:	75 24                	jne    402ac4 <secret_phase+0x98>
  402aa0:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  402aa5:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  402aac:	00 00 
  402aae:	75 19                	jne    402ac9 <secret_phase+0x9d>
  402ab0:	48 83 c4 28          	add    $0x28,%rsp
  402ab4:	c3                   	ret    
  402ab5:	e8 a4 0a 00 00       	call   40355e <explode_bomb>
  402aba:	e8 9f 0a 00 00       	call   40355e <explode_bomb>
  402abf:	e8 9a 0a 00 00       	call   40355e <explode_bomb>
  402ac4:	e8 95 0a 00 00       	call   40355e <explode_bomb>
  402ac9:	e8 52 f6 ff ff       	call   402120 <__stack_chk_fail@plt>

0000000000402ace <fs>:
  402ace:	b9 00 00 00 00       	mov    $0x0,%ecx
  402ad3:	eb 06                	jmp    402adb <fs+0xd>
  402ad5:	c6 02 6f             	movb   $0x6f,(%rdx)
  402ad8:	83 c1 01             	add    $0x1,%ecx
  402adb:	48 63 d1             	movslq %ecx,%rdx
  402ade:	48 01 fa             	add    %rdi,%rdx
  402ae1:	0f b6 02             	movzbl (%rdx),%eax
  402ae4:	84 c0                	test   %al,%al
  402ae6:	74 2e                	je     402b16 <fs+0x48>
  402ae8:	83 e8 61             	sub    $0x61,%eax
  402aeb:	3c 14                	cmp    $0x14,%al
  402aed:	77 e9                	ja     402ad8 <fs+0xa>
  402aef:	0f b6 c0             	movzbl %al,%eax
  402af2:	48 8d 35 47 18 00 00 	lea    0x1847(%rip),%rsi        # 404340 <n48+0x20>
  402af9:	48 63 04 86          	movslq (%rsi,%rax,4),%rax
  402afd:	48 01 f0             	add    %rsi,%rax
  402b00:	ff e0                	jmp    *%rax
  402b02:	c6 02 69             	movb   $0x69,(%rdx)
  402b05:	eb d1                	jmp    402ad8 <fs+0xa>
  402b07:	c6 02 65             	movb   $0x65,(%rdx)
  402b0a:	eb cc                	jmp    402ad8 <fs+0xa>
  402b0c:	c6 02 61             	movb   $0x61,(%rdx)
  402b0f:	eb c7                	jmp    402ad8 <fs+0xa>
  402b11:	c6 02 75             	movb   $0x75,(%rdx)
  402b14:	eb c2                	jmp    402ad8 <fs+0xa>
  402b16:	c3                   	ret    

0000000000402b17 <safe_print>:
  402b17:	55                   	push   %rbp
  402b18:	53                   	push   %rbx
  402b19:	48 83 ec 08          	sub    $0x8,%rsp
  402b1d:	48 89 fd             	mov    %rdi,%rbp
  402b20:	e8 eb f5 ff ff       	call   402110 <strlen@plt>
  402b25:	48 89 c3             	mov    %rax,%rbx
  402b28:	eb 1b                	jmp    402b45 <safe_print+0x2e>
  402b2a:	48 89 da             	mov    %rbx,%rdx
  402b2d:	48 89 ee             	mov    %rbp,%rsi
  402b30:	bf 01 00 00 00       	mov    $0x1,%edi
  402b35:	e8 96 f5 ff ff       	call   4020d0 <write@plt>
  402b3a:	48 85 c0             	test   %rax,%rax
  402b3d:	78 12                	js     402b51 <safe_print+0x3a>
  402b3f:	48 29 c3             	sub    %rax,%rbx
  402b42:	48 01 c5             	add    %rax,%rbp
  402b45:	48 85 db             	test   %rbx,%rbx
  402b48:	75 e0                	jne    402b2a <safe_print+0x13>
  402b4a:	48 83 c4 08          	add    $0x8,%rsp
  402b4e:	5b                   	pop    %rbx
  402b4f:	5d                   	pop    %rbp
  402b50:	c3                   	ret    
  402b51:	e8 1a f5 ff ff       	call   402070 <abort@plt>

0000000000402b56 <so_you_think>:
  402b56:	53                   	push   %rbx
  402b57:	48 83 ec 50          	sub    $0x50,%rsp
  402b5b:	89 fb                	mov    %edi,%ebx
  402b5d:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402b64:	00 00 
  402b66:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  402b6b:	31 c0                	xor    %eax,%eax
  402b6d:	48 b8 0a 53 6f 20 79 	movabs $0x20756f79206f530a,%rax
  402b74:	6f 75 20 
  402b77:	48 ba 74 68 69 6e 6b 	movabs $0x6f79206b6e696874,%rdx
  402b7e:	20 79 6f 
  402b81:	48 89 04 24          	mov    %rax,(%rsp)
  402b85:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
  402b8a:	48 b8 75 20 63 61 6e 	movabs $0x7473206e61632075,%rax
  402b91:	20 73 74 
  402b94:	48 ba 6f 70 20 74 68 	movabs $0x622065687420706f,%rdx
  402b9b:	65 20 62 
  402b9e:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  402ba3:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
  402ba8:	48 b8 6f 6d 62 20 77 	movabs $0x6874697720626d6f,%rax
  402baf:	69 74 68 
  402bb2:	48 ba 20 63 74 72 6c 	movabs $0x2c212d6c72746320,%rdx
  402bb9:	2d 21 2c 
  402bbc:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
  402bc1:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
  402bc6:	48 b8 20 64 6f 20 79 	movabs $0x3f756f79206f6420,%rax
  402bcd:	6f 75 3f 
  402bd0:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  402bd5:	66 c7 44 24 38 0a 00 	movw   $0xa,0x38(%rsp)
  402bdc:	48 89 e7             	mov    %rsp,%rdi
  402bdf:	be 21 00 00 00       	mov    $0x21,%esi
  402be4:	e8 57 f5 ff ff       	call   402140 <strchr@plt>
  402be9:	83 fb ff             	cmp    $0xffffffff,%ebx
  402bec:	74 0f                	je     402bfd <so_you_think+0xa7>
  402bee:	83 fb 02             	cmp    $0x2,%ebx
  402bf1:	74 4b                	je     402c3e <so_you_think+0xe8>
  402bf3:	83 fb 03             	cmp    $0x3,%ebx
  402bf6:	75 08                	jne    402c00 <so_you_think+0xaa>
  402bf8:	c6 00 5c             	movb   $0x5c,(%rax)
  402bfb:	eb 03                	jmp    402c00 <so_you_think+0xaa>
  402bfd:	c6 00 44             	movb   $0x44,(%rax)
  402c00:	48 89 e7             	mov    %rsp,%rdi
  402c03:	e8 0f ff ff ff       	call   402b17 <safe_print>
  402c08:	bf 03 00 00 00       	mov    $0x3,%edi
  402c0d:	e8 1e f7 ff ff       	call   402330 <sleep@plt>
  402c12:	48 8d 3d a0 17 00 00 	lea    0x17a0(%rip),%rdi        # 4043b9 <__PRETTY_FUNCTION__.0+0x19>
  402c19:	e8 f9 fe ff ff       	call   402b17 <safe_print>
  402c1e:	bf 01 00 00 00       	mov    $0x1,%edi
  402c23:	e8 08 f7 ff ff       	call   402330 <sleep@plt>
  402c28:	48 8d 3d 92 17 00 00 	lea    0x1792(%rip),%rdi        # 4043c1 <__PRETTY_FUNCTION__.0+0x21>
  402c2f:	e8 e3 fe ff ff       	call   402b17 <safe_print>
  402c34:	bf 10 00 00 00       	mov    $0x10,%edi
  402c39:	e8 62 f4 ff ff       	call   4020a0 <_exit@plt>
  402c3e:	c6 00 43             	movb   $0x43,(%rax)
  402c41:	eb bd                	jmp    402c00 <so_you_think+0xaa>

0000000000402c43 <generate_submission>:
  402c43:	55                   	push   %rbp
  402c44:	53                   	push   %rbx
  402c45:	48 83 ec 10          	sub    $0x10,%rsp
  402c49:	48 89 fd             	mov    %rdi,%rbp
  402c4c:	49 89 f1             	mov    %rsi,%r9
  402c4f:	ff 35 7b 47 00 00    	push   0x477b(%rip)        # 4073d0 <num_input_strings>
  402c55:	44 8b 05 88 1e 00 00 	mov    0x1e88(%rip),%r8d        # 404ae4 <bomb_id>
  402c5c:	48 8b 0d 65 47 00 00 	mov    0x4765(%rip),%rcx        # 4073c8 <student_id>
  402c63:	48 8d 15 36 18 00 00 	lea    0x1836(%rip),%rdx        # 4044a0 <__PRETTY_FUNCTION__.0+0x100>
  402c6a:	be 01 00 00 00       	mov    $0x1,%esi
  402c6f:	b8 00 00 00 00       	mov    $0x0,%eax
  402c74:	e8 67 f6 ff ff       	call   4022e0 <__fprintf_chk@plt>
  402c79:	48 83 c4 10          	add    $0x10,%rsp
  402c7d:	bb 00 00 00 00       	mov    $0x0,%ebx
  402c82:	eb 28                	jmp    402cac <generate_submission+0x69>
  402c84:	48 8d 05 55 47 00 00 	lea    0x4755(%rip),%rax        # 4073e0 <input_strings>
  402c8b:	48 8b 0c d8          	mov    (%rax,%rbx,8),%rcx
  402c8f:	48 8d 15 0e 1c 00 00 	lea    0x1c0e(%rip),%rdx        # 4048a4 <__PRETTY_FUNCTION__.0+0x504>
  402c96:	be 01 00 00 00       	mov    $0x1,%esi
  402c9b:	48 89 ef             	mov    %rbp,%rdi
  402c9e:	b8 00 00 00 00       	mov    $0x0,%eax
  402ca3:	e8 38 f6 ff ff       	call   4022e0 <__fprintf_chk@plt>
  402ca8:	48 83 c3 01          	add    $0x1,%rbx
  402cac:	48 39 1d 1d 47 00 00 	cmp    %rbx,0x471d(%rip)        # 4073d0 <num_input_strings>
  402cb3:	77 cf                	ja     402c84 <generate_submission+0x41>
  402cb5:	b8 00 00 00 00       	mov    $0x0,%eax
  402cba:	48 83 c4 08          	add    $0x8,%rsp
  402cbe:	5b                   	pop    %rbx
  402cbf:	5d                   	pop    %rbp
  402cc0:	c3                   	ret    

0000000000402cc1 <open_submission_record>:
  402cc1:	41 54                	push   %r12
  402cc3:	55                   	push   %rbp
  402cc4:	53                   	push   %rbx
  402cc5:	48 83 ec 10          	sub    $0x10,%rsp
  402cc9:	48 89 fd             	mov    %rdi,%rbp
  402ccc:	89 f3                	mov    %esi,%ebx
  402cce:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402cd5:	00 00 
  402cd7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  402cdc:	31 c0                	xor    %eax,%eax
  402cde:	48 8b 3d bb 46 00 00 	mov    0x46bb(%rip),%rdi        # 4073a0 <submission_record_file>
  402ce5:	48 85 ff             	test   %rdi,%rdi
  402ce8:	74 2c                	je     402d16 <open_submission_record+0x55>
  402cea:	83 cb 40             	or     $0x40,%ebx
  402ced:	89 de                	mov    %ebx,%esi
  402cef:	ba 80 01 00 00       	mov    $0x180,%edx
  402cf4:	e8 77 f5 ff ff       	call   402270 <open@plt>
  402cf9:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  402cfe:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  402d05:	00 00 
  402d07:	0f 85 01 01 00 00    	jne    402e0e <open_submission_record+0x14d>
  402d0d:	48 83 c4 10          	add    $0x10,%rsp
  402d11:	5b                   	pop    %rbx
  402d12:	5d                   	pop    %rbp
  402d13:	41 5c                	pop    %r12
  402d15:	c3                   	ret    
  402d16:	48 8d 35 ad 16 00 00 	lea    0x16ad(%rip),%rsi        # 4043ca <__PRETTY_FUNCTION__.0+0x2a>
  402d1d:	4c 8d 25 ac 1d 00 00 	lea    0x1dac(%rip),%r12        # 404ad0 <course_and_lab>
  402d24:	4c 89 e7             	mov    %r12,%rdi
  402d27:	e8 64 f4 ff ff       	call   402190 <strcspn@plt>
  402d2c:	48 89 e7             	mov    %rsp,%rdi
  402d2f:	48 83 ec 08          	sub    $0x8,%rsp
  402d33:	8b 15 ab 1d 00 00    	mov    0x1dab(%rip),%edx        # 404ae4 <bomb_id>
  402d39:	52                   	push   %rdx
  402d3a:	4d 89 e1             	mov    %r12,%r9
  402d3d:	41 89 c0             	mov    %eax,%r8d
  402d40:	48 89 e9             	mov    %rbp,%rcx
  402d43:	48 8d 15 96 17 00 00 	lea    0x1796(%rip),%rdx        # 4044e0 <__PRETTY_FUNCTION__.0+0x140>
  402d4a:	be 01 00 00 00       	mov    $0x1,%esi
  402d4f:	b8 00 00 00 00       	mov    $0x0,%eax
  402d54:	e8 57 f4 ff ff       	call   4021b0 <__asprintf_chk@plt>
  402d59:	48 83 c4 10          	add    $0x10,%rsp
  402d5d:	83 f8 ff             	cmp    $0xffffffff,%eax
  402d60:	74 97                	je     402cf9 <open_submission_record+0x38>
  402d62:	83 cb 40             	or     $0x40,%ebx
  402d65:	ba 80 01 00 00       	mov    $0x180,%edx
  402d6a:	89 de                	mov    %ebx,%esi
  402d6c:	48 8b 3c 24          	mov    (%rsp),%rdi
  402d70:	b8 00 00 00 00       	mov    $0x0,%eax
  402d75:	e8 f6 f4 ff ff       	call   402270 <open@plt>
  402d7a:	85 c0                	test   %eax,%eax
  402d7c:	79 60                	jns    402dde <open_submission_record+0x11d>
  402d7e:	e8 fd f2 ff ff       	call   402080 <__errno_location@plt>
  402d83:	49 89 c4             	mov    %rax,%r12
  402d86:	83 38 02             	cmpl   $0x2,(%rax)
  402d89:	75 68                	jne    402df3 <open_submission_record+0x132>
  402d8b:	be 2f 00 00 00       	mov    $0x2f,%esi
  402d90:	48 8b 3c 24          	mov    (%rsp),%rdi
  402d94:	e8 b7 f3 ff ff       	call   402150 <strrchr@plt>
  402d99:	48 89 c5             	mov    %rax,%rbp
  402d9c:	48 85 c0             	test   %rax,%rax
  402d9f:	74 4d                	je     402dee <open_submission_record+0x12d>
  402da1:	c6 00 00             	movb   $0x0,(%rax)
  402da4:	be ff 01 00 00       	mov    $0x1ff,%esi
  402da9:	48 8b 3c 24          	mov    (%rsp),%rdi
  402dad:	e8 fe f2 ff ff       	call   4020b0 <mkdir@plt>
  402db2:	85 c0                	test   %eax,%eax
  402db4:	75 3d                	jne    402df3 <open_submission_record+0x132>
  402db6:	c6 45 00 2f          	movb   $0x2f,0x0(%rbp)
  402dba:	ba 80 01 00 00       	mov    $0x180,%edx
  402dbf:	89 de                	mov    %ebx,%esi
  402dc1:	48 8b 3c 24          	mov    (%rsp),%rdi
  402dc5:	e8 a6 f4 ff ff       	call   402270 <open@plt>
  402dca:	85 c0                	test   %eax,%eax
  402dcc:	78 25                	js     402df3 <open_submission_record+0x132>
  402dce:	48 8b 14 24          	mov    (%rsp),%rdx
  402dd2:	48 89 15 c7 45 00 00 	mov    %rdx,0x45c7(%rip)        # 4073a0 <submission_record_file>
  402dd9:	e9 1b ff ff ff       	jmp    402cf9 <open_submission_record+0x38>
  402dde:	48 8b 14 24          	mov    (%rsp),%rdx
  402de2:	48 89 15 b7 45 00 00 	mov    %rdx,0x45b7(%rip)        # 4073a0 <submission_record_file>
  402de9:	e9 0b ff ff ff       	jmp    402cf9 <open_submission_record+0x38>
  402dee:	e8 7d f2 ff ff       	call   402070 <abort@plt>
  402df3:	41 8b 1c 24          	mov    (%r12),%ebx
  402df7:	48 8b 3c 24          	mov    (%rsp),%rdi
  402dfb:	e8 40 f2 ff ff       	call   402040 <free@plt>
  402e00:	41 89 1c 24          	mov    %ebx,(%r12)
  402e04:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402e09:	e9 eb fe ff ff       	jmp    402cf9 <open_submission_record+0x38>
  402e0e:	e8 0d f3 ff ff       	call   402120 <__stack_chk_fail@plt>

0000000000402e13 <read_submission_record>:
  402e13:	53                   	push   %rbx
  402e14:	48 81 ec b0 00 00 00 	sub    $0xb0,%rsp
  402e1b:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402e22:	00 00 
  402e24:	48 89 84 24 a8 00 00 	mov    %rax,0xa8(%rsp)
  402e2b:	00 
  402e2c:	31 c0                	xor    %eax,%eax
  402e2e:	be 00 00 00 00       	mov    $0x0,%esi
  402e33:	e8 89 fe ff ff       	call   402cc1 <open_submission_record>
  402e38:	83 f8 ff             	cmp    $0xffffffff,%eax
  402e3b:	0f 84 c9 00 00 00    	je     402f0a <read_submission_record+0xf7>
  402e41:	89 c3                	mov    %eax,%ebx
  402e43:	48 8d b4 24 a5 00 00 	lea    0xa5(%rsp),%rsi
  402e4a:	00 
  402e4b:	ba 02 00 00 00       	mov    $0x2,%edx
  402e50:	89 c7                	mov    %eax,%edi
  402e52:	e8 49 f3 ff ff       	call   4021a0 <read@plt>
  402e57:	48 85 c0             	test   %rax,%rax
  402e5a:	0f 88 c0 00 00 00    	js     402f20 <read_submission_record+0x10d>
  402e60:	0f 84 d0 00 00 00    	je     402f36 <read_submission_record+0x123>
  402e66:	c6 84 04 a5 00 00 00 	movb   $0x0,0xa5(%rsp,%rax,1)
  402e6d:	00 
  402e6e:	48 8d 74 24 08       	lea    0x8(%rsp),%rsi
  402e73:	48 8d bc 24 a5 00 00 	lea    0xa5(%rsp),%rdi
  402e7a:	00 
  402e7b:	ba 0a 00 00 00       	mov    $0xa,%edx
  402e80:	e8 1b f4 ff ff       	call   4022a0 <strtoul@plt>
  402e85:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  402e8a:	48 8d 8c 24 a6 00 00 	lea    0xa6(%rsp),%rcx
  402e91:	00 
  402e92:	48 39 ca             	cmp    %rcx,%rdx
  402e95:	0f 85 c5 00 00 00    	jne    402f60 <read_submission_record+0x14d>
  402e9b:	0f b6 12             	movzbl (%rdx),%edx
  402e9e:	84 d2                	test   %dl,%dl
  402ea0:	0f 95 c1             	setne  %cl
  402ea3:	80 fa 0a             	cmp    $0xa,%dl
  402ea6:	0f 95 c2             	setne  %dl
  402ea9:	84 d1                	test   %dl,%cl
  402eab:	0f 85 af 00 00 00    	jne    402f60 <read_submission_record+0x14d>
  402eb1:	48 83 f8 07          	cmp    $0x7,%rax
  402eb5:	0f 87 a5 00 00 00    	ja     402f60 <read_submission_record+0x14d>
  402ebb:	48 89 05 fe 44 00 00 	mov    %rax,0x44fe(%rip)        # 4073c0 <highest_solved_phase>
  402ec2:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  402ec7:	89 df                	mov    %ebx,%edi
  402ec9:	e8 72 f4 ff ff       	call   402340 <fstat@plt>
  402ece:	85 c0                	test   %eax,%eax
  402ed0:	0f 85 b8 00 00 00    	jne    402f8e <read_submission_record+0x17b>
  402ed6:	f3 0f 6f 44 24 68    	movdqu 0x68(%rsp),%xmm0
  402edc:	0f 29 05 cd 44 00 00 	movaps %xmm0,0x44cd(%rip)        # 4073b0 <most_recent_submission>
  402ee3:	89 df                	mov    %ebx,%edi
  402ee5:	e8 96 f2 ff ff       	call   402180 <close@plt>
  402eea:	48 8b 84 24 a8 00 00 	mov    0xa8(%rsp),%rax
  402ef1:	00 
  402ef2:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  402ef9:	00 00 
  402efb:	0f 85 a3 00 00 00    	jne    402fa4 <read_submission_record+0x191>
  402f01:	48 81 c4 b0 00 00 00 	add    $0xb0,%rsp
  402f08:	5b                   	pop    %rbx
  402f09:	c3                   	ret    
  402f0a:	48 8d 3d ef 15 00 00 	lea    0x15ef(%rip),%rdi        # 404500 <__PRETTY_FUNCTION__.0+0x160>
  402f11:	e8 7a f3 ff ff       	call   402290 <perror@plt>
  402f16:	bf 08 00 00 00       	mov    $0x8,%edi
  402f1b:	e8 a0 f3 ff ff       	call   4022c0 <exit@plt>
  402f20:	48 8d 3d a5 14 00 00 	lea    0x14a5(%rip),%rdi        # 4043cc <__PRETTY_FUNCTION__.0+0x2c>
  402f27:	e8 64 f3 ff ff       	call   402290 <perror@plt>
  402f2c:	bf 08 00 00 00       	mov    $0x8,%edi
  402f31:	e8 8a f3 ff ff       	call   4022c0 <exit@plt>
  402f36:	48 c7 05 7f 44 00 00 	movq   $0x0,0x447f(%rip)        # 4073c0 <highest_solved_phase>
  402f3d:	00 00 00 00 
  402f41:	48 c7 05 64 44 00 00 	movq   $0x0,0x4464(%rip)        # 4073b0 <most_recent_submission>
  402f48:	00 00 00 00 
  402f4c:	48 c7 05 61 44 00 00 	movq   $0x0,0x4461(%rip)        # 4073b8 <most_recent_submission+0x8>
  402f53:	00 00 00 00 
  402f57:	89 df                	mov    %ebx,%edi
  402f59:	e8 22 f2 ff ff       	call   402180 <close@plt>
  402f5e:	eb 8a                	jmp    402eea <read_submission_record+0xd7>
  402f60:	48 8b 0d 39 44 00 00 	mov    0x4439(%rip),%rcx        # 4073a0 <submission_record_file>
  402f67:	48 8d 15 c2 15 00 00 	lea    0x15c2(%rip),%rdx        # 404530 <__PRETTY_FUNCTION__.0+0x190>
  402f6e:	be 01 00 00 00       	mov    $0x1,%esi
  402f73:	48 8b 3d 06 44 00 00 	mov    0x4406(%rip),%rdi        # 407380 <stderr@GLIBC_2.2.5>
  402f7a:	b8 00 00 00 00       	mov    $0x0,%eax
  402f7f:	e8 5c f3 ff ff       	call   4022e0 <__fprintf_chk@plt>
  402f84:	bf 08 00 00 00       	mov    $0x8,%edi
  402f89:	e8 32 f3 ff ff       	call   4022c0 <exit@plt>
  402f8e:	48 8d 3d 50 14 00 00 	lea    0x1450(%rip),%rdi        # 4043e5 <__PRETTY_FUNCTION__.0+0x45>
  402f95:	e8 f6 f2 ff ff       	call   402290 <perror@plt>
  402f9a:	bf 08 00 00 00       	mov    $0x8,%edi
  402f9f:	e8 1c f3 ff ff       	call   4022c0 <exit@plt>
  402fa4:	e8 77 f1 ff ff       	call   402120 <__stack_chk_fail@plt>

0000000000402fa9 <blank_line>:
  402fa9:	55                   	push   %rbp
  402faa:	53                   	push   %rbx
  402fab:	48 83 ec 08          	sub    $0x8,%rsp
  402faf:	48 89 fd             	mov    %rdi,%rbp
  402fb2:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  402fb6:	84 db                	test   %bl,%bl
  402fb8:	74 1e                	je     402fd8 <blank_line+0x2f>
  402fba:	e8 91 f3 ff ff       	call   402350 <__ctype_b_loc@plt>
  402fbf:	48 8b 00             	mov    (%rax),%rax
  402fc2:	48 83 c5 01          	add    $0x1,%rbp
  402fc6:	48 0f be db          	movsbq %bl,%rbx
  402fca:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
  402fcf:	75 e1                	jne    402fb2 <blank_line+0x9>
  402fd1:	b8 00 00 00 00       	mov    $0x0,%eax
  402fd6:	eb 05                	jmp    402fdd <blank_line+0x34>
  402fd8:	b8 01 00 00 00       	mov    $0x1,%eax
  402fdd:	48 83 c4 08          	add    $0x8,%rsp
  402fe1:	5b                   	pop    %rbx
  402fe2:	5d                   	pop    %rbp
  402fe3:	c3                   	ret    

0000000000402fe4 <skip>:
  402fe4:	55                   	push   %rbp
  402fe5:	53                   	push   %rbx
  402fe6:	48 83 ec 28          	sub    $0x28,%rsp
  402fea:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  402ff1:	00 00 
  402ff3:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  402ff8:	31 c0                	xor    %eax,%eax
  402ffa:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  403001:	00 00 
  403003:	48 c7 44 24 10 00 00 	movq   $0x0,0x10(%rsp)
  40300a:	00 00 
  40300c:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
  403011:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  403016:	48 8b 0d fb 43 00 00 	mov    0x43fb(%rip),%rcx        # 407418 <infile>
  40301d:	ba 0a 00 00 00       	mov    $0xa,%edx
  403022:	e8 99 f1 ff ff       	call   4021c0 <__getdelim@plt>
  403027:	48 89 c3             	mov    %rax,%rbx
  40302a:	48 85 c0             	test   %rax,%rax
  40302d:	78 13                	js     403042 <skip+0x5e>
  40302f:	48 8b 6c 24 08       	mov    0x8(%rsp),%rbp
  403034:	48 89 ef             	mov    %rbp,%rdi
  403037:	e8 6d ff ff ff       	call   402fa9 <blank_line>
  40303c:	85 c0                	test   %eax,%eax
  40303e:	75 cc                	jne    40300c <skip+0x28>
  403040:	eb 46                	jmp    403088 <skip+0xa4>
  403042:	48 8b 3d cf 43 00 00 	mov    0x43cf(%rip),%rdi        # 407418 <infile>
  403049:	e8 92 f1 ff ff       	call   4021e0 <feof@plt>
  40304e:	85 c0                	test   %eax,%eax
  403050:	74 1c                	je     40306e <skip+0x8a>
  403052:	b8 00 00 00 00       	mov    $0x0,%eax
  403057:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
  40305c:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  403063:	00 00 
  403065:	75 47                	jne    4030ae <skip+0xca>
  403067:	48 83 c4 28          	add    $0x28,%rsp
  40306b:	5b                   	pop    %rbx
  40306c:	5d                   	pop    %rbp
  40306d:	c3                   	ret    
  40306e:	48 8d 3d 8a 13 00 00 	lea    0x138a(%rip),%rdi        # 4043ff <__PRETTY_FUNCTION__.0+0x5f>
  403075:	e8 16 f2 ff ff       	call   402290 <perror@plt>
  40307a:	bf 08 00 00 00       	mov    $0x8,%edi
  40307f:	e8 3c f2 ff ff       	call   4022c0 <exit@plt>
  403084:	48 83 eb 01          	sub    $0x1,%rbx
  403088:	48 85 db             	test   %rbx,%rbx
  40308b:	7e 15                	jle    4030a2 <skip+0xbe>
  40308d:	e8 be f2 ff ff       	call   402350 <__ctype_b_loc@plt>
  403092:	48 8b 00             	mov    (%rax),%rax
  403095:	48 0f be 54 1d ff    	movsbq -0x1(%rbp,%rbx,1),%rdx
  40309b:	f6 44 50 01 20       	testb  $0x20,0x1(%rax,%rdx,2)
  4030a0:	75 e2                	jne    403084 <skip+0xa0>
  4030a2:	c6 44 1d 00 00       	movb   $0x0,0x0(%rbp,%rbx,1)
  4030a7:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  4030ac:	eb a9                	jmp    403057 <skip+0x73>
  4030ae:	e8 6d f0 ff ff       	call   402120 <__stack_chk_fail@plt>

00000000004030b3 <update_submission_record>:
  4030b3:	55                   	push   %rbp
  4030b4:	53                   	push   %rbx
  4030b5:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
  4030bc:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4030c3:	00 00 
  4030c5:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
  4030cc:	00 
  4030cd:	31 c0                	xor    %eax,%eax
  4030cf:	48 83 3d c9 42 00 00 	cmpq   $0x0,0x42c9(%rip)        # 4073a0 <submission_record_file>
  4030d6:	00 
  4030d7:	0f 84 ab 00 00 00    	je     403188 <update_submission_record+0xd5>
  4030dd:	be 01 02 00 00       	mov    $0x201,%esi
  4030e2:	bf 00 00 00 00       	mov    $0x0,%edi
  4030e7:	e8 d5 fb ff ff       	call   402cc1 <open_submission_record>
  4030ec:	89 c5                	mov    %eax,%ebp
  4030ee:	83 f8 ff             	cmp    $0xffffffff,%eax
  4030f1:	0f 84 b0 00 00 00    	je     4031a7 <update_submission_record+0xf4>
  4030f7:	48 8d 35 13 13 00 00 	lea    0x1313(%rip),%rsi        # 404411 <__PRETTY_FUNCTION__.0+0x71>
  4030fe:	89 c7                	mov    %eax,%edi
  403100:	e8 3b f1 ff ff       	call   402240 <fdopen@plt>
  403105:	48 89 c3             	mov    %rax,%rbx
  403108:	48 8b 0d b1 42 00 00 	mov    0x42b1(%rip),%rcx        # 4073c0 <highest_solved_phase>
  40310f:	48 8d 15 fd 12 00 00 	lea    0x12fd(%rip),%rdx        # 404413 <__PRETTY_FUNCTION__.0+0x73>
  403116:	be 01 00 00 00       	mov    $0x1,%esi
  40311b:	48 89 c7             	mov    %rax,%rdi
  40311e:	b8 00 00 00 00       	mov    $0x0,%eax
  403123:	e8 b8 f1 ff ff       	call   4022e0 <__fprintf_chk@plt>
  403128:	48 89 df             	mov    %rbx,%rdi
  40312b:	e8 c0 f0 ff ff       	call   4021f0 <fflush@plt>
  403130:	85 c0                	test   %eax,%eax
  403132:	0f 85 85 00 00 00    	jne    4031bd <update_submission_record+0x10a>
  403138:	48 89 e6             	mov    %rsp,%rsi
  40313b:	89 ef                	mov    %ebp,%edi
  40313d:	e8 fe f1 ff ff       	call   402340 <fstat@plt>
  403142:	85 c0                	test   %eax,%eax
  403144:	0f 85 89 00 00 00    	jne    4031d3 <update_submission_record+0x120>
  40314a:	f3 0f 6f 44 24 58    	movdqu 0x58(%rsp),%xmm0
  403150:	0f 29 05 59 42 00 00 	movaps %xmm0,0x4259(%rip)        # 4073b0 <most_recent_submission>
  403157:	48 89 df             	mov    %rbx,%rdi
  40315a:	e8 81 ef ff ff       	call   4020e0 <fclose@plt>
  40315f:	85 c0                	test   %eax,%eax
  403161:	0f 85 82 00 00 00    	jne    4031e9 <update_submission_record+0x136>
  403167:	48 8b 84 24 98 00 00 	mov    0x98(%rsp),%rax
  40316e:	00 
  40316f:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  403176:	00 00 
  403178:	0f 85 81 00 00 00    	jne    4031ff <update_submission_record+0x14c>
  40317e:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
  403185:	5b                   	pop    %rbx
  403186:	5d                   	pop    %rbp
  403187:	c3                   	ret    
  403188:	48 8d 0d 11 12 00 00 	lea    0x1211(%rip),%rcx        # 4043a0 <__PRETTY_FUNCTION__.0>
  40318f:	ba 4c 01 00 00       	mov    $0x14c,%edx
  403194:	48 8d 35 6c 12 00 00 	lea    0x126c(%rip),%rsi        # 404407 <__PRETTY_FUNCTION__.0+0x67>
  40319b:	48 8d 3d be 13 00 00 	lea    0x13be(%rip),%rdi        # 404560 <__PRETTY_FUNCTION__.0+0x1c0>
  4031a2:	e8 c9 ef ff ff       	call   402170 <__assert_fail@plt>
  4031a7:	48 8b 3d f2 41 00 00 	mov    0x41f2(%rip),%rdi        # 4073a0 <submission_record_file>
  4031ae:	e8 dd f0 ff ff       	call   402290 <perror@plt>
  4031b3:	bf 08 00 00 00       	mov    $0x8,%edi
  4031b8:	e8 03 f1 ff ff       	call   4022c0 <exit@plt>
  4031bd:	48 8d 3d 54 12 00 00 	lea    0x1254(%rip),%rdi        # 404418 <__PRETTY_FUNCTION__.0+0x78>
  4031c4:	e8 c7 f0 ff ff       	call   402290 <perror@plt>
  4031c9:	bf 08 00 00 00       	mov    $0x8,%edi
  4031ce:	e8 ed f0 ff ff       	call   4022c0 <exit@plt>
  4031d3:	48 8d 3d 0b 12 00 00 	lea    0x120b(%rip),%rdi        # 4043e5 <__PRETTY_FUNCTION__.0+0x45>
  4031da:	e8 b1 f0 ff ff       	call   402290 <perror@plt>
  4031df:	bf 08 00 00 00       	mov    $0x8,%edi
  4031e4:	e8 d7 f0 ff ff       	call   4022c0 <exit@plt>
  4031e9:	48 8d 3d 28 12 00 00 	lea    0x1228(%rip),%rdi        # 404418 <__PRETTY_FUNCTION__.0+0x78>
  4031f0:	e8 9b f0 ff ff       	call   402290 <perror@plt>
  4031f5:	bf 08 00 00 00       	mov    $0x8,%edi
  4031fa:	e8 c1 f0 ff ff       	call   4022c0 <exit@plt>
  4031ff:	e8 1c ef ff ff       	call   402120 <__stack_chk_fail@plt>

0000000000403204 <invalid_phase>:
  403204:	50                   	push   %rax
  403205:	58                   	pop    %rax
  403206:	48 83 ec 08          	sub    $0x8,%rsp
  40320a:	48 89 fa             	mov    %rdi,%rdx
  40320d:	48 8d 35 10 12 00 00 	lea    0x1210(%rip),%rsi        # 404424 <__PRETTY_FUNCTION__.0+0x84>
  403214:	bf 01 00 00 00       	mov    $0x1,%edi
  403219:	b8 00 00 00 00       	mov    $0x0,%eax
  40321e:	e8 2d f0 ff ff       	call   402250 <__printf_chk@plt>
  403223:	bf 08 00 00 00       	mov    $0x8,%edi
  403228:	e8 93 f0 ff ff       	call   4022c0 <exit@plt>

000000000040322d <string_length>:
  40322d:	b8 00 00 00 00       	mov    $0x0,%eax
  403232:	eb 08                	jmp    40323c <string_length+0xf>
  403234:	48 83 c7 01          	add    $0x1,%rdi
  403238:	48 83 c0 01          	add    $0x1,%rax
  40323c:	80 3f 00             	cmpb   $0x0,(%rdi)
  40323f:	75 f3                	jne    403234 <string_length+0x7>
  403241:	c3                   	ret    

0000000000403242 <strings_not_equal>:
  403242:	41 54                	push   %r12
  403244:	55                   	push   %rbp
  403245:	53                   	push   %rbx
  403246:	48 89 fb             	mov    %rdi,%rbx
  403249:	48 89 f5             	mov    %rsi,%rbp
  40324c:	e8 dc ff ff ff       	call   40322d <string_length>
  403251:	49 89 c4             	mov    %rax,%r12
  403254:	48 89 ef             	mov    %rbp,%rdi
  403257:	e8 d1 ff ff ff       	call   40322d <string_length>
  40325c:	49 39 c4             	cmp    %rax,%r12
  40325f:	74 12                	je     403273 <strings_not_equal+0x31>
  403261:	b8 01 00 00 00       	mov    $0x1,%eax
  403266:	5b                   	pop    %rbx
  403267:	5d                   	pop    %rbp
  403268:	41 5c                	pop    %r12
  40326a:	c3                   	ret    
  40326b:	48 83 c3 01          	add    $0x1,%rbx
  40326f:	48 83 c5 01          	add    $0x1,%rbp
  403273:	0f b6 03             	movzbl (%rbx),%eax
  403276:	84 c0                	test   %al,%al
  403278:	74 ec                	je     403266 <strings_not_equal+0x24>
  40327a:	38 45 00             	cmp    %al,0x0(%rbp)
  40327d:	74 ec                	je     40326b <strings_not_equal+0x29>
  40327f:	b8 01 00 00 00       	mov    $0x1,%eax
  403284:	eb e0                	jmp    403266 <strings_not_equal+0x24>

0000000000403286 <send_msg>:
  403286:	53                   	push   %rbx
  403287:	48 83 ec 20          	sub    $0x20,%rsp
  40328b:	48 89 fb             	mov    %rdi,%rbx
  40328e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403295:	00 00 
  403297:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  40329c:	31 c0                	xor    %eax,%eax
  40329e:	48 8d 35 90 11 00 00 	lea    0x1190(%rip),%rsi        # 404435 <__PRETTY_FUNCTION__.0+0x95>
  4032a5:	e8 98 ff ff ff       	call   403242 <strings_not_equal>
  4032aa:	84 c0                	test   %al,%al
  4032ac:	75 4c                	jne    4032fa <send_msg+0x74>
  4032ae:	48 8b 05 1b 41 00 00 	mov    0x411b(%rip),%rax        # 4073d0 <num_input_strings>
  4032b5:	48 39 05 04 41 00 00 	cmp    %rax,0x4104(%rip)        # 4073c0 <highest_solved_phase>
  4032bc:	73 26                	jae    4032e4 <send_msg+0x5e>
  4032be:	48 89 05 fb 40 00 00 	mov    %rax,0x40fb(%rip)        # 4073c0 <highest_solved_phase>
  4032c5:	48 89 da             	mov    %rbx,%rdx
  4032c8:	48 8d 35 74 f9 ff ff 	lea    -0x68c(%rip),%rsi        # 402c43 <generate_submission>
  4032cf:	48 8d 3d fa 17 00 00 	lea    0x17fa(%rip),%rdi        # 404ad0 <course_and_lab>
  4032d6:	e8 22 06 00 00       	call   4038fd <autolab_submit_stream>
  4032db:	85 c0                	test   %eax,%eax
  4032dd:	75 45                	jne    403324 <send_msg+0x9e>
  4032df:	e8 cf fd ff ff       	call   4030b3 <update_submission_record>
  4032e4:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4032e9:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  4032f0:	00 00 
  4032f2:	75 61                	jne    403355 <send_msg+0xcf>
  4032f4:	48 83 c4 20          	add    $0x20,%rsp
  4032f8:	5b                   	pop    %rbx
  4032f9:	c3                   	ret    
  4032fa:	66 0f 6f 05 ae 40 00 	movdqa 0x40ae(%rip),%xmm0        # 4073b0 <most_recent_submission>
  403301:	00 
  403302:	0f 29 04 24          	movaps %xmm0,(%rsp)
  403306:	48 83 04 24 05       	addq   $0x5,(%rsp)
  40330b:	48 89 e2             	mov    %rsp,%rdx
  40330e:	b9 00 00 00 00       	mov    $0x0,%ecx
  403313:	be 01 00 00 00       	mov    $0x1,%esi
  403318:	bf 00 00 00 00       	mov    $0x0,%edi
  40331d:	e8 ce ef ff ff       	call   4022f0 <clock_nanosleep@plt>
  403322:	eb a1                	jmp    4032c5 <send_msg+0x3f>
  403324:	89 c7                	mov    %eax,%edi
  403326:	e8 f5 ef ff ff       	call   402320 <strerror@plt>
  40332b:	48 89 c1             	mov    %rax,%rcx
  40332e:	48 8d 15 4b 12 00 00 	lea    0x124b(%rip),%rdx        # 404580 <__PRETTY_FUNCTION__.0+0x1e0>
  403335:	be 01 00 00 00       	mov    $0x1,%esi
  40333a:	48 8b 3d 3f 40 00 00 	mov    0x403f(%rip),%rdi        # 407380 <stderr@GLIBC_2.2.5>
  403341:	b8 00 00 00 00       	mov    $0x0,%eax
  403346:	e8 95 ef ff ff       	call   4022e0 <__fprintf_chk@plt>
  40334b:	bf 01 00 00 00       	mov    $0x1,%edi
  403350:	e8 6b ef ff ff       	call   4022c0 <exit@plt>
  403355:	e8 c6 ed ff ff       	call   402120 <__stack_chk_fail@plt>

000000000040335a <initialize_bomb>:
  40335a:	55                   	push   %rbp
  40335b:	53                   	push   %rbx
  40335c:	48 81 ec 18 04 00 00 	sub    $0x418,%rsp
  403363:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40336a:	00 00 
  40336c:	48 89 84 24 08 04 00 	mov    %rax,0x408(%rsp)
  403373:	00 
  403374:	31 c0                	xor    %eax,%eax
  403376:	48 89 3d 9b 40 00 00 	mov    %rdi,0x409b(%rip)        # 407418 <infile>
  40337d:	48 8d 3d 9c 3e 00 00 	lea    0x3e9c(%rip),%rdi        # 407220 <sval>
  403384:	e8 45 f7 ff ff       	call   402ace <fs>
  403389:	48 8d 3d 70 3e 00 00 	lea    0x3e70(%rip),%rdi        # 407200 <tval>
  403390:	e8 39 f7 ff ff       	call   402ace <fs>
  403395:	48 8d 3d ed 3f 00 00 	lea    0x3fed(%rip),%rdi        # 407389 <wval>
  40339c:	e8 2d f7 ff ff       	call   402ace <fs>
  4033a1:	48 8d 1d ae f7 ff ff 	lea    -0x852(%rip),%rbx        # 402b56 <so_you_think>
  4033a8:	48 89 de             	mov    %rbx,%rsi
  4033ab:	bf 02 00 00 00       	mov    $0x2,%edi
  4033b0:	e8 1b ee ff ff       	call   4021d0 <signal@plt>
  4033b5:	48 89 de             	mov    %rbx,%rsi
  4033b8:	bf 03 00 00 00       	mov    $0x3,%edi
  4033bd:	e8 0e ee ff ff       	call   4021d0 <signal@plt>
  4033c2:	48 89 e7             	mov    %rsp,%rdi
  4033c5:	be 01 04 00 00       	mov    $0x401,%esi
  4033ca:	e8 e1 ee ff ff       	call   4022b0 <gethostname@plt>
  4033cf:	85 c0                	test   %eax,%eax
  4033d1:	75 28                	jne    4033fb <initialize_bomb+0xa1>
  4033d3:	89 c5                	mov    %eax,%ebp
  4033d5:	89 c3                	mov    %eax,%ebx
  4033d7:	48 63 c3             	movslq %ebx,%rax
  4033da:	48 8d 15 7f 39 00 00 	lea    0x397f(%rip),%rdx        # 406d60 <host_table>
  4033e1:	48 8b 3c c2          	mov    (%rdx,%rax,8),%rdi
  4033e5:	48 85 ff             	test   %rdi,%rdi
  4033e8:	74 2c                	je     403416 <initialize_bomb+0xbc>
  4033ea:	48 89 e6             	mov    %rsp,%rsi
  4033ed:	e8 5e ec ff ff       	call   402050 <strcasecmp@plt>
  4033f2:	85 c0                	test   %eax,%eax
  4033f4:	74 1b                	je     403411 <initialize_bomb+0xb7>
  4033f6:	83 c3 01             	add    $0x1,%ebx
  4033f9:	eb dc                	jmp    4033d7 <initialize_bomb+0x7d>
  4033fb:	48 8d 3d 3a 10 00 00 	lea    0x103a(%rip),%rdi        # 40443c <__PRETTY_FUNCTION__.0+0x9c>
  403402:	e8 89 ee ff ff       	call   402290 <perror@plt>
  403407:	bf 08 00 00 00       	mov    $0x8,%edi
  40340c:	e8 af ee ff ff       	call   4022c0 <exit@plt>
  403411:	bd 01 00 00 00       	mov    $0x1,%ebp
  403416:	85 ed                	test   %ebp,%ebp
  403418:	74 75                	je     40348f <initialize_bomb+0x135>
  40341a:	e8 11 ed ff ff       	call   402130 <getuid@plt>
  40341f:	89 c7                	mov    %eax,%edi
  403421:	e8 da ec ff ff       	call   402100 <getpwuid@plt>
  403426:	48 89 c3             	mov    %rax,%rbx
  403429:	48 85 c0             	test   %rax,%rax
  40342c:	0f 84 87 00 00 00    	je     4034b9 <initialize_bomb+0x15f>
  403432:	48 8b 38             	mov    (%rax),%rdi
  403435:	48 85 ff             	test   %rdi,%rdi
  403438:	74 7f                	je     4034b9 <initialize_bomb+0x15f>
  40343a:	80 3f 00             	cmpb   $0x0,(%rdi)
  40343d:	74 7a                	je     4034b9 <initialize_bomb+0x15f>
  40343f:	48 8b 40 20          	mov    0x20(%rax),%rax
  403443:	48 85 c0             	test   %rax,%rax
  403446:	74 71                	je     4034b9 <initialize_bomb+0x15f>
  403448:	80 38 00             	cmpb   $0x0,(%rax)
  40344b:	74 6c                	je     4034b9 <initialize_bomb+0x15f>
  40344d:	e8 be ee ff ff       	call   402310 <strdup@plt>
  403452:	48 89 05 6f 3f 00 00 	mov    %rax,0x3f6f(%rip)        # 4073c8 <student_id>
  403459:	48 8d 3d f1 0f 00 00 	lea    0xff1(%rip),%rdi        # 404451 <__PRETTY_FUNCTION__.0+0xb1>
  403460:	e8 cb eb ff ff       	call   402030 <getenv@plt>
  403465:	48 89 c7             	mov    %rax,%rdi
  403468:	48 85 c0             	test   %rax,%rax
  40346b:	74 62                	je     4034cf <initialize_bomb+0x175>
  40346d:	e8 a1 f9 ff ff       	call   402e13 <read_submission_record>
  403472:	48 8b 84 24 08 04 00 	mov    0x408(%rsp),%rax
  403479:	00 
  40347a:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  403481:	00 00 
  403483:	75 50                	jne    4034d5 <initialize_bomb+0x17b>
  403485:	48 81 c4 18 04 00 00 	add    $0x418,%rsp
  40348c:	5b                   	pop    %rbx
  40348d:	5d                   	pop    %rbp
  40348e:	c3                   	ret    
  40348f:	48 89 e1             	mov    %rsp,%rcx
  403492:	48 8d 15 0f 11 00 00 	lea    0x110f(%rip),%rdx        # 4045a8 <__PRETTY_FUNCTION__.0+0x208>
  403499:	be 01 00 00 00       	mov    $0x1,%esi
  40349e:	48 8b 3d db 3e 00 00 	mov    0x3edb(%rip),%rdi        # 407380 <stderr@GLIBC_2.2.5>
  4034a5:	b8 00 00 00 00       	mov    $0x0,%eax
  4034aa:	e8 31 ee ff ff       	call   4022e0 <__fprintf_chk@plt>
  4034af:	bf 08 00 00 00       	mov    $0x8,%edi
  4034b4:	e8 07 ee ff ff       	call   4022c0 <exit@plt>
  4034b9:	48 8d 3d 88 0f 00 00 	lea    0xf88(%rip),%rdi        # 404448 <__PRETTY_FUNCTION__.0+0xa8>
  4034c0:	e8 cb ed ff ff       	call   402290 <perror@plt>
  4034c5:	bf 08 00 00 00       	mov    $0x8,%edi
  4034ca:	e8 f1 ed ff ff       	call   4022c0 <exit@plt>
  4034cf:	48 8b 7b 20          	mov    0x20(%rbx),%rdi
  4034d3:	eb 98                	jmp    40346d <initialize_bomb+0x113>
  4034d5:	e8 46 ec ff ff       	call   402120 <__stack_chk_fail@plt>

00000000004034da <read_line>:
  4034da:	48 83 ec 08          	sub    $0x8,%rsp
  4034de:	48 83 3d ea 3e 00 00 	cmpq   $0x6,0x3eea(%rip)        # 4073d0 <num_input_strings>
  4034e5:	06 
  4034e6:	77 23                	ja     40350b <read_line+0x31>
  4034e8:	e8 f7 fa ff ff       	call   402fe4 <skip>
  4034ed:	48 85 c0             	test   %rax,%rax
  4034f0:	75 4a                	jne    40353c <read_line+0x62>
  4034f2:	48 8b 05 47 3e 00 00 	mov    0x3e47(%rip),%rax        # 407340 <stdin@GLIBC_2.2.5>
  4034f9:	48 39 05 18 3f 00 00 	cmp    %rax,0x3f18(%rip)        # 407418 <infile>
  403500:	74 30                	je     403532 <read_line+0x58>
  403502:	48 89 05 0f 3f 00 00 	mov    %rax,0x3f0f(%rip)        # 407418 <infile>
  403509:	eb dd                	jmp    4034e8 <read_line+0xe>
  40350b:	48 8b 0d 6e 3e 00 00 	mov    0x3e6e(%rip),%rcx        # 407380 <stderr@GLIBC_2.2.5>
  403512:	ba 45 00 00 00       	mov    $0x45,%edx
  403517:	be 01 00 00 00       	mov    $0x1,%esi
  40351c:	48 8d 3d dd 10 00 00 	lea    0x10dd(%rip),%rdi        # 404600 <__PRETTY_FUNCTION__.0+0x260>
  403523:	e8 a8 ed ff ff       	call   4022d0 <fwrite@plt>
  403528:	bf 00 00 00 00       	mov    $0x0,%edi
  40352d:	e8 8e ed ff ff       	call   4022c0 <exit@plt>
  403532:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  403537:	e8 1a f6 ff ff       	call   402b56 <so_you_think>
  40353c:	48 8b 15 8d 3e 00 00 	mov    0x3e8d(%rip),%rdx        # 4073d0 <num_input_strings>
  403543:	48 8d 4a 01          	lea    0x1(%rdx),%rcx
  403547:	48 89 0d 82 3e 00 00 	mov    %rcx,0x3e82(%rip)        # 4073d0 <num_input_strings>
  40354e:	48 8d 0d 8b 3e 00 00 	lea    0x3e8b(%rip),%rcx        # 4073e0 <input_strings>
  403555:	48 89 04 d1          	mov    %rax,(%rcx,%rdx,8)
  403559:	48 83 c4 08          	add    $0x8,%rsp
  40355d:	c3                   	ret    

000000000040355e <explode_bomb>:
  40355e:	50                   	push   %rax
  40355f:	58                   	pop    %rax
  403560:	48 83 ec 08          	sub    $0x8,%rsp
  403564:	48 8d 3d dd 10 00 00 	lea    0x10dd(%rip),%rdi        # 404648 <__PRETTY_FUNCTION__.0+0x2a8>
  40356b:	e8 50 eb ff ff       	call   4020c0 <puts@plt>
  403570:	48 8d 3d df 0e 00 00 	lea    0xedf(%rip),%rdi        # 404456 <__PRETTY_FUNCTION__.0+0xb6>
  403577:	e8 0a fd ff ff       	call   403286 <send_msg>
  40357c:	48 8d 3d e5 10 00 00 	lea    0x10e5(%rip),%rdi        # 404668 <__PRETTY_FUNCTION__.0+0x2c8>
  403583:	e8 38 eb ff ff       	call   4020c0 <puts@plt>
  403588:	bf 08 00 00 00       	mov    $0x8,%edi
  40358d:	e8 2e ed ff ff       	call   4022c0 <exit@plt>

0000000000403592 <read_six_numbers>:
  403592:	48 83 ec 08          	sub    $0x8,%rsp
  403596:	48 89 f2             	mov    %rsi,%rdx
  403599:	48 8d 4e 08          	lea    0x8(%rsi),%rcx
  40359d:	48 8d 46 28          	lea    0x28(%rsi),%rax
  4035a1:	50                   	push   %rax
  4035a2:	48 8d 46 20          	lea    0x20(%rsi),%rax
  4035a6:	50                   	push   %rax
  4035a7:	4c 8d 4e 18          	lea    0x18(%rsi),%r9
  4035ab:	4c 8d 46 10          	lea    0x10(%rsi),%r8
  4035af:	48 8d 35 a8 0e 00 00 	lea    0xea8(%rip),%rsi        # 40445e <__PRETTY_FUNCTION__.0+0xbe>
  4035b6:	b8 00 00 00 00       	mov    $0x0,%eax
  4035bb:	e8 40 ec ff ff       	call   402200 <__isoc99_sscanf@plt>
  4035c0:	48 83 c4 10          	add    $0x10,%rsp
  4035c4:	83 f8 05             	cmp    $0x5,%eax
  4035c7:	7e 05                	jle    4035ce <read_six_numbers+0x3c>
  4035c9:	48 83 c4 08          	add    $0x8,%rsp
  4035cd:	c3                   	ret    
  4035ce:	e8 8b ff ff ff       	call   40355e <explode_bomb>

00000000004035d3 <phase_defused>:
  4035d3:	55                   	push   %rbp
  4035d4:	48 89 e5             	mov    %rsp,%rbp
  4035d7:	41 55                	push   %r13
  4035d9:	41 54                	push   %r12
  4035db:	53                   	push   %rbx
  4035dc:	48 83 ec 28          	sub    $0x28,%rsp
  4035e0:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4035e7:	00 00 
  4035e9:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  4035ed:	31 c0                	xor    %eax,%eax
  4035ef:	48 89 e3             	mov    %rsp,%rbx
  4035f2:	48 8d 3d 3c 0e 00 00 	lea    0xe3c(%rip),%rdi        # 404435 <__PRETTY_FUNCTION__.0+0x95>
  4035f9:	e8 88 fc ff ff       	call   403286 <send_msg>
  4035fe:	48 83 3d ca 3d 00 00 	cmpq   $0x5,0x3dca(%rip)        # 4073d0 <num_input_strings>
  403605:	05 
  403606:	77 21                	ja     403629 <phase_defused+0x56>
  403608:	48 89 dc             	mov    %rbx,%rsp
  40360b:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40360f:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  403616:	00 00 
  403618:	0f 85 f5 00 00 00    	jne    403713 <phase_defused+0x140>
  40361e:	48 8d 65 e8          	lea    -0x18(%rbp),%rsp
  403622:	5b                   	pop    %rbx
  403623:	41 5c                	pop    %r12
  403625:	41 5d                	pop    %r13
  403627:	5d                   	pop    %rbp
  403628:	c3                   	ret    
  403629:	4c 8b 25 c8 3d 00 00 	mov    0x3dc8(%rip),%r12        # 4073f8 <input_strings+0x18>
  403630:	4c 89 e7             	mov    %r12,%rdi
  403633:	e8 d8 ea ff ff       	call   402110 <strlen@plt>
  403638:	48 83 c0 10          	add    $0x10,%rax
  40363c:	48 89 c1             	mov    %rax,%rcx
  40363f:	48 83 e1 f0          	and    $0xfffffffffffffff0,%rcx
  403643:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
  403649:	48 89 e2             	mov    %rsp,%rdx
  40364c:	48 29 c2             	sub    %rax,%rdx
  40364f:	48 39 d4             	cmp    %rdx,%rsp
  403652:	74 12                	je     403666 <phase_defused+0x93>
  403654:	48 81 ec 00 10 00 00 	sub    $0x1000,%rsp
  40365b:	48 83 8c 24 f8 0f 00 	orq    $0x0,0xff8(%rsp)
  403662:	00 00 
  403664:	eb e9                	jmp    40364f <phase_defused+0x7c>
  403666:	48 89 c8             	mov    %rcx,%rax
  403669:	25 ff 0f 00 00       	and    $0xfff,%eax
  40366e:	48 29 c4             	sub    %rax,%rsp
  403671:	48 85 c0             	test   %rax,%rax
  403674:	74 06                	je     40367c <phase_defused+0xa9>
  403676:	48 83 4c 04 f8 00    	orq    $0x0,-0x8(%rsp,%rax,1)
  40367c:	49 89 e5             	mov    %rsp,%r13
  40367f:	48 8d 4d c8          	lea    -0x38(%rbp),%rcx
  403683:	48 8d 55 c0          	lea    -0x40(%rbp),%rdx
  403687:	4c 8d 4d d0          	lea    -0x30(%rbp),%r9
  40368b:	49 89 e0             	mov    %rsp,%r8
  40368e:	48 8d 35 e1 0d 00 00 	lea    0xde1(%rip),%rsi        # 404476 <__PRETTY_FUNCTION__.0+0xd6>
  403695:	4c 89 e7             	mov    %r12,%rdi
  403698:	b8 00 00 00 00       	mov    $0x0,%eax
  40369d:	e8 5e eb ff ff       	call   402200 <__isoc99_sscanf@plt>
  4036a2:	83 f8 04             	cmp    $0x4,%eax
  4036a5:	74 20                	je     4036c7 <phase_defused+0xf4>
  4036a7:	48 8d 3d 6a 10 00 00 	lea    0x106a(%rip),%rdi        # 404718 <__PRETTY_FUNCTION__.0+0x378>
  4036ae:	e8 0d ea ff ff       	call   4020c0 <puts@plt>
  4036b3:	48 8d 3d 8e 10 00 00 	lea    0x108e(%rip),%rdi        # 404748 <__PRETTY_FUNCTION__.0+0x3a8>
  4036ba:	e8 01 ea ff ff       	call   4020c0 <puts@plt>
  4036bf:	48 89 dc             	mov    %rbx,%rsp
  4036c2:	e9 44 ff ff ff       	jmp    40360b <phase_defused+0x38>
  4036c7:	4c 89 ef             	mov    %r13,%rdi
  4036ca:	e8 5e fb ff ff       	call   40322d <string_length>
  4036cf:	48 3b 45 d0          	cmp    -0x30(%rbp),%rax
  4036d3:	75 d2                	jne    4036a7 <phase_defused+0xd4>
  4036d5:	48 8d 35 24 3b 00 00 	lea    0x3b24(%rip),%rsi        # 407200 <tval>
  4036dc:	4c 89 ef             	mov    %r13,%rdi
  4036df:	e8 5e fb ff ff       	call   403242 <strings_not_equal>
  4036e4:	84 c0                	test   %al,%al
  4036e6:	75 bf                	jne    4036a7 <phase_defused+0xd4>
  4036e8:	48 8d 3d a1 0f 00 00 	lea    0xfa1(%rip),%rdi        # 404690 <__PRETTY_FUNCTION__.0+0x2f0>
  4036ef:	e8 cc e9 ff ff       	call   4020c0 <puts@plt>
  4036f4:	e8 33 f3 ff ff       	call   402a2c <secret_phase>
  4036f9:	48 8d 3d f0 0f 00 00 	lea    0xff0(%rip),%rdi        # 4046f0 <__PRETTY_FUNCTION__.0+0x350>
  403700:	e8 bb e9 ff ff       	call   4020c0 <puts@plt>
  403705:	48 8d 3d 29 0d 00 00 	lea    0xd29(%rip),%rdi        # 404435 <__PRETTY_FUNCTION__.0+0x95>
  40370c:	e8 75 fb ff ff       	call   403286 <send_msg>
  403711:	eb 94                	jmp    4036a7 <phase_defused+0xd4>
  403713:	e8 08 ea ff ff       	call   402120 <__stack_chk_fail@plt>

0000000000403718 <autolab_submit_file>:
  403718:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
  40371f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403726:	00 00 
  403728:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
  40372f:	00 
  403730:	31 c0                	xor    %eax,%eax
  403732:	48 8d 05 16 11 00 00 	lea    0x1116(%rip),%rax        # 40484f <__PRETTY_FUNCTION__.0+0x4af>
  403739:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  40373e:	48 8d 05 12 11 00 00 	lea    0x1112(%rip),%rax        # 404857 <__PRETTY_FUNCTION__.0+0x4b7>
  403745:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  40374a:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
  40374f:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
  403754:	48 8d 05 03 11 00 00 	lea    0x1103(%rip),%rax        # 40485e <__PRETTY_FUNCTION__.0+0x4be>
  40375b:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
  403760:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  403767:	00 00 
  403769:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  40376e:	e8 ed e8 ff ff       	call   402060 <posix_spawn_file_actions_init@plt>
  403773:	85 c0                	test   %eax,%eax
  403775:	74 1f                	je     403796 <autolab_submit_file+0x7e>
  403777:	48 8b 94 24 98 00 00 	mov    0x98(%rsp),%rdx
  40377e:	00 
  40377f:	64 48 2b 14 25 28 00 	sub    %fs:0x28,%rdx
  403786:	00 00 
  403788:	0f 85 6a 01 00 00    	jne    4038f8 <autolab_submit_file+0x1e0>
  40378e:	48 81 c4 a8 00 00 00 	add    $0xa8,%rsp
  403795:	c3                   	ret    
  403796:	48 8d 3d c4 10 00 00 	lea    0x10c4(%rip),%rdi        # 404861 <__PRETTY_FUNCTION__.0+0x4c1>
  40379d:	e8 8e e8 ff ff       	call   402030 <getenv@plt>
  4037a2:	48 85 c0             	test   %rax,%rax
  4037a5:	0f 84 95 00 00 00    	je     403840 <autolab_submit_file+0x128>
  4037ab:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
  4037b0:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  4037b5:	4c 8b 0d a4 3b 00 00 	mov    0x3ba4(%rip),%r9        # 407360 <__environ@GLIBC_2.2.5>
  4037bc:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  4037c1:	b9 00 00 00 00       	mov    $0x0,%ecx
  4037c6:	48 8d 35 82 10 00 00 	lea    0x1082(%rip),%rsi        # 40484f <__PRETTY_FUNCTION__.0+0x4af>
  4037cd:	e8 4e ea ff ff       	call   402220 <posix_spawnp@plt>
  4037d2:	85 c0                	test   %eax,%eax
  4037d4:	75 a1                	jne    403777 <autolab_submit_file+0x5f>
  4037d6:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  4037db:	e8 10 e9 ff ff       	call   4020f0 <posix_spawn_file_actions_destroy@plt>
  4037e0:	48 8d 74 24 0c       	lea    0xc(%rsp),%rsi
  4037e5:	ba 00 00 00 00       	mov    $0x0,%edx
  4037ea:	8b 7c 24 08          	mov    0x8(%rsp),%edi
  4037ee:	e8 6d ea ff ff       	call   402260 <waitpid@plt>
  4037f3:	83 f8 ff             	cmp    $0xffffffff,%eax
  4037f6:	0f 84 8e 00 00 00    	je     40388a <autolab_submit_file+0x172>
  4037fc:	8b 4c 24 0c          	mov    0xc(%rsp),%ecx
  403800:	89 cf                	mov    %ecx,%edi
  403802:	83 e7 7f             	and    $0x7f,%edi
  403805:	0f 85 8b 00 00 00    	jne    403896 <autolab_submit_file+0x17e>
  40380b:	0f b6 c5             	movzbl %ch,%eax
  40380e:	f6 c5 ff             	test   $0xff,%ch
  403811:	0f 84 60 ff ff ff    	je     403777 <autolab_submit_file+0x5f>
  403817:	89 c1                	mov    %eax,%ecx
  403819:	48 8d 15 5b 10 00 00 	lea    0x105b(%rip),%rdx        # 40487b <__PRETTY_FUNCTION__.0+0x4db>
  403820:	be 01 00 00 00       	mov    $0x1,%esi
  403825:	48 8b 3d 54 3b 00 00 	mov    0x3b54(%rip),%rdi        # 407380 <stderr@GLIBC_2.2.5>
  40382c:	b8 00 00 00 00       	mov    $0x0,%eax
  403831:	e8 aa ea ff ff       	call   4022e0 <__fprintf_chk@plt>
  403836:	b8 46 00 00 00       	mov    $0x46,%eax
  40383b:	e9 37 ff ff ff       	jmp    403777 <autolab_submit_file+0x5f>
  403840:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  403845:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  40384b:	b9 01 00 00 00       	mov    $0x1,%ecx
  403850:	48 8d 15 1a 10 00 00 	lea    0x101a(%rip),%rdx        # 404871 <__PRETTY_FUNCTION__.0+0x4d1>
  403857:	be 01 00 00 00       	mov    $0x1,%esi
  40385c:	e8 af e9 ff ff       	call   402210 <posix_spawn_file_actions_addopen@plt>
  403861:	85 c0                	test   %eax,%eax
  403863:	0f 85 0e ff ff ff    	jne    403777 <autolab_submit_file+0x5f>
  403869:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  40386e:	ba 02 00 00 00       	mov    $0x2,%edx
  403873:	be 01 00 00 00       	mov    $0x1,%esi
  403878:	e8 83 ea ff ff       	call   402300 <posix_spawn_file_actions_adddup2@plt>
  40387d:	85 c0                	test   %eax,%eax
  40387f:	0f 84 26 ff ff ff    	je     4037ab <autolab_submit_file+0x93>
  403885:	e9 ed fe ff ff       	jmp    403777 <autolab_submit_file+0x5f>
  40388a:	e8 f1 e7 ff ff       	call   402080 <__errno_location@plt>
  40388f:	8b 00                	mov    (%rax),%eax
  403891:	e9 e1 fe ff ff       	jmp    403777 <autolab_submit_file+0x5f>
  403896:	89 c8                	mov    %ecx,%eax
  403898:	83 e0 7f             	and    $0x7f,%eax
  40389b:	83 c0 01             	add    $0x1,%eax
  40389e:	3c 01                	cmp    $0x1,%al
  4038a0:	7e 2f                	jle    4038d1 <autolab_submit_file+0x1b9>
  4038a2:	e8 89 e9 ff ff       	call   402230 <strsignal@plt>
  4038a7:	48 89 c1             	mov    %rax,%rcx
  4038aa:	48 8d 15 e3 0f 00 00 	lea    0xfe3(%rip),%rdx        # 404894 <__PRETTY_FUNCTION__.0+0x4f4>
  4038b1:	be 01 00 00 00       	mov    $0x1,%esi
  4038b6:	48 8b 3d c3 3a 00 00 	mov    0x3ac3(%rip),%rdi        # 407380 <stderr@GLIBC_2.2.5>
  4038bd:	b8 00 00 00 00       	mov    $0x0,%eax
  4038c2:	e8 19 ea ff ff       	call   4022e0 <__fprintf_chk@plt>
  4038c7:	b8 46 00 00 00       	mov    $0x46,%eax
  4038cc:	e9 a6 fe ff ff       	jmp    403777 <autolab_submit_file+0x5f>
  4038d1:	48 8d 15 d0 0f 00 00 	lea    0xfd0(%rip),%rdx        # 4048a8 <__PRETTY_FUNCTION__.0+0x508>
  4038d8:	be 01 00 00 00       	mov    $0x1,%esi
  4038dd:	48 8b 3d 9c 3a 00 00 	mov    0x3a9c(%rip),%rdi        # 407380 <stderr@GLIBC_2.2.5>
  4038e4:	b8 00 00 00 00       	mov    $0x0,%eax
  4038e9:	e8 f2 e9 ff ff       	call   4022e0 <__fprintf_chk@plt>
  4038ee:	b8 46 00 00 00       	mov    $0x46,%eax
  4038f3:	e9 7f fe ff ff       	jmp    403777 <autolab_submit_file+0x5f>
  4038f8:	e8 23 e8 ff ff       	call   402120 <__stack_chk_fail@plt>

00000000004038fd <autolab_submit_stream>:
  4038fd:	41 56                	push   %r14
  4038ff:	41 55                	push   %r13
  403901:	41 54                	push   %r12
  403903:	55                   	push   %rbp
  403904:	53                   	push   %rbx
  403905:	48 83 ec 20          	sub    $0x20,%rsp
  403909:	48 89 fd             	mov    %rdi,%rbp
  40390c:	48 89 f3             	mov    %rsi,%rbx
  40390f:	49 89 d5             	mov    %rdx,%r13
  403912:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  403919:	00 00 
  40391b:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  403920:	31 c0                	xor    %eax,%eax
  403922:	48 b8 2e 61 73 75 62 	movabs $0x585858627573612e,%rax
  403929:	58 58 58 
  40392c:	48 89 44 24 0c       	mov    %rax,0xc(%rsp)
  403931:	c7 44 24 14 58 58 58 	movl   $0x585858,0x14(%rsp)
  403938:	00 
  403939:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
  40393e:	be 00 00 08 00       	mov    $0x80000,%esi
  403943:	e8 18 e8 ff ff       	call   402160 <mkostemp@plt>
  403948:	83 f8 ff             	cmp    $0xffffffff,%eax
  40394b:	74 4f                	je     40399c <autolab_submit_stream+0x9f>
  40394d:	41 89 c6             	mov    %eax,%r14d
  403950:	48 8d 35 6d 0f 00 00 	lea    0xf6d(%rip),%rsi        # 4048c4 <__PRETTY_FUNCTION__.0+0x524>
  403957:	89 c7                	mov    %eax,%edi
  403959:	e8 e2 e8 ff ff       	call   402240 <fdopen@plt>
  40395e:	49 89 c4             	mov    %rax,%r12
  403961:	48 85 c0             	test   %rax,%rax
  403964:	74 5c                	je     4039c2 <autolab_submit_stream+0xc5>
  403966:	4c 89 ee             	mov    %r13,%rsi
  403969:	48 89 c7             	mov    %rax,%rdi
  40396c:	ff d3                	call   *%rbx
  40396e:	89 c3                	mov    %eax,%ebx
  403970:	85 c0                	test   %eax,%eax
  403972:	75 69                	jne    4039dd <autolab_submit_stream+0xe0>
  403974:	4c 89 e7             	mov    %r12,%rdi
  403977:	e8 64 e7 ff ff       	call   4020e0 <fclose@plt>
  40397c:	85 c0                	test   %eax,%eax
  40397e:	75 71                	jne    4039f1 <autolab_submit_stream+0xf4>
  403980:	4c 8d 64 24 0c       	lea    0xc(%rsp),%r12
  403985:	4c 89 e6             	mov    %r12,%rsi
  403988:	48 89 ef             	mov    %rbp,%rdi
  40398b:	e8 88 fd ff ff       	call   403718 <autolab_submit_file>
  403990:	89 c3                	mov    %eax,%ebx
  403992:	4c 89 e7             	mov    %r12,%rdi
  403995:	e8 f6 e6 ff ff       	call   402090 <unlink@plt>
  40399a:	eb 07                	jmp    4039a3 <autolab_submit_stream+0xa6>
  40399c:	e8 df e6 ff ff       	call   402080 <__errno_location@plt>
  4039a1:	8b 18                	mov    (%rax),%ebx
  4039a3:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  4039a8:	64 48 2b 04 25 28 00 	sub    %fs:0x28,%rax
  4039af:	00 00 
  4039b1:	75 51                	jne    403a04 <autolab_submit_stream+0x107>
  4039b3:	89 d8                	mov    %ebx,%eax
  4039b5:	48 83 c4 20          	add    $0x20,%rsp
  4039b9:	5b                   	pop    %rbx
  4039ba:	5d                   	pop    %rbp
  4039bb:	41 5c                	pop    %r12
  4039bd:	41 5d                	pop    %r13
  4039bf:	41 5e                	pop    %r14
  4039c1:	c3                   	ret    
  4039c2:	e8 b9 e6 ff ff       	call   402080 <__errno_location@plt>
  4039c7:	8b 18                	mov    (%rax),%ebx
  4039c9:	44 89 f7             	mov    %r14d,%edi
  4039cc:	e8 af e7 ff ff       	call   402180 <close@plt>
  4039d1:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
  4039d6:	e8 b5 e6 ff ff       	call   402090 <unlink@plt>
  4039db:	eb c6                	jmp    4039a3 <autolab_submit_stream+0xa6>
  4039dd:	4c 89 e7             	mov    %r12,%rdi
  4039e0:	e8 fb e6 ff ff       	call   4020e0 <fclose@plt>
  4039e5:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
  4039ea:	e8 a1 e6 ff ff       	call   402090 <unlink@plt>
  4039ef:	eb b2                	jmp    4039a3 <autolab_submit_stream+0xa6>
  4039f1:	e8 8a e6 ff ff       	call   402080 <__errno_location@plt>
  4039f6:	8b 18                	mov    (%rax),%ebx
  4039f8:	48 8d 7c 24 0c       	lea    0xc(%rsp),%rdi
  4039fd:	e8 8e e6 ff ff       	call   402090 <unlink@plt>
  403a02:	eb 9f                	jmp    4039a3 <autolab_submit_stream+0xa6>
  403a04:	e8 17 e7 ff ff       	call   402120 <__stack_chk_fail@plt>

Disassembly of section .fini:

0000000000403a0c <_fini>:
  403a0c:	f3 0f 1e fa          	endbr64 
  403a10:	48 83 ec 08          	sub    $0x8,%rsp
  403a14:	48 83 c4 08          	add    $0x8,%rsp
  403a18:	c3                   	ret    
