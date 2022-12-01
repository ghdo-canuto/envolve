variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}

variable "network_watcher_name" {
  description = "Nome do network watcher "
  type        = string
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
}