# GitHub OIDC Setup Notes

For real use, prefer workload identity federation instead of long-lived client secrets.

High-level steps:

1. Create Microsoft Entra app registration or user-assigned managed identity.
2. Create federated credential that trusts your GitHub repo, branch, or environment.
3. Assign least-privilege Azure RBAC role to the identity.
4. Store only non-secret IDs in GitHub secrets/variables:
   - AZURE_CLIENT_ID
   - AZURE_TENANT_ID
   - AZURE_SUBSCRIPTION_ID
5. Use azure/login with OIDC in the pipeline.

Why this matters: You avoid storing client secrets in CI/CD and reduce credential leakage risk.
