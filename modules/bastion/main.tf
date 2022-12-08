data "azurerm_resource_group" "bastion" {
  name = var.resource_group_name
}

data "azurerm_subnet" "sub" {
    name = var.subnet_name_bastion
    resource_group_name =  var.subnet_rg_bastion
    virtual_network_name = var.subnet_vnet_bastion
}

data "azurerm_public_ip" "ips" {
    name = var.pip_name_bastion
    resource_group_name = data.azurerm_subnet.sub.resource_group_name
}


resource "azurerm_bastion_host" "bastion" {
  name                = var.bastion_name
  location            = var.location == null ? data.azurerm_resource_group.bastion.location : var.location
  resource_group_name = data.azurerm_resource_group.bastion.name
  sku                 = var.sku_bastion_name

  ip_configuration {
    name                 = var.ip_configuration_name
    subnet_id            = data.azurerm_subnet.sub.id
    public_ip_address_id = data.azurerm_public_ip.ips.id
  }


  copy_paste_enabled     = var.copy_paste_enabled
  file_copy_enabled      = var.sku_bastion_name == "Standard" ? var.file_copy_enabled : null
  scale_units            = var.sku_bastion_name == "Standard" ? var.scale_units : 2
  shareable_link_enabled = var.sku_bastion_name == "Standard" ? var.shareable_link_enabled : null
  tunneling_enabled      = var.sku_bastion_name == "Standard" ? var.tunneling_enabled : null
  ip_connect_enabled     = var.ip_connect_enabled
  tags                   = var.tags
}