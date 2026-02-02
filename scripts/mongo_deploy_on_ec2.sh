#!/bin/bash

# add if using with user data
# sleep 15

# Update the packages
sudo apt-get update

# Install gnupg which is needed to import the MongoDB public GPG Key
# gnupg is a complete and free implementation of the OpenPGP standard
sudo apt-get install gnupg

# download MongoDB's GPG key and add it to a specific keyring file
curl -fsSL https://www.mongodb.org/static/pgp/server-8.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg \
   --dearmor

# Create a list file for MongoDB
# The list file tells apt-get where to download the MongoDB packages
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg ] https://repo.mongodb.org/apt/ubuntu noble/mongodb-org/8.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.2.list

# Reload the local package database
sudo apt-get update

# Install the MongoDB packages
sudo apt-get install -y mongodb-org

# Start MongoDB
sudo systemctl start mongod


# Path to your mongod.conf file
CONFIG_FILE="/etc/mongod.conf"

# Use sed to replace "bindIp: 127.0.0.1" with "bindIp: 0.0.0.0"
sudo sed -i 's/bindIp: 127.0.0.1/bindIp: 0.0.0.0/g' $CONFIG_FILE

# Start MongoDB
sudo systemctl restart mongod

# add enable to allow mongodb to start automatically when launching instance 
sudo systemctl enable mongod