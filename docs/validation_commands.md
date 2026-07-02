# Validation Commands

## Azure account

```bash
az account show --output table
```

## Resource groups

```bash
az group list --query "[?starts_with(name, 'rg-eahl-')].{Name:name,Location:location}" --output table
```

## VNets

```bash
az network vnet list --query "[].{Name:name,RG:resourceGroup,Address:addressSpace.addressPrefixes}" --output table
```

## Peerings

```bash
az network vnet peering list -g <rg-name> --vnet-name <vnet-name> --output table
```

## Effective routes on a NIC

```bash
az network nic show-effective-route-table -g <rg-name> -n <nic-name> --output table
```

## Load balancer health

Use Azure Portal: Load Balancer > Insights > Backend pool health.

## Route Server peerings

```bash
az network routeserver peering list -g <rg-name> --routeserver <route-server-name> --output table
```

## Tags from Resource Graph

```kusto
Resources
| where resourceGroup startswith "rg-eahl-"
| project name, type, resourceGroup, tags
```
