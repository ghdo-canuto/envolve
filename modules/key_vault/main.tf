data "azurerm_resource_group" "kv" {
  name = var.resource_group_name
}

data "azurerm_client_config" "current" {}

resource "random_string" "random" {
  length  = 4
  special = false
  numeric = false
}

resource "azurerm_key_vault" "key_vault" {
  name                = lower(join("", [var.kv_name, random_string.random.result]))
  location            = var.location == null ? data.azurerm_resource_group.kv.location : var.location
  resource_group_name = data.azurerm_resource_group.kv.name

  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization

  tenant_id = data.azurerm_client_config.current.tenant_id
  sku_name  = var.sku_name

  purge_protection_enabled        = var.purge_protection_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days

  tags                            = var.tags

  network_acls {
    bypass                     = var.network_acls_bypass
    default_action             = var.network_acls_default_action
    ip_rules                   = var.network_acls_ip_rules
    virtual_network_subnet_ids = var.network_acls_virtual_network_subnet_ids
  }
}  
