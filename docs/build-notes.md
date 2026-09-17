# Build Notes

## 1. Resource organization

Created the `rg-azure-enterprise-lab` resource group in West US 2 to contain the primary lab resources.

## 2. Networking

Created `vnet-prod-lab` with separate management and server subnets.

Configured subnet-level NSGs:

- `nsg-management`
- `nsg-servers`

The design separates management access from server workloads and avoids attaching duplicate NSGs to every NIC when subnet-level enforcement is sufficient.

## 3. RBAC

Configured Azure RBAC assignments using groups to model least-privilege administration and read-only support access.

## 4. Policy governance

Assigned the built-in policy `Inherit a tag from the resource group if missing` for the `Environment` tag.

A remediation task corrected three pre-existing resources and brought the policy evaluation to 100% compliance.

## 5. Resource protection

Added a deletion lock to the virtual network to prevent accidental removal of critical networking infrastructure.

## 6. Cost controls

Configured a monthly subscription budget and notifications, plus VM auto-shutdown.

## 7. Monitoring

Created Azure Monitor Activity Log alerts for:

- NSG deletion.
- RBAC role assignment creation.

A reusable action group handles email notifications.

## 8. Windows Server deployment

Deployed `vm-win01` on Windows Server 2022 Datacenter: Azure Edition and connected it to `snet-management`.

RDP access was validated through the management NSG.

## 9. Validation

PowerShell was used to verify host identity, IP configuration, DNS, outbound HTTPS, and OS information.
