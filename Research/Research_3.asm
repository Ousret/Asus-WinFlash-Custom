;Fichier 2 tracer le message shutdown
 00405F16                           CASE_0040606A_PROC0002:
 00405F16  8B85D8F8FFFF              		mov	eax,[ebp-00000728h]
 00405F1C  83B8EC04000001            		cmp	dword ptr [eax+000004ECh],00000001h
 00405F23  751B                      		jnz	L00405F40
 00405F25  682C010000                		push	0000012Ch
 00405F2A  8D8DA8FDFFFF              		lea	ecx,[ebp-00000258h]
 00405F30  51                        		push	ecx
 00405F31  68A8A64200                		push	SWC0042A6A8_IDS_REBOOT_SF20
 00405F36  E8E0470000                		call	SUB_L0040A71B
 00405F3B  83C40C                    		add	esp,0000000Ch
 00405F3E  EB47                      		jmp	L00405F87

;..
;Ce bout de code est appellé après fail de la vérif
 00406014                           CASE_004060CE_PROC0003:
 00406014  682C010000                		push	0000012Ch
 00406019  8D85A8FDFFFF              		lea	eax,[ebp-00000258h]
 0040601F  50                        		push	eax
 00406020  685CA74200                		push	SWC0042A75C_IDS_INVALID_BIOS ;Preuve est que si je change cette ligne par SWC0042A6A8_IDS_REBOOT_SF20, le chmgt est effectif.
 00406025  E8F1460000                		call	SUB_L0040A71B
 0040602A  83C40C                    		add	esp,0000000Ch

 
 
;Switch?!?
 0040606A                           CASE_PROCTABLE_0040606A:
 0040606A  B25E4000                 		dd	CASE_0040606A_PROC0000
 0040606E  E45E4000                 		dd	CASE_0040606A_PROC0001
 00406072  165F4000                 		dd	CASE_0040606A_PROC0002
 00406076  905D4000                 		dd	CASE_0040606A_PROC0003
 0040607A  2D604000                 		dd	CASE_004060CE_PROC0003

 ;Appel #1 Avant clic sur flash.. donc inutile
 
 00405BBD                           L00405BBD:
 00405BBD  81BDD4F8FFFF59020000      		cmp	dword ptr [ebp-0000072Ch],00000259h
 00405BC7  7743                      		ja 	L00405C0C
 00405BC9  81BDD4F8FFFF59020000      		cmp	dword ptr [ebp-0000072Ch],00000259h
 00405BD3  0F84E9010000              		jz 	L00405DC2
 00405BD9  8B85D4F8FFFF              		mov	eax,[ebp-0000072Ch]
 00405BDF  2D09020000                		sub	eax,00000209h
 00405BE4  8985D4F8FFFF              		mov	[ebp-0000072Ch],eax
 00405BEA  83BDD4F8FFFF4F            		cmp	dword ptr [ebp-0000072Ch],0000004Fh
 00405BF1  0F8736040000              		ja 	CASE_004060CE_PROC0003 ;Invalid BIOS
 00405BF7  8B95D4F8FFFF              		mov	edx,[ebp-0000072Ch]
 00405BFD  33C9                      		xor	ecx,ecx
 00405BFF  8A8A7E604000              		mov	cl,[edx+CASE_0040607E]
 00405C05  FF248D6A604000            		jmp	[CASE_PROCTABLE_0040606A+ecx*4] ; Case valid??

 ;Bingo??
 
     5c35:	8a 8a e2 60 40 00    	mov    0x4060e2(%edx),%cl
    5c3b:	ff 24 8d ce 60 40 00 	jmp    *0x4060ce(,%ecx,4)
 
;Fin prog??

 L00405F87:
  		mov	eax,[ebp-00000728h]
  		cmp	dword ptr [eax+00000764h],00000000h
  		jz 	L00405FDC
  		mov	word ptr [ebp-00000724h],0000h
  		mov	ecx,00000031h
  		xor	eax,eax
  		lea	edi,[ebp-00000722h]
  		rep stosd
  		stosw
  		push	00000064h
  		lea	ecx,[ebp-00000724h]
  		push	ecx
  		push	SWC0042A6FC_IDS_CMOS_CLEAR
  		call	SUB_L0040A71B
  		add	esp,0000000Ch
  		lea	edx,[ebp-00000724h]
  		push	edx
  		lea	eax,[ebp-00000258h]
  		push	eax
  		call	SUB_L0040E302
  		add	esp,00000008h

;Fonction SUB_ a surveiller

;----------------------------------------------------------------------------------------------------
 00405A17                           SUB_L00405A17:
 00405A17  55                        		push	ebp
 00405A18  8BEC                      		mov	ebp,esp
 00405A1A  81EC2C070000              		sub	esp,0000072Ch
 00405A20  57                        		push	edi
 00405A21  898DD8F8FFFF              		mov	[ebp-00000728h],ecx
 00405A27  68F6030000                		push	000003F6h
 00405A2C  8B8DD8F8FFFF              		mov	ecx,[ebp-00000728h]
 00405A32  E8264D0100                		call	SUB_L0041A75D
 00405A37  8BC8                      		mov	ecx,eax
 00405A39  E8722A0000                		call	SUB_L004084B0
 00405A3E  8985A4FDFFFF              		mov	[ebp-0000025Ch],eax
 00405A44  66C785A8FDFFFF0000        		mov	word ptr [ebp-00000258h],0000h
 00405A4D  B995000000                		mov	ecx,00000095h
 00405A52  33C0                      		xor	eax,eax
 00405A54  8DBDAAFDFFFF              		lea	edi,[ebp-00000256h]
 00405A5A  F3AB                      		rep stosd
 00405A5C  66AB                      		stosw
 00405A5E  66C785A4FBFFFF0000        		mov	word ptr [ebp-0000045Ch],0000h
 00405A67  B97F000000                		mov	ecx,0000007Fh
 00405A6C  33C0                      		xor	eax,eax
 00405A6E  8DBDA6FBFFFF              		lea	edi,[ebp-0000045Ah]
 00405A74  F3AB                      		rep stosd
 00405A76  66AB                      		stosw
 00405A78  66C785A4F9FFFF0000        		mov	word ptr [ebp-0000065Ch],0000h
 00405A81  B97F000000                		mov	ecx,0000007Fh
 00405A86  33C0                      		xor	eax,eax
 00405A88  8DBDA6F9FFFF              		lea	edi,[ebp-0000065Ah]
 00405A8E  F3AB                      		rep stosd
 00405A90  66AB                      		stosw
 00405A92  6800010000                		push	00000100h
 00405A97  8D85A4FBFFFF              		lea	eax,[ebp-0000045Ch]
 00405A9D  50                        		push	eax
 00405A9E  683CA44200                		push	SWC0042A43C_IDS_EXIT
 00405AA3  E8734C0000                		call	SUB_L0040A71B
 00405AA8  83C40C                    		add	esp,0000000Ch
 00405AAB  6800010000                		push	00000100h
 00405AB0  8D8DA4F9FFFF              		lea	ecx,[ebp-0000065Ch]
 00405AB6  51                        		push	ecx
 00405AB7  6850A44200                		push	SWC0042A450_IDS_RETRY
 00405ABC  E85A4C0000                		call	SUB_L0040A71B
 00405AC1  83C40C                    		add	esp,0000000Ch
 00405AC4  8B95D8F8FFFF              		mov	edx,[ebp-00000728h]
 00405ACA  8B4508                    		mov	eax,[ebp+08h]
 00405ACD  898280020000              		mov	[edx+00000280h],eax
 00405AD3  8B4D08                    		mov	ecx,[ebp+08h]
 00405AD6  51                        		push	ecx
 00405AD7  8B8DD8F8FFFF              		mov	ecx,[ebp-00000728h]
 00405ADD  E829120000                		call	SUB_L00406D0B
 00405AE2  8B5508                    		mov	edx,[ebp+08h]
 00405AE5  8995D4F8FFFF              		mov	[ebp-0000072Ch],edx
 00405AEB  81BDD4F8FFFF08020000      		cmp	dword ptr [ebp-0000072Ch],00000208h
 00405AF5  0F87C2000000              		ja 	L00405BBD
 00405AFB  81BDD4F8FFFF08020000      		cmp	dword ptr [ebp-0000072Ch],00000208h
 00405B05  0F8489030000              		jz 	L00405E94
 00405B0B  81BDD4F8FFFF31010000      		cmp	dword ptr [ebp-0000072Ch],00000131h
 00405B15  7773                      		ja 	L00405B8A
 00405B17  81BDD4F8FFFF31010000      		cmp	dword ptr [ebp-0000072Ch],00000131h
 00405B21  0F8437020000              		jz 	L00405D5E
 00405B27  81BDD4F8FFFF2C010000      		cmp	dword ptr [ebp-0000072Ch],0000012Ch
 00405B31  7732                      		ja 	L00405B65
 00405B33  81BDD4F8FFFF2C010000      		cmp	dword ptr [ebp-0000072Ch],0000012Ch
 00405B3D  0F8485010000              		jz 	L00405CC8
 00405B43  83BDD4F8FFFF00            		cmp	dword ptr [ebp-0000072Ch],00000000h
 00405B4A  0F84F2000000              		jz 	L00405C42
 00405B50  81BDD4F8FFFFC8000000      		cmp	dword ptr [ebp-0000072Ch],000000C8h
 00405B5A  0F8434010000              		jz 	L00405C94
 00405B60  E9C8040000                		jmp	CASE_004060CE_PROC0004

		