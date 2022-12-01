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

variable "subnet_name_bastion" {
  type        = string
  description = " Referência a uma sub-rede na qual este Bastion Host foi criado"
}

variable "subnet_vnet_bastion" {
  type        = string
  description = " Referência a uma Vnet para o  Bastion Host foi criado"
}

variable "subnet_rg_bastion" {
  type        = string
  description = " Referência a uma RG da Vnet para o Bastion Bastion Host foi criado"
}

variable "pip_name_bastion" {
  type        = string
  description = "Referência a um endereço IP público para associar a este Bastion Host"
}

variable "bastion_name" {
  type        = string
  description = "Especifica o nome do Bastion Host"
}

variable "sku_bastion_name" {
  type        = string
  description = "O SKU do Bastion Host (Basic ou Standard)."
  validation {
    condition     = can(regex("Basic|Standard", var.sku_bastion_name))
    error_message = "Selecione apenas um dos valores aceitos como SKU: Basic ou Standard."
  }
}

variable "ip_configuration_name" {
  type        = string
  description = "O nome da configuração de IP"
}

variable "copy_paste_enabled" {
  type        = bool
  default     = true
  description = "O recurso Copiar/Colar está habilitado para o Bastion. Padrões para True"
}

variable "file_copy_enabled" {
  type        = bool
  default     = false
  description = "O recurso de cópia de arquivo está ativado para o Bastion. Padrões para False"
}

variable "scale_units" {
  type        = number
  default     = 2
  description = "O número de unidades de escala com as quais provisionar o Bastion. Por padrão e 2"
  validation {
    condition     = can(regex("^[1-9]$|^[1-9][0-9]$|^(50)$", var.scale_units))
    error_message = "Selecione apenas um dos valores aceitos: 2 ate 50."
  }
}


variable "shareable_link_enabled" {
  type        = bool
  default     = false
  description = "O recurso Link compartilhável está habilitado para o Bastion Host. Padrões para False"
}

variable "tunneling_enabled" {
  type        = bool
  default     = false
  description = "O recurso Tunneling está habilitado para o Bastion Host. Padrões para False"
}

variable "ip_connect_enabled" {
  type        = bool
  default     = false
  description = "O recurso IP Connect está ativado para o Bastion. Padrões para False"
}



