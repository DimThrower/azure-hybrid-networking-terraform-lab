# Tagging Standard v1

## Required tags

| Tag | Purpose | Example |
|---|---|---|
| CostCenter | Finance allocation | IT-4001 |
| BusinessUnit | Department ownership | IT |
| Application | Workload or platform name | EnterpriseHybridLab |
| Environment | Lifecycle stage | Dev |
| Owner | Accountable team | cloudops@example.com |
| Criticality | Business importance | Tier2 |
| DataClass | Sensitivity level | Internal |
| ManagedBy | Deployment method | Terraform |

## Allowed values

Environment: Dev, Test, Stage, Prod, DR, Sandbox

Criticality: Tier1, Tier2, Tier3

DataClass: Public, Internal, Confidential, Restricted

ManagedBy: Terraform, AzureCLI, Portal, AzureDevOps, GitHubActions
