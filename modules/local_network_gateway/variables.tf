variable "resource_group_name" {
  type = string  
  description = "Name of resource group to deploy resources in."
}

variable "location" {
  type = string  
  description = "The Azure Region in which to create resource."
}

variable "local_networks" {
  description = "List of local virtual network connections to connect to gateway."
  type = list(
    object({
      name            = string
      gateway_address = string
      address_space   = list(string)
      shared_key      = string
      ipsec_policy    = any
    })
  )
  default = []
}

variable "type" {
  type = string
  default = "IPsec"
  validation {
    condition     = can(regex("IPsec|ExpressRoute|Vnet2Vnet", var.type))
    error_message = "Selecione apenas um dos valores aceitos como conexão: ExpressRoute, IPsec ou Vnet2Vnet."
  }
  description = " O tipo de conexão. As opções válidas são ExpressRoute, IPsec ou Vnet2Vnet"
}

variable "gw_id" {
  type = string  
  description = "O ID do Virtual Network Gateway no qual a conexão será criada."
}

variable "tags" {
  description = "Tags to apply to all resources created."
  type        = map(string)
  default     = {}
}