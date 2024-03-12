#!/bin/bash

echo "Enter the command"
read -r name

command="/usr/bin/$name"

if [ -x "$command" ]
then 
    echo "Available"
else
    echo "Installing"
    sudo apt update -y && sudo apt install "$name"
htop
fi
