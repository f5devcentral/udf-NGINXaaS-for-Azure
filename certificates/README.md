certificates
============

Creates an Azure Key Vault, loads a certificate into it, and installs that
certificate into an NGINXaaS for Azure instance.

Input variables:
----------------

| Variable            | Type     | Description                                                    |
| ------------------- | -------- | -------------------------------------------------------------- |
| name                | string   | Name of NGINXaaS deployment and related resources              |
| location            | string   | Azure region for this deployment                               |
| resource_group_name | string   | Name of the UDF resource group                                 |
| tags                | map(any) | Tags for NGINXaaS deployment and related resources             |
| deployment_id       | string   | ID of the NGINXaaS Deployment that will use these certificates |
| principal_id        | string   | Principal ID of the NGINXaaS managed identity                  |

Required providers:
-------------------

- azurerm ~> 3.44