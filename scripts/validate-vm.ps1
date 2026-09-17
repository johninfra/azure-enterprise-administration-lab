# Azure Windows VM validation commands
# Run from an elevated PowerShell session inside vm-win01.

Write-Host "=== Host Identity ===" -ForegroundColor Cyan
hostname
whoami

Write-Host "`n=== Network Configuration ===" -ForegroundColor Cyan
Get-NetIPConfiguration

Write-Host "`n=== DNS Resolution ===" -ForegroundColor Cyan
Resolve-DnsName microsoft.com

Write-Host "`n=== Outbound HTTPS Test ===" -ForegroundColor Cyan
Test-NetConnection microsoft.com -Port 443

Write-Host "`n=== System Information ===" -ForegroundColor Cyan
systeminfo
