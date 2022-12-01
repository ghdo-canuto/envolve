output "access_policy" {
    value = azurerm_key_vault_access_policy.access_policy[*]
}