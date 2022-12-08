output "vnet_name" {
  description = "Nome da rede virtual criada"
  value       = azurerm_virtual_network.vnet.name
}

output "vnet_address_space" {
  description = "Rage de ip da vnet"
  value       = azurerm_virtual_network.vnet.address_space
}


output "vnet_subnet_names" {
  description = "The names of subnets created inside the newly created vNet"
  value       = azurerm_subnet.subnet.*.name
}