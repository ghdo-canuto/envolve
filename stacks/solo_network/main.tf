resource "azurerm_resource_group" "rg" {
  count    = length(var.resource_group_names)
  name     = "${var.resource_group_names[count.index]}-${terraform.workspace}"
  location = var.location
  tags     = merge(var.global_tags, var.tags_rg[count.index])
}

module "acr" {
  count  = var.acr_module_enabled == true ? 1 : 0
  source = "../../modules/acr"

  acr_name            = "${var.acr_name}${terraform.workspace}${var.location}"
  enable_admin        = var.acr_enable_admin
  resource_group_name = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("acr", resource_group_name))])
  location            = var.location
  tags                = merge(var.global_tags, var.tags_acr)
  sku                 = var.sku

  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "aks" {
  count  = var.aks_module_enabled && var.vnet-spoke_module_enabled ? 1 : 0
  source = "../../modules/aks"

  cluster_name                      = "${var.cluster_name}-${terraform.workspace}-${var.location}"
  dns_prefix                        = var.dns_prefix
  resource_group_name               = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("aks", resource_group_name))])
  location                          = var.location
  sku_tier_aks                      = var.sku_tier_aks
  k8s_version                       = var.k8s_version
  tags                              = merge(var.global_tags, var.tags_aks)
  disable_local_account             = var.disable_local_account
  private_cluster_enabled           = var.private_cluster_enabled
  http_application_routing_enabled  = var.http_application_routing_enabled
  api_server_authorized_ip_ranges   = var.api_server_authorized_ip_ranges
  azure_policy_enabled              = var.azure_policy_enabled
  name_pool_default                 = var.name_pool_default
  auto_scaling_default              = var.auto_scaling_default
  vm_size_default                   = var.vm_size_default
  agent_count_default               = var.agent_count_default
  max_nodes_default                 = var.max_nodes_default
  min_nodes_default                 = var.min_nodes_default
  labels_default                    = var.labels_default
  node_av_zone                      = var.node_av_zone
  enable_node_public_ip             = var.enable_node_public_ip
  enable_host_encryption            = var.enable_host_encryption
  node_vm_disk_size                 = var.node_vm_disk_size
  ultra_ssd_enabled                 = var.ultra_ssd_enabled
  admin_linux                       = var.admin_linux
  ssh_public_key                    = var.ssh_public_key
  windows_admin_username            = var.windows_admin_username
  windows_admin_password            = var.windows_admin_password
  network_plugin                    = var.network_plugin
  lb_sku                            = var.lb_sku
  network_policy                    = var.network_policy
  aks_network_cidr                  = var.aks_network_cidr
  aks_docker_bridge                 = var.aks_docker_bridge
  role_based_access_control_enabled = var.role_based_access_control_enabled
  rbac_aad_managed                  = var.rbac_aad_managed
  rbac_aad_admin_group_object_ids   = var.rbac_aad_admin_group_object_ids
  rbac_aad_azure_rbac_enabled       = var.rbac_aad_azure_rbac_enabled
  rbac_aad_tenant_id                = var.rbac_aad_tenant_id
  rbac_aad_client_app_id            = var.rbac_aad_client_app_id
  rbac_aad_server_app_id            = var.rbac_aad_server_app_id
  rbac_aad_server_app_secret        = var.rbac_aad_server_app_secret
  is_identity_enabled               = var.is_identity_enabled
  aks_dns_ip                        = var.aks_dns_ip
  os_type                           = var.os_type
  os_disk_size                      = var.os_disk_size
  zones                             = var.zones
  max_pods                          = var.max_pods
  node_pool                         = var.node_pool
  vm_size                           = var.vm_size
  enable_auto_scaling               = var.enable_auto_scaling
  agent_count                       = var.agent_count
  max_nodes                         = var.max_nodes
  min_nodes                         = var.min_nodes
  mode                              = var.mode
  labels                            = var.labels
  enable_public_ip                  = var.enable_public_ip

  resource_group_name_vnet_aks        = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vnet", resource_group_name))])
  vnet_name_aks                       = module.vnet-spoke[0].vnet_name
  subnet_names_aks                    = one([for subnet in module.vnet-spoke[0].vnet_subnet_names : subnet if can(regex("k8s", subnet))])
  aks_service_principal_app_id        = var.aks_service_principal_app_id
  aks_service_principal_client_secret = var.aks_service_principal_client_secret
  enable_attach_acr                   = var.aks_enable_attach_acr
  log_analytics_workspace_id          = var.log_analytics_workspace_id == null ? module.wks_log[0].analytics_id : var.log_analytics_workspace_id
  acr_id                              = module.acr[0].acr_id

  depends_on = [
    module.acr,
    azurerm_resource_group.rg,
    module.vnet-spoke,
    module.key_vault_access_policy,
    module.wks_log
  ]
}

module "vnet-spoke" {
  count  = var.vnet-spoke_module_enabled == true ?  1 : 0
  source = "../../modules/vnet"

  resource_group_name                                   = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vnet", resource_group_name))])
  location                                              = var.location
  tags                                                  = merge(var.global_tags, var.tags_vnet_spoke)
  vnet_name                                             = "${var.vnet_name-spoke}-${terraform.workspace}-${var.location}-spoke"
  address_space                                         = var.address_space-spoke
  subnet_names                                          = var.subnet_names-spoke
  subnet_prefixes                                       = var.subnet_prefixes-spoke
  subnet_service_endpoints                              = var.subnet_service_endpoints-spoke
  subnet_enforce_private_link_endpoint_network_policies = var.subnet_enforce_private_link_endpoint_network_policies-spoke
  subnet_enforce_private_link_service_network_policies  = var.subnet_enforce_private_link_service_network_policies-spoke
  is_ddos_plan_enabled                                  = var.is_ddos_plan_enabled-spoke
  id_ddos_plan                                          = var.id_ddos_plan-spoke
  dns_servers                                           = var.dns_servers-spoke
  nsg_ids                                               = var.nsg_ids-spoke
  route_tables_ids                                      = var.route_tables_ids-spoke
  nat_gateway_ids                                       = var.nat_gateway_ids-spoke
  create_vnet_peering                                   = var.use_network_existing_to_peering == false ? false : var.use_network_existing_to_peering
  virtual_network_remote_name                           = var.use_network_existing_to_peering ? var.peering_network_existing_vnet_name : ""
  virtual_network_remote_rg_name                        = var.use_network_existing_to_peering ? var.peering_network_existing_rg_name : ""
  allow_virtual_network_access                          = var.use_network_existing_to_peering ? var.allow_virtual_network_access : false
  allow_forwarded_traffic                               = var.use_network_existing_to_peering ? var.allow_forwarded_traffic : false
  allow_gateway_transit                                 = var.use_network_existing_to_peering ? var.allow_gateway_transit : false
  use_remote_gateways                                   = var.use_network_existing_to_peering ? var.use_remote_gateways : false


  depends_on = [
    azurerm_resource_group.rg
  ]
}


module "vnet-hub" {
  count  = var.vnet-hub_module_enabled  ?  1 : 0
  source = "../../modules/vnet"

  resource_group_name                                   = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vnet", resource_group_name))])
  location                                              = var.location
  tags                                                  = merge(var.global_tags, var.tags_vnet_hub)
  vnet_name                                             = "${var.vnet_name}-${terraform.workspace}-${var.location}-hub"
  address_space                                         = var.address_space
  subnet_names                                          = var.subnet_names
  subnet_prefixes                                       = var.subnet_prefixes
  subnet_service_endpoints                              = var.subnet_service_endpoints
  subnet_enforce_private_link_endpoint_network_policies = var.subnet_enforce_private_link_endpoint_network_policies
  subnet_enforce_private_link_service_network_policies  = var.subnet_enforce_private_link_service_network_policies
  is_ddos_plan_enabled                                  = var.is_ddos_plan_enabled
  id_ddos_plan                                          = var.id_ddos_plan
  dns_servers                                           = var.dns_servers
  nsg_ids                                               = var.nsg_ids
  route_tables_ids                                      = var.route_tables_ids
  nat_gateway_ids                                       = var.nat_gateway_ids
  allow_virtual_network_access                          = var.allow_virtual_network_access
  allow_forwarded_traffic                               = var.allow_forwarded_traffic
  allow_gateway_transit                                 = var.allow_gateway_transit
  use_remote_gateways                                   = var.use_remote_gateways
  virtual_network_remote_name                           = var.vnet-spoke_module_enabled == false ? var.peering_network_existing_vnet_name : module.vnet-spoke[0].vnet_name
  virtual_network_remote_rg_name                        = var.vnet-spoke_module_enabled == false ? var.peering_network_existing_rg_name : one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vnet", resource_group_name))])
  create_vnet_peering                                   = var.vnet-spoke_module_enabled == false ? false : var.create_vnet_peering


  depends_on = [
    azurerm_resource_group.rg,
    module.vnet-spoke
  ]
}

module "key_vault" {
  count  = var.key_vault_module_enabled == true ?  1 : 0
  source = "../../modules/key_vault"

  resource_group_name         = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vault", resource_group_name))])
  location                    = var.location
  tags                        = merge(var.global_tags, var.tags_key_vault)
  kv_name                     = "${var.kv_name}${terraform.workspace}${var.location}"
  sku_name                    = var.sku_name
  enable_rbac_authorization   = var.enable_rbac_authorization
  network_acls_bypass         = var.network_acls_bypass
  network_acls_default_action = var.network_acls_default_action
  network_acls_ip_rules       = var.network_acls_ip_rules

  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "key_vault_access_policy" {
  count  = var.key_vault_module_enabled == true ?  1 : 0
  source = "../../modules/access_policy"

  resource_group_name = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vault", resource_group_name))])
  key_vault_name      = module.key_vault[0].key_vault_name
  access_policies     = var.access_policies

  depends_on = [
    azurerm_resource_group.rg,
    module.key_vault
  ]

}

module "pip" {
  count  = var.pip_module_enabled == true ?  1 : 0
  source = "../../modules/pip"

  resource_group_name   = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vnet", resource_group_name))])
  location              = var.location
  tags                  = merge(var.global_tags, var.tags_public_ip)
  pip_name              = "${var.pip_name}-${terraform.workspace}-${var.location}"
  allocation_method_pip = var.allocation_method_pip
  sku_pip               = var.sku_pip
  ip_version_pip        = var.ip_version_pip
  sku_tier              = var.sku_tier

  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "pip_vpn" {
  count  = var.pip_vpn_module_enabled == true ?  1 : 0
  source = "../../modules/pip"

  resource_group_name   = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vnet", resource_group_name))])
  location              = var.location
  tags                  = merge(var.global_tags, var.tags_public_ip_gw)
  pip_name              = "${var.pip_name_gw}-${terraform.workspace}-${var.location}"
  allocation_method_pip = var.allocation_method_pip_gw
  sku_pip               = var.sku_pip_gw
  ip_version_pip        = var.ip_version_pip_gw
  sku_tier              = var.sku_tier_gw

  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "bastion" {
  count  = var.bastion_module_enabled && var.pip_module_enabled  ?  1 : 0
  source = "../../modules/bastion"

  resource_group_name    = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("bastion", resource_group_name))])
  location               = var.location
  tags                   = merge(var.global_tags, var.tags_bastion)
  subnet_name_bastion    = one([for subnet in module.vnet-hub[0].vnet_subnet_names : subnet if can(regex("AzureBastionSubnet", subnet))])
  subnet_rg_bastion      = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vnet", resource_group_name))])
  subnet_vnet_bastion    = module.vnet-hub[0].vnet_name
  pip_name_bastion       = module.pip[0].pip_name
  bastion_name           = "${var.bastion_name}-${terraform.workspace}-${var.location}"
  sku_bastion_name       = var.sku_bastion_name
  ip_configuration_name  = var.ip_configuration_name
  copy_paste_enabled     = var.copy_paste_enabled
  file_copy_enabled      = var.file_copy_enabled
  scale_units            = var.scale_units
  shareable_link_enabled = var.shareable_link_enabled
  tunneling_enabled      = var.tunneling_enabled
  ip_connect_enabled     = var.ip_connect_enabled

  depends_on = [
    azurerm_resource_group.rg,
    module.pip,
    module.vnet-hub
  ]

}

module "dns_private" {
  count  = var.dns_private_module_enabled == true ?  1 : 0
  source = "../../modules/dns/private"

  resource_group_name = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vnet", resource_group_name))])
  tags                = merge(var.global_tags, var.tags_dns_private)
  name                = var.dns_private_name
  vnet_links          = var.vnet_links
  a_records           = var.a_records
  cname_records       = var.cname_records

  depends_on = [
    azurerm_resource_group.rg,
    module.vnet-hub
  ]
}

module "vm-win" {
  count  = var.vm-win_module_enabled && var.vnet-hub_module_enabled ?  1 : 0
  source = "../../modules/vm-windows"

  resource_group_name       = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vm", resource_group_name))])
  location                  = var.location
  tags                      = merge(var.global_tags, var.tags_vm-win)
  ip_address                = var.ip_address
  dns_servers_to_nic        = var.dns_servers_to_nic
  sn_name                   = one([for subnet in module.vnet-hub[0].vnet_subnet_names : subnet if can(regex("vms", subnet))])
  resource_group_name_nic   = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vnet", resource_group_name))])
  subnet_vnet_nic           = module.vnet-hub[0].vnet_name
  ip_allocation             = var.ip_allocation
  existing_public_ip        = var.existing_public_ip
  public_ip_id              = var.public_ip_id
  is_public_ip_enabled      = var.is_public_ip_enabled
  vm_name                   = "${var.vm_name}-${terraform.workspace}"
  vm_size                   = var.vm_size_win
  license_act               = var.license_act
  admin_win_username        = var.admin_win_username
  admin_win_pass            = var.admin_win_pass
  caching                   = var.caching
  sizegbdisk                = var.sizegbdisk
  managed_disk_type         = var.managed_disk_type
  img_publisher             = var.img_publisher
  img_offer                 = var.img_offer
  img_sku                   = var.img_sku
  img_version               = var.img_version
  enable_automatic_upgrades = var.enable_automatic_upgrades
  provision_vm_agent        = var.provision_vm_agent
  storage_uri               = var.storage_uri
  allocation_method         = var.allocation_method
  public_ip_sku             = var.public_ip_sku

  depends_on = [
    azurerm_resource_group.rg,
    module.vnet-hub,
    module.dns_private,
    module.bastion
  ]

}


module "wks_log" {
  count  = var.wks_log_module_enabled == true ?  1 : 0
  source = "../../modules/log_analytics"

  log_analytics_workspace_name = "wkslog-${var.log_analytics_workspace_name}-${terraform.workspace}-${var.location}"
  tags                         = merge(var.global_tags, var.tags_log_analytcs)
  log_analytics_workspace_sku  = var.log_analytics_workspace_sku
  resource_group_name          = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("monitoramento", resource_group_name))])
  location                     = var.location
  log_retention_in_days        = var.log_retention_in_days

  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "network_watcher" {
  count  = var.network_watcher_module_enabled == true ?  1 : 0
  source = "../../modules/network_watcher"

  network_watcher_name = var.network_watcher_name
  resource_group_name  = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("network-watcher", resource_group_name))])
  tags                 = merge(var.global_tags, var.tags_network_watcher)

  depends_on = [
    azurerm_resource_group.rg
  ]
}

module "storage_account" {
  count  = var.storage_account_module_enabled == true ?  1 : 0
  source = "../../modules/storage"

  storage_account_name   = "${var.storage_account_name}${terraform.workspace}${var.location}"
  location               = var.location
  resource_group_name    = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("storage", resource_group_name))])
  tier                   = var.tier
  kind                   = var.kind
  replication            = var.replication
  tags                   = merge(var.global_tags, var.tags_storage)
  static_website_enabled = var.static_website_enabled
  static_website         = var.static_website
  storacc_containers     = var.storacc_containers
  enable_secure_transfer = var.enable_secure_transfer
  storacc_shares         = var.storacc_shares

  depends_on = [
    module.vm-win,
    azurerm_resource_group.rg
  ]
}

module "gatway_vpn" {
  count  = var.gatway_vpn_module_enabled && var.pip_vpn_module_enabled && var.vnet-hub_module_enabled ?  1 : 0
  source = "../../modules/network_gateway"

  name                           = var.gateway_name
  location                       = var.location
  resource_group_name            = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vnet", resource_group_name))])
  subnet_name_vpn                = one([for subnet in module.vnet-hub[0].vnet_subnet_names : subnet if can(regex("GatewaySubnet", subnet))])
  resource_group_name_subnet_vpn = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vnet", resource_group_name))])
  subnet_vnet_name_vpn           = module.vnet-hub[0].vnet_name
  type                           = var.type_gw
  vpn_type                       = var.vpn_type_gw
  active_active                  = var.active_active
  enable_bgp                     = var.enable_bgp
  sku                            = var.sku_gw
  client_configuration           = var.client_configuration
  pip_name_vpn                   = module.pip_vpn[0].pip_name
  tags                           = merge(var.global_tags, var.tags_gw)

  depends_on = [
    azurerm_resource_group.rg,
    module.vnet-hub,
    module.pip_vpn
  ]
}

module "local_gw" {
  count  = var.local_gw_module_enabled &&  var.gatway_vpn_module_enabled ?  1 : 0
  source = "../../modules/local_network_gateway"

  resource_group_name = one([for resource_group_name in azurerm_resource_group.rg.*.name : resource_group_name if can(regex("vnet", resource_group_name))])
  location            = var.location
  local_networks      = var.local_networks
  type                = var.type_local_gw
  gw_id               = module.gatway_vpn[0].gateway_id
  tags                = merge(var.global_tags, var.tags_local_gw)

  depends_on = [
    azurerm_resource_group.rg,
    module.vnet-hub,
    module.pip_vpn,
    module.gatway_vpn
  ]


}