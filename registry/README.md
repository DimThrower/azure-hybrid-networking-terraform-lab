# Terraform Module Registry Practice

## Beginner path

Keep modules in this repo under `terraform/modules` and reference them with local paths.

```hcl
module "hub_vnet" {
  source = "../../modules/vnet"
}
```

## Intermediate path

Create separate Git repositories for modules, version them with Git tags, and reference exact versions:

```hcl
module "hub_vnet" {
  source = "git::https://github.com/example/terraform-azurerm-vnet.git?ref=v1.0.0"
}
```

## Module versioning practice

- v0.1.0 - first lab version
- v0.2.0 - add outputs
- v1.0.0 - stable interface
- v1.1.0 - backward-compatible improvements
- v2.0.0 - breaking variable/output changes

## What to document for each module

- Purpose
- Inputs
- Outputs
- Example usage
- Required provider version
- Known limitations
- Change log
