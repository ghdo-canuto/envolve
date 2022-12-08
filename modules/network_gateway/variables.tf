variable "name" {
  type = string  
  description = "Name of virtual gateway."
}

variable "resource_group_name" {
  type = string  
  description = "Name of resource group to deploy resources in."
}

variable "location" {
  type = string  
  description = "The Azure Region in which to create resource."
}

variable "pip_name_vpn" {
  type = string  
  description = "Nome da PIP."
}

variable "subnet_name_vpn" {
  type = string  
  default = "GatewaySubnet"
  description = "Nome da vnet."
}

variable "resource_group_name_subnet_vpn" {
  type = string  
  description = "Nome do rg da vnet."
}

variable "subnet_vnet_name_vpn" {
  type =  string
  description = "Nome da subnet da vnet. O nome da subnet deve ser GatewaySubnet"
}


variable "enable_bgp" {
  description = "If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false."
  type        = bool
  default     = false
}

variable "active_active" {
  description = "If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false."
  type        = bool
  default     = false
}

variable "sku" {
  type = string
  default = "VpnGw1"
  validation {
    condition     = can(regex("Basic|Standard|HighPerformance|ErGw1AZ|ErGw2AZ|ErGw3AZ|VpnGw1|VpnGw2|VpnGw3|VpnGw4|VpnGw5|VpnGw1AZ|VpnGw2AZ|VpnGw3AZ|VpnGw4AZ|VpnGw5AZ", var.sku))
    error_message = "Selecione apenas um dos valores aceitos como SKU: Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ e VpnGw5AZ."
  }
  description = " Configuração do tamanho e capacidade do gateway de rede virtual. As opções válidas são Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ e VpnGw5AZ"
}

variable "client_configuration" {
  description = "If set it will activate point-to-site configuration."
  type = object({
    address_space = string
    protocols     = list(string)
    certificate   = string
  })
  default = null
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}

variable "type" {
  type = string
  default = "Vpn"
  validation {
    condition     = can(regex("Vpn|ExpressRoute", var.type))
    error_message = "Selecione apenas um dos valores aceitos como SKU: ExpressRoute ou Vpn."
  }
  description = "O tipo do Gateway de Rede Virtual. As opções válidas são ExpressRoute ou Vpn"
}

variable "vpn_type" {
  type = string
  default = "RouteBased"
  validation {
    condition     = can(regex("RouteBased|PolicyBased", var.vpn_type))
    error_message = "Selecione apenas um dos valores aceitos como VPN Type: RouteBased ou PolicyBased."
  }
  description = "O tipo de roteamento do Virtual Network Gateway. As opções válidas são RouteBased ou PolicyBased"
}

variable "private_ip_address_allocation" {
  type = string
  default = "Dynamic"
  validation {
    condition     = can(regex("Static|Dynamic", var.private_ip_address_allocation))
    error_message = "Selecione apenas um dos valores aceitos como: Static ou Dynamic."
  }
  description = " Define como o endereço IP privado da interface virtual dos gateways é atribuído. As opções válidas são Static ou Dynamic"
}