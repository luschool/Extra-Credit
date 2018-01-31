#!/bin/bash
#Week 3 Chapter 3 Lab - Lucas Merriott

#This script will run through a few different commands to display information
#about attached drive devices

echo This script may require you to install the lsscsi package via the command \
\sudo apt-get install lsscsi

echo First we will run the lsblk and lssci comand and output the results to ~/Desktop/log
lsblk > ~/Desktop/log
lsscsi >> ~/Desktop/log

# By redirecting future echos I should be able to make the log file easier to understand
echo Now using the ls -l /sys/block we will see the true sysfs paths >> ~/Desktop/log

ls -l /sys/block >> ~/Desktop/log

echo udevadm info --query=all --name=/dev/sda shows all info on the /dev/sda device >> ~/Desktop/log
echo However I just want to use the --query=symlink flag to see the symbolic links >> ~/Desktop/log
edevadm info --query=symlink --name=/dev/sda >> ~/Desktop/log
edevadm info --query=symlink --name=/dev/sr0 >> ~/Desktop/log

#Since recent commands and echos were redirected and appended to the log file in order of execution
#When I call the file with the cat command it will appear as if everything also happend in the terminal

cat ~/Desktop/log
