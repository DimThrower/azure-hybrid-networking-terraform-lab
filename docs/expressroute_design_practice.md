# ExpressRoute Design Practice

You generally cannot fully practice real ExpressRoute without a connectivity provider. For the lab, simulate the design with a separate on-prem VNet and peering or VPN Gateway.

## Practice design questions

- What business requirement justifies ExpressRoute instead of VPN?
- What bandwidth is needed?
- Which provider or peering location would be used?
- Is Microsoft peering required or only private peering?
- Does traffic need to transit a firewall/NVA?
- What is the fallback path if ExpressRoute fails?
- How are routes filtered to avoid accidental route leaks?
- How will the team monitor circuit status and gateway metrics?

## Deliverable

Create a diagram that shows:

- On-prem router
- Connectivity provider
- ExpressRoute circuit
- ExpressRoute gateway
- Hub VNet
- Spokes
- Route Server/NVA relationship if used
