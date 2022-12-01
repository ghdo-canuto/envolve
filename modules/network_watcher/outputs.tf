output "network_watcher_name" {
  description = "Nome da network watcher name"
  value       = azurerm_network_watcher.nw.name
}

output "network_watcher_location" {
  description = "local do Azure do network watcher"
  value       = azurerm_network_watcher.nw.location
}

output "network_watcher_id" {
  description = "Id do network watcher"
  value       = azurerm_network_watcher.nw.id
}