#!/bin/bash
#### Genarate SSH Keys ##########
# Set the desired key file path
key_file="$HOME/.ssh/id_rsa"

# Check if the key file already exists
if [ ! -f "$key_file" ]; then
    # Run ssh-keygen non-interactively
    ssh-keygen -t rsa -b 2048 -f "$key_file" -N ""
    echo "SSH key generated at: $key_file"
else
    echo "SSH key already exists at: $key_file"
fi