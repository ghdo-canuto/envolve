variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}

variable "key_vault_name" {
  type        = string
  description = "Nome do cofre."
}

variable "access_policies" {
  type    = list(any)
  default = []
}
