#!/bin/bash
SELF=$_
(return 0 2>/dev/null) && SOURCED=1 || SOURCED=0
if [ "$SOURCED" -eq "0" ]; then
	>&2 echo "This script must be sourced (i.e.: \"source $SELF\")"
	exit -1
fi
 
METADATA=$(curl -s http://metadata.udf/cloudAccounts | jq -r '.cloudAccounts[0]')
echo "Environment Variable        | Value"
echo "============================+=================================================="
export TF_VAR_resource_group_name=$(echo $METADATA | jq -r '.resourceGroup')
echo "TF_VAR_resource_group_name: | $TF_VAR_resource_group_name"
export ARM_TENANT_ID=$(echo $METADATA | jq -r '.credentials[0].tenant')
echo "ARM_TENANT_ID:              | $ARM_TENANT_ID"
export ARM_CLIENT_ID=$(echo $METADATA | jq -r '.credentials[0].username')
echo "ARM_CLIENT_ID:              | $ARM_CLIENT_ID"
export ARM_CLIENT_SECRET=$(echo $METADATA | jq -r '.credentials[0].password')
if [ $ARM_CLIENT_SECRET == "null" ]; then
	echo "ARM_CLIENT_SECRET:          | null" 
else
	echo "ARM_CLIENT_SECRET:          | <hidden>"
fi

export ARM_SUBSCRIPTION_ID=$(az login --service-principal --username $ARM_CLIENT_ID --password $ARM_CLIENT_SECRET --tenant $ARM_TENANT_ID | jq -r .[0].id)
echo "ARM_SUBSCRIPTION_ID:        | $ARM_SUBSCRIPTION_ID"

if [ "$ARM_SUBSCRIPTION_ID" != "" ]; then
	echo "Azure CLI logged in"
fi
