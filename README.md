# Enterprise Azure Hybrid Networking and IaC Lab Toolkit

This toolkit is a phased lab for practicing senior cloud engineer skills on a Mac with Apple Silicon. Your Mac is the admin workstation. Azure hosts the lab infrastructure, including the simulated on-prem network and target Azure hub/spoke environment.

## What this lab teaches

- Hub-and-spoke Azure networking
- Secure VM access with Azure Bastion
- Internal load balancing
- Azure Route Server and BGP with a Linux NVA
- Simulated ExpressRoute/VPN-style hybrid connectivity
- Terraform remote state in Azure Storage
- Terraform module design and module registry/versioning workflow
- Git-based version control and pull request workflow
- CI/CD plan/apply pattern
- Tagging, cost governance, and minimum viable change management

## Important cost warning

This lab can create billable resources such as Azure Bastion, virtual machines, public IPs, load balancers, Route Server, NAT Gateway, VPN Gateway, storage, Log Analytics, and Recovery Services Vault resources. Build in phases and destroy resources when finished.

Start with the PDF guide in this package before deploying anything.

## Recommended learning order

1. Install local tools on Mac
2. Bootstrap Terraform remote state
3. Create Git repo and branch strategy
4. Deploy management resources
5. Deploy hub-and-spoke VNets
6. Add Bastion for secure access
7. Add internal load balancer and app VMs
8. Add Linux NVA and Azure Route Server BGP
9. Simulate ExpressRoute/VPN design
10. Add Terraform CI/CD pipeline
11. Create reusable Terraform modules and module versioning
12. Add monitoring, tagging, budgets, and change management

## Folder map

```text
enterprise_azure_hybrid_networking_iac_lab/
|-- pdf/                              PDF guide
|-- quickstart_mac.md                 Mac setup steps
|-- architecture/                     Diagrams and design notes
|-- scripts/                          Helper scripts
|-- terraform/                        Terraform environment and modules
|-- pipelines/                        GitHub Actions and Azure DevOps examples
|-- templates/                        Change and design templates
|-- docs/                             Step-by-step notes and checklists
|-- cost_governance/                  Tagging, budgets, cost reports
```
