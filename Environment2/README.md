wsl
sudo apt update
sudo apt install docker.io
sudo service docker start

sudo usermod -aG docker $USER
wsl --shutdown


wsl
mkdir -p ~/bin
Check latest version: https://github.com/docker/compose/releases
curl -L "https://github.com/docker/compose/releases/download/v5.0.1/docker-compose-$(uname -s)-$(uname -m)" -o ~/bin/docker-compose
chmod +x ~/bin/docker-compose
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
echo $PATH
docker-compose version

Navigate to Docker Compose File Folder
wsl
docker-compose up -d
docker ps
docker-compose down -v


hostname -I
Connect to WSL IP from SQL Management Studio


Navigate http://172.25.225.70:50000/
Create admin user (password 4dm1nP4ssw0rd@)
Go to Environments
Add Environment
Select Docker Standalone
Click Start Wizard
Choose Socket
Write an unique name
Click Connect
