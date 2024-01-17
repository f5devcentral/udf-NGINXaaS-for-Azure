deployments
===========

Deploys an NGINXaaS for Azure instance

Input variables:
----------------

| Variable                      | Type     | Description                                        |
| ----------------------------- | -------- | -------------------------------------------------- |
| name                          | string   | Name of NGINXaaS deployment and related resources  |
| location                      | string   | Azure region for this deployment                   |
| resource_group_name           | string   | Name of the UDF resource group                     |
| tags                          | map(any) | Tags for NGINXaaS deployment and related resources |
| sku                           | string   | SKU of the NGINXaaS deployment                     |
| managed_identity_id           | string   | ID of the managed identify for NGINXaaS            |
| managed_identity_principal_id | string   | Principal ID of the managed identity for NGINXaaS  |
| public_ip_address_id          | string   | ID of the public IP address for NGINXaaS           |
| subnet_id                     | string   | ID of the delegated subnet for NGINXaaS            |

Outputs:
--------

| Output        | Value                                 |
| ------------- | ------------------------------------- |
| deployment_id | ID of the NGINXaaS deployment         |
| ip_address    | IP address of the NGINXaaS deployment |

Required providers:
-------------------

- azurerm ~> 3.44
