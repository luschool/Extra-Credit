# **Arch Linux Installation Documentation**

After some thought between Tails and Arch I have decided to install and use Arch.

This is mearly a place that I documented my experiences, resources, and struggles. 

    Hardware - 
        2 SanDisk USB Drives
	1 Computer to facilitate the install
	1 Laptop or Phone to follow any guides and answer questions with google.

    Software -
        archlinux-2018.02.01-x86_64.iso
        Etcher.io

I used Etcher on windows to make the .iso bootable on USB 1 to begin my install
process. I made sure to delete any partitions on USB 2 as it would soon be my
persistent bootable Arch Linux.

Once both drives were ready I restarted my computer and using the boot menu I
booted into USB 1 while using my laptop to help guide my way. 

Arch Linux has a ton of great information on their wiki along with their own
Installation guide. However it wasnt as clear as I would of liked it to be. I also 
wanted to be able to boot with both partition scheme options which this next guide
shows you how to do. 


**The guide I followed the most was by C.Magyar on valleycat -**

    http://valleycat.org/linux/arch-usb.html?i=2

This guide is almost as clear cut as you can get in my opinion. Make sure you
double check every command twice and read throughly if you're unsure. However I
still used Archs Wiki and other resources if I was ever unsure or having a
problem. 

    Other resources used -
    https://lifehacker.com/5680453/build-a-killer-customized-arch-linux-installation-and-learn-all-about-linux-in-the-process
    https://wiki.archlinux.org/index.php/Installation_guide
    https://www.addictivetips.com/ubuntu-linux-tips/how-to-install-arch-linux/

**I want to document any issues or tips I have in the order I encountered them.**

* Use a wired connection if at all possible. Trying to connect over wireless from
the start was a bit problematic for me and others it seems.

* Make sure you are 100% sure the name of USB 2 by using the commands "lsblk" and
"fdisk -l" Failure to do this could result in you erasing data on the wrong drive*

	Partition Information https://wiki.archlinux.org/index.php/Partitioning 
 
* The only patition change I made from the guide was to make partition 2 550MB
based on something I read on another article.

## TAKE NOTE BEFORE YOU INSTALL THE BASE PACKAGES 
    
        Command "pacstrap /mnt base" begins the download and installation of all
        the base packages for Arch. 
        
        I suggest checking your mirrors being used for downloading first.
        Command "nano /etc/pacman.d/mirrorlist" will open up the mirrorlist to
        edit. Find a few of the US domains and copy with alt+6 and paste the
        copied lines at the top of the list with ctrl+u. Save the file.
        
        My default mirror was one in China and even though I changed it and saved
        the file it never registered the change and my download took forever. 
        
        Later I found the command " pacman -Syyu " which should refresh it. 
        After you edit the mirrors and refresh it with the above command
        you should be getting much better speeds when you run the 
        "pacstrap /mnt base" command.
        
* TAKE NOTE BEFORE YOU INSTALL THE BASE PACKAGES 


The final issue I had was with network interface names. My home computer has 2
Ethernet ports and using the command "ln -s /dev/null /etc/udev/rules.d/80-net-setup-link.rules"
to revert interfaces to traditional names the guide wasnt able to provide me
network access when you reach the ifplugd step.

        Step netctl-ifplugd has you input the following commands
        1 - "cp /etc/netctl/examples/ethernet-dhcp /etc/netctl/eth0-arch_usb"
        2 - "nano /etc/netctl/eth0-arch_usb" Edit and ensure interface is named (Interface=eth0):
        3 - "systemctl start netctl-ifplugd@eth0.service"
        4 - "systemctl enable netctl-ifplugd@eth0.service"
        
        My problem was eth1 was the ethernet port that was actually plugged in.
        There is probably multiple ways to fix this but what I did was just
        followed steps 1 through 4 again but changed the commands to reflect eth1
        1 - "cp /etc/netctl/examples/ethernet-dhcp /etc/netctl/eth1-arch_usb"
        2 - "nano /etc/netctl/eth1-arch_usb" Edit and ensure interface is named (Interface=eth1):
        3 - "systemctl start netctl-ifplugd@eth1.service"
        4 - "systemctl enable netctl-ifplugd@eth1.service"
        
        I assume you can do this as many times as needed but am unsure.
        
I decided to use the KDE Plasma desktop enviorment and plan to also install LXDE if I happen to boot on a very old computer.

