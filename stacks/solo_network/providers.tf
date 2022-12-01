provider "azurerm" {
  features {
    resource_group {
     prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = "#{ARM-SUBSCRIPTION-ID}#"
  tenant_id       = "#{ARM-TENANT-ID}#"
  client_id       = "#{ARM-CLIENT-ID}#"
  client_secret   = "#{ARM-CLIENT-SECRET}#"
}