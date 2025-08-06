#!/bin/bash

# -------------------------------
# Ubuntu script to install Docker, Docker Compose, and run n8n
# -------------------------------

echo "📦 Updating system packages..."
sudo apt-get update -y
sudo apt-get upgrade -y

echo "🐳 Installing Docker..."
sudo apt-get install -y docker.io

echo "✅ Enabling and starting Docker service..."
sudo systemctl start docker
sudo systemctl enable docker

echo "🔐 Adding current user to docker group..."
sudo usermod -aG docker $USER

echo "📄 Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "✅ Docker Compose version:"
docker-compose --version

echo "📁 Creating n8n project directory..."
mkdir -p ~/n8n-docker
cd ~/n8n-docker

echo "📝 Creating Docker Compose file..."
cat <<EOF > docker-compose.yml
version: "3.7"

services:
  n8n:
    image: n8nio/n8n
    restart: always
    ports:
      - "5678:5678"
    environment:
      - N8N_BASIC_AUTH_ACTIVE=true
      - N8N_BASIC_AUTH_USER=admin
      - N8N_BASIC_AUTH_PASSWORD=admin123
      - N8N_HOST=localhost
      - N8N_PORT=5678
      - WEBHOOK_URL=http://localhost:5678
    volumes:
      - n8n_data:/home/node/.n8n

volumes:
  n8n_data:
EOF

echo "🚀 Starting n8n container..."
docker-compose up -d

echo "✅ n8n is now running at: http://localhost:5678"
echo "🔐 Login with username: admin and password: admin123"
echo "⚠️ Please reboot or re-login to activate Docker group permissions for your user"
