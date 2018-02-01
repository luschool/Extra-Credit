#!/bin/bash
#This script will create a directory, a file, and allow you to add contents to a file. Feedback greatly appreciated.

#Shows where you are currently located (should be home/user)
pwd

#lists contents of directory
ls -F

#moves you into Documents
cd /home/user/Documents

#creates a file
touch Sample1

#double check to see if file was created
ls -F

#move back to home directory
cd

#create new directory
mkdir Week2

#move to Documents again
cd /home/user/Documents 

#move file to Week2
mv Sample1 /home/user/week2

#change directory to Week2
cd /home/user/week2

#confirm file was moved
ls -F

#create joke inside file
tee -a Sample1

#enter in joke, once joke has been entered, hit CTRL C to exit
Joke1: I love the F5 key, it's just so refreshing!

#confirm joke was saved into file
cat Sample1
