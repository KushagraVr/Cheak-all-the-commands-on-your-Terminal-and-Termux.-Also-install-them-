#!/bin/bash

echo "Are you using a terminal or Termux?"
echo "1 = Terminal"
echo "2 = Termux"

read -p "Enter your choice: " choice

if [ "$choice" == "1" ]; then
    echo "Enter the command:"
    read -r name

    command="/usr/bin/$name"

    if [ -x "$command" ]; then
        echo "Available"
    else
        echo "Installing"
        sudo apt update -y && sudo apt install "$name"
        "$name"
    fi

elif [ "$choice" == "2" ]; then
    echo "Enter the command:"
    read -r name

    if command -v "$name" &> /dev/null; then
        echo "Available"
    else
        echo "Installing"
        pkg update && pkg install "$name"
        "$name"
    fi
else
    echo "Invalid choice."
fi

