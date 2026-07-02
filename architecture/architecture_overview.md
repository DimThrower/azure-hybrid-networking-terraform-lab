# Architecture Overview

## Lab topology

```mermaid
flowchart TB
  subgraph Workstation[Mac Apple Silicon Admin Workstation]
    CLI[Azure CLI / PowerShell / Terraform / Git]
  end

  subgraph Azure[Azure Subscription]
    subgraph Mgmt[Management RG]
      TFSTATE[Terraform State Storage]
      LAW[Log Analytics]
      RSV[Recovery Services Vault]
    end

    subgraph Hub[Hub VNet]
      BAS[Azure Bastion]
      ARS[Azure Route Server]
      NVA[Linux NVA with FRR]
      GW[GatewaySubnet - VPN/ExpressRoute concept]
    end

    subgraph App[App Spoke VNet]
      WEB1[web-vm-01]
      WEB2[web-vm-02]
      ILB[Internal Load Balancer]
    end

    subgraph Data[Data Spoke VNet]
      DB[db-vm-01]
    end

    subgraph Shared[Shared Services Spoke]
      DC[domain/dns simulation]
    end

    subgraph OnPrem[Simulated On-Prem VNet]
      OPDC[onprem-dc01]
      OPWEB[onprem-web01]
      OPLIN[onprem-linux01]
    end
  end

  CLI --> TFSTATE
  Hub --- App
  Hub --- Data
  Hub --- Shared
  Hub --- OnPrem
  BAS --> WEB1
  BAS --> WEB2
  ARS <--> NVA
  WEB1 --> ILB
  WEB2 --> ILB
```

## Design principle

The lab uses Azure to simulate both sides of the hybrid environment. This keeps the lab practical on Apple Silicon while still teaching the real enterprise concepts: routing, DNS, BGP, secure access, IaC, change control, monitoring, and cost governance.
