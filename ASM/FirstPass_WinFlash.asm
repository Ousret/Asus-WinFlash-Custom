;Source ASM code
;Version 1
;ONLY FOR ASUS AMI EFI Firmware
;Change this at your own risk
;Credit goes to Ousret

 004014BC                           SUB_L004014BC: ;Got'ya
 ;When you press "Flash" btn.
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
 004014FC  0F85AC000000              		jnz	L004015AE ;Manual flash, don't work on AMI ASUS EFI Firmware. Because of SMI Lock..
 00401502  8B55F8                    		mov	edx,[ebp-08h]
 00401505  83BAEC04000001            		cmp	dword ptr [edx+000004ECh],00000001h
 0040150C  0F859C000000              		jnz	L004015AE ;Same, Manual flash, don't work on AMI ASUS EFI Firmware. Because of SMI Lock..
 00401512  C745E012020000            		mov	dword ptr [ebp-20h],00000212h
 00401519  8B4DF8                    		mov	ecx,[ebp-08h]
 0040151C  E84C640000                		call	SUB_L0040796D
 00401521  85C0                      		test	eax,eax ;Here you are, bayby!
 00401523  7509                      		jnz	L0040152E ;This is it, jump here ! will allow the custom ROM when you clic "Flash"
 ;Search for E84C64000085C07509 and change it to E84C64000085C0EB09 for jump what ever happen.
 ;Now i need to find where WinFlash cpy the ROM to the RAM before shutdown and force it to do it even if the checksum fail.
 ;This is only the first part of the process.
 ;Now i've to search for what Exit btn do in ASM code.
 ;Almost there..
 00401525  C745E086030000            		mov	dword ptr [ebp-20h],00000386h
 0040152C  EB50                      		jmp	L0040157E ;Handle memory.. do not touch it ;)

;When clic on EXIT !!
;Almost there! 
;Work when patch 1 is applied and with original one
 
 0040788A                           L0040788A:
 0040788A  8B8DF8EFFFFF              		mov	ecx,[ebp-00001008h]
 00407890  3B8DF4E7FFFF              		cmp	ecx,[ebp-0000180Ch]
 00407896  0F83CC000000              		jnc	L00407968
 0040789C  8B95F8EFFFFF              		mov	edx,[ebp-00001008h]
 004078A2  83BC9500F0FFFF00          		cmp	dword ptr [ebp+edx*4-00001000h],00000000h
 004078AA  0F84B3000000              		jz 	L00407963
 004078B0  8B85F8EFFFFF              		mov	eax,[ebp-00001008h]
 004078B6  8B8C8500F0FFFF            		mov	ecx,[ebp+eax*4-00001000h]
 004078BD  51                        		push	ecx
 004078BE  6A00                      		push	00000000h
 004078C0  6811041000                		push	00100411h
 004078C5  FF158C324200              		call	[KERNEL32.dll!OpenProcess]
 004078CB  8985F0E7FFFF              		mov	[ebp-00001810h],eax
 004078D1  83BDF0E7FFFF00            		cmp	dword ptr [ebp-00001810h],00000000h
 004078D8  0F8485000000              		jz 	L00407963
 004078DE  C785FCEFFFFF00000000      		mov	dword ptr [ebp-00001004h],00000000h
 004078E8  8D95FCEFFFFF              		lea	edx,[ebp-00001004h]
 004078EE  52                        		push	edx
 004078EF  6A04                      		push	00000004h
 004078F1  8D85ECE7FFFF              		lea	eax,[ebp-00001814h]
 004078F7  50                        		push	eax
 004078F8  8B8DF0E7FFFF              		mov	ecx,[ebp-00001810h]
 004078FE  51                        		push	ecx
 004078FF  E812E70000                		call	jmp_PSAPI.DLL!EnumProcessModules
 00407904  85C0                      		test	eax,eax
 00407906  7444                      		jz 	L0040794C
 00407908  6800040000                		push	00000400h
 0040790D  8D95F8E7FFFF              		lea	edx,[ebp-00001808h]
 00407913  52                        		push	edx
 00407914  8B85ECE7FFFF              		mov	eax,[ebp-00001814h]
 0040791A  50                        		push	eax
 0040791B  8B8DF0E7FFFF              		mov	ecx,[ebp-00001810h]
 00407921  51                        		push	ecx
 00407922  E8E9E60000                		call	jmp_PSAPI.DLL!GetModuleFileNameExW
 00407927  68E4A74200                		push	SWC0042A7E4_USBChargerPlus_exe
 0040792C  8D95F8E7FFFF              		lea	edx,[ebp-00001808h]
 00407932  52                        		push	edx
 00407933  FF152C334200              		call	[SHLWAPI.dll!StrStrIW]
 00407939  85C0                      		test	eax,eax
 0040793B  740F                      		jz 	L0040794C
 0040793D  6A00                      		push	00000000h
 0040793F  8B85F0E7FFFF              		mov	eax,[ebp-00001810h]
 00407945  50                        		push	eax
 00407946  FF1590324200              		call	[KERNEL32.dll!TerminateProcess]



