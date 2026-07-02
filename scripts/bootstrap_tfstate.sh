#!/usr/bin/env bash
set -euo pipefail

# Bootstrap Terraform remote state in Azure Storage.
# Run once per subscription or lab environment.

LOCATION="${LOCATION:-centralus}"
RG="${RG:-rg-eahl-tfstate-dev}"
SA="${SA:-steahltfstate$RANDOM$RANDOM}"
SA=$(echo "$SA" | tr '[:upper:]' '[:lower:]' | tr -cd 'a-z0-9' | cut -c1-24)
CONTAINER="${CONTAINER:-tfstate}"

az group create -n "$RG" -l "$LOCATION" --tags Application=EnterpriseHybridLab Environment=Dev ManagedBy=AzureCLI CostCenter=IT-4001 BusinessUnit=IT Owner=cloudops@example.com

az storage account create \
  -g "$RG" \
  -n "$SA" \
  -l "$LOCATION" \
  --sku Standard_LRS \
  --kind StorageV2 \
  --min-tls-version TLS1_2 \
  --allow-blob-public-access false \
  --tags Application=EnterpriseHybridLab Environment=Dev ManagedBy=AzureCLI CostCenter=IT-4001 BusinessUnit=IT Owner=cloudops@example.com

az storage container create \
  --name "$CONTAINER" \
  --account-name "$SA" \
  --auth-mode login

cat <<EOF

Remote state bootstrap complete.

Use these values in backend.tf:
resource_group_name  = "$RG"
storage_account_name = "$SA"
container_name       = "$CONTAINER"
key                  = "network-dev.tfstate"

EOF
