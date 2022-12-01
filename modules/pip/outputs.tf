output "pip_name" {
    description = "Nome do ip publico"
    value = azurerm_public_ip.pip.name
}