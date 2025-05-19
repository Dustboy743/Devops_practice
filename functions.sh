#!/bin/bash
user=$(id -u)

install_apps()
{
 apt install $1
    if [ $? -eq 0 ]
    then
        echo "$1 is successfully installed..SUCCESS"
    else
        echo "$1 is not installed..FAILURE"
    fi    
}


if [ $user -eq 0 ]
then
    echo "You're a root user"
else
    echo "you're not a root user"
    exit 1
fi   

apt list --installed | grep nginx

if [ $? -ne 0 ]
then    
    install_apps nginx    
else
    echo "nginx is already installed"        
fi

apt list --installed | grep mysql-server

if [ $? -ne 0 ]
then    
    install_apps mysql-server 
else
    echo "mysql-server is already installed"        
fi

