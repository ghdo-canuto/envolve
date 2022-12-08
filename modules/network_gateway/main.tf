data "azurerm_resource_group" "gateway" {
  name = var.resource_group_name
}

data "azurerm_subnet" "sub_vpn" {
    name = var.subnet_name_vpn
    resource_group_name =  var.resource_group_name_subnet_vpn
    virtual_network_name = var.subnet_vnet_name_vpn
}

data "azurerm_public_ip" "public_ip" {
    name = var.pip_name_vpn
    resource_group_name = data.azurerm_subnet.sub_vpn.resource_group_name
}


resource "azurerm_virtual_network_gateway" "gw" {
  name                = var.name
  location            = var.location == null ? data.azurerm_resource_group.gateway.location : var.location
  resource_group_name = data.azurerm_resource_group.gateway.name

  type     = var.type
  vpn_type = var.vpn_type

  active_active = var.active_active
  enable_bgp    = var.enable_bgp
  sku           = var.sku

  ip_configuration {
    name                          = "${var.name}-gw-config"
    public_ip_address_id          = data.azurerm_public_ip.public_ip.id
    private_ip_address_allocation = var.private_ip_address_allocation 
    subnet_id                     = data.azurerm_subnet.sub_vpn.id
  }


  dynamic "vpn_client_configuration" {
    for_each = var.client_configuration != null ? [var.client_configuration] : []
    iterator = vpn
    content {
      address_space = [vpn.value.address_space]

      root_certificate {
        name = "VPN-Certificate"

        public_cert_data = vpn.value.certificate
      }

      vpn_client_protocols = vpn.value.protocols
    }
  }

  # TODO Buggy... keep want to change this attribute
  lifecycle {
    ignore_changes = [vpn_client_configuration[0].root_certificate]
  }

  tags = var.tags
}