# Manage an NGINXaaS for Azure deployment certificate.

### Usage

The code in this directory can be used to managed an **NGINXaaS for Azure deployment certificate**.

To create a deployment, add a certificate, and leverage it in a configuration, run the following commands:

```shell
terraform init
terraform plan
terraform apply --auto-approve
```

Once the deployment is no longer needed, run the following to clean up the deployment and related resources:

```shell
terraform destroy --auto-approve
```

### Notes

#### Why does my Azure Key Vault have a random string appended to its name?

There are three factors that come together to cause issues with Key Vaults and
ephemeral UDF accounts:

  1.  Key Vault names are *globally* unique.
  2.  Key Vaults are only soft-deleted when they are destroyed.
  3.  Only subscription owners can purge a soft-deleted Key Vault before the
      retention period expires (minimum 7 days)

To prevent collisions from occurring between UDF deployments that don't change
the default name, a random suffix is appended to the Key Vault name. This
suffix will change if you re-apply the configuration after destroying it, so
that you don't collide with your own soft-deleted vault.