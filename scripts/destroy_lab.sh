#!/usr/bin/env bash
set -euo pipefail

# Safer destroy helper. Run from repository root.
# Always review the plan before approving destroy.

ENV_DIR="${1:-terraform/environments/dev}"
cd "$ENV_DIR"
terraform init
terraform plan -destroy -out=tfdestroy

echo "Review tfdestroy. To destroy: terraform apply tfdestroy"
