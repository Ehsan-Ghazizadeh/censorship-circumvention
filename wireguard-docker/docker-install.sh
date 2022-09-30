#! /bin/bash
# Uninstall old versions
sudo apt-get remove docker docker-engine docker.io containerd runc -y

# Update the package index
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable repository
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
	  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker Engine
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Verify that Docker Engine is installed correctly
# sudo docker run hello-world

# Download the stable release of Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.11.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Apply executable permissions to the binary
sudo chmod +x /usr/local/bin/docker-compose

# Test the installation
docker-compose --version

# Update user so docker can run without needing the sudo command
# sudo groupadd docker
sudo usermod -aG docker $USER

# Tell the user to logout and login again
BIWhite='\033[5;97m'
RED='\033[0;31m'
NC='\033[0m' # No Color
echo -e "\n\n\n"
echo -e ------------------------------------------------
echo -e "${BIWhite}Dear $USER You have to logout and login again to new group priviledges take effect.${NC}"
echo -e ------------------------------------------------