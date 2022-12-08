data "azurerm_resource_group" "storacc" {
  name = var.resource_group_name
}

resource "random_string" "storacc" {
  length   = 4
  special  = false
  numeric  = false
}

resource "azurerm_storage_account" "storacc" {
  name                      = lower(join("", [var.storage_account_name, random_string.storacc.result]))
  resource_group_name       = var.resource_group_name
  location                  = var.location
  account_tier              = var.tier
  account_kind              = var.kind
  account_replication_type  = var.replication
  tags                      = var.tags
  enable_https_traffic_only = var.enable_secure_transfer

  dynamic "static_website" {
    for_each = var.static_website_enabled ? [var.static_website] : []
    content {
      index_document        = static_website.value["index_document"]
      error_404_document    = static_website.value["error_404_document"]
    }
  }
}

resource "azurerm_storage_share" "file_share" {
  for_each                  = var.storacc_shares
  name                      = each.key
  storage_account_name      = azurerm_storage_account.storacc.name
  enabled_protocol          = each.value.protocol
  quota                     = lookup(each.value, "share_quota", 1)

  depends_on = [
    azurerm_storage_account.storacc
  ]
}

resource "azurerm_storage_container" "container" {
  for_each                  = var.storacc_containers
  name                      = each.key
  storage_account_name      = azurerm_storage_account.storacc.name
  container_access_type     = lookup(each.value, "container_access_type", "Private")

  depends_on = [
    azurerm_storage_account.storacc
  ]
}
