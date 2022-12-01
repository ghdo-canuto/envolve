output "azure_bastion_host_id" {
    value = azurerm_bastion_host.bastion.id
}

output "azure_bastion_host_pip" {
    value = data.azurerm_public_ip.ips.ip_address
}