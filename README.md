NGINXaaS for Azure
==================

This is a Terraform/OpenTofu configuration to deploy an NGINXaaS for Azure
instance into a UDF managed Azure account. Infrastructure prerequisites, the 
NGINXaaS instance itself, and an NGINX configuration are deployed though this
config.

This document will use TF to refer to either Terraform or OpenTofu.

TL;DR;
------

To stand up an instance, execute the following:

### OpenTofu
```bash
source ../populate_creds.sh
tofu init
tofu plan
tofu apply --var="configure=false"
./import_config.sh
tofu apply
```

### Terraform
```bash
source ../populate_creds.sh
terraform init
terraform plan
terraform apply --var="configure=false"
./import_config.sh
terraform apply
```

The IP address of your NGINXaaS instance is provided as an output. Browse to
`http://<ip_address/` to see your changes in action.

Known Issues
------------
There is a [known issue with applying a configuration to a newly-deployed
NGINXaaS instance using TF](https://docs.nginx.com/nginxaas/azure/known-issues/#i-classfa-solid-fa-bug-stylecolore4002bi-terraform-shows-an-error-while-trying-to-manage-configuration-of-a-fresh-deployment-id-891).
This is because deploying the NGINXaaS instance automatically creates a default
configuration, but TF doesn't know about it yet. To work around this issue,
the default NGINXaaS configuration needs to be imported into the TF state, and
the configuration re-applied.

To avoid seeing this error the first time you apply the TF configuration, you
can call `plan` or `apply` with the `configure` variable set to `false`. This
will skip creating the NGINX configuration resource, at which point you can
import the default NGINXaaS config using `./import_config.sh`, and then re-apply
the TF configuration without the `configure=false` variable.

You only need to do this the first time you deploy a new instance; once the
configuration is part of TF's state, subsequent deployment will update it
correctly.
