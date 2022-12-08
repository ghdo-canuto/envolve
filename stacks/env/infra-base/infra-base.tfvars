#----------------------
# Global Vars
#----------------------
resource_group_names = [
  "rg-us-envolve-vm", 
  "rg-us-envolve-vnet",  
  "rg-us-envolve-bastion", 
  "rg-us-envolve-watcher"
]

tags_rg = [{
    rg            = "vm"
  },
  {
    rg            = "vnet"
  },
  {
    rg            = "bastion"
  },
  {
    rg            = "whatcher"
  },
]

location            = "eastus2"
global_tags = {
  Department    = "Envolve IT"
  Environment   = "infra base"
  Project       = "Migração DevOps"
  Provisioner   = "Terraform"
  onwer         = "Canuto"
}

acr_module_enabled                  = false
aks_module_enabled                  = false
vnet-spoke_module_enabled           = false
vnet-hub_module_enabled             = true
key_vault_module_enabled            = false
pip_module_enabled                  = true
pip_vpn_module_enabled              = true
bastion_module_enabled              = true
dns_private_module_enabled          = true
vm-win_module_enabled               = true
wks_log_module_enabled              = false
network_watcher_module_enabled      = true
storage_account_module_enabled      = false
gatway_vpn_module_enabled           = true
local_gw_module_enabled             = true

#----------------------
# VNET hub Vars
#----------------------
vnet_name                                             = "vnet-aks-envolve"
tags_vnet_hub                                    = {
                                     resource = "vnet-us-envovle-hub"
}
address_space                                         = ["172.20.0.0/16"]
subnet_names                                          = ["AzureBastionSubnet", "vms", "GatewaySubnet"]
subnet_prefixes                                       = ["172.20.0.0/26", "172.20.200.0/24", "172.20.1.0/24"]
subnet_service_endpoints                              = {}
subnet_enforce_private_link_endpoint_network_policies = {}
subnet_enforce_private_link_service_network_policies  = {}
is_ddos_plan_enabled                                  = false
id_ddos_plan                                          = null
dns_servers                                           = ["8.8.8.8", "8.8.4.4"]
create_vnet_peering                                   = false
allow_virtual_network_access                          = true
allow_forwarded_traffic                               = false
allow_gateway_transit                                 = false
use_remote_gateways                                   = false
nsg_ids                                               = {}
route_tables_ids                                      = {}
nat_gateway_ids                                       = {}


#----------------------
# Public IP Vars
#----------------------

pip_name              = "pip-envovle-bastion"
tags_public_ip                                    = {
                                     resource = "PIP"
}
allocation_method_pip = "Static"
sku_pip               = "Standard"
ip_version_pip        = "IPv4"
sku_tier              = "Regional"

#----------------------
# Bastion Vars
#----------------------

bastion_name = "bastion-envolve"
tags_bastion                                    = {
                                     resource = "bastion"
}
sku_bastion_name = "Standard"
ip_configuration_name = "ipsConfig"
copy_paste_enabled    = true
file_copy_enabled     = true
scale_units           = 4
shareable_link_enabled = false
tunneling_enabled      = false
ip_connect_enabled     = false

#----------------------
# DNS Private Vars
#----------------------

dns_private_name = "contoso.com.br"
tags_dns_private                                    = {
                                     resource = "dns"
}
vnet_links       = [{
  name   = "hub-us-envolve"
  virtual_network_name = "vnet-aks-envolve-infra-base-eastus2-hub"
  registration_enabled = true
  rg_name              = "rg-us-envolve-vnet-infra-base"
}]
a_records        = []
cname_records    = []

#----------------------
# VM Windows Vars
#----------------------

dns_servers_to_nic        = []
tags_vm-win                                    = {
                                     resource = "vms"
}
ip_allocation             = "Static"
ip_address                = "172.20.200.182"
existing_public_ip        = false
is_public_ip_enabled      = false
public_ip_id              = ""
vm_name                   = "vm-ad"
vm_size_win               = "Standard_B2S"
license_act               = "None"
admin_win_username        = "useradmin"
admin_win_pass            = "#{Password_vms_windons}#"
caching                   = "ReadOnly"
sizegbdisk                = "127"
managed_disk_type         = "Standard_LRS"
img_publisher             = "microsoftwindowsserver"
img_offer                 = "windowsserver"
img_sku                   = "2019-Datacenter"
img_version               = "latest"
enable_automatic_upgrades = false
provision_vm_agent        = true
allocation_method         = ""
public_ip_sku             = ""


storage_uri  = "https://tfsprdcontainer.blob.core.windows.net/"

#----------------------
# Network Whatcher Vars
#----------------------

network_watcher_name = "NetworkWatcher_eastus2"
tags_network_watcher  = {
  resource = "tshoout-network"
}

#----------------------
# Public IP Gateway Vars
#----------------------

pip_name_gw              = "pip-envovel-vpn"
tags_public_ip_gw                                    = {
                                     resource = "PIP-gataway"
}
allocation_method_pip_gw = "Static"
sku_pip_gw               = "Standard"
ip_version_pip_gw        = "IPv4"
sku_tier_gw              = "Regional"


#----------------------
# Network gateway Vars
#----------------------

gateway_name                  = "vpn-envolves-s2s"
enable_bgp                    = false
active_active                 = false
sku_gw                        = "VpnGw1"
client_configuration          = null
type_gw                       = "Vpn"
vpn_type_gw                   = "RouteBased"
private_ip_address_allocation = "Dynamic"
tags_gw = {
  resource = "vpn-gataway"
}

#----------------------
# local gateway Vars
#----------------------

type_local_gw = "IPsec"
tags_local_gw = {
  resource = "local-gataway"
}
local_networks = [
  {
    name = "onpremise"
    gateway_address = "179.232.122.210"
    type = "IPsec"
    address_space = [
      "10.0.0.0/8"
    ]
    shared_key = "#{shared_key_vpn}#"
    ipsec_policy = null
  }
]