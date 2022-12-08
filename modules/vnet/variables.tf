variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}

variable "location" {
  type        = string
  description = "A região do datacenter onde seus recursos serão criados."
}

variable "vnet_name" {
  description = "Nome da rede virtual"
  type        = string
}

variable "address_space" {
  type        = list(string)
  description = "Range de ip da rede virtual"
}

variable "dns_servers" {
  description = "Customizar Dns server da rede virtual, por padrão Default (Azure-provided)"
  type        = list(string)
  default     = []
}

variable "subnet_names" {
  description = "Nomes das subnets "
  type        = list(string)
}

variable "subnet_prefixes" {
  description = "Range de ip da subnet"
  type        = list(string)
}

variable "subnet_service_endpoints" {
  description = "A map of subnet name to service endpoints to add to the subnet."
  type        = map(any)
  default     = {}
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  description = "A map of subnet name to enable/disable private link endpoint network policies on the subnet."
  type        = map(bool)
  default     = {}
}

variable "subnet_enforce_private_link_service_network_policies" {
  description = "A map of subnet name to enable/disable private link service network policies on the subnet."
  type        = map(bool)
  default     = {}
}

variable "is_ddos_plan_enabled" {
  type        = bool
  description = "Determina se esta ativado para o plano DDOS. Por padrão e False"
  default = false
}

variable "id_ddos_plan"{
  description = "Id do Plano DDOS"
  type        = string
  default = null
}


variable "nsg_ids" {
  description = "Ids de Network Security Group para atrelar na subnet"
  type        = map(string)
  default     = {}
}

variable "route_tables_ids" {
  description = "Ids de tabelas de rotas para atrelar na subnet"
  type        = map(string)
  default     = {}
}

variable "nat_gateway_ids" {
  type  = map(string)
  default = {}
  description = "Mapa de NAT Gateway ids."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
}

variable "create_vnet_peering" {
  type        = bool
  default     = false
  description = "Criação de peering entre vnets selecione true, por padrão False"
}

variable "virtual_network_remote_name" {
  type        = string
  description = "Nome da rede virtual que deseja fazer o peering" 
  default = ""
}

variable "allow_virtual_network_access" {
  type        = bool
  default     = true
  description = "Controla se as VMs na rede virtual remota podem acessar as VMs na rede virtual local. O padrão é true." 
}

variable "allow_forwarded_traffic" {
  type        = bool
  default     = false
  description = "Controla se o tráfego encaminhado de VMs na rede virtual remota é permitido. O padrão é false." 
}

variable "allow_gateway_transit" {
  type        = bool
  default     = false
  description = "Os controles gatewayLinks podem ser usados ​​no link da rede virtual remota para a rede virtual local. O padrão é false." 
}

variable "use_remote_gateways" {
  type        = bool
  default     = false
  description = "Controla se os gateways remotos podem ser utilizados na rede virtual local. O padrão é false." 
}

variable "virtual_network_remote_rg_name" {
  type        = string
  description = "Nome do grupo de recursos que esta a vnet remota para fazer o peering"
  default = ""
}

