data "azurerm_resource_group" "local_gateway" {
  name = var.resource_group_name
}


resource "azurerm_local_network_gateway" "local" {
  count               = length(var.local_networks)
  name                = "${var.local_networks[count.index].name}-lng"
  resource_group_name = data.azurerm_resource_group.local_gateway.name
  location            = var.location == null ? data.azurerm_resource_group.local_gateway.location : var.location
  gateway_address     = var.local_networks[count.index].gateway_address
  address_space       = var.local_networks[count.index].address_space

  tags = var.tags
}

resource "azurerm_virtual_network_gateway_connection" "local" {
  count               = length(var.local_networks)
  name                = "${var.local_networks[count.index].name}-lngc"
  location            = var.location == null ? data.azurerm_resource_group.local_gateway.location : var.location
  resource_group_name = data.azurerm_resource_group.local_gateway.name

  type                       = var.type
  virtual_network_gateway_id = var.gw_id
  local_network_gateway_id   = azurerm_local_network_gateway.local[count.index].id

  shared_key = var.local_networks[count.index].shared_key

  dynamic "ipsec_policy" {
    for_each = var.local_networks[count.index].ipsec_policy != null ? [true] : []
    content {
      dh_group         = var.local_networks[count.index].ipsec_policy.dh_group
      ike_encryption   = var.local_networks[count.index].ipsec_policy.ike_encryption
      ike_integrity    = var.local_networks[count.index].ipsec_policy.ike_integrity
      ipsec_encryption = var.local_networks[count.index].ipsec_policy.ipsec_encryption
      ipsec_integrity  = var.local_networks[count.index].ipsec_policy.ipsec_integrity
      pfs_group        = var.local_networks[count.index].ipsec_policy.pfs_group
      sa_datasize      = var.local_networks[count.index].ipsec_policy.sa_datasize
      sa_lifetime      = var.local_networks[count.index].ipsec_policy.sa_lifetime
    }
  }

  tags = var.tags
}