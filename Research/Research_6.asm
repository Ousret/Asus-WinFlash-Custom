;On a bypassé la verif lorsque que l'on clique sur Flash
;Faut maintenant rechercher de quoi bypasser lors du clic sur Exit
;Je vais en chier

;1st exit process
 0040D8D1                           L0040D8D1:
 0040D8D1  FF742404                  		push	[esp+04h]
 0040D8D5  E803250000                		call	SUB_L0040FDDD
 0040D8DA  59                        		pop	ecx
 0040D8DB  68FF000000                		push	000000FFh
 0040D8E0  FF15F4304200              		call	[KERNEL32.dll!ExitProcess]
 0040D8E6  C3                        		retn

 ;On s'occupe de bsitf64
 
  0040B18C  66C740020000              		mov	word ptr [eax+02h],0000h
 0040B192  833DA8C6420000            		cmp	dword ptr [L0042C6A8],00000000h
 0040B199  7414                      		jz 	L0040B1AF
 0040B19B  6824AD4200                		push	SWC0042AD24_bsitf64_sys

 
  0040A123  8945F4                    		mov	[ebp-0Ch],eax
 0040A126  837DF400                  		cmp	dword ptr [ebp-0Ch],00000000h
 0040A12A  750A                      		jnz	L0040A136
 0040A12C  B8C9000000                		mov	eax,000000C9h
