 004014BC                           SUB_L004014BC: ;On tiens qqch là.. 
 ;Lorsque je change un jump conditionnelle je change la méthode de flash.
 004014BC  55                        		push	ebp
 004014BD  8BEC                      		mov	ebp,esp
 004014BF  81EC14030000              		sub	esp,00000314h
 004014C5  C745E400000000            		mov	dword ptr [ebp-1Ch],00000000h
 004014CC  8B4508                    		mov	eax,[ebp+08h]
 004014CF  8945F8                    		mov	[ebp-08h],eax
 004014D2  6A00                      		push	00000000h
 004014D4  8B4DF8                    		mov	ecx,[ebp-08h]
 004014D7  81C18C020000              		add	ecx,0000028Ch
 004014DD  E84E940100                		call	SUB_L0041A930
 004014E2  6A00                      		push	00000000h
 004014E4  8B4DF8                    		mov	ecx,[ebp-08h]
 004014E7  81C1E8020000              		add	ecx,000002E8h
 004014ED  E83E940100                		call	SUB_L0041A930
 004014F2  8B4DF8                    		mov	ecx,[ebp-08h]
 004014F5  83B9DC04000001            		cmp	dword ptr [ecx+000004DCh],00000001h
 004014FC  0F85AC000000              		jnz	L004015AE ;Flash.. 2-3 minutes process, on en veut pas.
 00401502  8B55F8                    		mov	edx,[ebp-08h]
 00401505  83BAEC04000001            		cmp	dword ptr [edx+000004ECh],00000001h
 0040150C  0F859C000000              		jnz	L004015AE ;Flash.. 2-3 minutes process, on en veut pas.
 00401512  C745E012020000            		mov	dword ptr [ebp-20h],00000212h
 00401519  8B4DF8                    		mov	ecx,[ebp-08h]
 0040151C  E84C640000                		call	SUB_L0040796D
 00401521  85C0                      		test	eax,eax ;Vérification du registre eax??!?? What the fuck.
 00401523  7509                      		jnz	L0040152E ;Flash pour Asus !!! On tiens qqch là..! C'est du sérieux.
 ;Manque maintenant la copie vers la RAM!
 ;Il accepte le bios mais ne le copie pas. (Courage on y est..)
 ;A ce stade il flash toujours correctement avec une rom officielle
 ;Faut trouver d'ou a partir de L0040152E
 ;Fesons un arbre a partir de cette appel
 00401525  C745E086030000            		mov	dword ptr [ebp-20h],00000386h
 0040152C  EB50                      		jmp	L0040157E ;Interessant (On le revoit à plusieurs reprise) Handle memory..

 ;L'appel inconnu de jmp L0040157E (Gestion de mémoire tampon apparement)
  0040157E                           L0040157E:
 0040157E  8B45E0                    		mov	eax,[ebp-20h]
 00401581  50                        		push	eax
 00401582  8B4DF8                    		mov	ecx,[ebp-08h]
 00401585  E88D440000                		call	SUB_L00405A17
 0040158A  6A01                      		push	00000001h
 0040158C  8B4DF8                    		mov	ecx,[ebp-08h]
 0040158F  81C1E8020000              		add	ecx,000002E8h
 00401595  E896930100                		call	SUB_L0041A930
 0040159A  8B4DF8                    		mov	ecx,[ebp-08h]
 0040159D  C7818402000001000000      		mov	dword ptr [ecx+00000284h],00000001h
 004015A7  33C0                      		xor	eax,eax
 004015A9  E917050000                		jmp	L00401AC5

 
 ;Flash pour asus
  0040152E                           L0040152E:
 0040152E  8B45F8                    		mov	eax,[ebp-08h]
 00401531  8B88F0040000              		mov	ecx,[eax+000004F0h]
 00401537  83E102                    		and	ecx,00000002h
 0040153A  83F902                    		cmp	ecx,00000002h
 0040153D  753F                      		jnz	L0040157E ;Mémoire tampon
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
 00401575  7507                      		jnz	L0040157E ;Mémoire tampon
 00401577  C745E02D010000            		mov	dword ptr [ebp-20h],0000012Dh

 
 ;Faut qu'on etudie le SUB_L0040796D
 
  0040796D                           SUB_L0040796D:
 0040796D  55                        		push	ebp
 0040796E  8BEC                      		mov	ebp,esp
 00407970  83EC28                    		sub	esp,00000028h
 00407973  894DD8                    		mov	[ebp-28h],ecx
 00407976  8B45D8                    		mov	eax,[ebp-28h]
 00407979  8B8888020000              		mov	ecx,[eax+00000288h]
 0040797F  51                        		push	ecx
 00407980  FF15DC324200              		call	[KERNEL32.dll!GlobalLock]
 00407986  8945F8                    		mov	[ebp-08h],eax
 00407989  8B55D8                    		mov	edx,[ebp-28h]
 0040798C  8B82E8040000              		mov	eax,[edx+000004E8h]
 00407992  50                        		push	eax
 00407993  FF15DC324200              		call	[KERNEL32.dll!GlobalLock]
 00407999  8945F0                    		mov	[ebp-10h],eax
 0040799C  C745E800000000            		mov	dword ptr [ebp-18h],00000000h
 004079A3  C745FC00000000            		mov	dword ptr [ebp-04h],00000000h
 004079AA  C745F400000000            		mov	dword ptr [ebp-0Ch],00000000h
 004079B1  C745E000000000            		mov	dword ptr [ebp-20h],00000000h
 004079B8  C745EC00000000            		mov	dword ptr [ebp-14h],00000000h
 004079BF  C745E400000000            		mov	dword ptr [ebp-1Ch],00000000h
 004079C6  837DF000                  		cmp	dword ptr [ebp-10h],00000000h
 004079CA  0F849A010000              		jz 	L00407B6A
 004079D0  837DF800                  		cmp	dword ptr [ebp-08h],00000000h
 004079D4  0F8490010000              		jz 	L00407B6A
 004079DA  C745EC00000000            		mov	dword ptr [ebp-14h],00000000h
 004079E1  EB09                      		jmp	L004079EC

; Reviens avant appel SUB_L0040796D
 00401943                           L00401943:
 00401943  837DE400                  		cmp	dword ptr [ebp-1Ch],00000000h
 00401947  7558                      		jnz	L004019A1
 00401949  8B4DF8                    		mov	ecx,[ebp-08h]
 0040194C  83B96C02000004            		cmp	dword ptr [ecx+0000026Ch],00000004h
 00401953  7D3C                      		jge	L00401991
 00401955  8B55F8                    		mov	edx,[ebp-08h]
 00401958  8B826C020000              		mov	eax,[edx+0000026Ch]
 0040195E  83C001                    		add	eax,00000001h
 00401961  8B4DF8                    		mov	ecx,[ebp-08h]
 00401964  89816C020000              		mov	[ecx+0000026Ch],eax
 0040196A  8B55F8                    		mov	edx,[ebp-08h]
 0040196D  83BADC04000000            		cmp	dword ptr [edx+000004DCh],00000000h
 00401974  7408                      		jz 	L0040197E
 00401976  8B4DF8                    		mov	ecx,[ebp-08h]
 00401979  E8EF5F0000                		call	SUB_L0040796D
 0040197E                           L0040197E:
 0040197E  8B4508                    		mov	eax,[ebp+08h]
 00401981  50                        		push	eax
 00401982  E835FBFFFF                		call	SUB_L004014BC
 00401987  83C404                    		add	esp,00000004h
 0040198A  33C0                      		xor	eax,eax
 0040198C  E934010000                		jmp	L00401AC5
