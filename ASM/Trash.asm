 ;2nd hyp
 
 0040C850                           SUB_L0040C850:
 0040C850  55                        		push	ebp
 0040C851  8BEC                      		mov	ebp,esp
 0040C853  83EC08                    		sub	esp,00000008h
 0040C856  894DF8                    		mov	[ebp-08h],ecx
 0040C859  837D08FF                  		cmp	dword ptr [ebp+08h],FFFFFFFFh
 0040C85D  7411                      		jz 	L0040C870 ;jmp here --> Make the window just dissapear, nothing happen after exit clic. got something here !!
 0040C85F  8B4508                    		mov	eax,[ebp+08h]
 0040C862  50                        		push	eax
 0040C863  FF15F8324200              		call	[KERNEL32.dll!CloseHandle]
 0040C869  C74508FFFFFFFF            		mov	dword ptr [ebp+08h],FFFFFFFFh

 ;3rd
 00407BBC  8945F0                    		mov	[ebp-10h],eax
 00407BBF                           L00407BBF:
 00407BBF  837DF014                  		cmp	dword ptr [ebp-10h],00000014h
 00407BC3  7D21                      		jge	L00407BE6
 00407BC5  8B4DF0                    		mov	ecx,[ebp-10h]
 00407BC8  8B550C                    		mov	edx,[ebp+0Ch]
 00407BCB  33C0                      		xor	eax,eax
 00407BCD  668B044A                  		mov	ax,[edx+ecx*2]
 00407BD1  83F820                    		cmp	eax,00000020h
 00407BD4  750E                      		jnz	L00407BE4
 00407BD6  8B4DF0                    		mov	ecx,[ebp-10h]
 00407BD9  8B550C                    		mov	edx,[ebp+0Ch]
 00407BDC  66C7044A0000              		mov	word ptr [edx+ecx*2],0000h
 00407BE2  EB02                      		jmp	L00407BE6