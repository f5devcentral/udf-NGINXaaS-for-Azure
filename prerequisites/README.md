prerequisites
=============

Prerequisite Azure objects for NGINXaaS for Azure

Input variables:
----------------

| Variable            | Type     | Description                                        |
| ------------------- | -------- | -------------------------------------------------- |
| name                | string   | Name of NGINXaaS deployment and related resources  |
| resource_group_name | string   | Name of the UDF resource group                     |
| tags                | map(any) | Tags for NGINXaaS deployment and related resources |

Outputs:
--------

| Output                        | Value                                             |
| ----------------------------- | ------------------------------------------------- |
| managed_identity_id           | ID of the managed identity for NGINXaaS           |
| managed_identity_principal_id | Principal ID of the managed identity for NGINXaaS |
| public_ip_address_id          | ID of the public IP address for NGINXaaS          |
| subnet_id                     | ID of the delegated subnet for NGINXaaS           |
| location                      | Location of the UDF resource group                |

Required providers:
-------------------

- azurerm ~> 3.44