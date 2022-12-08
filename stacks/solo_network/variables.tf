#----------------------
# Global Vars
#----------------------

variable "resource_group_names" {
  type        = list(string)
  description = "O nome do seu Resource Group"
}

variable "tags_rg" {
  type        = list(map(any))
  description = "Lista de mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = [{}]
}

variable "location" {
  type        = string
  description = "A região do datacenter onde seus recursos serão criados."
  default     = "eastus2"
}

variable "global_tags" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "acr_module_enabled" {
  type    = bool
  default = true
}

variable "aks_module_enabled" {
  type    = bool
  default = false
}

variable "vnet-spoke_module_enabled" {
  type    = bool
  default = true
}

variable "vnet-hub_module_enabled" {
  type    = bool
  default = true
}

variable "key_vault_module_enabled" {
  type    = bool
  default = true
}

variable "pip_module_enabled" {
  type    = bool
  default = true
}

variable "pip_vpn_module_enabled" {
  type    = bool
  default = true
}

variable "bastion_module_enabled" {
  type    = bool
  default = true
}

variable "dns_private_module_enabled" {
  type    = bool
  default = true
}

variable "vm-win_module_enabled" {
  type    = bool
  default = true
}

variable "wks_log_module_enabled" {
  type    = bool
  default = true
}

variable "network_watcher_module_enabled" {
  type    = bool
  default = true
}

variable "storage_account_module_enabled" {
  type    = bool
  default = true
}

variable "gatway_vpn_module_enabled" {
  type    = bool
  default = true
}

variable "local_gw_module_enabled" {
  type    = bool
  default = true
}

#----------------------
# ACR Vars
#----------------------

variable "acr_name" {
  type        = string
  description = "Nome do Registro de Container. Precisa ser um nome único porque a partir daqui será gerado o nome do registry."
  default     = ""
}

variable "tags_acr" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "acr_enable_admin" {
  type        = string
  description = "Habilita usuário administrativo no Azure Container Registry"
  default     = ""
}

variable "sku" {
  type        = string
  default     = "Standard"
  description = "SKU do Registro de Container. Aceita os valores `Standard`, `Premium` ou `Basic`."
  validation {
    condition     = can(regex("Standard|Premium|Basic", var.sku))
    error_message = "Selecione apenas um dos valores aceitos como SKU: Basic, Standard, ou Premium."
  }
}

#----------------------
# AKS Vars
#----------------------

variable "tags_aks" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "subnet_names_aks" {
  type        = string
  default     = ""
  description = "Nome da Subnet do AKS com CNI"
}

variable "cluster_name" {
  type        = string
  description = "Nome do Cluster Kubernetes."
  default     = ""
}

variable "sku_tier_aks" {
  type    = string
  default = "Free"
  validation {
    condition     = can(regex("Free|Paid", var.sku_tier_aks))
    error_message = "Selecione apenas um dos valores aceitos como SKU: Free ou Paid."
  }
  description = "O nível de SKU que deve ser usado para este cluster Kubernetes. Os valores possíveis são Free e Paid. Por padãro e Free"
}

variable "k8s_version" {
  type        = string
  default     = "1.19.9"
  description = "Versão do Kubernetes. Por opadão é 1.19.9"
}

variable "disable_local_account" {
  type        = bool
  default     = true
  description = "Desabilita o acesso ao cluster com usuários locais. Por padrão é True"
}

variable "private_cluster_enabled" {
  type        = bool
  default     = false
  description = "Habilita que o cluster teha suas APIs dipostas somente para a rede interna. Por padrão é False"
}

variable "http_application_routing_enabled" {
  type        = bool
  default     = true
  description = "Habilitar ou não Roteamento HTTP de Aplicação. Por padão é True"
}

variable "api_server_authorized_ip_ranges" {
  type        = set(string)
  default     = null
  description = "Range de IPs que são liberados para gerência dos server nodes."
}

variable "azure_policy_enabled" {
  type        = bool
  default     = false
  description = "Habilitar ou não o add-on de Azure Policy para Kubernetes. Por padão é False"
}

variable "dns_prefix" {
  type        = string
  description = "Prefixo DNS do Cluster Kubernetes."
  default     = ""
}

variable "name_pool_default" {
  type        = string
  default     = "agentpool"
  description = "Nome do pool do Cluster Kubernetes."
}

variable "auto_scaling_default" {
  type        = bool
  default     = false
  description = "Ativa o auto scaling dos nopdes linux. por padrão false."
}

variable "vm_size_default" {
  type        = string
  default     = "Standard_D2_v2"
  description = "Size da VM do default node"
}

variable "max_nodes_default" {
  type        = string
  default     = 3
  description = "Número maximo de nodes do Cluster Kubernetes."
}

variable "min_nodes_default" {
  type        = string
  default     = 1
  description = "Número de nodes do Cluster Kubernetes."
}

variable "agent_count_default" {
  type        = string
  default     = 3
  description = "Número de nodes do Cluster Kubernetes."
}

variable "labels_default" {
  type        = map(any)
  default     = {}
  description = "mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool."
}

variable "node_av_zone" {
  type        = list(number)
  default     = []
  description = "Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3]"
}

variable "enable_node_public_ip" {
  type        = bool
  default     = false
  description = "Habilita ou não se os nós devem ter um endereço IP público. Default é false."
}

variable "enable_host_encryption" {
  type        = bool
  default     = false
  description = "Habilita criptografia no default node pool, Por padão é false"
}

variable "node_vm_disk_size" {
  type        = number
  default     = 30
  description = "Tamanho em GB do disco de SO do Node. Por padrão é 30GB"
}

variable "ultra_ssd_enabled" {
  type        = bool
  default     = false
  description = "Usado para especificar se o UltraSSD está habilitado no pool de nós padrão. Default é false."
}

variable "admin_linux" {
  type        = string
  description = "Usuário administrador de sistemas Linux"
  default     = ""
}

variable "ssh_public_key" {
  type        = string
  description = "Chave púclica SSH para acesso ao sistema do Cluster Kubernetes."
  default     = ""
}

variable "windows_admin_username" {
  type        = string
  default     = "Solonetwork"
  description = "Usuário administrador de sistemas windows. Por padrão Solonetwork"
}

variable "windows_admin_password" {
  type        = string
  description = "Senha do usuario admin do sitema windows"
  default     = ""
}

variable "network_plugin" {
  type        = string
  description = "Modelo de plugin de rede utilizado no Cluster Kubernetes."
  default     = ""
}

variable "lb_sku" {
  type        = string
  description = "Modelo de SKU do Load Balancer no cluster Kubernetes."
  default     = ""
}


variable "network_policy" {
  type        = string
  default     = "azure"
  description = "Politicas de redes do Azure CNI clico ou azure"
}

variable "aks_network_cidr" {
  type        = string
  description = "Endereço CIDR da rede do Kubernetes Service."
  default     = ""
}

variable "aks_docker_bridge" {
  type        = string
  description = "Endereço CIDR para ser usado como Docker Bridge."
  default     = ""
}

variable "aks_dns_ip" {
  type        = string
  description = "IP do DNS (deve estar dentro do range de IP do `aks_network_cidr`)."
  default     = ""
}

variable "role_based_access_control_enabled" {
  type        = bool
  default     = false
  nullable    = false
  description = "Habilitar Role Based Access Control."
}

variable "rbac_aad_managed" {
  type        = bool
  default     = false
  nullable    = false
  description = " Integração com Azure Active Directory, habilitado, significa que o Azure criará/gerenciará a entidade de Serviço usada para integração."
}


variable "rbac_aad_admin_group_object_ids" {
  type        = any
  default     = null
  description = "Object ID dos grupos com acesso administrativo ao cluster Kubernetes."
}

variable "rbac_aad_azure_rbac_enabled" {
  type        = bool
  default     = null
  description = "Habilita Role Based Access Control based com Azure AD"
}

variable "rbac_aad_tenant_id" {
  type        = string
  default     = null
  description = "ID do tenant usada para o aplicativo do Azure Active Directory. Se isso não for especificado, a ID do tenant da assinatura atual será utilizado."
}

variable "rbac_aad_client_app_id" {
  type        = string
  default     = null
  description = "Client ID da aplicação do Azure Active Directory."
}

variable "rbac_aad_server_app_id" {
  type        = string
  default     = null
  description = "Server ID do Azure Active Directory Application."
}

variable "rbac_aad_server_app_secret" {
  type        = string
  default     = null
  description = "Server Secret do Azure Active Directory Application."
}


variable "is_identity_enabled" {
  type        = bool
  default     = false
  description = "Habilitar ou não o uso de identidade gerenciada."
}

variable "aks_service_principal_app_id" {
  type        = string
  description = "Credencial para conexão com service principal."
  default     = ""
}

variable "aks_service_principal_client_secret" {
  type        = string
  description = "Credencial para conexão com service principal"
  default     = ""
}

variable "oms_agent_enabled" {
  type        = bool
  default     = true
  description = "Habilita o OMS Agent no Cluster Kubernetes."
}

variable "node_pool" {
  type        = list(string)
  default     = []
  description = "Nome do node pool do Cluster Kubernetes."
}

variable "os_type" {
  type        = list(string)
  description = "Tipo de sistema operacional dos nodes. Aceita os valores `Windows` ou `Linux`."
  default     = []
  validation {
    condition = alltrue([
      for os in var.os_type : can(regex("Windows|Linux", os))
    ])
    error_message = "Selecione apenas um dos valores aceitos como SO: Windows ou Linux."
  }
}


variable "os_disk_size" {
  type        = list(number)
  default     = [30]
  description = "Tamanho em GB do disco de SO do Node. Por padrão é 30GB"
}

variable "zones" {
  type        = list(number)
  default     = []
  description = "Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3]"
}

variable "max_pods" {
  type        = list(number)
  default     = [30]
  description = "Quantidade máxima de Pods por node (dentro do Default node)."
}

variable "enable_auto_scaling" {
  type        = bool
  default     = false
  description = "Ativa o auto scaling dos nopdes linux. por padrão false"
}

variable "agent_count" {
  type        = list(string)
  default     = ["3"]
  description = "Número de nodes windows do Cluster Kubernetes."
}

variable "max_nodes" {
  type        = list(string)
  default     = ["3"]
  description = "Número maximo de nodes windows do Cluster Kubernetes."
}

variable "min_nodes" {
  type        = list(string)
  default     = ["1"]
  description = "Número de nodes windows do Cluster Kubernetes."
}

variable "mode" {
  type        = list(string)
  description = "Este pool de nós deve ser usado para recursos do kube-system ou do user. Por padrão user"
  default     = ["System"]
  validation {
    condition = alltrue([
      for mo in var.mode : can(regex("User|System", mo))
    ])
    error_message = "Selecione apenas um dos valores aceitos como mode: User ou System."
  }
}

variable "vm_size" {
  type        = list(string)
  default     = ["Standard_D2_v2"]
  description = "Size da VM do default node, por padrão Standard_D2_v2"
}

variable "labels" {
  type        = list(map(any))
  default     = [{}]
  description = "mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool."
}

variable "enable_public_ip" {
  type        = bool
  default     = false
  description = "Habilita ou não se os nós devem ter um endereço IP público. Default é false."
}

variable "log_analytics_workspace_id" {
  type        = string
  default     = ""
  description = "ID do Log Analytics."
}

variable "aks_enable_attach_acr" {
  type        = bool
  default     = true
  description = "Força o attach ou não do Kubernetes Services com o Azure Container Services (Obrigatório verificar a documentação adequada)"

}

#----------------------
# Vnet spoke Vars
#----------------------


variable "vnet_name-spoke" {
  description = "Nome da rede virtual"
  type        = string
  default     = ""
}


variable "tags_vnet_spoke" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}


variable "address_space-spoke" {
  type        = list(string)
  description = "Range de ip da rede virtual"
  default     = [""]
}

variable "dns_servers-spoke" {
  description = "Customizar Dns server da rede virtual, por padrão Default (Azure-provided)"
  type        = list(string)
  default     = []
}

variable "subnet_names-spoke" {
  description = "Nomes das subnets "
  type        = list(string)
  default     = [""]
}

variable "subnet_prefixes-spoke" {
  description = "Range de ip da subnet"
  type        = list(string)
  default     = [""]
}

variable "subnet_service_endpoints-spoke" {
  description = "A map of subnet name to service endpoints to add to the subnet."
  type        = map(any)
  default     = {}
}

variable "subnet_enforce_private_link_endpoint_network_policies-spoke" {
  description = "A map of subnet name to enable/disable private link endpoint network policies on the subnet."
  type        = map(bool)
  default     = {}
}

variable "subnet_enforce_private_link_service_network_policies-spoke" {
  description = "A map of subnet name to enable/disable private link service network policies on the subnet."
  type        = map(bool)
  default     = {}
}

variable "is_ddos_plan_enabled-spoke" {
  type        = bool
  description = "Determina se esta ativado para o plano DDOS. Por padrão e False"
  default     = false
}

variable "id_ddos_plan-spoke" {
  description = "Id do Plano DDOS"
  type        = string
  default     = null
}

variable "nsg_ids-spoke" {
  description = "Ids de Network Security Group para atrelar na subnet"
  type        = map(string)
  default     = {}
}

variable "route_tables_ids-spoke" {
  description = "Ids de tabelas de rotas para atrelar na subnet"
  type        = map(string)
  default     = {}
}

variable "nat_gateway_ids-spoke" {
  type        = map(string)
  default     = {}
  description = "Mapa de NAT Gateway ids."
}

variable "peering_network_existing_vnet_name" {
  type        = string
  description = "Nome da rede virtual que deseja fazer o peering"
  default     = ""
}

variable "peering_network_existing_rg_name" {
  type        = string
  description = "Nome do rg da rede virtual que deseja fazer o peering"
  default     = ""
}


#----------------------
# Vnet hub Vars
#----------------------

variable "vnet_name" {
  description = "Nome da rede virtual"
  type        = string
  default     = ""
}

variable "tags_vnet_hub" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "address_space" {
  type        = list(string)
  description = "Range de ip da rede virtual"
  default     = [""]
}

variable "dns_servers" {
  description = "Customizar Dns server da rede virtual, por padrão Default (Azure-provided)"
  type        = list(string)
  default     = []
}

variable "subnet_names" {
  description = "Nomes das subnets "
  type        = list(string)
  default     = [""]
}

variable "subnet_prefixes" {
  description = "Range de ip da subnet"
  type        = list(string)
  default     = [""]
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
  default     = false
}

variable "id_ddos_plan" {
  description = "Id do Plano DDOS"
  type        = string
  default     = null
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
  type        = map(string)
  default     = {}
  description = "Mapa de NAT Gateway ids."
}

variable "create_vnet_peering" {
  type        = bool
  default     = false
  description = "Criação de peering entre vnets selecione true, por padrão False"
}

variable "use_network_existing_to_peering" {
  type        = bool
  default     = false
  description = "Criação de peering entre vnets que ja existem selecione true, por padrão False"
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



#----------------------
# Key Vault Vars
#----------------------

variable "kv_name" {
  type        = string
  description = "Nome do cofre."
  default     = ""
}

variable "tags_key_vault" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "sku_name" {
  type        = string
  description = "Definição da SKU (standard ou premium)."
  default     = "standard"
  validation {
    condition     = can(regex("standard|premium", var.sku_name))
    error_message = "Selecione apenas um dos valores aceitos como SKU: standard ou premium."
  }
}

variable "enabled_for_deployment" {
  type        = bool
  description = "Propriedade que define se máquinas virtuais do Azure têm permissão para recuperar certificados armazenados como segredos no cofre."
  default     = false
}

variable "enabled_for_template_deployment" {
  type        = bool
  description = "Propriedade que define se o Azure Resource Manager tem permissão para recuperar segredos armazenados no cofre."
  default     = false
}

variable "enabled_for_disk_encryption" {
  type        = bool
  description = "Propriedade que define se  o Azure Disk Encryption tem permissão para recuperar segredos armazenados no cofre."
  default     = false
}

variable "enable_rbac_authorization" {
  type        = bool
  description = "Propriedade que define se a autorização será feita via RBAC ao invés de access policies."
  default     = false
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Propriedade que define se a feature Purge Protection será habilitada."
  default     = false
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Quantidade de dias para retenção do 'soft delete'. (90 >= days >= 7)"
  default     = 90
}

variable "network_acls_bypass" {
  type        = string
  description = "Propriedade que define se os serviços do Azure podem realizar operações no cofre. (AzureServices ou None)"
  default     = "None"
}

variable "network_acls_default_action" {
  type        = string
  description = "Ação a ser realizada quando o tráfego de rede de origem for diferente das regras especificadas. (Allow ou Deny)"
  default     = "Deny"
}

variable "network_acls_ip_rules" {
  type        = list(string)
  description = "Um ou mais endereços de IP ou blocos CIDR que devem ter acesso ao cofre."
  default     = []
}

variable "network_acls_virtual_network_subnet_ids" {
  type        = list(string)
  description = "Um ou mais IDs de subnets que devem ter acesso ao cofre."
  default     = []
}



#----------------------
# Key Vault policy Vars
#----------------------

variable "access_policies" {
  type    = list(any)
  default = []
}


#----------------------
# Public IP Vars
#----------------------

variable "pip_name" {
  type        = string
  description = "Nome do Public IP."
  default     = ""
}

variable "tags_public_ip" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "allocation_method_pip" {
  type        = string
  default     = "Static"
  description = "Define o método de alocação para este endereço IP (Static ou Dynamic)."
  validation {
    condition     = can(regex("Static|Dynamic", var.allocation_method_pip))
    error_message = "Selecione apenas um dos valores aceitos como SKU: Static ou Dynamic."
  }
}

variable "sku_pip" {
  type        = string
  default     = "Standard"
  description = "Definição da SKU (Basic ou standard)."
  validation {
    condition     = can(regex("Standard|Basic", var.sku_pip))
    error_message = "Selecione apenas um dos valores aceitos : Basic ou standard."
  }
}


variable "ip_version_pip" {
  type        = string
  description = "Definição da SKU (IPv6 ou IPv4)."
  default     = "IPv4"
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


#----------------------
# Bastion Vars
#----------------------

variable "bastion_name" {
  type        = string
  description = "Especifica o nome do Bastion Host"
  default     = ""
}

variable "tags_bastion" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "sku_bastion_name" {
  type        = string
  description = "O SKU do Bastion Host (Basic ou Standard)."
  default     = "Standard"
  validation {
    condition     = can(regex("Basic|Standard", var.sku_bastion_name))
    error_message = "Selecione apenas um dos valores aceitos como SKU: Basic ou Standard."
  }
}

variable "ip_configuration_name" {
  type        = string
  description = "O nome da configuração de IP"
  default     = ""
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

#----------------------
# DNS Private Vars
#----------------------

variable "dns_private_name" {
  type        = string
  description = "Especifica o nome do DNS privado"
  default     = ""
}

variable "tags_dns_private" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "vnet_links" {
  type = list(object({
    name                 = string
    virtual_network_name = string
    registration_enabled = bool
    rg_name              = string
  }))
  default     = []
  description = "Esses Links habilitam a resolução e o registro de DNS dentro das Redes Virtuais do Azure usando o DNS Privado do Azure."
}

variable "a_records" {
  type = list(object({
    name    = string
    ttl     = number
    records = list(string)
  }))
  default     = []
  description = "Permite que você gerencie os Registros A de DNS no DNS Privado do Azure."
}

variable "cname_records" {
  type = list(object({
    name   = string
    ttl    = number
    record = string
  }))
  default     = []
  description = "Permite que você gerencie registros CNAME de DNS no DNS privado do Azure."
}

#----------------------
# VM Windows Vars
#----------------------

variable "dns_servers_to_nic" {
  type        = list(string)
  description = "Dns Server para criação nic."
  default     = [""]
}

variable "tags_vm-win" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "ip_allocation" {
  type        = string
  default     = "Dynamic"
  description = "O método de alocação usado para o endereço IP privado. O padão é Dynamic"
}

variable "existing_public_ip" {
  type        = bool
  default     = false
  description = "Usar um Public IP existente. Por padão e False"
}

variable "public_ip_id" {
  type        = string
  default     = null
  description = "ID do Public IP existente, a opção existing_public_ip tem que estar como True. Por padão é null"
}

variable "is_public_ip_enabled" {
  type        = bool
  default     = false
  description = "Criar um novo Public IP para VM. Por padrão é False"
}

variable "vm_name" {
  type        = string
  description = "Especifica o nome da Máquina Virtual."
  default     = ""
}


variable "vm_size_win" {
  type        = string
  description = "Especifica o tamanho da Máquina Virtual "
  default     = ""
}

variable "ip_address" {
  type        = string
  description = "O endereço IP estático que deve ser usado."
  default     = ""

}

variable "license_act" {
  type        = string
  description = "Especifica o tipo BYOL para esta máquina virtual"
  default     = ""
}

variable "admin_win_username" {
  type        = string
  description = "Especifica o nome da conta do administrador local."
  default     = ""
}

variable "admin_win_pass" {
  type        = string
  default     = ""
  sensitive   = true
  description = "A senha associada à conta do administrador local."
}

variable "caching" {
  type        = string
  default     = "ReadOnly"
  description = "specifica os requisitos de cache para o disco do sistema operaciona. Por padrão é ReadOnly"
}

variable "sizegbdisk" {
  type        = string
  description = "Especifica o tamanho do disco de dados em gigabyte"
  default     = ""
}

variable "managed_disk_type" {
  type        = string
  default     = "Standard_LRS"
  description = "Especifica o tipo de disco gerenciado a ser criado."
}

variable "img_publisher" {
  type        = string
  description = "Especifica o editor da imagem."
  default     = ""
}
variable "img_offer" {
  type        = string
  description = "Especifica a oferta da imagem usada para criar a máquina virtual."
  default     = ""
}
variable "img_sku" {
  type        = string
  description = " Especifica o SKU da imagem usada para criar a máquina virtual."
  default     = ""
}
variable "img_version" {
  type        = string
  default     = "latest"
  description = "Especifica a versão da imagem usada para criar a máquina virtual."
}

variable "enable_automatic_upgrades" {
  type        = bool
  default     = "false"
  description = "As atualizações automáticas estão habilitadas nesta máquina virtual. Padrões para false."
}

variable "provision_vm_agent" {
  type        = bool
  default     = true
  description = "O Agente Convidado da Máquina Virtual do Azure deve ser instalado nesta Máquina Virtual. Padrões para True."
}

variable "storage_uri" {
  type        = string
  default     = ""
  description = "O Blob Endpoint da Conta de Armazenamento que deve conter os arquivos de diagnóstico da máquina virtual."
}

variable "public_ip_sku" {
  type        = string
  default     = "Basic"
  description = "Sku para criação do novo Public IP, a opção is_public_ip_enabled deve ser True. Por padão é basic"
}

variable "allocation_method" {
  type        = string
  default     = "Static"
  description = "Metodo de aloação do Public, a opção is_public_ip_enabled deve ser True. Por padão é static"
}


#----------------------
# Log analytcs Vars
#----------------------
variable "tags_log_analytcs" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "log_analytics_workspace_name" {
  type        = string
  default     = ""
  description = "Nome do workspace do Log Analytics. É obrigatório caso `enable_log_analytics_workspace` for marcado como `true`"
}

variable "log_analytics_workspace_sku" {
  type        = string
  default     = "PerGB2018"
  description = "Define a SKU utilizada pelo Log Analytics Workspace."
}

variable "log_retention_in_days" {
  type        = number
  default     = 30
  description = "Define o número de dias em que os logs serão armazenados no Workspace."
}

#----------------------
# Network watcher Vars
#----------------------

variable "network_watcher_name" {
  description = "Nome do network watcher "
  type        = string
  default     = ""
}

variable "tags_network_watcher" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

#----------------------
# Storage accounts Vars
#----------------------

variable "storage_account_name" {
  type        = string
  description = "Nome da Storage Account."
  default     = ""
}

variable "tier" {
  type    = string
  default = "Standard"
  validation {
    condition     = can(regex("Premium|Standard", var.tier))
    error_message = "Selecione apenas um dos valores aceitos como SKU: Premium ou Standard."
  }
  description = "Que tipo de performance espera-se. Aceita os valores `Standard` e `Premium`."
}

variable "kind" {
  type        = string
  default     = "StorageV2"
  description = "Qual SKU do do blob storage é usado."
}

variable "replication" {
  type        = string
  default     = "GRS"
  description = "Que tipo de replicação será usada pela Storage Account."
}

variable "tags_storage" {
  type        = map(any)
  default     = {}
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
}

variable "static_website_enabled" {
  type        = bool
  default     = false
  description = "Especifica se o armazenamento para websites estáticos será habilitado."
}

variable "static_website" {
  type        = map(any)
  default     = {}
  description = "Obrigatório caso `static_website_enabled` seja `true`. Bloco que define caminho para os arquivos do website (ver exemplo de código)."
}

variable "storacc_containers" {
  type        = map(any)
  default     = {}
  description = "Utilizá-lo quando houver a necessidade de criar containers dentro da storage account. \nNo bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`."
}

variable "enable_secure_transfer" {
  type        = bool
  default     = true
  description = "Força ou não a utilização de transferência de dados exclusivamente por HTTPS."
}

variable "storacc_shares" {
  type        = map(any)
  default     = {}
  description = "Utilizá-lo quando houver a necessidade de criar file shares dentro da storage account. \nNo bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`."
}

#----------------------
# Network gateway Vars
#----------------------

variable "gateway_name" {
  type        = string
  description = "Name of virtual gateway."
  default     = ""
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

variable "sku_gw" {
  type    = string
  default = "VpnGw1"
  validation {
    condition     = can(regex("Basic|Standard|HighPerformance|ErGw1AZ|ErGw2AZ|ErGw3AZ|VpnGw1|VpnGw2|VpnGw3|VpnGw4|VpnGw5|VpnGw1AZ|VpnGw2AZ|VpnGw3AZ|VpnGw4AZ|VpnGw5AZ", var.sku_gw))
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

variable "type_gw" {
  type    = string
  default = "Vpn"
  validation {
    condition     = can(regex("Vpn|ExpressRoute", var.type_gw))
    error_message = "Selecione apenas um dos valores aceitos como SKU: ExpressRoute ou Vpn."
  }
  description = "O tipo do Gateway de Rede Virtual. As opções válidas são ExpressRoute ou Vpn"
}

variable "vpn_type_gw" {
  type    = string
  default = "RouteBased"
  validation {
    condition     = can(regex("RouteBased|PolicyBased", var.vpn_type_gw))
    error_message = "Selecione apenas um dos valores aceitos como VPN Type: RouteBased ou PolicyBased."
  }
  description = "O tipo de roteamento do Virtual Network Gateway. As opções válidas são RouteBased ou PolicyBased"
}

variable "private_ip_address_allocation" {
  type    = string
  default = "Dynamic"
  validation {
    condition     = can(regex("Static|Dynamic", var.private_ip_address_allocation))
    error_message = "Selecione apenas um dos valores aceitos como: Static ou Dynamic."
  }
  description = " Define como o endereço IP privado da interface virtual dos gateways é atribuído. As opções válidas são Static ou Dynamic"
}

variable "tags_gw" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}



#----------------------
# Public IP Gateway Vars
#----------------------

variable "pip_name_gw" {
  type        = string
  description = "Nome do Public IP."
  default     = ""
}

variable "tags_public_ip_gw" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}

variable "allocation_method_pip_gw" {
  type        = string
  description = "Define o método de alocação para este endereço IP (Static ou Dynamic)."
  default     = "Static"
  validation {
    condition     = can(regex("Static|Dynamic", var.allocation_method_pip_gw))
    error_message = "Selecione apenas um dos valores aceitos como SKU: Static ou Dynamic."
  }
}

variable "sku_pip_gw" {
  type        = string
  description = "Definição da SKU (Basic ou standard)."
  default     = "Standard"
  validation {
    condition     = can(regex("Standard|Basic", var.sku_pip_gw))
    error_message = "Selecione apenas um dos valores aceitos : Basic ou standard."
  }
}


variable "ip_version_pip_gw" {
  type        = string
  description = "Definição da SKU (IPv6 ou IPv4)."
  default     = "IPv4"
  validation {
    condition     = can(regex("IPv4|IPv6", var.ip_version_pip_gw))
    error_message = "Selecione apenas um dos valores aceitos: IPv4 ou IPv6."
  }
}


variable "sku_tier_gw" {
  type        = string
  default     = "Regional"
  description = "O nível de SKU que deve ser usado para o IP público (Regional ou Global)."
  validation {
    condition     = can(regex("Regional|Global", var.sku_tier_gw))
    error_message = "Selecione apenas um dos valores aceitos : Regional ou Global."
  }
}

#----------------------
# Local network Gateway Vars
#----------------------

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

variable "type_local_gw" {
  type    = string
  default = "IPsec"
  validation {
    condition     = can(regex("IPsec|ExpressRoute|Vnet2Vnet", var.type_local_gw))
    error_message = "Selecione apenas um dos valores aceitos como conexão: ExpressRoute, IPsec ou Vnet2Vnet."
  }
  description = " O tipo de conexão. As opções válidas são ExpressRoute, IPsec ou Vnet2Vnet"
}

variable "tags_local_gw" {
  type        = map(any)
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
  default     = {}
}