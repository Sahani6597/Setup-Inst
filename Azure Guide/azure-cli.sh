#!/bin/bash

# Exit on error
set -e

echo "Updating system packages..."
sudo apt update

echo "Installing required dependencies..."
sudo apt install -y ca-certificates curl apt-transport-https lsb-release gnupg

echo "Adding Microsoft GPG key..."
curl -sL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor | \
    sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null

echo "Adding Azure CLI repository..."
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | \
    sudo tee /etc/apt/sources.list.d/azure-cli.list

echo "Updating package list..."
sudo apt update

echo "Installing Azure CLI..."
sudo apt install -y azure-cli

echo "Installation complete. Verifying..."
az version

echo "Azure CLI installed successfully!"
