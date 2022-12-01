data "azurerm_resource_group" "kv_access" {
  name = var.resource_group_name
}

data "azurerm_client_config" "current" {}

data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = data.azurerm_resource_group.kv_access.name
}


resource "azurerm_key_vault_access_policy" "access_policy" {
  count                   = length(var.access_policies)
  key_vault_id            = data.azurerm_key_vault.key_vault.id
  tenant_id               = data.azurerm_client_config.current.tenant_id
  object_id               = lookup(var.access_policies[count.index], "object_id")
  application_id          = lookup(var.access_policies[count.index], "application_id", null)
  key_permissions         = lookup(var.access_policies[count.index], "key_permissions")
  secret_permissions      = lookup(var.access_policies[count.index], "secret_permissions")
  certificate_permissions = lookup(var.access_policies[count.index], "certificate_permissions")
  storage_permissions     = lookup(var.access_policies[count.index], "storage_permissions")
}