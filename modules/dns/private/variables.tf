variable "resource_group_name" {
  type = string
}

variable "name" {
  description = "Nome da zona a ser criada."
  type        = string
}

variable "vnet_links" {
  type = list(object({
    name                 = string
    virtual_network_name = string
    registration_enabled = bool
    rg_name              = string
  }))
  default = []
  description = "Esses Links habilitam a resolução e o registro de DNS dentro das Redes Virtuais do Azure usando o DNS Privado do Azure."
}

variable "a_records" {
  type = list(object({
    name    = string
    ttl     = number
    records = list(string)
  }))
  default = []
  description = "Permite que você gerencie os Registros A de DNS no DNS Privado do Azure."
}

variable "cname_records" {
  type = list(object({
    name   = string
    ttl    = number
    record = string
  }))
  default = []
  description = "Permite que você gerencie registros CNAME de DNS no DNS privado do Azure."
}

variable "tags" {
  type    = map(any)
  default = {}
}
