 00405B8A                           L00405B8A:
 00405B8A  8B85D4F8FFFF              		mov	eax,[ebp-0000072Ch]
 00405B90  2DF4010000                		sub	eax,000001F4h
 00405B95  8985D4F8FFFF              		mov	[ebp-0000072Ch],eax
 00405B9B  83BDD4F8FFFF0D            		cmp	dword ptr [ebp-0000072Ch],0000000Dh
 00405BA2  0F8785040000              		ja 	CASE_004060CE_PROC0003
 00405BA8  8B95D4F8FFFF              		mov	edx,[ebp-0000072Ch]
 00405BAE  33C9                      		xor	ecx,ecx
 00405BB0  8A8A5C604000              		mov	cl,[edx+CASE_0040605C]
 00405BB6  FF248D48604000            		jmp	[CASE_PROCTABLE_00406048+ecx*4]

; ---------------------------------------------------------------------------------

 00405BBD                           L00405BBD:
 00405BBD  81BDD4F8FFFF59020000      		cmp	dword ptr [ebp-0000072Ch],00000259h
 00405BC7  7743                      		ja 	L00405C0C
 00405BC9  81BDD4F8FFFF59020000      		cmp	dword ptr [ebp-0000072Ch],00000259h
 00405BD3  0F84E9010000              		jz 	L00405DC2
 00405BD9  8B85D4F8FFFF              		mov	eax,[ebp-0000072Ch]
 00405BDF  2D09020000                		sub	eax,00000209h
 00405BE4  8985D4F8FFFF              		mov	[ebp-0000072Ch],eax
 00405BEA  83BDD4F8FFFF4F            		cmp	dword ptr [ebp-0000072Ch],0000004Fh
 00405BF1  0F8736040000              		ja 	CASE_004060CE_PROC0003
 00405BF7  8B95D4F8FFFF              		mov	edx,[ebp-0000072Ch]
 00405BFD  33C9                      		xor	ecx,ecx
 00405BFF  8A8A7E604000              		mov	cl,[edx+CASE_0040607E]
 00405C05  FF248D6A604000            		jmp	[CASE_PROCTABLE_0040606A+ecx*4]

 ; ---------------------------------------------------------------------------------
 
  00405C0C                           L00405C0C:
 00405C0C  8B85D4F8FFFF              		mov	eax,[ebp-0000072Ch]
 00405C12  2DC4020000                		sub	eax,000002C4h
 00405C17  8985D4F8FFFF              		mov	[ebp-0000072Ch],eax
 00405C1D  81BDD4F8FFFFC2000000      		cmp	dword ptr [ebp-0000072Ch],000000C2h
 00405C27  0F8700040000              		ja 	CASE_004060CE_PROC0003
 00405C2D  8B95D4F8FFFF              		mov	edx,[ebp-0000072Ch]
 00405C33  33C9                      		xor	ecx,ecx
 00405C35  8A8AE2604000              		mov	cl,[edx+CASE_004060E2]
 00405C3B  FF248DCE604000            		jmp	[CASE_PROCTABLE_004060CE+ecx*4]

  ; ---------------------------------------------------------------------------------
  
   00410CB0                           L00410CB0:
 00410CB0  0FBE84C640564200          		movsx	eax,[esi+eax*8+L00425640]
 00410CB8  C1F804                    		sar	eax,04h
 00410CBB  83F807                    		cmp	eax,00000007h
 00410CBE  8945D0                    		mov	[ebp-30h],eax
 00410CC1  0F879A060000              		ja 	L00411361
 00410CC7  FF24857A134100            		jmp	[CASE_PROCTABLE_0041137A+eax*4]

 ; ---------------------------------------------------------------------------------
  
 00414F5A                           L00414F5A:
 00414F5A  8A1F                      		mov	bl,[edi]
 00414F5C  47                        		inc	edi
 00414F5D  83F80B                    		cmp	eax,0000000Bh
 00414F60  0F8777020000              		ja 	CASE_004153A4_PROC000A
 00414F66  FF2485A4534100            		jmp	[CASE_PROCTABLE_004153A4+eax*4]

 ; ---------------------------------------------------------------------------------
 
  00418353                           L00418353:
 00418353  83FB09                    		cmp	ebx,00000009h
 00418356  0F873D030000              		ja 	CASE_004186C4_PROC0008
 0041835C  FF249DC4864100            		jmp	[CASE_PROCTABLE_004186C4+ebx*4]

; ---------------------------------------------------------------------------------

 00418769                           L00418769:
 00418769  81FFF1000000              		cmp	edi,000000F1h
 0041876F  8BC7                      		mov	eax,edi
 00418771  7715                      		ja 	L00418788
 00418773  0F841D010000              		jz 	L00418896
 00418779  83E807                    		sub	eax,00000007h
 0041877C  83F808                    		cmp	eax,00000008h
 0041877F  7724                      		ja 	CASE_004189A0_PROC0002
 00418781  FF2485A0894100            		jmp	[CASE_PROCTABLE_004189A0+eax*4]

; ---------------------------------------------------------------------------------

 00419220                           SUB_L00419220:
 00419220  83EC14                    		sub	esp,00000014h
 00419223  53                        		push	ebx
 00419224  56                        		push	esi
 00419225  8B742420                  		mov	esi,[esp+20h]
 00419229  57                        		push	edi
 0041922A  55                        		push	ebp
 0041922B  6AF0                      		push	FFFFFFF0h
 0041922D  56                        		push	esi
 0041922E  FF1530354200              		call	[USER32.dll!GetWindowLongA]
 00419234  89442410                  		mov	[esp+10h],eax
 00419238  A900000010                		test	eax,10000000h
 0041923D  0F8439010000              		jz 	CASE_00419384_PROC0009
 00419243  8D442414                  		lea	eax,[esp+14h]
 00419247  50                        		push	eax
 00419248  56                        		push	esi
 00419249  FF159C344200              		call	[USER32.dll!GetClientRect]
 0041924F  8B442410                  		mov	eax,[esp+10h]
 00419253  83E01F                    		and	eax,0000001Fh
 00419256  83F812                    		cmp	eax,00000012h
 00419259  0F871D010000              		ja 	CASE_00419384_PROC0009
 0041925F  33C9                      		xor	ecx,ecx
 00419261  8A88AC934100              		mov	cl,[eax+CASE_004193AC]
 00419267  FF248D84934100            		jmp	[CASE_PROCTABLE_00419384+ecx*4]

; ---------------------------------------------------------------------------------

 0041C61D                           L0041C61D:
 0041C61D  48                        		dec	eax
 0041C61E  83F830                    		cmp	eax,00000030h
 0041C621  0F87C6020000              		ja 	CASE_0041C901_PROC0025
 0041C627  FF248501C94100            		jmp	[CASE_PROCTABLE_0041C901+eax*4]

; ---------------------------------------------------------------------------------

 
   