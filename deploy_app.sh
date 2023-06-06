#!/bin/bash

# User input
read -p "Enter Aleo address: " WALLETADDRESS
read -p "Enter Aleo private key: " PRIVATEKEY
read -p "Enter record code: " RECORD

# Generate application name
APPNAME="helloworld_${WALLETADDRESS:4:6}"
echo $APPNAME

# Create a new application
leo new "$APPNAME"

# Run the application
cd "$APPNAME" && leo run && cd -

# Get the application path
PATHTOAPP=$(realpath -q "$APPNAME")
echo $PATHTOAPP
cd "$PATHTOAPP" && cd -

# Deploy the application
snarkos developer deploy "${APPNAME}.aleo" --private-key "$PRIVATEKEY" --query "$RECORD"
