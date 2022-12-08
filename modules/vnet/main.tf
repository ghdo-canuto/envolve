data "azurerm_resource_group" "vnet" {
  name = var.resource_group_name
}


data "azurerm_virtual_network" "true" {
  count = var.create_vnet_peering == true ? 1 : 0
  name  = var.virtual_network_remote_name
  resource_group_name = var.virtual_network_remote_rg_name
}

resource "azurerm_virtual_network" "vnet" {
    name                = var.vnet_name
    resource_group_name = var.resource_group_name
    location            = var.location == null ? data.azurerm_resource_group.vnet.location : var.location
    address_space       = var.address_space
    dns_servers         = var.dns_servers
    tags                = var.tags

  dynamic "ddos_protection_plan" {
    for_each = var.is_ddos_plan_enabled  ? [1] : []
    content {
    enable = var.is_ddos_plan_enabled 
    id     = var.id_ddos_plan
    }
  }    
}

locals {
  azurerm_subnets = {
    for index, subnet in azurerm_subnet.subnet :
    subnet.name => subnet.id
  }
}

resource "azurerm_subnet" "subnet" { 
  count                   = length(var.subnet_names)
  name                    = var.subnet_names[count.index]
  resource_group_name     = var.resource_group_name
  virtual_network_name    = azurerm_virtual_network.vnet.name
  address_prefixes        = [var.subnet_prefixes[count.index]]   
  service_endpoints                              = lookup(var.subnet_service_endpoints, var.subnet_names[count.index], null)
  private_endpoint_network_policies_enabled      = lookup(var.subnet_enforce_private_link_endpoint_network_policies, var.subnet_names[count.index], false)
  private_link_service_network_policies_enabled  = lookup(var.subnet_enforce_private_link_service_network_policies, var.subnet_names[count.index], false)  
}

resource "azurerm_subnet_network_security_group_association" "vnet" {
  for_each                  = var.nsg_ids
  subnet_id                 = local.azurerm_subnets[each.key]
  network_security_group_id = each.value
}

resource "azurerm_subnet_route_table_association" "vnet" {
  for_each       = var.route_tables_ids
  route_table_id = each.value
  subnet_id      = local.azurerm_subnets[each.key]
}

resource "azurerm_subnet_nat_gateway_association" "vnet" {
  for_each       = var.nat_gateway_ids
  nat_gateway_id = each.value
  subnet_id      = local.azurerm_subnets[each.key]
}


resource "azurerm_virtual_network_peering" "true_to_dest" {
  count                           = var.create_vnet_peering == true ? 1 : 0
  name                            = lower("pee-${azurerm_virtual_network.vnet.name}-to-${data.azurerm_virtual_network.true[count.index].name}")
  resource_group_name             = var.resource_group_name
  virtual_network_name            = azurerm_virtual_network.vnet.name
  remote_virtual_network_id       = data.azurerm_virtual_network.true[count.index].id
  allow_virtual_network_access    = var.allow_virtual_network_access
  allow_forwarded_traffic         = var.allow_forwarded_traffic 
  allow_gateway_transit           = var.allow_gateway_transit
  use_remote_gateways             = var.use_remote_gateways

}


resource "azurerm_virtual_network_peering" "true_to_returning" {
  count                           = var.create_vnet_peering == true ? 1 : 0
  name                            = lower("pee${data.azurerm_virtual_network.true[count.index].name}-to-${azurerm_virtual_network.vnet.name}")
  resource_group_name             = data.azurerm_virtual_network.true[count.index].resource_group_name  
  virtual_network_name            = data.azurerm_virtual_network.true[count.index].name
  remote_virtual_network_id       = azurerm_virtual_network.vnet.id
  allow_virtual_network_access    = var.allow_virtual_network_access
  allow_forwarded_traffic         = var.allow_forwarded_traffic 
  allow_gateway_transit           = var.allow_gateway_transit
  use_remote_gateways             = var.use_remote_gateways
}