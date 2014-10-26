;Second pass
;When clic on Exit btn
;
 004077F9                           SUB_L004077F9:
 004077F9  55                        		push	ebp
 004077FA  8BEC                      		mov	ebp,esp
 004077FC  B818180000                		mov	eax,00001818h
 00407801  E80A6C0000                		call	SUB_L0040E410
 00407806  57                        		push	edi
 00407807  898DE8E7FFFF              		mov	[ebp-00001818h],ecx
 0040780D  C78500F0FFFF00000000      		mov	dword ptr [ebp-00001000h],00000000h
 00407817  B9FF030000                		mov	ecx,000003FFh
 0040781C  33C0                      		xor	eax,eax
 0040781E  8DBD04F0FFFF              		lea	edi,[ebp-00000FFCh]
 00407824  F3AB                      		rep stosd
 00407826  66C785F8E7FFFF0000        		mov	word ptr [ebp-00001808h],0000h
 0040782F  B9FF010000                		mov	ecx,000001FFh
 00407834  33C0                      		xor	eax,eax
 00407836  8DBDFAE7FFFF              		lea	edi,[ebp-00001806h]
 0040783C  F3AB                      		rep stosd
 0040783E  66AB                      		stosw
 00407840  8D85FCEFFFFF              		lea	eax,[ebp-00001004h]
 00407846  50                        		push	eax
 00407847  6800100000                		push	00001000h
 0040784C  8D8D00F0FFFF              		lea	ecx,[ebp-00001000h]
 00407852  51                        		push	ecx
 00407853  E8C4E70000                		call	jmp_PSAPI.DLL!EnumProcesses
 00407858  85C0                      		test	eax,eax
 0040785A  0F8408010000              		jz 	L00407968
 00407860  8B95FCEFFFFF              		mov	edx,[ebp-00001004h]
 00407866  C1EA02                    		shr	edx,02h
 00407869  8995F4E7FFFF              		mov	[ebp-0000180Ch],edx
 0040786F  C785F8EFFFFF00000000      		mov	dword ptr [ebp-00001008h],00000000h
 00407879  EB0F                      		jmp	L0040788A ;Close USBChargerPlus because of possible conflict.. Closed in both case. Custom ROM and official ROM

 ;This is what call SUB_L004077F9
  00401860                           L00401860:
 00401860  8B4DF8                    		mov	ecx,[ebp-08h]
 00401863  E8915F0000                		call	SUB_L004077F9 ;Previous call
 00401868  8B4DF8                    		mov	ecx,[ebp-08h]
 0040186B  81B9D804000000005000      		cmp	dword ptr [ecx+000004D8h],00500000h
 00401875  1BD2                      		sbb	edx,edx
 00401877  81E2D4FEFFFF              		and	edx,FFFFFED4h
 0040187D  81C258020000              		add	edx,00000258h
 00401883  52                        		push	edx
 00401884  6A01                      		push	00000001h
 00401886  8B4DF8                    		mov	ecx,[ebp-08h]
 00401889  E8205F0000                		call	SUB_L004077AE
 0040188E  68F4010000                		push	000001F4h
 00401893  8B4DF8                    		mov	ecx,[ebp-08h]
 00401896  E87C410000                		call	SUB_L00405A17
 0040189B  8B45F8                    		mov	eax,[ebp-08h]
 0040189E  8B8874020000              		mov	ecx,[eax+00000274h]
 004018A4  51                        		push	ecx
 004018A5  8B4DF8                    		mov	ecx,[ebp-08h]
 004018A8  E8D7240000                		call	SUB_L00403D84
 004018AD  8945E0                    		mov	[ebp-20h],eax
 004018B0  837DE000                  		cmp	dword ptr [ebp-20h],00000000h
 004018B4  7411                      		jz 	L004018C7 ;Patch 837DE00074118B to 837DE000EB118B
 004018B6  8B55E0                    		mov	edx,[ebp-20h]
 004018B9  52                        		push	edx
 004018BA  8B4DF8                    		mov	ecx,[ebp-08h]
 004018BD  E855410000                		call	SUB_L00405A17
 004018C2  E9F4010000                		jmp	L00401ABB
