#Global Varibales
variable "resource_group_name" {
  type = string
  description = "Nome do Resource Group"
}

variable "location" {
  type    = string
  description = "A região do datacenter onde seus recursos serão criados."
}

variable "tags" {
  type    = map(any)
  default = {}
}

#Network Variables

variable "resource_group_name_nic" {
  type    = string
  description = "Grupo de recurso para criação do Public IP"
}

variable "dns_servers_to_nic" {
  type        = list(string)
  description = "Dns Server para criação nic."
}

variable "ip_allocation" {
  type    = string
  default = "Dynamic"
  description = "O método de alocação usado para o endereço IP privado. O padão é Dynamic"
}


variable "ip_address" {
  type = string
  description = "O endereço IP estático que deve ser usado."

}

variable "sn_name" {
  type = string
  description = "O Nome da Sub-rede onde esta Interface de Rede deve estar localizada."

}

variable "subnet_vnet_nic" {
  type = string
  description = "O nome da Vnet da subnet."

}

variable "is_public_ip_enabled" {
  type    = bool
  default = false
  description = "Criar um novo Public IP para VM. Por padrão é False"
}

variable "existing_public_ip" {
  type    = bool
  default = false
  description = "Usar um Public IP existente. Por padão e False"
}

variable "public_ip_id" {
  type    = string
  default = null
  description = "ID do Public IP existente, a opção existing_public_ip tem que estar como True. Por padão é null"
}

variable "public_ip_sku" {
  type    = string
  default = "Basic"
  description = "Sku para criação do novo Public IP, a opção is_public_ip_enabled deve ser True. Por padão é basic"
}

variable "allocation_method" {
  type    = string
  default = "Static"
  description = "Metodo de aloação do Public, a opção is_public_ip_enabled deve ser True. Por padão é static"
}

#VM variables
variable "vm_name" {
  type = string
  description = "Especifica o nome da Máquina Virtual."
}

variable "vm_size" {
  type = string
  description = "Especifica o tamanho da Máquina Virtual "
}

variable "sizegbdisk" {
  type = string
  description = "Especifica o tamanho do disco de dados em gigabyte"
}

variable "license_act" {
  type = string
  description = "Especifica o tipo BYOL para esta máquina virtual"
}

variable "admin_win_username" {
  type = string
  description = "Especifica o nome da conta do administrador local."
}

variable "admin_win_pass" {
  type      = string
  sensitive = true
  description = "A senha associada à conta do administrador local."
}

variable "caching" {
  type = string
  default = "ReadOnly"
  description = "specifica os requisitos de cache para o disco do sistema operaciona. Por padrão é ReadOnly"
}

variable "managed_disk_type" {
  type = string
  default = "Standard_LRS"
  description = "Especifica o tipo de disco gerenciado a ser criado."
}

variable "img_publisher" {
  type = string
  description = "Especifica o editor da imagem."
}
variable "img_offer" {
  type = string
  description = "Especifica a oferta da imagem usada para criar a máquina virtual."
}
variable "img_sku" {
  type = string
  description = " Especifica o SKU da imagem usada para criar a máquina virtual."
}
variable "img_version" {
  type = string
  default = "latest"
  description = "Especifica a versão da imagem usada para criar a máquina virtual."
}

variable "enable_automatic_upgrades" {
  type = bool
  default = "false"
  description = "As atualizações automáticas estão habilitadas nesta máquina virtual. Padrões para false."
}

variable "provision_vm_agent" {
  type = bool
  default = true
  description = "O Agente Convidado da Máquina Virtual do Azure deve ser instalado nesta Máquina Virtual. Padrões para True."
}


variable "storage_uri" {
  type = string
  description = "O Blob Endpoint da Conta de Armazenamento que deve conter os arquivos de diagnóstico da máquina virtual."
}

