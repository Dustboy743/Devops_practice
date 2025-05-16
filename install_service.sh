#!/bin/bash

user_id=$(id -u)  #to get the user id of the user

if [$user_id -eq 0 ]
then
    echo "You're the root user.."
else
    echo "You're not the root user. Switch to root user"
    exit 1
fi