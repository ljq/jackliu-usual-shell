#!/bin/bash
# Description: Using SSH and running's node number to quickly log into servers based on orbstack.dev.
# Author: Jackliu (ljq@GitHub)
# Usage: ssh_orbstack.sh <node_number>
# Version: 1.2
# Date: 2024-07-15
# License: MIT
# Page Site: https://github.com/ljq

# Define an array of node names or addresses

# show orbstack runing names

# exec: orb list -rq (-r: running; -q: only show names)
output=$(orb list -rq)
nodes=()
# Loop through each line in the output
while IFS= read -r line; do
    # set "username@hostname@orb"
    nodes+=("root@${line}@orb")
done <<< "$output"

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
    echo "[ Available nodes ]:"
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
