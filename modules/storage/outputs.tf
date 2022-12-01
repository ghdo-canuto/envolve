output "storage_account_name" {
  value = azurerm_storage_account.storacc.name
}

output "storage_account_id" {
  value = azurerm_storage_account.storacc.id
}

output "storage_account_url" {
  value = azurerm_storage_account.storacc.primary_blob_endpoint
}

output "storage_access_key" {
  sensitive   = true
  value = azurerm_storage_account.storacc.primary_access_key
}

output "storage_account_primary_web_host" {
  value = azurerm_storage_account.storacc.primary_web_host
}

output "storage_account_containers" {
  value = [for container in azurerm_storage_container.container : container.name]
}