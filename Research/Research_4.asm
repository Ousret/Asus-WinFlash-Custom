 0042A684  4900440053005F005600+     		unicode	'IDS_VERIFY_FAILED',0000h
 
 ;Call of what we are searching for
  0042A75C  4900440053005F004900+     		unicode	'IDS_INVALID_BIOS',0000h
  
  ;1st occurence
  
 00406014                           CASE_004060CE_PROC0003:
 00406014  682C010000                		push	0000012Ch
 00406019  8D85A8FDFFFF              		lea	eax,[ebp-00000258h]
 0040601F  50                        		push	eax
 00406020  685CA74200                		push	SWC0042A75C_IDS_INVALID_BIOS
 00406025  E8F1460000                		call	SUB_L0040A71B
 0040602A  83C40C                    		add	esp,0000000Ch
 
 
  SWC0042A75C_IDS_INVALID_BIOS:
  		unicode	'IDS_INVALID_BIOS',0000h
  		Align	4

		;Souvent rappel 
		call	SUB_L0040A71B
		
		
 ;0040A71B                           SUB_L0040A71B:
 0040A71B  55                        		push	ebp
 0040A71C  8BEC                      		mov	ebp,esp
 0040A71E  81EC34080000              		sub	esp,00000834h
 0040A724  57                        		push	edi
 0040A725  837D0800                  		cmp	dword ptr [ebp+08h],00000000h
 0040A729  7406                      		jz 	L0040A731
 0040A72B  837D0C00                  		cmp	dword ptr [ebp+0Ch],00000000h
 0040A72F  7505                      		jnz	L0040A736

 ;FAIL #1 - Boite de dialogue

;23/10/2014
;WinFlash semble ne pas utiliser la partition EFI
;Les premières expérimentations montre que le logiciel le stocke on mémoire RAM ? à vérifier ?
;Donc sa ne sert à rien de tromper le shutdown.4
;Faut chercher test checksum ou similaire.
;Ce qui m'intrigue c'est la chaine de caractère EFI\ASUS
 
 0042A37C                           SWC0042A37C__s__s__s_BIN:
 0042A37C  250073005C0025007300+     		unicode	'%s\%s\%s.BIN',0000h
 0042A396  0000                      		Align	4

;Aucune explication à ce jour.

;IDS_[..] fait appel au boite de dialogue.. FAIL XD

 00407DF0                           SUB_L00407DF0:
  00407DD7  7409                      		jz 	L00407DE2

    		call	SUB_L00407EF0

;On remonte l'arbre
 CASE_004060CE_PROC0003:
;Trouvaille interessante
 004060CE                           CASE_PROCTABLE_004060CE:
 004060CE  F95F4000                 		dd	CASE_004060CE_PROC0000
 004060D2  605C4000                 		dd	CASE_004060CE_PROC0001
 004060D6  DE5F4000                 		dd	CASE_004060CE_PROC0002
 004060DA  14604000                 		dd	CASE_004060CE_PROC0003
 004060DE  2D604000                 		dd	CASE_004060CE_PROC0004
 
;Condition semblable switch?
 00405FF9                           CASE_004060CE_PROC0000:
 00405FF9  682C010000                		push	0000012Ch
 00405FFE  8D95A8FDFFFF              		lea	edx,[ebp-00000258h]
 00406004  52                        		push	edx
 00406005  683CA74200                		push	SWC0042A73C_IDS_UNSUPPORTED
 0040600A  E80C470000                		call	SUB_L0040A71B
 0040600F  83C40C                    		add	esp,0000000Ch
 00406012  EB19                      		jmp	CASE_004060CE_PROC0004
 00406014                           CASE_004060CE_PROC0003:
 00406014  682C010000                		push	0000012Ch
 00406019  8D85A8FDFFFF              		lea	eax,[ebp-00000258h]
 0040601F  50                        		push	eax
 00406020  685CA74200                		push	SWC0042A75C_IDS_INVALID_BIOS ;Vers echec
 00406025  E8F1460000                		call	SUB_L0040A71B
 0040602A  83C40C                    		add	esp,0000000Ch
 0040602D                           CASE_004060CE_PROC0004:
 0040602D  8D8DA8FDFFFF              		lea	ecx,[ebp-00000258h]
 00406033  51                        		push	ecx
 00406034  8B95A4FDFFFF              		mov	edx,[ebp-0000025Ch]
 0040603A  52                        		push	edx
 0040603B  FF150C354200              		call	[USER32.dll!SetWindowTextW] ;Suivant?
 00406041  5F                        		pop	edi
 00406042  8BE5                      		mov	esp,ebp
 00406044  5D                        		pop	ebp
 00406045  C20400                    		retn	0004h


;Hyper interessant !!!
;Fonction qui termine sur jmp CASE PROC0003
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
 00405B60  E9C8040000                		jmp	CASE_004060CE_PROC0003


 ;1st = ja 	L00405BBD
jmp	[CASE_PROCTABLE_0040606A+ecx*4]

