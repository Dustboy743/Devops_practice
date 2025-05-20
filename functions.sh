#!/bin/bash

#colour coding
red="\e[31m"
green="\e[32m"
yellow="\e[33m"
normal="\e[0m"

folder="/var/log/shell_scriptlogs"   #create a folder
scriptname=$(echo $0 | cut -d "." -f1)  #to extract the name
filename="$folder/$scriptname.log"

mkdir -p $folder  $make a directory

install_apps()
{
 apt install $1 -y
    if [ $? -eq 0 ]
    then
        echo -e "$green $1 is successfully installed..SUCCESS" | tee -a $filename
    else
        echo -e "$red $1 is not installed..FAILURE" | tee -a $filename
        exit 1
    fi    
}


user=$(id -u)
if [ $user -eq 0 ]
then
    echo "You're a root user" | tee -a $filename
else
    echo -e "$red you're not a root user $normal" | tee -a $filename
    exit 1
fi   

dpkg -l | grep nginx &>> $filename

if [ $? -ne 0 ]
then    
    install_apps nginx &>> $filename   
else
    echo -e "$yellow nginx is already installed $normal"  | tee -a $filename       
fi

dpkg -l | grep awscli &>> $filename

if [ $? -ne 0 ]
then    
    install_apps awscli &>> $filename
else
    echo -e "$yellow awscli is already installed $normal" | tee -a $filename       
fi

