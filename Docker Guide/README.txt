Docker Installation

1. Update System Packages
sudo apt update

2. Install Docker
curl -fsSL https://get.docker.com | sudo sh

3. Start and Enable Docker
sudo systemctl enable docker
sudo systemctl start docker

4. Verify Installation
docker --version

5. Test Docker
sudo docker run hello-world


Optional: Run Docker Without sudo
sudo usermod -aG docker $USER
newgrp docker

Verify:

docker run hello-world