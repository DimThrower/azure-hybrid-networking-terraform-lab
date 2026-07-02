#!/usr/bin/env bash
set -euo pipefail

ENV_DIR="${1:-terraform/environments/dev}"
cd "$ENV_DIR"
terraform init
terraform fmt -recursive
terraform validate
terraform plan -out=tfplan

echo "Review tfplan. To apply: terraform apply tfplan"
