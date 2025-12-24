$ips = (wsl.exe hostname -I).Trim() -split '\s+'; 
Write-Host "WSL IP:" $ips[0]