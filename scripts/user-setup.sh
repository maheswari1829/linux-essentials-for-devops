#!/bin/bash
# Script to create a new user with sudo access

if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

USER=$1
sudo adduser $USER
sudo usermod -aG sudo $USER
echo "User $USER created and added to sudo group."
