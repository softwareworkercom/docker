# Script to configure WSL localhost forwarding
# This enables automatic localhost forwarding from Windows to WSL

$wslConfigPath = "$env:USERPROFILE\.wslconfig"

Write-Host "Configuring WSL localhost forwarding..." -ForegroundColor Cyan

# Check if . wslconfig exists
if (Test-Path $wslConfigPath) {
    Write-Host "Found existing .wslconfig file" -ForegroundColor Yellow
    $content = Get-Content $wslConfigPath -Raw
    
    # Check if [wsl2] section exists
    if ($content -match '\[wsl2\]') {
        # Check if localhostForwarding already exists
        if ($content -match 'localhostForwarding\s*=') {
            Write-Host "localhostForwarding setting already exists.  Updating..." -ForegroundColor Yellow
            $content = $content -replace 'localhostForwarding\s*=\s*\w+', 'localhostForwarding=true'
        } else {
            # Add localhostForwarding under [wsl2]
            $content = $content -replace '(\[wsl2\])', "`$1`nlocalhostForwarding=true"
        }
    } else {
        # Add [wsl2] section with localhostForwarding
        $content += "`n`n[wsl2]`nlocalhostForwarding=true"
    }
    
    Set-Content -Path $wslConfigPath -Value $content
} else {
    Write-Host "Creating new .wslconfig file" -ForegroundColor Green
    $configContent = @"
[wsl2]
localhostForwarding=true
"@
    Set-Content -Path $wslConfigPath -Value $configContent
}

Write-Host "`n. wslconfig updated successfully!" -ForegroundColor Green
Write-Host "`nCurrent configuration:" -ForegroundColor Cyan
Get-Content $wslConfigPath

Write-Host "`nShutting down WSL to apply changes..." -ForegroundColor Yellow
wsl --shutdown

Write-Host "`nWSL has been shutdown.  The configuration will take effect when you restart WSL." -ForegroundColor Green
Write-Host "You can now access services running in WSL via localhost from Windows!" -ForegroundColor Green