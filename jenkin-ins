#!/bin/bash

# Exit on error
set -e

echo "🔄 Updating system..."
sudo apt update -y && sudo apt upgrade -y

echo "☕ Installing Java (required for Jenkins)..."
sudo apt install -y openjdk-17-jdk

# Verify Java
java -version

echo "🔑 Adding Jenkins GPG key..."
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "📦 Adding Jenkins repository..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "🔄 Updating package list..."
sudo apt update -y

echo "📥 Installing Jenkins..."
sudo apt install -y jenkins

echo "🚀 Starting Jenkins service..."
sudo systemctl start jenkins

echo "🔁 Enabling Jenkins on boot..."
sudo systemctl enable jenkins

echo "📊 Checking Jenkins status..."
sudo systemctl status jenkins --no-pager

echo "🔥 Opening port 8080 (if UFW enabled)..."
sudo ufw allow 8080 || true

echo "✅ Jenkins Installed Successfully!"

echo "🌐 Access Jenkins at:"
echo "http://<YOUR_SERVER_IP>:8080"

echo "🔐 Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
