* Asus EFI BIOS WinFlash bypass verif PoC *

Educational purposes only.

* Credits *

Goes to Ousret

* Actual state *

Does not work on my laptop because of verification with Easy Flash.
I wanted to bypass AMI EFI Haswell check when flashing. 
May work on Ivy Bridge.
Just bypass WinFlash check..
Just PoC for now. Nothing else..

* Why ? *

Because i'm an unhappy customer !
This is about the lack of freedom in our own configuration.
so i decided to work on a 'Jailbreak' for Asus EFI BIOS.

For example one of thing that make me puke is that Asus set shutdown alert at 100°C.
Your laptop would be already dead at this point. 
So with this tool you should be allowed to lower that insane trip point. 
Your laptop could be saved with this.
Another example, Nvidia Optimus is still very limited to 'Wintrash' and with this tool
you should be able to disable that bullshit and fully enjoy Linux dist. and Hackintosh !

* What ? *

I studied how WinFlash work and I found a vulnerability.
In did WinFlash check the ROM himself and prepare the EFI firmware to flash the BIOS.
Asus built AMI Bios with EasyFlash that is very secure and cannot be modified from this day.
But WinFlash can be modified, so I disassembled the program and search for when the software allow or not the procedure.
This software is'nt open source and my work can be found at GitHub.

* Results *

Does not work on my AMI EFI Asus firmware. EasyFlash check again the f****ing ROM !
Reports me any success or fail with screen or picture.
If anyone, i said anyone have any idea to bypass this.
Don't hesitate to contact me. Skype or Mail. Your choice.

* Where ? *

My work can be found at https://github.com/Ousret/
Follow me on Twitter to be informed when something happen.
https://twitter.com/Ousret

* Support *

This software is free of any charge !
Very hard work and many test..

* Caution *

At this time, this tool is ONLY for Asus EFI AMI firmware AND NOTHING ELSE !
Don't be stupid, unless you have a SPI Flasher at hand.

I cannot be held responsible for any damage or if you brick your laptop.