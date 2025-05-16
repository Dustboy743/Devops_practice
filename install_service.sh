#!/bin/bash

user_id=$(id -u)  #to get the user id of the user

if [ $user_id -eq 0 ]  #check whether user is root
then
    echo "You're the root user.."
else
    echo "You're not the root user. Switch to root user"
    exit 1
fi

apt list --installed | grep mysql-server   #to check whether already installed or not

if [ $? -ne 0 ]    #if installed
then
    echo "not installed..will start installing it"
    apt install mysql-server -y
    if [ $? -eq 0 ]    #status after installing
    then
        echo "great..installed it..SUCCESS"
    else
        echo "cannot be installed..FAILURE"
        exit 1
    fi
else
    echo "Already installed.."
fi        
