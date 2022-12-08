#----------------------
# Global Vars
#----------------------
resource_group_names = [
  "rg-us-envolve-vnet", 
  "rg-us-envolve-vault", 
  "rg-us-envolve-acr", 
  "rg-us-envolve-aks",
  "rg-us-envolve-monitoramento",
  "rg-us-envolve-storage"
]

tags_rg = [
  {
    rg            = "vnet"
  },
  {
    rg            = "vault"
  },
  {
    rg            = "acr"
  },
  {
    rg            = "aks"
  },
  {
    rg            = "monitor"
  },
  {
    rg            = "storage"
  }
]

location            = "eastus2"
global_tags = {
  Department    = "Envolve IT"
  Environment   = "Prd"
  Project       = "DevOps"
  Provisioner   = "Terraform"
  onwer         = "Canuto"
}

acr_module_enabled                  = true
aks_module_enabled                  = true
vnet-spoke_module_enabled           = true
vnet-hub_module_enabled             = false
key_vault_module_enabled            = true
pip_module_enabled                  = false
pip_vpn_module_enabled              = false
bastion_module_enabled              = false
dns_private_module_enabled          = false
vm-win_module_enabled               = false
wks_log_module_enabled              = true
network_watcher_module_enabled      = false
storage_account_module_enabled      = true
gatway_vpn_module_enabled           = false
local_gw_module_enabled             = false

#--------------------
# ACR Vars
#--------------------
acr_name         = "acrusenvolve"
acr_enable_admin = true
sku              = "Standard"
tags_acr         = {
  resource       = "acr"
}

#----------------------
# AKS Vars
#----------------------
cluster_name                                  = "aks-envolve"
tags_aks                                      = {
                                     resource = "aks"
}
sku_tier_aks                                  = "Free"
k8s_version                                   = "1.23.12"
dns_prefix                                    = "aks-envolve"
disable_local_account                         = false
private_cluster_enabled                       = true
http_application_routing_enabled              = true
aks_dns_ip                                    = null
name_pool_default                             = "system"
auto_scaling_default                          = true
api_server_authorized_ip_ranges               = null
azure_policy_enabled                          = false
vm_size_default                               = "Standard_B2ms"
agent_count_default                           = 3
max_nodes_default                             = 3
min_nodes_default                             = 1
admin_linux 	                                = "useradmin"
ssh_public_key                                = "~/.ssh/aks-#{environmentName}#-sshkeys-terraform/aks-#{environmentName}#-sshkey.pub"
labels_default                                = {
    "nodepool-type" = "kube-system"
    "environment"   = "production"
    "nodepoolos"    = "linux"
    "apps"          = "modern"
}
node_av_zone                  = []
enable_node_public_ip         = false
enable_host_encryption        = false
node_vm_disk_size             = 30
ultra_ssd_enabled             = false
os_type                       = ["Linux"]
os_disk_size                  = [30]
node_pool                     = ["modern"]
zones                         = []
max_pods                      = [60]
enable_public_ip              = false
vm_size                       = ["Standard_B2ms"]
enable_auto_scaling           = true
agent_count                   = ["1"]
max_nodes                     = ["3"]
min_nodes                     = ["1"]
mode                          = ["User"]
windows_admin_username        = "useradmin"
windows_admin_password        = "#{Password_nodes_windons}#"
labels                        =[{
    "nodepool-type" = "User"
    "environment"   = "production"
    "nodepoolos"    = "linux"
    "apps"          = "modern"
}]
network_plugin                                  = "azure"
lb_sku                                          = "standard"
network_policy                                  = "azure"
aks_network_cidr                                = null
aks_docker_bridge                               = null
role_based_access_control_enabled               = false
rbac_aad_managed                                = false
rbac_aad_admin_group_object_ids                 = null
rbac_aad_azure_rbac_enabled                     = null
rbac_aad_tenant_id                              = null
rbac_aad_client_app_id                          = null
rbac_aad_server_app_id                          = null
rbac_aad_server_app_secret                      = null
is_identity_enabled                             = false
aks_enable_attach_acr               = true
aks_service_principal_app_id        = "#{clintid_AKS}#"
aks_service_principal_client_secret = "#{Secret_AKS}#"
log_analytics_workspace_id          = null


#----------------------
# VNET spoke Vars
#----------------------
vnet_name-spoke                                             = "vnet-envolve"
tags_vnet_spoke    = {
                                     resource = "vnet-us-envolve-spoke"
}
address_space-spoke                                         = ["10.175.0.0/16"]
subnet_names-spoke                                          = ["subnet-k8s"]
subnet_prefixes-spoke                                       = ["10.175.0.0/16"]
subnet_service_endpoints-spoke                              = {}
subnet_enforce_private_link_endpoint_network_policies-spoke = {}
subnet_enforce_private_link_service_network_policies-spoke  = {}
is_ddos_plan_enabled-spoke                                  = false
id_ddos_plan-spoke                                          = null
dns_servers-spoke                                           = ["8.8.8.8", "8.8.4.4"]
nsg_ids-spoke                                               = {}
route_tables_ids-spoke                                      = {}
nat_gateway_ids-spoke                                       = {}
use_network_existing_to_peering                             = true
allow_virtual_network_access                                = true
allow_forwarded_traffic                                     = false
allow_gateway_transit                                       = false
use_remote_gateways                                         = false
peering_network_existing_vnet_name                          = "vnet-aks-envolve-infra-base-eastus2-hub"
peering_network_existing_rg_name                            = "rg-us-envolve-vnet-infra-base"

#----------------------
# key vault Vars
#----------------------

kv_name  = "akvenvolve"
tags_key_vault                                    = {
                                     resource = "vault"
}
sku_name = "standard"
enable_rbac_authorization = false
network_acls_bypass = "AzureServices"
network_acls_ip_rules  = ["179.232.122.210", "13.82.5.252"]
network_acls_default_action  = "Allow"


#----------------------
# Key Vault policy Vars
#----------------------
access_policies = [
    {
      object_id               = "#{ObjectID_SPA_kevault_full}#"
      key_permissions         = ["Backup", "Create", "Decrypt", "Delete", "Encrypt", "Get", "Import", "List", "Purge",
                                  "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey", "Release", "Rotate", "GetRotationPolicy", "SetRotationPolicy"]
      secret_permissions      = ["Backup", "Delete", "Get", "List", "Purge", "Recover", "Restore", "Set"]
      certificate_permissions = ["Backup", "Create", "Delete", "DeleteIssuers", "Get", "GetIssuers", "Import", "List", "ListIssuers", "ManageContacts", "Purge",
                                  "Recover", "Restore", "SetIssuers", "Update"]
      storage_permissions     = ["Backup", "Delete", "DeleteSAS", "Get", "GetSAS", "List", "ListSAS", "Purge",
                                  "Recover", "RegenerateKey", "Restore", "Set", "SetSAS", "Update"]
    },
    {
      object_id               = "#{ObjectID_SPA_kevault_read}#"
      key_permissions         = ["Get", "List"]
      secret_permissions      = ["Get", "List"]
      certificate_permissions = ["Get", "List"]
      storage_permissions     = ["Get", "List"]
    }
]

#----------------------
# Log analytcs Vars
#----------------------
tags_log_analytcs                                   = {
                                     resource = "log"
}

log_analytics_workspace_name  = "la-envolve-monitoramento"


#----------------------
# Sotorage account Vars
#----------------------
storage_account_name = "envolvelogs"
tier                 = "Standard"
kind                 = "StorageV2"
replication          = "LRS"
tags_storage         = {
  resource = "stoaccount"
}
static_website_enabled = false
static_website         = {}
storacc_containers     = {}
enable_secure_transfer = true
storacc_shares         = {}