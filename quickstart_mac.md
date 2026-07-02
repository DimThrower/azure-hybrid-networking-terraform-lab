# Mac Apple Silicon Quickstart

## Recommended approach

Use your Mac as the admin workstation. Do not try to run a full Windows Server x64 enterprise lab locally on Apple Silicon. Use Azure VMs to simulate the on-prem environment and target Azure environment.

## Install tools

If you use Homebrew:

```bash
brew update
brew install azure-cli terraform git jq yq graphviz
brew install --cask visual-studio-code microsoft-remote-desktop
```

Install PowerShell:

```bash
brew install --cask powershell
```

Install the Az PowerShell module:

```powershell
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force
```

## Login and select subscription

```bash
az login
az account list --output table
az account set --subscription "<subscription-id-or-name>"
```

## Suggested Mac workflow

- Use VS Code for Terraform and markdown.
- Use Azure CLI and PowerShell 7 from Terminal.
- Use Azure Portal for visual validation.
- Use Microsoft Remote Desktop only if needed; prefer Azure Bastion for private VM access.
