#----------------------
# RG Outputs
#----------------------

output "rg_name" {
  value = azurerm_resource_group.rg.*.name
}

output "rg_location" {
  value = azurerm_resource_group.rg.*.location
}

#----------------------
# ACR Outputs
#----------------------

output "acr_id" {
  value     = var.acr_module_enabled == true ? module.acr[0].acr_id : null
  sensitive = true
}

#----------------------
# AKS Outputs
#----------------------

output "client_certificate" {
  value     = var.aks_module_enabled && var.vnet-spoke_module_enabled ? module.aks[0].client_certificate : null
  sensitive = true
}

output "client_key" {
  value     = var.aks_module_enabled && var.vnet-spoke_module_enabled ? module.aks[0].client_key : null
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = var.aks_module_enabled && var.vnet-spoke_module_enabled ? module.aks[0].cluster_ca_certificate : null
  sensitive = true
}

output "host" {
  value     = var.aks_module_enabled && var.vnet-spoke_module_enabled ? module.aks[0].host : null
  sensitive = true
}

output "kube_config_raw" {
  value     = var.aks_module_enabled && var.vnet-spoke_module_enabled ? module.aks[0].kube_config_raw : null
  sensitive = true
}

output "identity" {
  value = var.aks_module_enabled && var.vnet-spoke_module_enabled ? module.aks[0].identity : null
}


#----------------------
# Vnet spoke Outputs
#----------------------

output "vnet_name-spoke" {
  value = var.vnet-spoke_module_enabled == true ? module.vnet-spoke[0].vnet_name : null
}

output "vnet_address_space-spoke" {
  value = var.vnet-spoke_module_enabled == true ? module.vnet-spoke[0].vnet_address_space : null
}


output "vnet_subnet_names-spoke" {
  value = var.vnet-spoke_module_enabled == true ? module.vnet-spoke[0].vnet_subnet_names : null
}

#----------------------
# Vnet hub Outputs
#----------------------

output "vnet_name" {
  value = var.vnet-hub_module_enabled ? module.vnet-hub[0].vnet_name : null
}

output "vnet_address_space" {
  value = var.vnet-hub_module_enabled ? module.vnet-hub[0].vnet_address_space : null
}


output "vnet_subnet_names" {
  value = var.vnet-hub_module_enabled ? module.vnet-hub[0].vnet_subnet_names : null
}


#----------------------
# Key Vault Vars
#----------------------

output "key_vault_id" {
  value = var.key_vault_module_enabled == true ? module.key_vault[0].key_vault_id : null
}

output "key_vault_name" {
  value = var.key_vault_module_enabled == true ? module.key_vault[0].key_vault_name : null
}

#----------------------
# Key Vault access policy Vars
#----------------------

output "access_policy" {
  value = var.key_vault_module_enabled == true ? module.key_vault_access_policy[*] : null
}


#----------------------
# Public IP Vars
#----------------------

output "pip_name" {
  value = var.pip_module_enabled == true ? module.pip[0].pip_name : null
}


#----------------------
# Bastion Vars
#----------------------

output "azure_bastion_host_pip" {
  value = var.bastion_module_enabled && var.pip_module_enabled ? module.bastion[0].azure_bastion_host_pip : null
}

output "azure_bastion_host_id" {
  value = var.bastion_module_enabled && var.pip_module_enabled ? module.bastion[0].azure_bastion_host_id : null
}

#----------------------
# DNS private Vars
#----------------------

output "zone_name" {
  value = var.dns_private_module_enabled == true ? module.dns_private[0].zone_name : null
}

output "a_records" {
  value = var.dns_private_module_enabled == true ? module.dns_private[0].a_records[*].name : null
}

output "cname_records" {
  value = var.dns_private_module_enabled == true ? module.dns_private[0].cname_records[*].name : null
}

#----------------------
# VM Windows Vars
#----------------------

output "vm_id" {
  value = var.vm-win_module_enabled && var.vnet-hub_module_enabled ? module.vm-win[0].vm_id : null
}

output "vm_ip" {
  value = var.vm-win_module_enabled && var.vnet-hub_module_enabled ? module.vm-win[0].vm_ip : null
}


#----------------------
# Log analytics Vars
#----------------------


output "analytics_id" {
  value = var.wks_log_module_enabled == true ? module.wks_log[0].analytics_id : null
}

output "app_id" {
  value = var.wks_log_module_enabled == true ? module.wks_log[0].app_id : null
}

output "instrumentation_key" {
  value     = var.wks_log_module_enabled == true ? module.wks_log[0].instrumentation_key : null
  sensitive = true
}

#----------------------
# Network watcher Vars
#----------------------

output "network_watcher_name" {
  value = var.network_watcher_module_enabled == true ? module.network_watcher[0].network_watcher_name : null
}

output "network_watcher_location" {
  value = var.network_watcher_module_enabled == true ? module.network_watcher[0].network_watcher_location : null
}

output "network_watcher_id" {
  value = var.network_watcher_module_enabled == true ? module.network_watcher[0].network_watcher_id : null
}

#----------------------
# Sotorage account Vars
#----------------------

output "storage_account_name" {
  value = var.storage_account_module_enabled == true ? module.storage_account[0].storage_account_name : null
}

output "storage_account_id" {
  value = var.storage_account_module_enabled == true ? module.storage_account[0].storage_account_id : null
}

output "storage_account_url" {
  value = var.storage_account_module_enabled == true ? module.storage_account[0].storage_account_url : null
}

output "storage_access_key" {
  value     = var.storage_account_module_enabled == true ? module.storage_account[0].storage_access_key : null
  sensitive = true
}

output "storage_account_container" {
  value = var.storage_account_module_enabled == true ? module.storage_account[0].storage_account_containers : null
}

output "storage_account_primary_web_host" {
  value = var.storage_account_module_enabled == true ? module.storage_account[0].storage_account_primary_web_host : null
}

#----------------------
# Network gataway Vars
#----------------------

output "gateway_id" {
  value = var.gatway_vpn_module_enabled && var.pip_vpn_module_enabled && var.vnet-hub_module_enabled ? module.gatway_vpn[0].gateway_id : null
}

#----------------------
# Public IP Gateway Vars
#----------------------

output "pip_vpn_name" {
  value = var.pip_vpn_module_enabled == true ? module.pip_vpn[0].pip_name : null
}