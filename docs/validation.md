# Validation

## Windows Server commands

```powershell
hostname
whoami
Get-NetIPConfiguration
Resolve-DnsName microsoft.com
Test-NetConnection microsoft.com -Port 443
systeminfo
```

## Observed results

- Hostname: `vm-win01`
- Private IPv4 address: `10.10.10.4`
- DNS resolution: successful
- Outbound TCP/443 test: successful
- Guest OS: Windows Server 2022 Datacenter: Azure Edition

## Azure-side validation

- VM deployment completed successfully.
- RDP session established successfully.
- `nsg-management` enforced subnet-level management controls.
- Azure Policy remediation completed for 3 of 3 resources.
- Policy compliance reached 100% for the evaluated resources.
- Resource lock was present on the VNet.
- Azure Monitor Activity Log alert rules were enabled.
- Alert action-group email receiver was verified.
