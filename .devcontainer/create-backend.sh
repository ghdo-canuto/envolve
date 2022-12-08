#!/bin/bash
echo "create resource group"
az group create --name $TF_BACKEND_RESOURCE_GROUP --location $TF_BACKEND_LOCATION
echo "create storage account"
az storage account create --resource-group $TF_BACKEND_RESOURCE_GROUP --name $TF_BACKEND_STORAGE_ACCOUNT --sku Standard_LRS 
echo "Get Account key"
ACCOUNT_KEY=$(az storage account keys list --resource-group $TF_BACKEND_RESOURCE_GROUP --account-name $TF_BACKEND_STORAGE_ACCOUNT  --query "[0].value" -o tsv)
echo "create blob container for tf state files"
az storage container create --name $TF_BACKEND_CONTAINER --account-name $TF_BACKEND_STORAGE_ACCOUNT --account-key $ACCOUNT_KEY
echo "create key ssh"
mkdir ~/.ssh/aks-dev-sshkeys-terraform
ssh-keygen -f ~/.ssh/aks-dev-sshkeys-terraform/aksdevsshkey -N ''
echo "terraform init"
terraform init -backend-config="storage_account_name=$TF_BACKEND_STORAGE_ACCOUNT" -backend-config="key=$TF_BACKEND_KEY=" -backend-config="container_name=$TF_BACKEND_CONTAINER" -backend-config="access_key=$ACCOUNT_KEY" 
