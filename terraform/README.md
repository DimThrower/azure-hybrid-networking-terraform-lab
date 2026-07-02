# Terraform Lab

This folder contains a starter Terraform structure for the enterprise hybrid networking lab.

## State strategy

Use remote state in Azure Storage. Split state by concern as the lab matures:

- platform-dev.tfstate
- network-hub-dev.tfstate
- network-spokes-dev.tfstate
- workloads-dev.tfstate
- governance-dev.tfstate

For simplicity, the starter environment uses one state file. As a senior-level exercise, split the state once you understand dependencies.
