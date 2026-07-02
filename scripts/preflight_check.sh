#!/usr/bin/env bash
set -euo pipefail

echo "Checking local tools..."
for tool in az terraform git jq; do
  if ! command -v "$tool" >/dev/null 2>&1; then
    echo "Missing: $tool"
    exit 1
  fi
  echo "Found: $tool"
done

echo "Azure account:"
az account show --output table

echo "Terraform version:"
terraform version
