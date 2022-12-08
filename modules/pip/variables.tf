variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}

variable "location" {
  type        = string
  description = "A região do datacenter onde seus recursos serão criados."
}

variable "tags" {
  type    = map(any)
  default = {}
}

variable "pip_name" {
  type        = string
  description = "Nome do Public IP."
}

variable "allocation_method_pip" {
  type        = string
  description = "Define o método de alocação para este endereço IP (Static ou Dynamic)."
  validation {
    condition     = can(regex("Static|Dynamic", var.allocation_method_pip))
    error_message = "Selecione apenas um dos valores aceitos como SKU: Static ou Dynamic."
  }
}

variable "sku_pip" {
  type        = string
  description = "Definição da SKU (Basic ou standard)."
  validation {
    condition     = can(regex("Standard|Basic", var.sku_pip))
    error_message = "Selecione apenas um dos valores aceitos : Basic ou standard."
  }
}


variable "ip_version_pip" {
  type        = string
  description = "Definição da SKU (IPv6 ou IPv4)."
  validation {
    condition     = can(regex("IPv4|IPv6", var.ip_version_pip))
    error_message = "Selecione apenas um dos valores aceitos: IPv4 ou IPv6."
  }
}

variable "sku_tier" {
  type        = string
  default     = "Regional"
  description = "O nível de SKU que deve ser usado para o IP público (Regional ou Global)."
  validation {
    condition     = can(regex("Regional|Global", var.sku_tier))
    error_message = "Selecione apenas um dos valores aceitos : Regional ou Global."
  }
}