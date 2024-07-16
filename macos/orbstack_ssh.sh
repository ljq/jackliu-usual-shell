#!/bin/bash
# Description: A script to check system version and install tools on linux os.
# Author: Jackliu (ljq@GitHub)
# Usage: orbstack_ssh.sh <node_number>
# Version: 1.1
# Date: 2023-07-15
# License: MIT
# Page Site: https://github.com/ljq

# Define an array of node names or addresses
nodes=(
    "root@rocky-master@orb"
    "root@rocky-node1@orb"
    "root@rocky-node2@orb"
    "root@rocky-node3@orb"
    # Add more nodes here as needed
)

# Function to handle SSH login by node index
ssh_login() {
    local choice=$1

    if (( choice >= 0 && choice < ${#nodes[@]} )); then
        ssh ${nodes[$choice]}
    else
        echo "Error: Invalid node number."
        exit 1
    fi
}

# Main script execution starts here

# Check if a parameter is provided
if [[ $# -eq 1 ]]; then
    re='^[0-9]+$'
    if [[ $1 =~ $re ]]; then
        ssh_login $1
    else
        echo "Error: Invalid input. Please enter a number."
        exit 1
    fi
else
    echo "Usage: $0 <node_number>"
    echo "Available nodes:"
    for ((i=0; i<${#nodes[@]}; i++)); do
        echo "[$i] ${nodes[$i]}"
    done
    echo

    read -p "Enter the node number to SSH into or press Enter to exit: " choice

    if [[ -z $choice ]]; then
        exit 0
    fi

    re='^[0-9]+$'
    if [[ $choice =~ $re ]]; then
        ssh_login $choice
    else
        echo "Error: Invalid input. Please enter a number."
        exit 1
    fi
fi
