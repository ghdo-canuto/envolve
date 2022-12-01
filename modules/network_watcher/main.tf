data "azurerm_resource_group" "rg_network_watcher" {
  name = var.resource_group_name
}

resource "azurerm_network_watcher" "nw" {
  name                = var.network_watcher_name
  location            = data.azurerm_resource_group.rg_network_watcher.location
  resource_group_name = data.azurerm_resource_group.rg_network_watcher.name
  tags                = var.tags 
}