# Environment2 - Docker Setup Guide

## Prerequisites

This guide assumes you're using WSL (Windows Subsystem for Linux) on Windows.

## Installation

### 1. Install Docker

Open WSL and run the following commands:

```bash
wsl
sudo apt update
sudo apt install docker.io
sudo service docker start
```

Add your user to the docker group (to run Docker without sudo):

```bash
sudo usermod -aG docker $USER
```

Restart WSL to apply group changes:

```bash
wsl --shutdown
```

### 2. Install Docker Compose

Create a bin directory and download Docker Compose:

```bash
wsl
mkdir -p ~/bin
```

Check the latest version at: https://github.com/docker/compose/releases

```bash
curl -L "https://github.com/docker/compose/releases/download/v5.0.1/docker-compose-$(uname -s)-$(uname -m)" -o ~/bin/docker-compose
chmod +x ~/bin/docker-compose
```

Add Docker Compose to your PATH:

```bash
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Verify the installation:

```bash
echo $PATH
docker-compose version
```

## Usage

### Starting the Environment

Navigate to the Docker Compose file folder:

```bash
wsl
docker-compose up -d
```

### Monitoring Containers

View running containers:

```bash
docker ps
```

List Docker volumes:

```bash
docker volume ls
```

### Stopping the Environment

To stop and remove containers along with volumes:

```bash
docker-compose down -v
```

## Database Connection

### Find WSL IP Address

Get your WSL IP address:

```bash
hostname -I
```

Connect to SQL Server from SQL Management Studio using the displayed WSL IP address.

## Troubleshooting

### View Container Logs

Monitor Portainer logs:

```bash
docker logs -f --tail 100 portainer
```

Monitor SQL Server logs:

```bash
docker logs -f --tail 100 sqlserver
```

## Portainer Setup

### Initial Configuration

1. Navigate to: `http://172.25.225.70:50000/`
2. Create admin user with password: `4dm1nP4ssw0rd@`
3. Go to **Environments**
4. Click **Add Environment**
5. Select **Docker Standalone**
6. Click **Start Wizard**
7. Choose **Socket**
8. Write a unique name for your environment
9. Click **Connect**

---

**Note:** Replace `172.25.225.70` with your actual WSL IP address from the `hostname -I` command.
