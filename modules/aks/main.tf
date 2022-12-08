/*
 * # Azure Kubernetes Services
 * This module presents an easy way to provision your Azure Kubernetes Services.
*/

data "azurerm_resource_group" "aks" {
  name = var.resource_group_name
}

data "azurerm_subnet" "aks" {
  name                 = var.subnet_names_aks
  virtual_network_name = var.vnet_name_aks
  resource_group_name  = var.resource_group_name_vnet_aks
}

data "azurerm_client_config" "aks" {
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                                = var.cluster_name
  location                            = var.location == null ? data.azurerm_resource_group.aks.location : var.location
  resource_group_name                 = var.resource_group_name
  dns_prefix                          = var.dns_prefix
  tags                                = var.tags
  sku_tier                            = var.sku_tier_aks
  kubernetes_version                  = var.k8s_version
  local_account_disabled              = var.disable_local_account
  http_application_routing_enabled    = var.http_application_routing_enabled
  private_cluster_enabled             = var.private_cluster_enabled
  api_server_authorized_ip_ranges     = var.api_server_authorized_ip_ranges 
  azure_policy_enabled                = var.azure_policy_enabled
  
  default_node_pool {
    name                        = var.name_pool_default
    enable_auto_scaling         = var.auto_scaling_default
    vm_size                     = var.vm_size_default
    node_count                  = var.agent_count_default 
    max_count                   = var.auto_scaling_default == true ? var.max_nodes_default : null
    min_count                   = var.auto_scaling_default == true ? var.min_nodes_default : null
    node_labels                 = var.labels_default
    vnet_subnet_id              = data.azurerm_subnet.aks.id
    zones                       = var.node_av_zone
    enable_node_public_ip       = var.enable_node_public_ip
    enable_host_encryption      = var.enable_host_encryption
    os_disk_size_gb             = var.node_vm_disk_size
    ultra_ssd_enabled           = var.ultra_ssd_enabled
  }
  
  linux_profile {
    admin_username = var.admin_linux

    ssh_key {
      key_data = file(var.ssh_public_key)
    }    
  }
   
  windows_profile {
    admin_username = var.windows_admin_username
    admin_password = var.windows_admin_password
  }

  network_profile {
    network_plugin      = var.network_plugin
    load_balancer_sku   = var.lb_sku
    network_policy      = var.network_policy
    service_cidr        = var.aks_network_cidr
    docker_bridge_cidr  = var.aks_docker_bridge
    dns_service_ip      = var.aks_dns_ip
  }

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = var.role_based_access_control_enabled && var.rbac_aad_managed ? ["rbac"] : []

    content {
      admin_group_object_ids          = var.rbac_aad_admin_group_object_ids
      azure_rbac_enabled              = var.rbac_aad_azure_rbac_enabled
      managed                         = true
      tenant_id                       = var.rbac_aad_tenant_id
    }
  }

  dynamic "azure_active_directory_role_based_access_control" {
    for_each = var.role_based_access_control_enabled && !var.rbac_aad_managed ? ["rbac"] : []

    content {
      client_app_id                   = var.rbac_aad_client_app_id
      managed                         = false
      server_app_id                   = var.rbac_aad_server_app_id
      server_app_secret               = var.rbac_aad_server_app_secret
      tenant_id                       = var.rbac_aad_tenant_id
    }
  }
  
  dynamic "service_principal" {
    for_each = var.is_identity_enabled ? [] : [1]
    content {
      client_id                       = var.aks_service_principal_app_id
      client_secret                   = var.aks_service_principal_client_secret
    }
  }

  dynamic "identity" {
    for_each = var.is_identity_enabled ? [1] : []
    content {
      type = "SystemAssigned"
    }
  }

  oms_agent {
    log_analytics_workspace_id =  var.log_analytics_workspace_id 
  }
}  

resource "azurerm_kubernetes_cluster_node_pool" "win" {

  lifecycle {
    ignore_changes                    = [node_count]
  }

  count                 = length(var.node_pool)
  name                  = var.node_pool[count.index]
  orchestrator_version  = var.k8s_version
  os_type               = var.os_type[count.index]
  os_disk_size_gb       = var.os_disk_size[count.index]
  zones                 = var.zones
  enable_auto_scaling   = var.enable_auto_scaling
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  node_count            = var.agent_count[count.index]
  max_count             = var.max_nodes[count.index]
  min_count             = var.min_nodes[count.index]
  max_pods              = var.max_pods[count.index] != null ? var.max_pods[count.index] : 60
  mode                  = var.mode[count.index]
  vm_size               = var.vm_size[count.index]
  vnet_subnet_id        = data.azurerm_subnet.aks.id
  node_labels           = var.labels[count.index]
  enable_node_public_ip = var.enable_public_ip
  tags                  = var.tags
}


resource "azurerm_role_assignment" "attach_acr" {
  count = var.enable_attach_acr ? 1 : 0

  scope                            = var.acr_id
  role_definition_name             = "AcrPull"
  principal_id                     = data.azurerm_client_config.aks.object_id
  skip_service_principal_aad_check = true
}