data "azurerm_resource_group" "pip" {
  name = var.resource_group_name
}

resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = data.azurerm_resource_group.pip.name
  location            = var.location == null ? data.azurerm_resource_group.pip.location : var.location
  allocation_method   = var.allocation_method_pip
  sku                 = var.sku_pip
  tags                = var.tags
  ip_version          = var.ip_version_pip
  sku_tier            = var.sku_tier
}