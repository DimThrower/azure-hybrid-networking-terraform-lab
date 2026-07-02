# Lab Phase Checklist

## Phase 0 - Local tools
- [ ] Azure CLI installed
- [ ] Terraform installed
- [ ] Git installed
- [ ] VS Code installed
- [ ] PowerShell 7 installed
- [ ] Subscription selected

## Phase 1 - Remote state
- [ ] Resource group for Terraform state created
- [ ] Storage account created
- [ ] Blob container created
- [ ] State access restricted
- [ ] Backend file configured

## Phase 2 - Git workflow
- [ ] Repo initialized
- [ ] main branch protected conceptually
- [ ] feature branch created
- [ ] pull request workflow understood

## Phase 3 - Management layer
- [ ] Management RG created
- [ ] Log Analytics created
- [ ] Tags applied

## Phase 4 - Hub and spoke
- [ ] Hub VNet deployed
- [ ] App spoke deployed
- [ ] Data spoke deployed
- [ ] Shared spoke deployed
- [ ] Simulated on-prem VNet deployed
- [ ] Peerings validated

## Phase 5 - Bastion
- [ ] Bastion deployed in AzureBastionSubnet
- [ ] VM public IPs avoided
- [ ] Bastion connection tested

## Phase 6 - Load Balancer
- [ ] Web VMs deployed
- [ ] Internal load balancer deployed
- [ ] Health probe validated
- [ ] Failover tested

## Phase 7 - Route Server and BGP
- [ ] RouteServerSubnet deployed
- [ ] Azure Route Server deployed
- [ ] Linux NVA deployed
- [ ] FRR configured
- [ ] BGP peering established
- [ ] Effective routes reviewed

## Phase 8 - ExpressRoute/VPN design
- [ ] ExpressRoute design diagram completed
- [ ] VPN/peering simulation documented
- [ ] Routing difference explained

## Phase 9 - CI/CD
- [ ] Pipeline validates Terraform
- [ ] Pipeline creates plan
- [ ] Manual approval concept documented
- [ ] Apply controlled through branch process

## Phase 10 - Module registry
- [ ] Module repo or modules folder created
- [ ] Semantic version tags understood
- [ ] Environments reference module version

## Phase 11 - Governance
- [ ] Required tags applied
- [ ] Cost grouping practiced
- [ ] Budget created
- [ ] Change register updated
