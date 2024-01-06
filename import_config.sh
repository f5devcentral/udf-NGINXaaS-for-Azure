#!/bin/bash

##############################################################################
# Workaround for known issue ID-891 - Terraform shows error while trying
# to manage configuration of a fresh deployment.
#
# Run this command to import the default configuration into terraform / tofu's
# state, then re-apply the plan.
##############################################################################

if command -v tofu &> /dev/null; then
	TF_COMMAND="tofu"
elif command -v terraform &> /dev/null; then
	TF_COMMAND="terraform"
else
	echo "Couldn't find tofu or terraform, exiting..."
	exit 1
fi

echo "Importing default NGINXaaS configuration into $TF_COMMAND  state..."
$TF_COMMAND import azurerm_nginx_configuration.example[0] $($TF_COMMAND output -raw nginx_default_config_id)

echo "Re-run $TF_COMMAND apply to apply the new configuration"
