configurations
==============

Installs a configuration set on an NGINXaaS for Azure instance

Input variables:
----------------

| Variable      | Type     | Description                                                    |
| ------------- | -------- | -------------------------------------------------------------- |
| deployment_id | string   | Deployment ID of the NGINXaaS Instance                         |
| config_files  | map(object({<br>&nbsp;&nbsp;&nbsp;&nbsp;content = string<br>&nbsp;&nbsp;&nbsp;&nbsp;virtual_path = string<br>})) | NGINX config files to add to the NGINXaaS configuration |
| configure     | bool     | Workaround for [Bug ID-891](https://docs.nginx.com/nginxaas/azure/known-issues/#i-classfa-solid-fa-bug-stylecolore4002bi-terraform-shows-an-error-while-trying-to-manage-configuration-of-a-fresh-deployment-id-891). Set to `false` to skip configuration. |


Required providers:
-------------------

- azurerm ~> 3.44

Known Issues
------------

### Terraform shows an error while trying to manage configuration of a fresh deployment
There is a [known issue with applying a configuration to a newly-deployed
NGINXaaS instance using TF](https://docs.nginx.com/nginxaas/azure/known-issues/#i-classfa-solid-fa-bug-stylecolore4002bi-terraform-shows-an-error-while-trying-to-manage-configuration-of-a-fresh-deployment-id-891).
This is because deploying the NGINXaaS instance automatically creates a default
configuration, but TF doesn't know about it yet. To work around this issue,
the default NGINXaaS configuration needs to be imported into the TF state, and
the configuration re-applied.

To avoid seeing this error the first time you apply the TF configuration, you
can call `plan` or `apply` with the `configure` variable set to `false`. This
will skip creating the NGINX configuration resource, at which point you can
import the default NGINXaaS config using `../import_config.sh`, and then re-apply
the TF configuration without the `configure=false` variable.

You only need to do this the first time you deploy a new instance; once the
configuration is part of TF's state, subsequent deployment will update it
correctly.