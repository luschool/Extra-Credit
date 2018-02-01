#!/bin/bash
#Week 2 Lab - Lucas Merriott

echo Hello this is my first Script.

echo It should leave you with a compressed output file of an ls -la command of your home directory

#First lets navigate to the home directory
cd 

#Make directory
mkdir test

#Creates a new file named results while outputting the result of the command ls -la
ls -la > test/output

#moving directory
cd test

#compressing the file
gzip output

#moving file to desktop
mv output.gz ~/Desktop

#returning to home directory
cd

#removing the directory created above
rmdir test/

echo Script Complete!

