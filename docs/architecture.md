# Architecture Notes

## Subscription and resource organization

- Subscription: `JohnTyler-Lab`
- Primary resource group: `rg-azure-enterprise-lab`
- Region: West US 2

## Network design

- Virtual network: `vnet-prod-lab`
- Management subnet: `snet-management` (`10.10.10.0/24`)
- Server subnet: `snet-servers` (`10.10.20.0/24`)

### Security boundaries

- `nsg-management` is associated with the management subnet.
- `nsg-servers` is associated with the server subnet.
- Administrative RDP is restricted to an approved source rather than the entire internet.
- SSH from the management subnet to the server subnet is explicitly allowed.
- Other traffic between security zones is restricted through explicit deny rules and Azure's default NSG behavior.

## Compute

- `vm-win01`
- Windows Server 2022 Datacenter: Azure Edition
- Standard B2als_v2
- Attached to `snet-management`
- Trusted Launch with Secure Boot
- Boot diagnostics enabled
- Auto-shutdown configured for 20:00 Pacific

## Governance

- Azure Policy inherits the `Environment` tag from the resource group when missing.
- Three existing resources were remediated.
- Compliance reached 100% for the evaluated resources.
- A `CanNotDelete` lock protects `vnet-prod-lab`.

## Monitoring

- `Alert-NSG-Deletion`
- `Alert-RBAC-Role-Assignment-Created`
- Shared action group: `ag-azure-lab-admin-alerts`

## Cost management

- Subscription-scoped monthly budget: `Azure-Lab-Monthly-Budget`
- Budget amount: $30/month
- VM auto-shutdown reduces unnecessary compute runtime.
