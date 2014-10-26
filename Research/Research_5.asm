;1st theory
;L0040157E cause the give up of flashing
;Remplace jnz to jo in order to skip the give up..
;jo = 0x70
;jnz = 0x75
;Theory invalid.. 25/10/2014 .. cause = Unable to duplicate ROM (temps var)
;1. L0040152E 
;La fonction qui commence la procédure
 0040152E                           L0040152E:
 0040152E  8B45F8                    		mov	eax,[ebp-08h]
 00401531  8B88F0040000              		mov	ecx,[eax+000004F0h]
 00401537  83E102                    		and	ecx,00000002h
 0040153A  83F902                    		cmp	ecx,00000002h
 0040153D  753F                      		jnz	L0040157E ;1st occ -- somekind of memory handle
 0040153F  6A50                      		push	00000050h
 00401541  8D9540FFFFFF              		lea	edx,[ebp-000000C0h]
 00401547  52                        		push	edx
 00401548  6AFF                      		push	FFFFFFFFh
 0040154A  8B45F8                    		mov	eax,[ebp-08h]
 0040154D  0540020000                		add	eax,00000240h
 00401552  50                        		push	eax
 00401553  6A00                      		push	00000000h
 00401555  6A00                      		push	00000000h
 00401557  FF15E4324200              		call	[KERNEL32.dll!MultiByteToWideChar]
 0040155D  8D8D40FFFFFF              		lea	ecx,[ebp-000000C0h]
 00401563  51                        		push	ecx
 00401564  8B55F8                    		mov	edx,[ebp-08h]
 00401567  83C264                    		add	edx,00000064h
 0040156A  52                        		push	edx
 0040156B  8B4DF8                    		mov	ecx,[ebp-08h]
 0040156E  E82A660000                		call	SUB_L00407B9D
 00401573  85C0                      		test	eax,eax
 00401575  7507                      		jnz	L0040157E ;2nd occ 
 00401577  C745E02D010000            		mov	dword ptr [ebp-20h],0000012Dh

 ;Après le call SUB_L00407B9D
  0040157E                           L0040157E:
 0040157E  8B45E0                    		mov	eax,[ebp-20h]
 00401581  50                        		push	eax
 00401582  8B4DF8                    		mov	ecx,[ebp-08h]
 00401585  E88D440000                		call	SUB_L00405A17 ;Part trop loin.. impossible de savoir de quoi il s'agit -_-" !!
 0040158A  6A01                      		push	00000001h
 0040158C  8B4DF8                    		mov	ecx,[ebp-08h]
 0040158F  81C1E8020000              		add	ecx,000002E8h
 00401595  E896930100                		call	SUB_L0041A930
 0040159A  8B4DF8                    		mov	ecx,[ebp-08h]
 0040159D  C7818402000001000000      		mov	dword ptr [ecx+00000284h],00000001h
 004015A7  33C0                      		xor	eax,eax
 004015A9  E917050000                		jmp	L00401AC5

 
 ;2. Appel d'un SUB_
 ;Utilité inconnu.
  00407B9D                           SUB_L00407B9D:
 00407B9D  55                        		push	ebp
 00407B9E  8BEC                      		mov	ebp,esp
 00407BA0  81EC24040000              		sub	esp,00000424h
 00407BA6  57                        		push	edi
 00407BA7  898DDCFBFFFF              		mov	[ebp-00000424h],ecx
 00407BAD  C745F000000000            		mov	dword ptr [ebp-10h],00000000h
 00407BB4  EB09                      		jmp	L00407BBF

 ;Procédure de copie??
  00407BBF                           L00407BBF:
 00407BBF  837DF014                  		cmp	dword ptr [ebp-10h],00000014h
 00407BC3  7D21                      		jge	L00407BE6 ;On test avec force EB.. (jmp) --> Aucun effet, shutdown sans effet
 00407BC5  8B4DF0                    		mov	ecx,[ebp-10h]
 00407BC8  8B550C                    		mov	edx,[ebp+0Ch]
 00407BCB  33C0                      		xor	eax,eax
 00407BCD  668B044A                  		mov	ax,[edx+ecx*2]
 00407BD1  83F820                    		cmp	eax,00000020h
 00407BD4  750E                      		jnz	L00407BE4 ;On essaie de virer celui là --> 77 aucun effet, on tente avec EB --> Aucun effet
 00407BD6  8B4DF0                    		mov	ecx,[ebp-10h]
 00407BD9  8B550C                    		mov	edx,[ebp+0Ch]
 00407BDC  66C7044A0000              		mov	word ptr [edx+ecx*2],0000h
 00407BE2  EB02                      		jmp	L00407BE6
 
 ;Procédure de copie (2) ??
  00407BE6                           L00407BE6:
 00407BE6  C745F400000000            		mov	dword ptr [ebp-0Ch],00000000h
 00407BED  C745F8FFFFFFFF            		mov	dword ptr [ebp-08h],FFFFFFFFh
 00407BF4  C745FCFFFFFFFF            		mov	dword ptr [ebp-04h],FFFFFFFFh
 00407BFB  8D45FC                    		lea	eax,[ebp-04h]
 00407BFE  50                        		push	eax
 00407BFF  8D4DF8                    		lea	ecx,[ebp-08h]
 00407C02  51                        		push	ecx
 00407C03  E8180D0000                		call	SUB_L00408920
 00407C08  83C408                    		add	esp,00000008h
 00407C0B  83F801                    		cmp	eax,00000001h
 00407C0E  0F853D010000              		jnz	L00407D51
 00407C14  66C785E8FDFFFF0000        		mov	word ptr [ebp-00000218h],0000h
 00407C1D  B981000000                		mov	ecx,00000081h
 00407C22  33C0                      		xor	eax,eax
 00407C24  8DBDEAFDFFFF              		lea	edi,[ebp-00000216h]
 00407C2A  F3AB                      		rep stosd
 00407C2C  66AB                      		stosw
 00407C2E  8D95E8FDFFFF              		lea	edx,[ebp-00000218h]
 00407C34  52                        		push	edx
 00407C35  6804010000                		push	00000104h
 00407C3A  FF15B4324200              		call	[KERNEL32.dll!GetTempPathW]
 00407C40  85C0                      		test	eax,eax
 00407C42  0F8409010000              		jz 	L00407D51
 00407C48  680CA84200                		push	SWC0042A80C_WinFlash_79e57031_8122_4301_85fc
 00407C4D  8D85E8FDFFFF              		lea	eax,[ebp-00000218h]
 00407C53  50                        		push	eax
 00407C54  FF15B8324200              		call	[KERNEL32.dll!lstrcatW]
 00407C5A  6A00                      		push	00000000h
 00407C5C  8D8DE8FDFFFF              		lea	ecx,[ebp-00000218h]
 00407C62  51                        		push	ecx
 00407C63  FF15BC324200              		call	[KERNEL32.dll!CreateDirectoryW]
 00407C69  83F801                    		cmp	eax,00000001h
 00407C6C  0F85DF000000              		jnz	L00407D51
 00407C72  8D95E8FDFFFF              		lea	edx,[ebp-00000218h]
 00407C78  52                        		push	edx
 00407C79  8B45FC                    		mov	eax,[ebp-04h]
 00407C7C  50                        		push	eax
 00407C7D  8B4DF8                    		mov	ecx,[ebp-08h]
 00407C80  51                        		push	ecx
 00407C81  E89D0E0000                		call	SUB_L00408B23
 00407C86  83C40C                    		add	esp,0000000Ch
 00407C89  85C0                      		test	eax,eax
 00407C8B  0F84B3000000              		jz 	L00407D44 ;Remove directory.. Si deja existant. (Hypothese)
 00407C91  66C785E0FBFFFF0000        		mov	word ptr [ebp-00000420h],0000h
 00407C9A  B981000000                		mov	ecx,00000081h
 00407C9F  33C0                      		xor	eax,eax
 00407CA1  8DBDE2FBFFFF              		lea	edi,[ebp-0000041Eh]
 00407CA7  F3AB                      		rep stosd
 00407CA9  66AB                      		stosw
 00407CAB  6868A84200                		push	SWC0042A868_EFI_ASUS_FIRMWARE
 00407CB0  8D95E8FDFFFF              		lea	edx,[ebp-00000218h]
 00407CB6  52                        		push	edx
 00407CB7  688CA84200                		push	SWC0042A88C__s__s
 00407CBC  8D85E0FBFFFF              		lea	eax,[ebp-00000420h]
 00407CC2  50                        		push	eax
 00407CC3  E8CF660000                		call	SUB_L0040E397
 00407CC8  83C410                    		add	esp,00000010h
 00407CCB  6A00                      		push	00000000h
 00407CCD  8D8DE0FBFFFF              		lea	ecx,[ebp-00000420h]
 00407CD3  51                        		push	ecx
 00407CD4  FF15BC324200              		call	[KERNEL32.dll!CreateDirectoryW]
 00407CDA  8B550C                    		mov	edx,[ebp+0Ch]
 00407CDD  52                        		push	edx
 00407CDE  6898A84200                		push	SWC0042A898_EFI_ASUS_FIRMWARE
 00407CE3  8D85E8FDFFFF              		lea	eax,[ebp-00000218h]
 00407CE9  50                        		push	eax
 00407CEA  68BCA84200                		push	SWC0042A8BC__s__s__s_BIN
 00407CEF  8D8DE0FBFFFF              		lea	ecx,[ebp-00000420h]
 00407CF5  51                        		push	ecx
 00407CF6  E89C660000                		call	SUB_L0040E397
 00407CFB  83C414                    		add	esp,00000014h
 00407CFE  6880000000                		push	00000080h
 00407D03  8D95E0FBFFFF              		lea	edx,[ebp-00000420h]
 00407D09  52                        		push	edx
 00407D0A  FF15C0324200              		call	[KERNEL32.dll!SetFileAttributesW]
 00407D10  6A00                      		push	00000000h
 00407D12  8D85E0FBFFFF              		lea	eax,[ebp-00000420h]
 00407D18  50                        		push	eax
 00407D19  8B4D08                    		mov	ecx,[ebp+08h]
 00407D1C  51                        		push	ecx
 00407D1D  FF15C4324200              		call	[KERNEL32.dll!CopyFileW]
 00407D23  8945F4                    		mov	[ebp-0Ch],eax
 00407D26  6A03                      		push	00000003h
 00407D28  8D95E0FBFFFF              		lea	edx,[ebp-00000420h]
 00407D2E  52                        		push	edx
 00407D2F  FF15C0324200              		call	[KERNEL32.dll!SetFileAttributesW]
 00407D35  8D85E8FDFFFF              		lea	eax,[ebp-00000218h]
 00407D3B  50                        		push	eax
 00407D3C  E853110000                		call	SUB_L00408E94
 00407D41  83C404                    		add	esp,00000004h

 ;Vers SUB_L00408E94
  00408E94                           SUB_L00408E94:
 00408E94  55                        		push	ebp
 00408E95  8BEC                      		mov	ebp,esp
 00408E97  83EC28                    		sub	esp,00000028h
 00408E9A  57                        		push	edi
 00408E9B  C745FCFFFFFFFF            		mov	dword ptr [ebp-04h],FFFFFFFFh
 00408EA2  8B4508                    		mov	eax,[ebp+08h]
 00408EA5  50                        		push	eax
 00408EA6  FF1580324200              		call	[KERNEL32.dll!GetFileAttributesW]
 00408EAC  8945F8                    		mov	[ebp-08h],eax
 00408EAF  8B4DF8                    		mov	ecx,[ebp-08h]
 00408EB2  81E100040000              		and	ecx,00000400h
 00408EB8  81F900040000              		cmp	ecx,00000400h
 00408EBE  756F                      		jnz	L00408F2F ;Aucun effet avec jmp
 00408EC0  6A00                      		push	00000000h
 00408EC2  6800002002                		push	02200000h
 00408EC7  6A03                      		push	00000003h
 00408EC9  6A00                      		push	00000000h
 00408ECB  6A04                      		push	00000004h
 00408ECD  68400000C0                		push	C0000040h
 00408ED2  8B5508                    		mov	edx,[ebp+08h]
 00408ED5  52                        		push	edx
 00408ED6  FF15FC324200              		call	[KERNEL32.dll!CreateFileW]
 00408EDC  8945FC                    		mov	[ebp-04h],eax
 00408EDF  837DFCFF                  		cmp	dword ptr [ebp-04h],FFFFFFFFh
 00408EE3  744A                      		jz 	L00408F2F
 00408EE5  C745D800000000            		mov	dword ptr [ebp-28h],00000000h
 00408EEC  B906000000                		mov	ecx,00000006h
 00408EF1  33C0                      		xor	eax,eax
 00408EF3  8D7DDC                    		lea	edi,[ebp-24h]
 00408EF6  F3AB                      		rep stosd
 00408EF8  C745D8030000A0            		mov	dword ptr [ebp-28h],A0000003h
 00408EFF  C745F400000000            		mov	dword ptr [ebp-0Ch],00000000h
 00408F06  6A00                      		push	00000000h
 00408F08  8D45F4                    		lea	eax,[ebp-0Ch]
 00408F0B  50                        		push	eax
 00408F0C  6A00                      		push	00000000h
 00408F0E  6A00                      		push	00000000h
 00408F10  6A18                      		push	00000018h
 00408F12  8D4DD8                    		lea	ecx,[ebp-28h]
 00408F15  51                        		push	ecx
 00408F16  68AC000900                		push	000900ACh
 00408F1B  8B55FC                    		mov	edx,[ebp-04h]
 00408F1E  52                        		push	edx
 00408F1F  FF15F4324200              		call	[KERNEL32.dll!DeviceIoControl]
 00408F25  8B45FC                    		mov	eax,[ebp-04h]
 00408F28  50                        		push	eax
 00408F29  FF15F8324200              		call	[KERNEL32.dll!CloseHandle]

