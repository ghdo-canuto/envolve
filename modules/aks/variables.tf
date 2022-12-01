variable "resource_group_name" {
  type        = string
  description = "Nome do Resource Group"
}

variable "location" {
  type        = string
  description = "A região do datacenter onde seus recursos serão criados."
}

variable "tags" {
  type        = map(any)
  default     = {}
  description = "Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos."
}

variable "subnet_names_aks" {
  type        = string
  default     = ""
  description = "Nome da Subnet do AKS com CNI"
}


variable "resource_group_name_vnet_aks" {
  type        = string
  description = "Nome do Resource Group"
}

variable "vnet_name_aks" {
  type        = string
  default     = ""
  description = "Nome da Rede virtal  do AKS com CNI"
}

variable "cluster_name" {
  type        = string
  default     = "aks"
  description = "Nome do Cluster Kubernetes"
}

variable "dns_prefix" {
  type        = string
  default     = "aks"
  description = "Prefixo DNS do Cluster Kubernetes."
}

variable "sku_tier_aks" {
  type  = string
  default = "Free"
    validation {
    condition     = can(regex("Free|Paid", var.sku_tier_aks))
    error_message = "Selecione apenas um dos valores aceitos como SKU: Free ou Paid."
  }
  description = "O nível de SKU que deve ser usado para este cluster Kubernetes. Os valores possíveis são Free e Paid. Por padãro e Free"
}

variable "k8s_version" {
  type  = string
  default = "1.19.9"
  description = "Versão do Kubernetes. Por opadão é 1.19.9"
}

variable "disable_local_account" {
  type  = bool
  default = true
  description = "Desabilita o acesso ao cluster com usuários locais. Por padrão é True"
}

variable "private_cluster_enabled" {
  type  = bool
  default = false
  description = "Habilita que o cluster teha suas APIs dipostas somente para a rede interna. Por padrão é False"
}

variable "http_application_routing_enabled" {
  type  = bool
  default = true
  description = "Habilitar ou não Roteamento HTTP de Aplicação. Por padão é True"
}

variable "api_server_authorized_ip_ranges" {
  type  = set(string)
  default = null
  description = "Range de IPs que são liberados para gerência dos server nodes."
}

variable "azure_policy_enabled" {
  type  = bool
  default = false
  description = "Habilitar ou não o add-on de Azure Policy para Kubernetes. Por padão é False"
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

variable "agent_count_default" {
  type        = string
  default     = 3
  description = "Número de nodes do Cluster Kubernetes."
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

variable "labels_default" {
  type        = map(any)
  default     = {}
  description = "mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool."
}

variable "node_av_zone" {
  type  = list(number)
  default = []
  description = "Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3]"
}

variable "enable_node_public_ip" {
  type  = bool
  default = false
  description = "Habilita ou não se os nós devem ter um endereço IP público. Default é false."
}

variable "enable_host_encryption" {
  type  = bool
  default = false
  description = "Habilita criptografia no default node pool, Por padão é false"
}

variable "node_vm_disk_size" {
  type  = number
  default = 30
  description = "Tamanho em GB do disco de SO do Node. Por padrão é 30GB"
}

variable "ultra_ssd_enabled" {
  type  = bool
  default = false
  description = "Usado para especificar se o UltraSSD está habilitado no pool de nós padrão. Default é false."
}


variable "admin_linux" {
  type        = string
  default     = "Solonetwork"
  description = "Usuário administrador de sistemas Linux. Por padrão Solonetwork"
}

variable "ssh_public_key" {
  type        = string
  default     = ""
  description = "Chave púclica SSH para acesso ao sistema do Cluster Kubernetes."
}

variable "windows_admin_username" {
  type        = string
  default     = "Solonetwork"
  description = "Usuário administrador de sistemas windows. Por padrão Solonetwork"
}

variable "windows_admin_password" {
  type        = string
  description = "Senha do usuario admin do sitema windows"
}

variable "network_plugin" {
  type        = string
  default     = "kubenet"
  description = "Modelo de plugin de rede utilizado no Cluster Kubernetes. Por padrão kubenet"
}

variable "lb_sku" {
  type        = string
  default     = "standard"
  description = "Modelo de SKU do Load Balancer no cluster Kubernetes. Por padrão standard"
}

variable "network_policy" {
  type        = string
  default     = "azure"
  description = "Politicas de redes do Azure CNI clico ou azure"
}

variable "aks_network_cidr" {
  type  = string
  description = "Endereço CIDR da rede do Kubernetes Service."
}

variable "aks_docker_bridge" {
  type  = string
  description = "Endereço CIDR para ser usado como Docker Bridge."
}

variable "aks_dns_ip" {
  type  = string
  description = "IP do DNS (deve estar dentro do range de IP do `aks_network_cidr`)."
}

variable "role_based_access_control_enabled" {
  type  = bool
  default = false
  nullable  = false
  description = "Habilitar Role Based Access Control."
}

variable "rbac_aad_managed" {
  type  = bool
  default = false
  nullable  = false
  description = " Integração com Azure Active Directory, habilitado, significa que o Azure criará/gerenciará a entidade de Serviço usada para integração."
}


variable "rbac_aad_admin_group_object_ids" {
  type  = any
  default = null
  description = "Object ID dos grupos com acesso administrativo ao cluster Kubernetes."
}

variable "rbac_aad_azure_rbac_enabled" {
  type  = bool
  default = null
  description = "Habilita Role Based Access Control based com Azure AD"
}

variable "rbac_aad_tenant_id" {
  type  = string
  default = null
  description = "ID do tenant usada para o aplicativo do Azure Active Directory. Se isso não for especificado, a ID do tenant da assinatura atual será utilizado."
}

variable "rbac_aad_client_app_id" {
  type  = string
  default = null
  description = "Client ID da aplicação do Azure Active Directory."
}

variable "rbac_aad_server_app_id" {
  type  = string
  default = null
  description = "Server ID do Azure Active Directory Application."
}

variable "rbac_aad_server_app_secret" {
  type  = string
  default = null
  description = "Server Secret do Azure Active Directory Application."
}


variable "is_identity_enabled" {
  type  = bool
  default = false
  description = "Habilitar ou não o uso de identidade gerenciada."
}

variable "aks_service_principal_app_id" {
  type        = string
  default     = ""
  description = "Credencial para conexão com service principal."
}

variable "aks_service_principal_client_secret" {
  type        = string
  default     = "" 
  description = "Credencial para conexão com service principal."
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
  type  = list(number)
  default = []
  description = "Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3]"
}

variable "max_pods" {
  type  = list(number)
  default = [30]
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
  type  = bool
  default = false
  description = "Habilita ou não se os nós devem ter um endereço IP público. Default é false."
}

variable "enable_attach_acr" {
  type        = bool
  default     = false
  description = "Força o attach ou não do Kubernetes Services com o Azure Container Services"
}

variable "log_analytics_workspace_id" {
  type  = string
  description = "ID do Log Analytics."
}

variable "acr_id" {
  type        = string
  default     = ""
  description = "ID do ACR a ser integrado com o AKS."
}