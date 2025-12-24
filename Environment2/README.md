# Environment2 - Docker Setup Guide

## Prerequisites

This guide assumes you're using WSL (Windows Subsystem for Linux) on Windows.

## Installation

### 0. Install WSL and Ubuntu

#### Install WSL 2

Open PowerShell as Administrator and run:

```powershell
wsl --install
```

This command installs WSL and the default Linux distribution (usually Ubuntu). If WSL is already installed, update it:

```powershell
wsl --update
```

#### Set Ubuntu as Distribution (if not already set)

List available distributions:

```powershell
wsl --list --online
```

Install Ubuntu if not already installed:

```powershell
wsl --install --distribution Ubuntu
```

Set Ubuntu as the default distribution:

```powershell
wsl --set-default Ubuntu
```

#### Verify WSL Installation

Check the installed distributions:

```powershell
wsl --list --verbose
```

You should see Ubuntu listed with version 2. If it shows version 1, upgrade it:

```powershell
wsl --set-version Ubuntu 2
```

Restart your computer after installation and setup are complete.

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

Open WSL and install Docker Compose:

```bash
wsl
sudo apt install docker-compose
```

Verify the installation:

```bash
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
3. Go to `http://172.25.225.70:50000/#!/home`

---

**Note:** Replace `172.25.225.70` with your actual WSL IP address from the `hostname -I` command.
