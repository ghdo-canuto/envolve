## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.29.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.27.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.13.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acr"></a> [acr](#module\_acr) | ../../modules/acr | n/a |
| <a name="module_aks"></a> [aks](#module\_aks) | ../../modules/aks | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ../../modules/bastion | n/a |
| <a name="module_dns_private"></a> [dns\_private](#module\_dns\_private) | ../../modules/dns/private | n/a |
| <a name="module_gatway_vpn"></a> [gatway\_vpn](#module\_gatway\_vpn) | ../../modules/network_gateway | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../../modules/key_vault | n/a |
| <a name="module_key_vault_access_policy"></a> [key\_vault\_access\_policy](#module\_key\_vault\_access\_policy) | ../../modules/access_policy | n/a |
| <a name="module_local_gw"></a> [local\_gw](#module\_local\_gw) | ../../modules/local_network_gateway | n/a |
| <a name="module_network_watcher"></a> [network\_watcher](#module\_network\_watcher) | ../../modules/network_watcher | n/a |
| <a name="module_pip"></a> [pip](#module\_pip) | ../../modules/pip | n/a |
| <a name="module_pip_vpn"></a> [pip\_vpn](#module\_pip\_vpn) | ../../modules/pip | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage | n/a |
| <a name="module_vm-win"></a> [vm-win](#module\_vm-win) | ../../modules/vm-windows | n/a |
| <a name="module_vnet-hub"></a> [vnet-hub](#module\_vnet-hub) | ../../modules/vnet | n/a |
| <a name="module_vnet-spoke"></a> [vnet-spoke](#module\_vnet-spoke) | ../../modules/vnet | n/a |
| <a name="module_wks_log"></a> [wks\_log](#module\_wks\_log) | ../../modules/log_analytics | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | Permite que você gerencie os Registros A de DNS no DNS Privado do Azure. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | n/a | `list(any)` | `[]` | no |
| <a name="input_acr_enable_admin"></a> [acr\_enable\_admin](#input\_acr\_enable\_admin) | Habilita usuário administrativo no Azure Container Registry | `string` | n/a | yes |
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | Nome do Registro de Container. Precisa ser um nome único porque a partir daqui será gerado o nome do registry. | `string` | n/a | yes |
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_address_space-spoke"></a> [address\_space-spoke](#input\_address\_space-spoke) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_admin_linux"></a> [admin\_linux](#input\_admin\_linux) | Usuário administrador de sistemas Linux | `string` | n/a | yes |
| <a name="input_admin_win_pass"></a> [admin\_win\_pass](#input\_admin\_win\_pass) | A senha associada à conta do administrador local. | `string` | n/a | yes |
| <a name="input_admin_win_username"></a> [admin\_win\_username](#input\_admin\_win\_username) | Especifica o nome da conta do administrador local. | `string` | n/a | yes |
| <a name="input_agent_count"></a> [agent\_count](#input\_agent\_count) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_agent_count_default"></a> [agent\_count\_default](#input\_agent\_count\_default) | Número de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_aks_dns_ip"></a> [aks\_dns\_ip](#input\_aks\_dns\_ip) | IP do DNS (deve estar dentro do range de IP do `aks_network_cidr`). | `string` | n/a | yes |
| <a name="input_aks_docker_bridge"></a> [aks\_docker\_bridge](#input\_aks\_docker\_bridge) | Endereço CIDR para ser usado como Docker Bridge. | `string` | n/a | yes |
| <a name="input_aks_enable_attach_acr"></a> [aks\_enable\_attach\_acr](#input\_aks\_enable\_attach\_acr) | Força o attach ou não do Kubernetes Services com o Azure Container Services (Obrigatório verificar a documentação adequada) | `bool` | n/a | yes |
| <a name="input_aks_network_cidr"></a> [aks\_network\_cidr](#input\_aks\_network\_cidr) | Endereço CIDR da rede do Kubernetes Service. | `string` | n/a | yes |
| <a name="input_aks_service_principal_app_id"></a> [aks\_service\_principal\_app\_id](#input\_aks\_service\_principal\_app\_id) | Credencial para conexão com service principal. | `string` | n/a | yes |
| <a name="input_aks_service_principal_client_secret"></a> [aks\_service\_principal\_client\_secret](#input\_aks\_service\_principal\_client\_secret) | Credencial para conexão com service principal | `string` | n/a | yes |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Metodo de aloação do Public, a opção is\_public\_ip\_enabled deve ser True. Por padão é static | `string` | `"Static"` | no |
| <a name="input_allocation_method_pip"></a> [allocation\_method\_pip](#input\_allocation\_method\_pip) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allocation_method_pip_gw"></a> [allocation\_method\_pip\_gw](#input\_allocation\_method\_pip\_gw) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allow_forwarded_traffic"></a> [allow\_forwarded\_traffic](#input\_allow\_forwarded\_traffic) | Controla se o tráfego encaminhado de VMs na rede virtual remota é permitido. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_gateway_transit"></a> [allow\_gateway\_transit](#input\_allow\_gateway\_transit) | Os controles gatewayLinks podem ser usados ​​no link da rede virtual remota para a rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_virtual_network_access"></a> [allow\_virtual\_network\_access](#input\_allow\_virtual\_network\_access) | Controla se as VMs na rede virtual remota podem acessar as VMs na rede virtual local. O padrão é true. | `bool` | `true` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | Range de IPs que são liberados para gerência dos server nodes. | `set(string)` | `null` | no |
| <a name="input_auto_scaling_default"></a> [auto\_scaling\_default](#input\_auto\_scaling\_default) | Ativa o auto scaling dos nopdes linux. por padrão false. | `bool` | `false` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Habilitar ou não o add-on de Azure Policy para Kubernetes. Por padão é False | `bool` | `false` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Especifica o nome do Bastion Host | `string` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | specifica os requisitos de cache para o disco do sistema operaciona. Por padrão é ReadOnly | `string` | `"ReadOnly"` | no |
| <a name="input_client_configuration"></a> [client\_configuration](#input\_client\_configuration) | If set it will activate point-to-site configuration. | <pre>object({<br>    address_space = string<br>    protocols     = list(string)<br>    certificate   = string<br>  })</pre> | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | Permite que você gerencie registros CNAME de DNS no DNS privado do Azure. | <pre>list(object({<br>    name   = string<br>    ttl    = number<br>    record = string<br>  }))</pre> | `[]` | no |
| <a name="input_copy_paste_enabled"></a> [copy\_paste\_enabled](#input\_copy\_paste\_enabled) | O recurso Copiar/Colar está habilitado para o Bastion. Padrões para True | `bool` | `true` | no |
| <a name="input_create_vnet_peering"></a> [create\_vnet\_peering](#input\_create\_vnet\_peering) | Criação de peering entre vnets selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_disable_local_account"></a> [disable\_local\_account](#input\_disable\_local\_account) | Desabilita o acesso ao cluster com usuários locais. Por padrão é True | `bool` | `true` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Prefixo DNS do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_dns_private_name"></a> [dns\_private\_name](#input\_dns\_private\_name) | Especifica o nome do DNS privado | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers-spoke"></a> [dns\_servers-spoke](#input\_dns\_servers-spoke) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers_to_nic"></a> [dns\_servers\_to\_nic](#input\_dns\_servers\_to\_nic) | Dns Server para criação nic. | `list(string)` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Ativa o auto scaling dos nopdes linux. por padrão false | `bool` | `false` | no |
| <a name="input_enable_automatic_upgrades"></a> [enable\_automatic\_upgrades](#input\_enable\_automatic\_upgrades) | As atualizações automáticas estão habilitadas nesta máquina virtual. Padrões para false. | `bool` | `"false"` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | Habilita criptografia no default node pool, Por padão é false | `bool` | `false` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Propriedade que define se a autorização será feita via RBAC ao invés de access policies. | `bool` | `false` | no |
| <a name="input_enable_secure_transfer"></a> [enable\_secure\_transfer](#input\_enable\_secure\_transfer) | Força ou não a utilização de transferência de dados exclusivamente por HTTPS. | `bool` | `true` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Propriedade que define se máquinas virtuais do Azure têm permissão para recuperar certificados armazenados como segredos no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Propriedade que define se  o Azure Disk Encryption tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Propriedade que define se o Azure Resource Manager tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_existing_public_ip"></a> [existing\_public\_ip](#input\_existing\_public\_ip) | Usar um Public IP existente. Por padão e False | `bool` | `false` | no |
| <a name="input_file_copy_enabled"></a> [file\_copy\_enabled](#input\_file\_copy\_enabled) | O recurso de cópia de arquivo está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_gateway_name"></a> [gateway\_name](#input\_gateway\_name) | Name of virtual gateway. | `string` | n/a | yes |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Habilitar ou não Roteamento HTTP de Aplicação. Por padão é True | `bool` | `true` | no |
| <a name="input_id_ddos_plan"></a> [id\_ddos\_plan](#input\_id\_ddos\_plan) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_id_ddos_plan-spoke"></a> [id\_ddos\_plan-spoke](#input\_id\_ddos\_plan-spoke) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_img_offer"></a> [img\_offer](#input\_img\_offer) | Especifica a oferta da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_publisher"></a> [img\_publisher](#input\_img\_publisher) | Especifica o editor da imagem. | `string` | n/a | yes |
| <a name="input_img_sku"></a> [img\_sku](#input\_img\_sku) | Especifica o SKU da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_version"></a> [img\_version](#input\_img\_version) | Especifica a versão da imagem usada para criar a máquina virtual. | `string` | `"latest"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | O endereço IP estático que deve ser usado. | `string` | n/a | yes |
| <a name="input_ip_allocation"></a> [ip\_allocation](#input\_ip\_allocation) | O método de alocação usado para o endereço IP privado. O padão é Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | O nome da configuração de IP | `string` | n/a | yes |
| <a name="input_ip_connect_enabled"></a> [ip\_connect\_enabled](#input\_ip\_connect\_enabled) | O recurso IP Connect está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_ip_version_pip"></a> [ip\_version\_pip](#input\_ip\_version\_pip) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_ip_version_pip_gw"></a> [ip\_version\_pip\_gw](#input\_ip\_version\_pip\_gw) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_is_ddos_plan_enabled"></a> [is\_ddos\_plan\_enabled](#input\_is\_ddos\_plan\_enabled) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_ddos_plan_enabled-spoke"></a> [is\_ddos\_plan\_enabled-spoke](#input\_is\_ddos\_plan\_enabled-spoke) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_identity_enabled"></a> [is\_identity\_enabled](#input\_is\_identity\_enabled) | Habilitar ou não o uso de identidade gerenciada. | `bool` | `false` | no |
| <a name="input_is_public_ip_enabled"></a> [is\_public\_ip\_enabled](#input\_is\_public\_ip\_enabled) | Criar um novo Public IP para VM. Por padrão é False | `bool` | `false` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Versão do Kubernetes. Por opadão é 1.19.9 | `string` | `"1.19.9"` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Qual SKU do do blob storage é usado. | `string` | `"StorageV2"` | no |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | Nome do cofre. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_labels_default"></a> [labels\_default](#input\_labels\_default) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `map(any)` | `{}` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | Modelo de SKU do Load Balancer no cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_license_act"></a> [license\_act](#input\_license\_act) | Especifica o tipo BYOL para esta máquina virtual | `string` | n/a | yes |
| <a name="input_local_networks"></a> [local\_networks](#input\_local\_networks) | List of local virtual network connections to connect to gateway. | <pre>list(<br>    object({<br>      name            = string<br>      gateway_address = string<br>      address_space   = list(string)<br>      shared_key      = string<br>      ipsec_policy    = any<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | A região do datacenter onde seus recursos serão criados. | `string` | `"eastus2"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID do Log Analytics. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Nome do workspace do Log Analytics. É obrigatório caso `enable_log_analytics_workspace` for marcado como `true` | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Define a SKU utilizada pelo Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Define o número de dias em que os logs serão armazenados no Workspace. | `number` | `30` | no |
| <a name="input_managed_disk_type"></a> [managed\_disk\_type](#input\_managed\_disk\_type) | Especifica o tipo de disco gerenciado a ser criado. | `string` | `"Standard_LRS"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Número maximo de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_max_nodes_default"></a> [max\_nodes\_default](#input\_max\_nodes\_default) | Número maximo de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | Quantidade máxima de Pods por node (dentro do Default node). | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "1"<br>]</pre> | no |
| <a name="input_min_nodes_default"></a> [min\_nodes\_default](#input\_min\_nodes\_default) | Número de nodes do Cluster Kubernetes. | `string` | `1` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Este pool de nós deve ser usado para recursos do kube-system ou do user. Por padrão user | `list(string)` | n/a | yes |
| <a name="input_name_pool_default"></a> [name\_pool\_default](#input\_name\_pool\_default) | Nome do pool do Cluster Kubernetes. | `string` | `"agentpool"` | no |
| <a name="input_nat_gateway_ids"></a> [nat\_gateway\_ids](#input\_nat\_gateway\_ids) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_nat_gateway_ids-spoke"></a> [nat\_gateway\_ids-spoke](#input\_nat\_gateway\_ids-spoke) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_network_acls_bypass"></a> [network\_acls\_bypass](#input\_network\_acls\_bypass) | Propriedade que define se os serviços do Azure podem realizar operações no cofre. (AzureServices ou None) | `string` | `"None"` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | Ação a ser realizada quando o tráfego de rede de origem for diferente das regras especificadas. (Allow ou Deny) | `string` | `"Deny"` | no |
| <a name="input_network_acls_ip_rules"></a> [network\_acls\_ip\_rules](#input\_network\_acls\_ip\_rules) | Um ou mais endereços de IP ou blocos CIDR que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_acls_virtual_network_subnet_ids"></a> [network\_acls\_virtual\_network\_subnet\_ids](#input\_network\_acls\_virtual\_network\_subnet\_ids) | Um ou mais IDs de subnets que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Modelo de plugin de rede utilizado no Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Politicas de redes do Azure CNI clico ou azure | `string` | `"azure"` | no |
| <a name="input_network_watcher_name"></a> [network\_watcher\_name](#input\_network\_watcher\_name) | Nome do network watcher | `string` | n/a | yes |
| <a name="input_node_av_zone"></a> [node\_av\_zone](#input\_node\_av\_zone) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |
| <a name="input_node_pool"></a> [node\_pool](#input\_node\_pool) | Nome do node pool do Cluster Kubernetes. | `list(string)` | `[]` | no |
| <a name="input_node_vm_disk_size"></a> [node\_vm\_disk\_size](#input\_node\_vm\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `number` | `30` | no |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_nsg_ids-spoke"></a> [nsg\_ids-spoke](#input\_nsg\_ids-spoke) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_oms_agent_enabled"></a> [oms\_agent\_enabled](#input\_oms\_agent\_enabled) | Habilita o OMS Agent no Cluster Kubernetes. | `bool` | `true` | no |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Tipo de sistema operacional dos nodes. Aceita os valores `Windows` ou `Linux`. | `list(string)` | n/a | yes |
| <a name="input_pip_name"></a> [pip\_name](#input\_pip\_name) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_pip_name_gw"></a> [pip\_name\_gw](#input\_pip\_name\_gw) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Habilita que o cluster teha suas APIs dipostas somente para a rede interna. Por padrão é False | `bool` | `false` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Define como o endereço IP privado da interface virtual dos gateways é atribuído. As opções válidas são Static ou Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | O Agente Convidado da Máquina Virtual do Azure deve ser instalado nesta Máquina Virtual. Padrões para True. | `bool` | `true` | no |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | ID do Public IP existente, a opção existing\_public\_ip tem que estar como True. Por padão é null | `string` | `null` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Sku para criação do novo Public IP, a opção is\_public\_ip\_enabled deve ser True. Por padão é basic | `string` | `"Basic"` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Propriedade que define se a feature Purge Protection será habilitada. | `bool` | `false` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | Object ID dos grupos com acesso administrativo ao cluster Kubernetes. | `any` | `null` | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | Habilita Role Based Access Control based com Azure AD | `bool` | `null` | no |
| <a name="input_rbac_aad_client_app_id"></a> [rbac\_aad\_client\_app\_id](#input\_rbac\_aad\_client\_app\_id) | Client ID da aplicação do Azure Active Directory. | `string` | `null` | no |
| <a name="input_rbac_aad_managed"></a> [rbac\_aad\_managed](#input\_rbac\_aad\_managed) | Integração com Azure Active Directory, habilitado, significa que o Azure criará/gerenciará a entidade de Serviço usada para integração. | `bool` | `false` | no |
| <a name="input_rbac_aad_server_app_id"></a> [rbac\_aad\_server\_app\_id](#input\_rbac\_aad\_server\_app\_id) | Server ID do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_server_app_secret"></a> [rbac\_aad\_server\_app\_secret](#input\_rbac\_aad\_server\_app\_secret) | Server Secret do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_tenant_id"></a> [rbac\_aad\_tenant\_id](#input\_rbac\_aad\_tenant\_id) | ID do tenant usada para o aplicativo do Azure Active Directory. Se isso não for especificado, a ID do tenant da assinatura atual será utilizado. | `string` | `null` | no |
| <a name="input_replication"></a> [replication](#input\_replication) | Que tipo de replicação será usada pela Storage Account. | `string` | `"GRS"` | no |
| <a name="input_resource_group_names"></a> [resource\_group\_names](#input\_resource\_group\_names) | O nome do seu Resource Group | `list(string)` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Habilitar Role Based Access Control. | `bool` | `false` | no |
| <a name="input_route_tables_ids"></a> [route\_tables\_ids](#input\_route\_tables\_ids) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_route_tables_ids-spoke"></a> [route\_tables\_ids-spoke](#input\_route\_tables\_ids-spoke) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_scale_units"></a> [scale\_units](#input\_scale\_units) | O número de unidades de escala com as quais provisionar o Bastion. Por padrão e 2 | `number` | `2` | no |
| <a name="input_shareable_link_enabled"></a> [shareable\_link\_enabled](#input\_shareable\_link\_enabled) | O recurso Link compartilhável está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_sizegbdisk"></a> [sizegbdisk](#input\_sizegbdisk) | Especifica o tamanho do disco de dados em gigabyte | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU do Registro de Container. Aceita os valores `Standard`, `Premium` ou `Basic`. | `string` | `"Standard"` | no |
| <a name="input_sku_bastion_name"></a> [sku\_bastion\_name](#input\_sku\_bastion\_name) | O SKU do Bastion Host (Basic ou Standard). | `string` | n/a | yes |
| <a name="input_sku_gw"></a> [sku\_gw](#input\_sku\_gw) | Configuração do tamanho e capacidade do gateway de rede virtual. As opções válidas são Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ e VpnGw5AZ | `string` | `"VpnGw1"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Definição da SKU (standard ou premium). | `string` | n/a | yes |
| <a name="input_sku_pip"></a> [sku\_pip](#input\_sku\_pip) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_pip_gw"></a> [sku\_pip\_gw](#input\_sku\_pip\_gw) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_sku_tier_aks"></a> [sku\_tier\_aks](#input\_sku\_tier\_aks) | O nível de SKU que deve ser usado para este cluster Kubernetes. Os valores possíveis são Free e Paid. Por padãro e Free | `string` | `"Free"` | no |
| <a name="input_sku_tier_gw"></a> [sku\_tier\_gw](#input\_sku\_tier\_gw) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Quantidade de dias para retenção do 'soft delete'. (90 >= days >= 7) | `number` | `90` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Chave púclica SSH para acesso ao sistema do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | Obrigatório caso `static_website_enabled` seja `true`. Bloco que define caminho para os arquivos do website (ver exemplo de código). | `map(any)` | `{}` | no |
| <a name="input_static_website_enabled"></a> [static\_website\_enabled](#input\_static\_website\_enabled) | Especifica se o armazenamento para websites estáticos será habilitado. | `bool` | `false` | no |
| <a name="input_storacc_containers"></a> [storacc\_containers](#input\_storacc\_containers) | Utilizá-lo quando houver a necessidade de criar containers dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storacc_shares"></a> [storacc\_shares](#input\_storacc\_shares) | Utilizá-lo quando houver a necessidade de criar file shares dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Nome da Storage Account. | `string` | n/a | yes |
| <a name="input_storage_uri"></a> [storage\_uri](#input\_storage\_uri) | O Blob Endpoint da Conta de Armazenamento que deve conter os arquivos de diagnóstico da máquina virtual. | `string` | n/a | yes |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies"></a> [subnet\_enforce\_private\_link\_service\_network\_policies](#input\_subnet\_enforce\_private\_link\_service\_network\_policies) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_service\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_service\_network\_policies-spoke) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names-spoke"></a> [subnet\_names-spoke](#input\_subnet\_names-spoke) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names_aks"></a> [subnet\_names\_aks](#input\_subnet\_names\_aks) | Nome da Subnet do AKS com CNI | `string` | `""` | no |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes-spoke"></a> [subnet\_prefixes-spoke](#input\_subnet\_prefixes-spoke) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_subnet_service_endpoints-spoke"></a> [subnet\_service\_endpoints-spoke](#input\_subnet\_service\_endpoints-spoke) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_tags_acr"></a> [tags\_acr](#input\_tags\_acr) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_aks"></a> [tags\_aks](#input\_tags\_aks) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_bastion"></a> [tags\_bastion](#input\_tags\_bastion) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_dns_private"></a> [tags\_dns\_private](#input\_tags\_dns\_private) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_gw"></a> [tags\_gw](#input\_tags\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_key_vault"></a> [tags\_key\_vault](#input\_tags\_key\_vault) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_local_gw"></a> [tags\_local\_gw](#input\_tags\_local\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_log_analytcs"></a> [tags\_log\_analytcs](#input\_tags\_log\_analytcs) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_network_watcher"></a> [tags\_network\_watcher](#input\_tags\_network\_watcher) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip"></a> [tags\_public\_ip](#input\_tags\_public\_ip) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip_gw"></a> [tags\_public\_ip\_gw](#input\_tags\_public\_ip\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_rg"></a> [tags\_rg](#input\_tags\_rg) | Lista de mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_tags_storage"></a> [tags\_storage](#input\_tags\_storage) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vm-win"></a> [tags\_vm-win](#input\_tags\_vm-win) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_hub"></a> [tags\_vnet\_hub](#input\_tags\_vnet\_hub) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_spoke"></a> [tags\_vnet\_spoke](#input\_tags\_vnet\_spoke) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Que tipo de performance espera-se. Aceita os valores `Standard` e `Premium`. | `string` | `"Standard"` | no |
| <a name="input_tunneling_enabled"></a> [tunneling\_enabled](#input\_tunneling\_enabled) | O recurso Tunneling está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_type_gw"></a> [type\_gw](#input\_type\_gw) | O tipo do Gateway de Rede Virtual. As opções válidas são ExpressRoute ou Vpn | `string` | `"Vpn"` | no |
| <a name="input_type_local_gw"></a> [type\_local\_gw](#input\_type\_local\_gw) | O tipo de conexão. As opções válidas são ExpressRoute, IPsec ou Vnet2Vnet | `string` | `"IPsec"` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Usado para especificar se o UltraSSD está habilitado no pool de nós padrão. Default é false. | `bool` | `false` | no |
| <a name="input_use_network_existing_to_peering"></a> [use\_network\_existing\_to\_peering](#input\_use\_network\_existing\_to\_peering) | Criação de peering entre vnets que ja existem selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | Controla se os gateways remotos podem ser utilizados na rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Especifica o nome da Máquina Virtual. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size da VM do default node, por padrão Standard\_D2\_v2 | `list(string)` | <pre>[<br>  "Standard_D2_v2"<br>]</pre> | no |
| <a name="input_vm_size_default"></a> [vm\_size\_default](#input\_vm\_size\_default) | Size da VM do default node | `string` | `"Standard_D2_v2"` | no |
| <a name="input_vm_size_win"></a> [vm\_size\_win](#input\_vm\_size\_win) | Especifica o tamanho da Máquina Virtual | `string` | n/a | yes |
| <a name="input_vnet_links"></a> [vnet\_links](#input\_vnet\_links) | Esses Links habilitam a resolução e o registro de DNS dentro das Redes Virtuais do Azure usando o DNS Privado do Azure. | <pre>list(object({<br>    name                 = string<br>    virtual_network_name = string<br>    registration_enabled = bool<br>    rg_name              = string<br>  }))</pre> | `[]` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vnet_name-spoke"></a> [vnet\_name-spoke](#input\_vnet\_name-spoke) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vpn_type_gw"></a> [vpn\_type\_gw](#input\_vpn\_type\_gw) | O tipo de roteamento do Virtual Network Gateway. As opções válidas são RouteBased ou PolicyBased | `string` | `"RouteBased"` | no |
| <a name="input_windows_admin_password"></a> [windows\_admin\_password](#input\_windows\_admin\_password) | Senha do usuario admin do sitema windows | `string` | n/a | yes |
| <a name="input_windows_admin_username"></a> [windows\_admin\_username](#input\_windows\_admin\_username) | Usuário administrador de sistemas windows. Por padrão Solonetwork | `string` | `"Solonetwork"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | n/a |
| <a name="output_access_policy"></a> [access\_policy](#output\_access\_policy) | n/a |
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | n/a |
| <a name="output_analytics_id"></a> [analytics\_id](#output\_analytics\_id) | n/a |
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | n/a |
| <a name="output_azure_bastion_host_id"></a> [azure\_bastion\_host\_id](#output\_azure\_bastion\_host\_id) | n/a |
| <a name="output_azure_bastion_host_pip"></a> [azure\_bastion\_host\_pip](#output\_azure\_bastion\_host\_pip) | n/a |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | n/a |
| <a name="output_gateway_id"></a> [gateway\_id](#output\_gateway\_id) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | n/a |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | n/a |
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | n/a |
| <a name="output_network_watcher_location"></a> [network\_watcher\_location](#output\_network\_watcher\_location) | n/a |
| <a name="output_network_watcher_name"></a> [network\_watcher\_name](#output\_network\_watcher\_name) | n/a |
| <a name="output_pip_name"></a> [pip\_name](#output\_pip\_name) | n/a |
| <a name="output_pip_vpn_name"></a> [pip\_vpn\_name](#output\_pip\_vpn\_name) | n/a |
| <a name="output_rg_location"></a> [rg\_location](#output\_rg\_location) | n/a |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | n/a |
| <a name="output_storage_access_key"></a> [storage\_access\_key](#output\_storage\_access\_key) | n/a |
| <a name="output_storage_account_container"></a> [storage\_account\_container](#output\_storage\_account\_container) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
| <a name="output_storage_account_primary_web_host"></a> [storage\_account\_primary\_web\_host](#output\_storage\_account\_primary\_web\_host) | n/a |
| <a name="output_storage_account_url"></a> [storage\_account\_url](#output\_storage\_account\_url) | n/a |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | n/a |
| <a name="output_vm_ip"></a> [vm\_ip](#output\_vm\_ip) | n/a |
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | n/a |
| <a name="output_vnet_address_space-spoke"></a> [vnet\_address\_space-spoke](#output\_vnet\_address\_space-spoke) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |
| <a name="output_vnet_name-spoke"></a> [vnet\_name-spoke](#output\_vnet\_name-spoke) | n/a |
| <a name="output_vnet_subnet_names"></a> [vnet\_subnet\_names](#output\_vnet\_subnet\_names) | n/a |
| <a name="output_vnet_subnet_names-spoke"></a> [vnet\_subnet\_names-spoke](#output\_vnet\_subnet\_names-spoke) | n/a |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.29.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.27.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.13.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acr"></a> [acr](#module\_acr) | ../../modules/acr | n/a |
| <a name="module_aks"></a> [aks](#module\_aks) | ../../modules/aks | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ../../modules/bastion | n/a |
| <a name="module_dns_private"></a> [dns\_private](#module\_dns\_private) | ../../modules/dns/private | n/a |
| <a name="module_gatway_vpn"></a> [gatway\_vpn](#module\_gatway\_vpn) | ../../modules/network_gateway | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../../modules/key_vault | n/a |
| <a name="module_key_vault_access_policy"></a> [key\_vault\_access\_policy](#module\_key\_vault\_access\_policy) | ../../modules/access_policy | n/a |
| <a name="module_local_gw"></a> [local\_gw](#module\_local\_gw) | ../../modules/local_network_gateway | n/a |
| <a name="module_network_watcher"></a> [network\_watcher](#module\_network\_watcher) | ../../modules/network_watcher | n/a |
| <a name="module_pip"></a> [pip](#module\_pip) | ../../modules/pip | n/a |
| <a name="module_pip_vpn"></a> [pip\_vpn](#module\_pip\_vpn) | ../../modules/pip | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage | n/a |
| <a name="module_vm-win"></a> [vm-win](#module\_vm-win) | ../../modules/vm-windows | n/a |
| <a name="module_vnet-hub"></a> [vnet-hub](#module\_vnet-hub) | ../../modules/vnet | n/a |
| <a name="module_vnet-spoke"></a> [vnet-spoke](#module\_vnet-spoke) | ../../modules/vnet | n/a |
| <a name="module_wks_log"></a> [wks\_log](#module\_wks\_log) | ../../modules/log_analytics | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | Permite que você gerencie os Registros A de DNS no DNS Privado do Azure. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | n/a | `list(any)` | `[]` | no |
| <a name="input_acr_enable_admin"></a> [acr\_enable\_admin](#input\_acr\_enable\_admin) | Habilita usuário administrativo no Azure Container Registry | `string` | n/a | yes |
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | Nome do Registro de Container. Precisa ser um nome único porque a partir daqui será gerado o nome do registry. | `string` | n/a | yes |
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_address_space-spoke"></a> [address\_space-spoke](#input\_address\_space-spoke) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_admin_linux"></a> [admin\_linux](#input\_admin\_linux) | Usuário administrador de sistemas Linux | `string` | n/a | yes |
| <a name="input_admin_win_pass"></a> [admin\_win\_pass](#input\_admin\_win\_pass) | A senha associada à conta do administrador local. | `string` | n/a | yes |
| <a name="input_admin_win_username"></a> [admin\_win\_username](#input\_admin\_win\_username) | Especifica o nome da conta do administrador local. | `string` | n/a | yes |
| <a name="input_agent_count"></a> [agent\_count](#input\_agent\_count) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_agent_count_default"></a> [agent\_count\_default](#input\_agent\_count\_default) | Número de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_aks_dns_ip"></a> [aks\_dns\_ip](#input\_aks\_dns\_ip) | IP do DNS (deve estar dentro do range de IP do `aks_network_cidr`). | `string` | n/a | yes |
| <a name="input_aks_docker_bridge"></a> [aks\_docker\_bridge](#input\_aks\_docker\_bridge) | Endereço CIDR para ser usado como Docker Bridge. | `string` | n/a | yes |
| <a name="input_aks_enable_attach_acr"></a> [aks\_enable\_attach\_acr](#input\_aks\_enable\_attach\_acr) | Força o attach ou não do Kubernetes Services com o Azure Container Services (Obrigatório verificar a documentação adequada) | `bool` | n/a | yes |
| <a name="input_aks_network_cidr"></a> [aks\_network\_cidr](#input\_aks\_network\_cidr) | Endereço CIDR da rede do Kubernetes Service. | `string` | n/a | yes |
| <a name="input_aks_service_principal_app_id"></a> [aks\_service\_principal\_app\_id](#input\_aks\_service\_principal\_app\_id) | Credencial para conexão com service principal. | `string` | n/a | yes |
| <a name="input_aks_service_principal_client_secret"></a> [aks\_service\_principal\_client\_secret](#input\_aks\_service\_principal\_client\_secret) | Credencial para conexão com service principal | `string` | n/a | yes |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Metodo de aloação do Public, a opção is\_public\_ip\_enabled deve ser True. Por padão é static | `string` | `"Static"` | no |
| <a name="input_allocation_method_pip"></a> [allocation\_method\_pip](#input\_allocation\_method\_pip) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allocation_method_pip_gw"></a> [allocation\_method\_pip\_gw](#input\_allocation\_method\_pip\_gw) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allow_forwarded_traffic"></a> [allow\_forwarded\_traffic](#input\_allow\_forwarded\_traffic) | Controla se o tráfego encaminhado de VMs na rede virtual remota é permitido. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_gateway_transit"></a> [allow\_gateway\_transit](#input\_allow\_gateway\_transit) | Os controles gatewayLinks podem ser usados ​​no link da rede virtual remota para a rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_virtual_network_access"></a> [allow\_virtual\_network\_access](#input\_allow\_virtual\_network\_access) | Controla se as VMs na rede virtual remota podem acessar as VMs na rede virtual local. O padrão é true. | `bool` | `true` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | Range de IPs que são liberados para gerência dos server nodes. | `set(string)` | `null` | no |
| <a name="input_auto_scaling_default"></a> [auto\_scaling\_default](#input\_auto\_scaling\_default) | Ativa o auto scaling dos nopdes linux. por padrão false. | `bool` | `false` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Habilitar ou não o add-on de Azure Policy para Kubernetes. Por padão é False | `bool` | `false` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Especifica o nome do Bastion Host | `string` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | specifica os requisitos de cache para o disco do sistema operaciona. Por padrão é ReadOnly | `string` | `"ReadOnly"` | no |
| <a name="input_client_configuration"></a> [client\_configuration](#input\_client\_configuration) | If set it will activate point-to-site configuration. | <pre>object({<br>    address_space = string<br>    protocols     = list(string)<br>    certificate   = string<br>  })</pre> | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | Permite que você gerencie registros CNAME de DNS no DNS privado do Azure. | <pre>list(object({<br>    name   = string<br>    ttl    = number<br>    record = string<br>  }))</pre> | `[]` | no |
| <a name="input_copy_paste_enabled"></a> [copy\_paste\_enabled](#input\_copy\_paste\_enabled) | O recurso Copiar/Colar está habilitado para o Bastion. Padrões para True | `bool` | `true` | no |
| <a name="input_create_vnet_peering"></a> [create\_vnet\_peering](#input\_create\_vnet\_peering) | Criação de peering entre vnets selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_disable_local_account"></a> [disable\_local\_account](#input\_disable\_local\_account) | Desabilita o acesso ao cluster com usuários locais. Por padrão é True | `bool` | `true` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Prefixo DNS do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_dns_private_name"></a> [dns\_private\_name](#input\_dns\_private\_name) | Especifica o nome do DNS privado | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers-spoke"></a> [dns\_servers-spoke](#input\_dns\_servers-spoke) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers_to_nic"></a> [dns\_servers\_to\_nic](#input\_dns\_servers\_to\_nic) | Dns Server para criação nic. | `list(string)` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Ativa o auto scaling dos nopdes linux. por padrão false | `bool` | `false` | no |
| <a name="input_enable_automatic_upgrades"></a> [enable\_automatic\_upgrades](#input\_enable\_automatic\_upgrades) | As atualizações automáticas estão habilitadas nesta máquina virtual. Padrões para false. | `bool` | `"false"` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | Habilita criptografia no default node pool, Por padão é false | `bool` | `false` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Propriedade que define se a autorização será feita via RBAC ao invés de access policies. | `bool` | `false` | no |
| <a name="input_enable_secure_transfer"></a> [enable\_secure\_transfer](#input\_enable\_secure\_transfer) | Força ou não a utilização de transferência de dados exclusivamente por HTTPS. | `bool` | `true` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Propriedade que define se máquinas virtuais do Azure têm permissão para recuperar certificados armazenados como segredos no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Propriedade que define se  o Azure Disk Encryption tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Propriedade que define se o Azure Resource Manager tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_existing_public_ip"></a> [existing\_public\_ip](#input\_existing\_public\_ip) | Usar um Public IP existente. Por padão e False | `bool` | `false` | no |
| <a name="input_file_copy_enabled"></a> [file\_copy\_enabled](#input\_file\_copy\_enabled) | O recurso de cópia de arquivo está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_gateway_name"></a> [gateway\_name](#input\_gateway\_name) | Name of virtual gateway. | `string` | n/a | yes |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Habilitar ou não Roteamento HTTP de Aplicação. Por padão é True | `bool` | `true` | no |
| <a name="input_id_ddos_plan"></a> [id\_ddos\_plan](#input\_id\_ddos\_plan) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_id_ddos_plan-spoke"></a> [id\_ddos\_plan-spoke](#input\_id\_ddos\_plan-spoke) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_img_offer"></a> [img\_offer](#input\_img\_offer) | Especifica a oferta da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_publisher"></a> [img\_publisher](#input\_img\_publisher) | Especifica o editor da imagem. | `string` | n/a | yes |
| <a name="input_img_sku"></a> [img\_sku](#input\_img\_sku) | Especifica o SKU da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_version"></a> [img\_version](#input\_img\_version) | Especifica a versão da imagem usada para criar a máquina virtual. | `string` | `"latest"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | O endereço IP estático que deve ser usado. | `string` | n/a | yes |
| <a name="input_ip_allocation"></a> [ip\_allocation](#input\_ip\_allocation) | O método de alocação usado para o endereço IP privado. O padão é Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | O nome da configuração de IP | `string` | n/a | yes |
| <a name="input_ip_connect_enabled"></a> [ip\_connect\_enabled](#input\_ip\_connect\_enabled) | O recurso IP Connect está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_ip_version_pip"></a> [ip\_version\_pip](#input\_ip\_version\_pip) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_ip_version_pip_gw"></a> [ip\_version\_pip\_gw](#input\_ip\_version\_pip\_gw) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_is_ddos_plan_enabled"></a> [is\_ddos\_plan\_enabled](#input\_is\_ddos\_plan\_enabled) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_ddos_plan_enabled-spoke"></a> [is\_ddos\_plan\_enabled-spoke](#input\_is\_ddos\_plan\_enabled-spoke) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_identity_enabled"></a> [is\_identity\_enabled](#input\_is\_identity\_enabled) | Habilitar ou não o uso de identidade gerenciada. | `bool` | `false` | no |
| <a name="input_is_public_ip_enabled"></a> [is\_public\_ip\_enabled](#input\_is\_public\_ip\_enabled) | Criar um novo Public IP para VM. Por padrão é False | `bool` | `false` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Versão do Kubernetes. Por opadão é 1.19.9 | `string` | `"1.19.9"` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Qual SKU do do blob storage é usado. | `string` | `"StorageV2"` | no |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | Nome do cofre. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_labels_default"></a> [labels\_default](#input\_labels\_default) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `map(any)` | `{}` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | Modelo de SKU do Load Balancer no cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_license_act"></a> [license\_act](#input\_license\_act) | Especifica o tipo BYOL para esta máquina virtual | `string` | n/a | yes |
| <a name="input_local_networks"></a> [local\_networks](#input\_local\_networks) | List of local virtual network connections to connect to gateway. | <pre>list(<br>    object({<br>      name            = string<br>      gateway_address = string<br>      address_space   = list(string)<br>      shared_key      = string<br>      ipsec_policy    = any<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | A região do datacenter onde seus recursos serão criados. | `string` | `"eastus2"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID do Log Analytics. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Nome do workspace do Log Analytics. É obrigatório caso `enable_log_analytics_workspace` for marcado como `true` | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Define a SKU utilizada pelo Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Define o número de dias em que os logs serão armazenados no Workspace. | `number` | `30` | no |
| <a name="input_managed_disk_type"></a> [managed\_disk\_type](#input\_managed\_disk\_type) | Especifica o tipo de disco gerenciado a ser criado. | `string` | `"Standard_LRS"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Número maximo de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_max_nodes_default"></a> [max\_nodes\_default](#input\_max\_nodes\_default) | Número maximo de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | Quantidade máxima de Pods por node (dentro do Default node). | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "1"<br>]</pre> | no |
| <a name="input_min_nodes_default"></a> [min\_nodes\_default](#input\_min\_nodes\_default) | Número de nodes do Cluster Kubernetes. | `string` | `1` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Este pool de nós deve ser usado para recursos do kube-system ou do user. Por padrão user | `list(string)` | n/a | yes |
| <a name="input_name_pool_default"></a> [name\_pool\_default](#input\_name\_pool\_default) | Nome do pool do Cluster Kubernetes. | `string` | `"agentpool"` | no |
| <a name="input_nat_gateway_ids"></a> [nat\_gateway\_ids](#input\_nat\_gateway\_ids) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_nat_gateway_ids-spoke"></a> [nat\_gateway\_ids-spoke](#input\_nat\_gateway\_ids-spoke) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_network_acls_bypass"></a> [network\_acls\_bypass](#input\_network\_acls\_bypass) | Propriedade que define se os serviços do Azure podem realizar operações no cofre. (AzureServices ou None) | `string` | `"None"` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | Ação a ser realizada quando o tráfego de rede de origem for diferente das regras especificadas. (Allow ou Deny) | `string` | `"Deny"` | no |
| <a name="input_network_acls_ip_rules"></a> [network\_acls\_ip\_rules](#input\_network\_acls\_ip\_rules) | Um ou mais endereços de IP ou blocos CIDR que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_acls_virtual_network_subnet_ids"></a> [network\_acls\_virtual\_network\_subnet\_ids](#input\_network\_acls\_virtual\_network\_subnet\_ids) | Um ou mais IDs de subnets que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Modelo de plugin de rede utilizado no Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Politicas de redes do Azure CNI clico ou azure | `string` | `"azure"` | no |
| <a name="input_network_watcher_name"></a> [network\_watcher\_name](#input\_network\_watcher\_name) | Nome do network watcher | `string` | n/a | yes |
| <a name="input_node_av_zone"></a> [node\_av\_zone](#input\_node\_av\_zone) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |
| <a name="input_node_pool"></a> [node\_pool](#input\_node\_pool) | Nome do node pool do Cluster Kubernetes. | `list(string)` | `[]` | no |
| <a name="input_node_vm_disk_size"></a> [node\_vm\_disk\_size](#input\_node\_vm\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `number` | `30` | no |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_nsg_ids-spoke"></a> [nsg\_ids-spoke](#input\_nsg\_ids-spoke) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_oms_agent_enabled"></a> [oms\_agent\_enabled](#input\_oms\_agent\_enabled) | Habilita o OMS Agent no Cluster Kubernetes. | `bool` | `true` | no |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Tipo de sistema operacional dos nodes. Aceita os valores `Windows` ou `Linux`. | `list(string)` | n/a | yes |
| <a name="input_pip_name"></a> [pip\_name](#input\_pip\_name) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_pip_name_gw"></a> [pip\_name\_gw](#input\_pip\_name\_gw) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Habilita que o cluster teha suas APIs dipostas somente para a rede interna. Por padrão é False | `bool` | `false` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Define como o endereço IP privado da interface virtual dos gateways é atribuído. As opções válidas são Static ou Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | O Agente Convidado da Máquina Virtual do Azure deve ser instalado nesta Máquina Virtual. Padrões para True. | `bool` | `true` | no |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | ID do Public IP existente, a opção existing\_public\_ip tem que estar como True. Por padão é null | `string` | `null` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Sku para criação do novo Public IP, a opção is\_public\_ip\_enabled deve ser True. Por padão é basic | `string` | `"Basic"` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Propriedade que define se a feature Purge Protection será habilitada. | `bool` | `false` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | Object ID dos grupos com acesso administrativo ao cluster Kubernetes. | `any` | `null` | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | Habilita Role Based Access Control based com Azure AD | `bool` | `null` | no |
| <a name="input_rbac_aad_client_app_id"></a> [rbac\_aad\_client\_app\_id](#input\_rbac\_aad\_client\_app\_id) | Client ID da aplicação do Azure Active Directory. | `string` | `null` | no |
| <a name="input_rbac_aad_managed"></a> [rbac\_aad\_managed](#input\_rbac\_aad\_managed) | Integração com Azure Active Directory, habilitado, significa que o Azure criará/gerenciará a entidade de Serviço usada para integração. | `bool` | `false` | no |
| <a name="input_rbac_aad_server_app_id"></a> [rbac\_aad\_server\_app\_id](#input\_rbac\_aad\_server\_app\_id) | Server ID do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_server_app_secret"></a> [rbac\_aad\_server\_app\_secret](#input\_rbac\_aad\_server\_app\_secret) | Server Secret do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_tenant_id"></a> [rbac\_aad\_tenant\_id](#input\_rbac\_aad\_tenant\_id) | ID do tenant usada para o aplicativo do Azure Active Directory. Se isso não for especificado, a ID do tenant da assinatura atual será utilizado. | `string` | `null` | no |
| <a name="input_replication"></a> [replication](#input\_replication) | Que tipo de replicação será usada pela Storage Account. | `string` | `"GRS"` | no |
| <a name="input_resource_group_names"></a> [resource\_group\_names](#input\_resource\_group\_names) | O nome do seu Resource Group | `list(string)` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Habilitar Role Based Access Control. | `bool` | `false` | no |
| <a name="input_route_tables_ids"></a> [route\_tables\_ids](#input\_route\_tables\_ids) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_route_tables_ids-spoke"></a> [route\_tables\_ids-spoke](#input\_route\_tables\_ids-spoke) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_scale_units"></a> [scale\_units](#input\_scale\_units) | O número de unidades de escala com as quais provisionar o Bastion. Por padrão e 2 | `number` | `2` | no |
| <a name="input_shareable_link_enabled"></a> [shareable\_link\_enabled](#input\_shareable\_link\_enabled) | O recurso Link compartilhável está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_sizegbdisk"></a> [sizegbdisk](#input\_sizegbdisk) | Especifica o tamanho do disco de dados em gigabyte | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU do Registro de Container. Aceita os valores `Standard`, `Premium` ou `Basic`. | `string` | `"Standard"` | no |
| <a name="input_sku_bastion_name"></a> [sku\_bastion\_name](#input\_sku\_bastion\_name) | O SKU do Bastion Host (Basic ou Standard). | `string` | n/a | yes |
| <a name="input_sku_gw"></a> [sku\_gw](#input\_sku\_gw) | Configuração do tamanho e capacidade do gateway de rede virtual. As opções válidas são Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ e VpnGw5AZ | `string` | `"VpnGw1"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Definição da SKU (standard ou premium). | `string` | n/a | yes |
| <a name="input_sku_pip"></a> [sku\_pip](#input\_sku\_pip) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_pip_gw"></a> [sku\_pip\_gw](#input\_sku\_pip\_gw) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_sku_tier_aks"></a> [sku\_tier\_aks](#input\_sku\_tier\_aks) | O nível de SKU que deve ser usado para este cluster Kubernetes. Os valores possíveis são Free e Paid. Por padãro e Free | `string` | `"Free"` | no |
| <a name="input_sku_tier_gw"></a> [sku\_tier\_gw](#input\_sku\_tier\_gw) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Quantidade de dias para retenção do 'soft delete'. (90 >= days >= 7) | `number` | `90` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Chave púclica SSH para acesso ao sistema do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | Obrigatório caso `static_website_enabled` seja `true`. Bloco que define caminho para os arquivos do website (ver exemplo de código). | `map(any)` | `{}` | no |
| <a name="input_static_website_enabled"></a> [static\_website\_enabled](#input\_static\_website\_enabled) | Especifica se o armazenamento para websites estáticos será habilitado. | `bool` | `false` | no |
| <a name="input_storacc_containers"></a> [storacc\_containers](#input\_storacc\_containers) | Utilizá-lo quando houver a necessidade de criar containers dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storacc_shares"></a> [storacc\_shares](#input\_storacc\_shares) | Utilizá-lo quando houver a necessidade de criar file shares dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Nome da Storage Account. | `string` | n/a | yes |
| <a name="input_storage_uri"></a> [storage\_uri](#input\_storage\_uri) | O Blob Endpoint da Conta de Armazenamento que deve conter os arquivos de diagnóstico da máquina virtual. | `string` | n/a | yes |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies"></a> [subnet\_enforce\_private\_link\_service\_network\_policies](#input\_subnet\_enforce\_private\_link\_service\_network\_policies) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_service\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_service\_network\_policies-spoke) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names-spoke"></a> [subnet\_names-spoke](#input\_subnet\_names-spoke) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names_aks"></a> [subnet\_names\_aks](#input\_subnet\_names\_aks) | Nome da Subnet do AKS com CNI | `string` | `""` | no |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes-spoke"></a> [subnet\_prefixes-spoke](#input\_subnet\_prefixes-spoke) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_subnet_service_endpoints-spoke"></a> [subnet\_service\_endpoints-spoke](#input\_subnet\_service\_endpoints-spoke) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_tags_acr"></a> [tags\_acr](#input\_tags\_acr) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_aks"></a> [tags\_aks](#input\_tags\_aks) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_bastion"></a> [tags\_bastion](#input\_tags\_bastion) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_dns_private"></a> [tags\_dns\_private](#input\_tags\_dns\_private) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_gw"></a> [tags\_gw](#input\_tags\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_key_vault"></a> [tags\_key\_vault](#input\_tags\_key\_vault) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_local_gw"></a> [tags\_local\_gw](#input\_tags\_local\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_log_analytcs"></a> [tags\_log\_analytcs](#input\_tags\_log\_analytcs) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_network_watcher"></a> [tags\_network\_watcher](#input\_tags\_network\_watcher) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip"></a> [tags\_public\_ip](#input\_tags\_public\_ip) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip_gw"></a> [tags\_public\_ip\_gw](#input\_tags\_public\_ip\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_rg"></a> [tags\_rg](#input\_tags\_rg) | Lista de mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_tags_storage"></a> [tags\_storage](#input\_tags\_storage) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vm-win"></a> [tags\_vm-win](#input\_tags\_vm-win) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_hub"></a> [tags\_vnet\_hub](#input\_tags\_vnet\_hub) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_spoke"></a> [tags\_vnet\_spoke](#input\_tags\_vnet\_spoke) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Que tipo de performance espera-se. Aceita os valores `Standard` e `Premium`. | `string` | `"Standard"` | no |
| <a name="input_tunneling_enabled"></a> [tunneling\_enabled](#input\_tunneling\_enabled) | O recurso Tunneling está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_type_gw"></a> [type\_gw](#input\_type\_gw) | O tipo do Gateway de Rede Virtual. As opções válidas são ExpressRoute ou Vpn | `string` | `"Vpn"` | no |
| <a name="input_type_local_gw"></a> [type\_local\_gw](#input\_type\_local\_gw) | O tipo de conexão. As opções válidas são ExpressRoute, IPsec ou Vnet2Vnet | `string` | `"IPsec"` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Usado para especificar se o UltraSSD está habilitado no pool de nós padrão. Default é false. | `bool` | `false` | no |
| <a name="input_use_network_existing_to_peering"></a> [use\_network\_existing\_to\_peering](#input\_use\_network\_existing\_to\_peering) | Criação de peering entre vnets que ja existem selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | Controla se os gateways remotos podem ser utilizados na rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Especifica o nome da Máquina Virtual. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size da VM do default node, por padrão Standard\_D2\_v2 | `list(string)` | <pre>[<br>  "Standard_D2_v2"<br>]</pre> | no |
| <a name="input_vm_size_default"></a> [vm\_size\_default](#input\_vm\_size\_default) | Size da VM do default node | `string` | `"Standard_D2_v2"` | no |
| <a name="input_vm_size_win"></a> [vm\_size\_win](#input\_vm\_size\_win) | Especifica o tamanho da Máquina Virtual | `string` | n/a | yes |
| <a name="input_vnet_links"></a> [vnet\_links](#input\_vnet\_links) | Esses Links habilitam a resolução e o registro de DNS dentro das Redes Virtuais do Azure usando o DNS Privado do Azure. | <pre>list(object({<br>    name                 = string<br>    virtual_network_name = string<br>    registration_enabled = bool<br>    rg_name              = string<br>  }))</pre> | `[]` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vnet_name-spoke"></a> [vnet\_name-spoke](#input\_vnet\_name-spoke) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vpn_type_gw"></a> [vpn\_type\_gw](#input\_vpn\_type\_gw) | O tipo de roteamento do Virtual Network Gateway. As opções válidas são RouteBased ou PolicyBased | `string` | `"RouteBased"` | no |
| <a name="input_windows_admin_password"></a> [windows\_admin\_password](#input\_windows\_admin\_password) | Senha do usuario admin do sitema windows | `string` | n/a | yes |
| <a name="input_windows_admin_username"></a> [windows\_admin\_username](#input\_windows\_admin\_username) | Usuário administrador de sistemas windows. Por padrão Solonetwork | `string` | `"Solonetwork"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | n/a |
| <a name="output_access_policy"></a> [access\_policy](#output\_access\_policy) | n/a |
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | n/a |
| <a name="output_analytics_id"></a> [analytics\_id](#output\_analytics\_id) | n/a |
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | n/a |
| <a name="output_azure_bastion_host_id"></a> [azure\_bastion\_host\_id](#output\_azure\_bastion\_host\_id) | n/a |
| <a name="output_azure_bastion_host_pip"></a> [azure\_bastion\_host\_pip](#output\_azure\_bastion\_host\_pip) | n/a |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | n/a |
| <a name="output_gateway_id"></a> [gateway\_id](#output\_gateway\_id) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | n/a |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | n/a |
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | n/a |
| <a name="output_network_watcher_location"></a> [network\_watcher\_location](#output\_network\_watcher\_location) | n/a |
| <a name="output_network_watcher_name"></a> [network\_watcher\_name](#output\_network\_watcher\_name) | n/a |
| <a name="output_pip_name"></a> [pip\_name](#output\_pip\_name) | n/a |
| <a name="output_pip_vpn_name"></a> [pip\_vpn\_name](#output\_pip\_vpn\_name) | n/a |
| <a name="output_rg_location"></a> [rg\_location](#output\_rg\_location) | n/a |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | n/a |
| <a name="output_storage_access_key"></a> [storage\_access\_key](#output\_storage\_access\_key) | n/a |
| <a name="output_storage_account_container"></a> [storage\_account\_container](#output\_storage\_account\_container) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
| <a name="output_storage_account_primary_web_host"></a> [storage\_account\_primary\_web\_host](#output\_storage\_account\_primary\_web\_host) | n/a |
| <a name="output_storage_account_url"></a> [storage\_account\_url](#output\_storage\_account\_url) | n/a |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | n/a |
| <a name="output_vm_ip"></a> [vm\_ip](#output\_vm\_ip) | n/a |
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | n/a |
| <a name="output_vnet_address_space-spoke"></a> [vnet\_address\_space-spoke](#output\_vnet\_address\_space-spoke) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |
| <a name="output_vnet_name-spoke"></a> [vnet\_name-spoke](#output\_vnet\_name-spoke) | n/a |
| <a name="output_vnet_subnet_names"></a> [vnet\_subnet\_names](#output\_vnet\_subnet\_names) | n/a |
| <a name="output_vnet_subnet_names-spoke"></a> [vnet\_subnet\_names-spoke](#output\_vnet\_subnet\_names-spoke) | n/a |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.29.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.27.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.13.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acr"></a> [acr](#module\_acr) | ../../modules/acr | n/a |
| <a name="module_aks"></a> [aks](#module\_aks) | ../../modules/aks | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ../../modules/bastion | n/a |
| <a name="module_dns_private"></a> [dns\_private](#module\_dns\_private) | ../../modules/dns/private | n/a |
| <a name="module_gatway_vpn"></a> [gatway\_vpn](#module\_gatway\_vpn) | ../../modules/network_gateway | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../../modules/key_vault | n/a |
| <a name="module_key_vault_access_policy"></a> [key\_vault\_access\_policy](#module\_key\_vault\_access\_policy) | ../../modules/access_policy | n/a |
| <a name="module_local_gw"></a> [local\_gw](#module\_local\_gw) | ../../modules/local_network_gateway | n/a |
| <a name="module_network_watcher"></a> [network\_watcher](#module\_network\_watcher) | ../../modules/network_watcher | n/a |
| <a name="module_pip"></a> [pip](#module\_pip) | ../../modules/pip | n/a |
| <a name="module_pip_vpn"></a> [pip\_vpn](#module\_pip\_vpn) | ../../modules/pip | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage | n/a |
| <a name="module_vm-win"></a> [vm-win](#module\_vm-win) | ../../modules/vm-windows | n/a |
| <a name="module_vnet-hub"></a> [vnet-hub](#module\_vnet-hub) | ../../modules/vnet | n/a |
| <a name="module_vnet-spoke"></a> [vnet-spoke](#module\_vnet-spoke) | ../../modules/vnet | n/a |
| <a name="module_wks_log"></a> [wks\_log](#module\_wks\_log) | ../../modules/log_analytics | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | Permite que você gerencie os Registros A de DNS no DNS Privado do Azure. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | n/a | `list(any)` | `[]` | no |
| <a name="input_acr_enable_admin"></a> [acr\_enable\_admin](#input\_acr\_enable\_admin) | Habilita usuário administrativo no Azure Container Registry | `string` | n/a | yes |
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | Nome do Registro de Container. Precisa ser um nome único porque a partir daqui será gerado o nome do registry. | `string` | n/a | yes |
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_address_space-spoke"></a> [address\_space-spoke](#input\_address\_space-spoke) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_admin_linux"></a> [admin\_linux](#input\_admin\_linux) | Usuário administrador de sistemas Linux | `string` | n/a | yes |
| <a name="input_admin_win_pass"></a> [admin\_win\_pass](#input\_admin\_win\_pass) | A senha associada à conta do administrador local. | `string` | n/a | yes |
| <a name="input_admin_win_username"></a> [admin\_win\_username](#input\_admin\_win\_username) | Especifica o nome da conta do administrador local. | `string` | n/a | yes |
| <a name="input_agent_count"></a> [agent\_count](#input\_agent\_count) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_agent_count_default"></a> [agent\_count\_default](#input\_agent\_count\_default) | Número de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_aks_dns_ip"></a> [aks\_dns\_ip](#input\_aks\_dns\_ip) | IP do DNS (deve estar dentro do range de IP do `aks_network_cidr`). | `string` | n/a | yes |
| <a name="input_aks_docker_bridge"></a> [aks\_docker\_bridge](#input\_aks\_docker\_bridge) | Endereço CIDR para ser usado como Docker Bridge. | `string` | n/a | yes |
| <a name="input_aks_enable_attach_acr"></a> [aks\_enable\_attach\_acr](#input\_aks\_enable\_attach\_acr) | Força o attach ou não do Kubernetes Services com o Azure Container Services (Obrigatório verificar a documentação adequada) | `bool` | n/a | yes |
| <a name="input_aks_network_cidr"></a> [aks\_network\_cidr](#input\_aks\_network\_cidr) | Endereço CIDR da rede do Kubernetes Service. | `string` | n/a | yes |
| <a name="input_aks_service_principal_app_id"></a> [aks\_service\_principal\_app\_id](#input\_aks\_service\_principal\_app\_id) | Credencial para conexão com service principal. | `string` | n/a | yes |
| <a name="input_aks_service_principal_client_secret"></a> [aks\_service\_principal\_client\_secret](#input\_aks\_service\_principal\_client\_secret) | Credencial para conexão com service principal | `string` | n/a | yes |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Metodo de aloação do Public, a opção is\_public\_ip\_enabled deve ser True. Por padão é static | `string` | `"Static"` | no |
| <a name="input_allocation_method_pip"></a> [allocation\_method\_pip](#input\_allocation\_method\_pip) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allocation_method_pip_gw"></a> [allocation\_method\_pip\_gw](#input\_allocation\_method\_pip\_gw) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allow_forwarded_traffic"></a> [allow\_forwarded\_traffic](#input\_allow\_forwarded\_traffic) | Controla se o tráfego encaminhado de VMs na rede virtual remota é permitido. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_gateway_transit"></a> [allow\_gateway\_transit](#input\_allow\_gateway\_transit) | Os controles gatewayLinks podem ser usados ​​no link da rede virtual remota para a rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_virtual_network_access"></a> [allow\_virtual\_network\_access](#input\_allow\_virtual\_network\_access) | Controla se as VMs na rede virtual remota podem acessar as VMs na rede virtual local. O padrão é true. | `bool` | `true` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | Range de IPs que são liberados para gerência dos server nodes. | `set(string)` | `null` | no |
| <a name="input_auto_scaling_default"></a> [auto\_scaling\_default](#input\_auto\_scaling\_default) | Ativa o auto scaling dos nopdes linux. por padrão false. | `bool` | `false` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Habilitar ou não o add-on de Azure Policy para Kubernetes. Por padão é False | `bool` | `false` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Especifica o nome do Bastion Host | `string` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | specifica os requisitos de cache para o disco do sistema operaciona. Por padrão é ReadOnly | `string` | `"ReadOnly"` | no |
| <a name="input_client_configuration"></a> [client\_configuration](#input\_client\_configuration) | If set it will activate point-to-site configuration. | <pre>object({<br>    address_space = string<br>    protocols     = list(string)<br>    certificate   = string<br>  })</pre> | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | Permite que você gerencie registros CNAME de DNS no DNS privado do Azure. | <pre>list(object({<br>    name   = string<br>    ttl    = number<br>    record = string<br>  }))</pre> | `[]` | no |
| <a name="input_copy_paste_enabled"></a> [copy\_paste\_enabled](#input\_copy\_paste\_enabled) | O recurso Copiar/Colar está habilitado para o Bastion. Padrões para True | `bool` | `true` | no |
| <a name="input_create_vnet_peering"></a> [create\_vnet\_peering](#input\_create\_vnet\_peering) | Criação de peering entre vnets selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_disable_local_account"></a> [disable\_local\_account](#input\_disable\_local\_account) | Desabilita o acesso ao cluster com usuários locais. Por padrão é True | `bool` | `true` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Prefixo DNS do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_dns_private_name"></a> [dns\_private\_name](#input\_dns\_private\_name) | Especifica o nome do DNS privado | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers-spoke"></a> [dns\_servers-spoke](#input\_dns\_servers-spoke) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers_to_nic"></a> [dns\_servers\_to\_nic](#input\_dns\_servers\_to\_nic) | Dns Server para criação nic. | `list(string)` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Ativa o auto scaling dos nopdes linux. por padrão false | `bool` | `false` | no |
| <a name="input_enable_automatic_upgrades"></a> [enable\_automatic\_upgrades](#input\_enable\_automatic\_upgrades) | As atualizações automáticas estão habilitadas nesta máquina virtual. Padrões para false. | `bool` | `"false"` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | Habilita criptografia no default node pool, Por padão é false | `bool` | `false` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Propriedade que define se a autorização será feita via RBAC ao invés de access policies. | `bool` | `false` | no |
| <a name="input_enable_secure_transfer"></a> [enable\_secure\_transfer](#input\_enable\_secure\_transfer) | Força ou não a utilização de transferência de dados exclusivamente por HTTPS. | `bool` | `true` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Propriedade que define se máquinas virtuais do Azure têm permissão para recuperar certificados armazenados como segredos no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Propriedade que define se  o Azure Disk Encryption tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Propriedade que define se o Azure Resource Manager tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_existing_public_ip"></a> [existing\_public\_ip](#input\_existing\_public\_ip) | Usar um Public IP existente. Por padão e False | `bool` | `false` | no |
| <a name="input_file_copy_enabled"></a> [file\_copy\_enabled](#input\_file\_copy\_enabled) | O recurso de cópia de arquivo está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_gateway_name"></a> [gateway\_name](#input\_gateway\_name) | Name of virtual gateway. | `string` | n/a | yes |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Habilitar ou não Roteamento HTTP de Aplicação. Por padão é True | `bool` | `true` | no |
| <a name="input_id_ddos_plan"></a> [id\_ddos\_plan](#input\_id\_ddos\_plan) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_id_ddos_plan-spoke"></a> [id\_ddos\_plan-spoke](#input\_id\_ddos\_plan-spoke) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_img_offer"></a> [img\_offer](#input\_img\_offer) | Especifica a oferta da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_publisher"></a> [img\_publisher](#input\_img\_publisher) | Especifica o editor da imagem. | `string` | n/a | yes |
| <a name="input_img_sku"></a> [img\_sku](#input\_img\_sku) | Especifica o SKU da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_version"></a> [img\_version](#input\_img\_version) | Especifica a versão da imagem usada para criar a máquina virtual. | `string` | `"latest"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | O endereço IP estático que deve ser usado. | `string` | n/a | yes |
| <a name="input_ip_allocation"></a> [ip\_allocation](#input\_ip\_allocation) | O método de alocação usado para o endereço IP privado. O padão é Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | O nome da configuração de IP | `string` | n/a | yes |
| <a name="input_ip_connect_enabled"></a> [ip\_connect\_enabled](#input\_ip\_connect\_enabled) | O recurso IP Connect está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_ip_version_pip"></a> [ip\_version\_pip](#input\_ip\_version\_pip) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_ip_version_pip_gw"></a> [ip\_version\_pip\_gw](#input\_ip\_version\_pip\_gw) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_is_ddos_plan_enabled"></a> [is\_ddos\_plan\_enabled](#input\_is\_ddos\_plan\_enabled) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_ddos_plan_enabled-spoke"></a> [is\_ddos\_plan\_enabled-spoke](#input\_is\_ddos\_plan\_enabled-spoke) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_identity_enabled"></a> [is\_identity\_enabled](#input\_is\_identity\_enabled) | Habilitar ou não o uso de identidade gerenciada. | `bool` | `false` | no |
| <a name="input_is_public_ip_enabled"></a> [is\_public\_ip\_enabled](#input\_is\_public\_ip\_enabled) | Criar um novo Public IP para VM. Por padrão é False | `bool` | `false` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Versão do Kubernetes. Por opadão é 1.19.9 | `string` | `"1.19.9"` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Qual SKU do do blob storage é usado. | `string` | `"StorageV2"` | no |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | Nome do cofre. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_labels_default"></a> [labels\_default](#input\_labels\_default) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `map(any)` | `{}` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | Modelo de SKU do Load Balancer no cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_license_act"></a> [license\_act](#input\_license\_act) | Especifica o tipo BYOL para esta máquina virtual | `string` | n/a | yes |
| <a name="input_local_networks"></a> [local\_networks](#input\_local\_networks) | List of local virtual network connections to connect to gateway. | <pre>list(<br>    object({<br>      name            = string<br>      gateway_address = string<br>      address_space   = list(string)<br>      shared_key      = string<br>      ipsec_policy    = any<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | A região do datacenter onde seus recursos serão criados. | `string` | `"eastus2"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID do Log Analytics. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Nome do workspace do Log Analytics. É obrigatório caso `enable_log_analytics_workspace` for marcado como `true` | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Define a SKU utilizada pelo Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Define o número de dias em que os logs serão armazenados no Workspace. | `number` | `30` | no |
| <a name="input_managed_disk_type"></a> [managed\_disk\_type](#input\_managed\_disk\_type) | Especifica o tipo de disco gerenciado a ser criado. | `string` | `"Standard_LRS"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Número maximo de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_max_nodes_default"></a> [max\_nodes\_default](#input\_max\_nodes\_default) | Número maximo de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | Quantidade máxima de Pods por node (dentro do Default node). | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "1"<br>]</pre> | no |
| <a name="input_min_nodes_default"></a> [min\_nodes\_default](#input\_min\_nodes\_default) | Número de nodes do Cluster Kubernetes. | `string` | `1` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Este pool de nós deve ser usado para recursos do kube-system ou do user. Por padrão user | `list(string)` | n/a | yes |
| <a name="input_name_pool_default"></a> [name\_pool\_default](#input\_name\_pool\_default) | Nome do pool do Cluster Kubernetes. | `string` | `"agentpool"` | no |
| <a name="input_nat_gateway_ids"></a> [nat\_gateway\_ids](#input\_nat\_gateway\_ids) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_nat_gateway_ids-spoke"></a> [nat\_gateway\_ids-spoke](#input\_nat\_gateway\_ids-spoke) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_network_acls_bypass"></a> [network\_acls\_bypass](#input\_network\_acls\_bypass) | Propriedade que define se os serviços do Azure podem realizar operações no cofre. (AzureServices ou None) | `string` | `"None"` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | Ação a ser realizada quando o tráfego de rede de origem for diferente das regras especificadas. (Allow ou Deny) | `string` | `"Deny"` | no |
| <a name="input_network_acls_ip_rules"></a> [network\_acls\_ip\_rules](#input\_network\_acls\_ip\_rules) | Um ou mais endereços de IP ou blocos CIDR que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_acls_virtual_network_subnet_ids"></a> [network\_acls\_virtual\_network\_subnet\_ids](#input\_network\_acls\_virtual\_network\_subnet\_ids) | Um ou mais IDs de subnets que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Modelo de plugin de rede utilizado no Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Politicas de redes do Azure CNI clico ou azure | `string` | `"azure"` | no |
| <a name="input_network_watcher_name"></a> [network\_watcher\_name](#input\_network\_watcher\_name) | Nome do network watcher | `string` | n/a | yes |
| <a name="input_node_av_zone"></a> [node\_av\_zone](#input\_node\_av\_zone) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |
| <a name="input_node_pool"></a> [node\_pool](#input\_node\_pool) | Nome do node pool do Cluster Kubernetes. | `list(string)` | `[]` | no |
| <a name="input_node_vm_disk_size"></a> [node\_vm\_disk\_size](#input\_node\_vm\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `number` | `30` | no |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_nsg_ids-spoke"></a> [nsg\_ids-spoke](#input\_nsg\_ids-spoke) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_oms_agent_enabled"></a> [oms\_agent\_enabled](#input\_oms\_agent\_enabled) | Habilita o OMS Agent no Cluster Kubernetes. | `bool` | `true` | no |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Tipo de sistema operacional dos nodes. Aceita os valores `Windows` ou `Linux`. | `list(string)` | n/a | yes |
| <a name="input_pip_name"></a> [pip\_name](#input\_pip\_name) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_pip_name_gw"></a> [pip\_name\_gw](#input\_pip\_name\_gw) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Habilita que o cluster teha suas APIs dipostas somente para a rede interna. Por padrão é False | `bool` | `false` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Define como o endereço IP privado da interface virtual dos gateways é atribuído. As opções válidas são Static ou Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | O Agente Convidado da Máquina Virtual do Azure deve ser instalado nesta Máquina Virtual. Padrões para True. | `bool` | `true` | no |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | ID do Public IP existente, a opção existing\_public\_ip tem que estar como True. Por padão é null | `string` | `null` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Sku para criação do novo Public IP, a opção is\_public\_ip\_enabled deve ser True. Por padão é basic | `string` | `"Basic"` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Propriedade que define se a feature Purge Protection será habilitada. | `bool` | `false` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | Object ID dos grupos com acesso administrativo ao cluster Kubernetes. | `any` | `null` | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | Habilita Role Based Access Control based com Azure AD | `bool` | `null` | no |
| <a name="input_rbac_aad_client_app_id"></a> [rbac\_aad\_client\_app\_id](#input\_rbac\_aad\_client\_app\_id) | Client ID da aplicação do Azure Active Directory. | `string` | `null` | no |
| <a name="input_rbac_aad_managed"></a> [rbac\_aad\_managed](#input\_rbac\_aad\_managed) | Integração com Azure Active Directory, habilitado, significa que o Azure criará/gerenciará a entidade de Serviço usada para integração. | `bool` | `false` | no |
| <a name="input_rbac_aad_server_app_id"></a> [rbac\_aad\_server\_app\_id](#input\_rbac\_aad\_server\_app\_id) | Server ID do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_server_app_secret"></a> [rbac\_aad\_server\_app\_secret](#input\_rbac\_aad\_server\_app\_secret) | Server Secret do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_tenant_id"></a> [rbac\_aad\_tenant\_id](#input\_rbac\_aad\_tenant\_id) | ID do tenant usada para o aplicativo do Azure Active Directory. Se isso não for especificado, a ID do tenant da assinatura atual será utilizado. | `string` | `null` | no |
| <a name="input_replication"></a> [replication](#input\_replication) | Que tipo de replicação será usada pela Storage Account. | `string` | `"GRS"` | no |
| <a name="input_resource_group_names"></a> [resource\_group\_names](#input\_resource\_group\_names) | O nome do seu Resource Group | `list(string)` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Habilitar Role Based Access Control. | `bool` | `false` | no |
| <a name="input_route_tables_ids"></a> [route\_tables\_ids](#input\_route\_tables\_ids) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_route_tables_ids-spoke"></a> [route\_tables\_ids-spoke](#input\_route\_tables\_ids-spoke) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_scale_units"></a> [scale\_units](#input\_scale\_units) | O número de unidades de escala com as quais provisionar o Bastion. Por padrão e 2 | `number` | `2` | no |
| <a name="input_shareable_link_enabled"></a> [shareable\_link\_enabled](#input\_shareable\_link\_enabled) | O recurso Link compartilhável está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_sizegbdisk"></a> [sizegbdisk](#input\_sizegbdisk) | Especifica o tamanho do disco de dados em gigabyte | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU do Registro de Container. Aceita os valores `Standard`, `Premium` ou `Basic`. | `string` | `"Standard"` | no |
| <a name="input_sku_bastion_name"></a> [sku\_bastion\_name](#input\_sku\_bastion\_name) | O SKU do Bastion Host (Basic ou Standard). | `string` | n/a | yes |
| <a name="input_sku_gw"></a> [sku\_gw](#input\_sku\_gw) | Configuração do tamanho e capacidade do gateway de rede virtual. As opções válidas são Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ e VpnGw5AZ | `string` | `"VpnGw1"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Definição da SKU (standard ou premium). | `string` | n/a | yes |
| <a name="input_sku_pip"></a> [sku\_pip](#input\_sku\_pip) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_pip_gw"></a> [sku\_pip\_gw](#input\_sku\_pip\_gw) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_sku_tier_aks"></a> [sku\_tier\_aks](#input\_sku\_tier\_aks) | O nível de SKU que deve ser usado para este cluster Kubernetes. Os valores possíveis são Free e Paid. Por padãro e Free | `string` | `"Free"` | no |
| <a name="input_sku_tier_gw"></a> [sku\_tier\_gw](#input\_sku\_tier\_gw) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Quantidade de dias para retenção do 'soft delete'. (90 >= days >= 7) | `number` | `90` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Chave púclica SSH para acesso ao sistema do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | Obrigatório caso `static_website_enabled` seja `true`. Bloco que define caminho para os arquivos do website (ver exemplo de código). | `map(any)` | `{}` | no |
| <a name="input_static_website_enabled"></a> [static\_website\_enabled](#input\_static\_website\_enabled) | Especifica se o armazenamento para websites estáticos será habilitado. | `bool` | `false` | no |
| <a name="input_storacc_containers"></a> [storacc\_containers](#input\_storacc\_containers) | Utilizá-lo quando houver a necessidade de criar containers dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storacc_shares"></a> [storacc\_shares](#input\_storacc\_shares) | Utilizá-lo quando houver a necessidade de criar file shares dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Nome da Storage Account. | `string` | n/a | yes |
| <a name="input_storage_uri"></a> [storage\_uri](#input\_storage\_uri) | O Blob Endpoint da Conta de Armazenamento que deve conter os arquivos de diagnóstico da máquina virtual. | `string` | n/a | yes |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies"></a> [subnet\_enforce\_private\_link\_service\_network\_policies](#input\_subnet\_enforce\_private\_link\_service\_network\_policies) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_service\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_service\_network\_policies-spoke) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names-spoke"></a> [subnet\_names-spoke](#input\_subnet\_names-spoke) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names_aks"></a> [subnet\_names\_aks](#input\_subnet\_names\_aks) | Nome da Subnet do AKS com CNI | `string` | `""` | no |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes-spoke"></a> [subnet\_prefixes-spoke](#input\_subnet\_prefixes-spoke) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_subnet_service_endpoints-spoke"></a> [subnet\_service\_endpoints-spoke](#input\_subnet\_service\_endpoints-spoke) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_tags_acr"></a> [tags\_acr](#input\_tags\_acr) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_aks"></a> [tags\_aks](#input\_tags\_aks) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_bastion"></a> [tags\_bastion](#input\_tags\_bastion) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_dns_private"></a> [tags\_dns\_private](#input\_tags\_dns\_private) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_gw"></a> [tags\_gw](#input\_tags\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_key_vault"></a> [tags\_key\_vault](#input\_tags\_key\_vault) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_local_gw"></a> [tags\_local\_gw](#input\_tags\_local\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_log_analytcs"></a> [tags\_log\_analytcs](#input\_tags\_log\_analytcs) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_network_watcher"></a> [tags\_network\_watcher](#input\_tags\_network\_watcher) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip"></a> [tags\_public\_ip](#input\_tags\_public\_ip) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip_gw"></a> [tags\_public\_ip\_gw](#input\_tags\_public\_ip\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_rg"></a> [tags\_rg](#input\_tags\_rg) | Lista de mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_tags_storage"></a> [tags\_storage](#input\_tags\_storage) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vm-win"></a> [tags\_vm-win](#input\_tags\_vm-win) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_hub"></a> [tags\_vnet\_hub](#input\_tags\_vnet\_hub) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_spoke"></a> [tags\_vnet\_spoke](#input\_tags\_vnet\_spoke) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Que tipo de performance espera-se. Aceita os valores `Standard` e `Premium`. | `string` | `"Standard"` | no |
| <a name="input_tunneling_enabled"></a> [tunneling\_enabled](#input\_tunneling\_enabled) | O recurso Tunneling está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_type_gw"></a> [type\_gw](#input\_type\_gw) | O tipo do Gateway de Rede Virtual. As opções válidas são ExpressRoute ou Vpn | `string` | `"Vpn"` | no |
| <a name="input_type_local_gw"></a> [type\_local\_gw](#input\_type\_local\_gw) | O tipo de conexão. As opções válidas são ExpressRoute, IPsec ou Vnet2Vnet | `string` | `"IPsec"` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Usado para especificar se o UltraSSD está habilitado no pool de nós padrão. Default é false. | `bool` | `false` | no |
| <a name="input_use_network_existing_to_peering"></a> [use\_network\_existing\_to\_peering](#input\_use\_network\_existing\_to\_peering) | Criação de peering entre vnets que ja existem selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | Controla se os gateways remotos podem ser utilizados na rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Especifica o nome da Máquina Virtual. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size da VM do default node, por padrão Standard\_D2\_v2 | `list(string)` | <pre>[<br>  "Standard_D2_v2"<br>]</pre> | no |
| <a name="input_vm_size_default"></a> [vm\_size\_default](#input\_vm\_size\_default) | Size da VM do default node | `string` | `"Standard_D2_v2"` | no |
| <a name="input_vm_size_win"></a> [vm\_size\_win](#input\_vm\_size\_win) | Especifica o tamanho da Máquina Virtual | `string` | n/a | yes |
| <a name="input_vnet_links"></a> [vnet\_links](#input\_vnet\_links) | Esses Links habilitam a resolução e o registro de DNS dentro das Redes Virtuais do Azure usando o DNS Privado do Azure. | <pre>list(object({<br>    name                 = string<br>    virtual_network_name = string<br>    registration_enabled = bool<br>    rg_name              = string<br>  }))</pre> | `[]` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vnet_name-spoke"></a> [vnet\_name-spoke](#input\_vnet\_name-spoke) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vpn_type_gw"></a> [vpn\_type\_gw](#input\_vpn\_type\_gw) | O tipo de roteamento do Virtual Network Gateway. As opções válidas são RouteBased ou PolicyBased | `string` | `"RouteBased"` | no |
| <a name="input_windows_admin_password"></a> [windows\_admin\_password](#input\_windows\_admin\_password) | Senha do usuario admin do sitema windows | `string` | n/a | yes |
| <a name="input_windows_admin_username"></a> [windows\_admin\_username](#input\_windows\_admin\_username) | Usuário administrador de sistemas windows. Por padrão Solonetwork | `string` | `"Solonetwork"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | n/a |
| <a name="output_access_policy"></a> [access\_policy](#output\_access\_policy) | n/a |
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | n/a |
| <a name="output_analytics_id"></a> [analytics\_id](#output\_analytics\_id) | n/a |
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | n/a |
| <a name="output_azure_bastion_host_id"></a> [azure\_bastion\_host\_id](#output\_azure\_bastion\_host\_id) | n/a |
| <a name="output_azure_bastion_host_pip"></a> [azure\_bastion\_host\_pip](#output\_azure\_bastion\_host\_pip) | n/a |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | n/a |
| <a name="output_gateway_id"></a> [gateway\_id](#output\_gateway\_id) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | n/a |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | n/a |
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | n/a |
| <a name="output_network_watcher_location"></a> [network\_watcher\_location](#output\_network\_watcher\_location) | n/a |
| <a name="output_network_watcher_name"></a> [network\_watcher\_name](#output\_network\_watcher\_name) | n/a |
| <a name="output_pip_name"></a> [pip\_name](#output\_pip\_name) | n/a |
| <a name="output_pip_vpn_name"></a> [pip\_vpn\_name](#output\_pip\_vpn\_name) | n/a |
| <a name="output_rg_location"></a> [rg\_location](#output\_rg\_location) | n/a |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | n/a |
| <a name="output_storage_access_key"></a> [storage\_access\_key](#output\_storage\_access\_key) | n/a |
| <a name="output_storage_account_container"></a> [storage\_account\_container](#output\_storage\_account\_container) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
| <a name="output_storage_account_primary_web_host"></a> [storage\_account\_primary\_web\_host](#output\_storage\_account\_primary\_web\_host) | n/a |
| <a name="output_storage_account_url"></a> [storage\_account\_url](#output\_storage\_account\_url) | n/a |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | n/a |
| <a name="output_vm_ip"></a> [vm\_ip](#output\_vm\_ip) | n/a |
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | n/a |
| <a name="output_vnet_address_space-spoke"></a> [vnet\_address\_space-spoke](#output\_vnet\_address\_space-spoke) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |
| <a name="output_vnet_name-spoke"></a> [vnet\_name-spoke](#output\_vnet\_name-spoke) | n/a |
| <a name="output_vnet_subnet_names"></a> [vnet\_subnet\_names](#output\_vnet\_subnet\_names) | n/a |
| <a name="output_vnet_subnet_names-spoke"></a> [vnet\_subnet\_names-spoke](#output\_vnet\_subnet\_names-spoke) | n/a |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.29.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.27.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.13.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acr"></a> [acr](#module\_acr) | ../../modules/acr | n/a |
| <a name="module_aks"></a> [aks](#module\_aks) | ../../modules/aks | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ../../modules/bastion | n/a |
| <a name="module_dns_private"></a> [dns\_private](#module\_dns\_private) | ../../modules/dns/private | n/a |
| <a name="module_gatway_vpn"></a> [gatway\_vpn](#module\_gatway\_vpn) | ../../modules/network_gateway | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../../modules/key_vault | n/a |
| <a name="module_key_vault_access_policy"></a> [key\_vault\_access\_policy](#module\_key\_vault\_access\_policy) | ../../modules/access_policy | n/a |
| <a name="module_local_gw"></a> [local\_gw](#module\_local\_gw) | ../../modules/local_network_gateway | n/a |
| <a name="module_network_watcher"></a> [network\_watcher](#module\_network\_watcher) | ../../modules/network_watcher | n/a |
| <a name="module_pip"></a> [pip](#module\_pip) | ../../modules/pip | n/a |
| <a name="module_pip_vpn"></a> [pip\_vpn](#module\_pip\_vpn) | ../../modules/pip | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage | n/a |
| <a name="module_vm-win"></a> [vm-win](#module\_vm-win) | ../../modules/vm-windows | n/a |
| <a name="module_vnet-hub"></a> [vnet-hub](#module\_vnet-hub) | ../../modules/vnet | n/a |
| <a name="module_vnet-spoke"></a> [vnet-spoke](#module\_vnet-spoke) | ../../modules/vnet | n/a |
| <a name="module_wks_log"></a> [wks\_log](#module\_wks\_log) | ../../modules/log_analytics | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | Permite que você gerencie os Registros A de DNS no DNS Privado do Azure. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | n/a | `list(any)` | `[]` | no |
| <a name="input_acr_enable_admin"></a> [acr\_enable\_admin](#input\_acr\_enable\_admin) | Habilita usuário administrativo no Azure Container Registry | `string` | n/a | yes |
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | Nome do Registro de Container. Precisa ser um nome único porque a partir daqui será gerado o nome do registry. | `string` | n/a | yes |
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_address_space-spoke"></a> [address\_space-spoke](#input\_address\_space-spoke) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_admin_linux"></a> [admin\_linux](#input\_admin\_linux) | Usuário administrador de sistemas Linux | `string` | n/a | yes |
| <a name="input_admin_win_pass"></a> [admin\_win\_pass](#input\_admin\_win\_pass) | A senha associada à conta do administrador local. | `string` | n/a | yes |
| <a name="input_admin_win_username"></a> [admin\_win\_username](#input\_admin\_win\_username) | Especifica o nome da conta do administrador local. | `string` | n/a | yes |
| <a name="input_agent_count"></a> [agent\_count](#input\_agent\_count) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_agent_count_default"></a> [agent\_count\_default](#input\_agent\_count\_default) | Número de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_aks_dns_ip"></a> [aks\_dns\_ip](#input\_aks\_dns\_ip) | IP do DNS (deve estar dentro do range de IP do `aks_network_cidr`). | `string` | n/a | yes |
| <a name="input_aks_docker_bridge"></a> [aks\_docker\_bridge](#input\_aks\_docker\_bridge) | Endereço CIDR para ser usado como Docker Bridge. | `string` | n/a | yes |
| <a name="input_aks_enable_attach_acr"></a> [aks\_enable\_attach\_acr](#input\_aks\_enable\_attach\_acr) | Força o attach ou não do Kubernetes Services com o Azure Container Services (Obrigatório verificar a documentação adequada) | `bool` | n/a | yes |
| <a name="input_aks_network_cidr"></a> [aks\_network\_cidr](#input\_aks\_network\_cidr) | Endereço CIDR da rede do Kubernetes Service. | `string` | n/a | yes |
| <a name="input_aks_service_principal_app_id"></a> [aks\_service\_principal\_app\_id](#input\_aks\_service\_principal\_app\_id) | Credencial para conexão com service principal. | `string` | n/a | yes |
| <a name="input_aks_service_principal_client_secret"></a> [aks\_service\_principal\_client\_secret](#input\_aks\_service\_principal\_client\_secret) | Credencial para conexão com service principal | `string` | n/a | yes |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Metodo de aloação do Public, a opção is\_public\_ip\_enabled deve ser True. Por padão é static | `string` | `"Static"` | no |
| <a name="input_allocation_method_pip"></a> [allocation\_method\_pip](#input\_allocation\_method\_pip) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allocation_method_pip_gw"></a> [allocation\_method\_pip\_gw](#input\_allocation\_method\_pip\_gw) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allow_forwarded_traffic"></a> [allow\_forwarded\_traffic](#input\_allow\_forwarded\_traffic) | Controla se o tráfego encaminhado de VMs na rede virtual remota é permitido. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_gateway_transit"></a> [allow\_gateway\_transit](#input\_allow\_gateway\_transit) | Os controles gatewayLinks podem ser usados ​​no link da rede virtual remota para a rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_virtual_network_access"></a> [allow\_virtual\_network\_access](#input\_allow\_virtual\_network\_access) | Controla se as VMs na rede virtual remota podem acessar as VMs na rede virtual local. O padrão é true. | `bool` | `true` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | Range de IPs que são liberados para gerência dos server nodes. | `set(string)` | `null` | no |
| <a name="input_auto_scaling_default"></a> [auto\_scaling\_default](#input\_auto\_scaling\_default) | Ativa o auto scaling dos nopdes linux. por padrão false. | `bool` | `false` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Habilitar ou não o add-on de Azure Policy para Kubernetes. Por padão é False | `bool` | `false` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Especifica o nome do Bastion Host | `string` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | specifica os requisitos de cache para o disco do sistema operaciona. Por padrão é ReadOnly | `string` | `"ReadOnly"` | no |
| <a name="input_client_configuration"></a> [client\_configuration](#input\_client\_configuration) | If set it will activate point-to-site configuration. | <pre>object({<br>    address_space = string<br>    protocols     = list(string)<br>    certificate   = string<br>  })</pre> | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | Permite que você gerencie registros CNAME de DNS no DNS privado do Azure. | <pre>list(object({<br>    name   = string<br>    ttl    = number<br>    record = string<br>  }))</pre> | `[]` | no |
| <a name="input_copy_paste_enabled"></a> [copy\_paste\_enabled](#input\_copy\_paste\_enabled) | O recurso Copiar/Colar está habilitado para o Bastion. Padrões para True | `bool` | `true` | no |
| <a name="input_create_vnet_peering"></a> [create\_vnet\_peering](#input\_create\_vnet\_peering) | Criação de peering entre vnets selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_disable_local_account"></a> [disable\_local\_account](#input\_disable\_local\_account) | Desabilita o acesso ao cluster com usuários locais. Por padrão é True | `bool` | `true` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Prefixo DNS do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_dns_private_name"></a> [dns\_private\_name](#input\_dns\_private\_name) | Especifica o nome do DNS privado | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers-spoke"></a> [dns\_servers-spoke](#input\_dns\_servers-spoke) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers_to_nic"></a> [dns\_servers\_to\_nic](#input\_dns\_servers\_to\_nic) | Dns Server para criação nic. | `list(string)` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Ativa o auto scaling dos nopdes linux. por padrão false | `bool` | `false` | no |
| <a name="input_enable_automatic_upgrades"></a> [enable\_automatic\_upgrades](#input\_enable\_automatic\_upgrades) | As atualizações automáticas estão habilitadas nesta máquina virtual. Padrões para false. | `bool` | `"false"` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | Habilita criptografia no default node pool, Por padão é false | `bool` | `false` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Propriedade que define se a autorização será feita via RBAC ao invés de access policies. | `bool` | `false` | no |
| <a name="input_enable_secure_transfer"></a> [enable\_secure\_transfer](#input\_enable\_secure\_transfer) | Força ou não a utilização de transferência de dados exclusivamente por HTTPS. | `bool` | `true` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Propriedade que define se máquinas virtuais do Azure têm permissão para recuperar certificados armazenados como segredos no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Propriedade que define se  o Azure Disk Encryption tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Propriedade que define se o Azure Resource Manager tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_existing_public_ip"></a> [existing\_public\_ip](#input\_existing\_public\_ip) | Usar um Public IP existente. Por padão e False | `bool` | `false` | no |
| <a name="input_file_copy_enabled"></a> [file\_copy\_enabled](#input\_file\_copy\_enabled) | O recurso de cópia de arquivo está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_gateway_name"></a> [gateway\_name](#input\_gateway\_name) | Name of virtual gateway. | `string` | n/a | yes |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Habilitar ou não Roteamento HTTP de Aplicação. Por padão é True | `bool` | `true` | no |
| <a name="input_id_ddos_plan"></a> [id\_ddos\_plan](#input\_id\_ddos\_plan) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_id_ddos_plan-spoke"></a> [id\_ddos\_plan-spoke](#input\_id\_ddos\_plan-spoke) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_img_offer"></a> [img\_offer](#input\_img\_offer) | Especifica a oferta da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_publisher"></a> [img\_publisher](#input\_img\_publisher) | Especifica o editor da imagem. | `string` | n/a | yes |
| <a name="input_img_sku"></a> [img\_sku](#input\_img\_sku) | Especifica o SKU da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_version"></a> [img\_version](#input\_img\_version) | Especifica a versão da imagem usada para criar a máquina virtual. | `string` | `"latest"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | O endereço IP estático que deve ser usado. | `string` | n/a | yes |
| <a name="input_ip_allocation"></a> [ip\_allocation](#input\_ip\_allocation) | O método de alocação usado para o endereço IP privado. O padão é Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | O nome da configuração de IP | `string` | n/a | yes |
| <a name="input_ip_connect_enabled"></a> [ip\_connect\_enabled](#input\_ip\_connect\_enabled) | O recurso IP Connect está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_ip_version_pip"></a> [ip\_version\_pip](#input\_ip\_version\_pip) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_ip_version_pip_gw"></a> [ip\_version\_pip\_gw](#input\_ip\_version\_pip\_gw) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_is_ddos_plan_enabled"></a> [is\_ddos\_plan\_enabled](#input\_is\_ddos\_plan\_enabled) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_ddos_plan_enabled-spoke"></a> [is\_ddos\_plan\_enabled-spoke](#input\_is\_ddos\_plan\_enabled-spoke) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_identity_enabled"></a> [is\_identity\_enabled](#input\_is\_identity\_enabled) | Habilitar ou não o uso de identidade gerenciada. | `bool` | `false` | no |
| <a name="input_is_public_ip_enabled"></a> [is\_public\_ip\_enabled](#input\_is\_public\_ip\_enabled) | Criar um novo Public IP para VM. Por padrão é False | `bool` | `false` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Versão do Kubernetes. Por opadão é 1.19.9 | `string` | `"1.19.9"` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Qual SKU do do blob storage é usado. | `string` | `"StorageV2"` | no |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | Nome do cofre. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_labels_default"></a> [labels\_default](#input\_labels\_default) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `map(any)` | `{}` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | Modelo de SKU do Load Balancer no cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_license_act"></a> [license\_act](#input\_license\_act) | Especifica o tipo BYOL para esta máquina virtual | `string` | n/a | yes |
| <a name="input_local_networks"></a> [local\_networks](#input\_local\_networks) | List of local virtual network connections to connect to gateway. | <pre>list(<br>    object({<br>      name            = string<br>      gateway_address = string<br>      address_space   = list(string)<br>      shared_key      = string<br>      ipsec_policy    = any<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | A região do datacenter onde seus recursos serão criados. | `string` | `"eastus2"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID do Log Analytics. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Nome do workspace do Log Analytics. É obrigatório caso `enable_log_analytics_workspace` for marcado como `true` | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Define a SKU utilizada pelo Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Define o número de dias em que os logs serão armazenados no Workspace. | `number` | `30` | no |
| <a name="input_managed_disk_type"></a> [managed\_disk\_type](#input\_managed\_disk\_type) | Especifica o tipo de disco gerenciado a ser criado. | `string` | `"Standard_LRS"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Número maximo de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_max_nodes_default"></a> [max\_nodes\_default](#input\_max\_nodes\_default) | Número maximo de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | Quantidade máxima de Pods por node (dentro do Default node). | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "1"<br>]</pre> | no |
| <a name="input_min_nodes_default"></a> [min\_nodes\_default](#input\_min\_nodes\_default) | Número de nodes do Cluster Kubernetes. | `string` | `1` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Este pool de nós deve ser usado para recursos do kube-system ou do user. Por padrão user | `list(string)` | n/a | yes |
| <a name="input_name_pool_default"></a> [name\_pool\_default](#input\_name\_pool\_default) | Nome do pool do Cluster Kubernetes. | `string` | `"agentpool"` | no |
| <a name="input_nat_gateway_ids"></a> [nat\_gateway\_ids](#input\_nat\_gateway\_ids) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_nat_gateway_ids-spoke"></a> [nat\_gateway\_ids-spoke](#input\_nat\_gateway\_ids-spoke) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_network_acls_bypass"></a> [network\_acls\_bypass](#input\_network\_acls\_bypass) | Propriedade que define se os serviços do Azure podem realizar operações no cofre. (AzureServices ou None) | `string` | `"None"` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | Ação a ser realizada quando o tráfego de rede de origem for diferente das regras especificadas. (Allow ou Deny) | `string` | `"Deny"` | no |
| <a name="input_network_acls_ip_rules"></a> [network\_acls\_ip\_rules](#input\_network\_acls\_ip\_rules) | Um ou mais endereços de IP ou blocos CIDR que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_acls_virtual_network_subnet_ids"></a> [network\_acls\_virtual\_network\_subnet\_ids](#input\_network\_acls\_virtual\_network\_subnet\_ids) | Um ou mais IDs de subnets que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Modelo de plugin de rede utilizado no Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Politicas de redes do Azure CNI clico ou azure | `string` | `"azure"` | no |
| <a name="input_network_watcher_name"></a> [network\_watcher\_name](#input\_network\_watcher\_name) | Nome do network watcher | `string` | n/a | yes |
| <a name="input_node_av_zone"></a> [node\_av\_zone](#input\_node\_av\_zone) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |
| <a name="input_node_pool"></a> [node\_pool](#input\_node\_pool) | Nome do node pool do Cluster Kubernetes. | `list(string)` | `[]` | no |
| <a name="input_node_vm_disk_size"></a> [node\_vm\_disk\_size](#input\_node\_vm\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `number` | `30` | no |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_nsg_ids-spoke"></a> [nsg\_ids-spoke](#input\_nsg\_ids-spoke) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_oms_agent_enabled"></a> [oms\_agent\_enabled](#input\_oms\_agent\_enabled) | Habilita o OMS Agent no Cluster Kubernetes. | `bool` | `true` | no |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Tipo de sistema operacional dos nodes. Aceita os valores `Windows` ou `Linux`. | `list(string)` | n/a | yes |
| <a name="input_pip_name"></a> [pip\_name](#input\_pip\_name) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_pip_name_gw"></a> [pip\_name\_gw](#input\_pip\_name\_gw) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Habilita que o cluster teha suas APIs dipostas somente para a rede interna. Por padrão é False | `bool` | `false` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Define como o endereço IP privado da interface virtual dos gateways é atribuído. As opções válidas são Static ou Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | O Agente Convidado da Máquina Virtual do Azure deve ser instalado nesta Máquina Virtual. Padrões para True. | `bool` | `true` | no |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | ID do Public IP existente, a opção existing\_public\_ip tem que estar como True. Por padão é null | `string` | `null` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Sku para criação do novo Public IP, a opção is\_public\_ip\_enabled deve ser True. Por padão é basic | `string` | `"Basic"` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Propriedade que define se a feature Purge Protection será habilitada. | `bool` | `false` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | Object ID dos grupos com acesso administrativo ao cluster Kubernetes. | `any` | `null` | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | Habilita Role Based Access Control based com Azure AD | `bool` | `null` | no |
| <a name="input_rbac_aad_client_app_id"></a> [rbac\_aad\_client\_app\_id](#input\_rbac\_aad\_client\_app\_id) | Client ID da aplicação do Azure Active Directory. | `string` | `null` | no |
| <a name="input_rbac_aad_managed"></a> [rbac\_aad\_managed](#input\_rbac\_aad\_managed) | Integração com Azure Active Directory, habilitado, significa que o Azure criará/gerenciará a entidade de Serviço usada para integração. | `bool` | `false` | no |
| <a name="input_rbac_aad_server_app_id"></a> [rbac\_aad\_server\_app\_id](#input\_rbac\_aad\_server\_app\_id) | Server ID do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_server_app_secret"></a> [rbac\_aad\_server\_app\_secret](#input\_rbac\_aad\_server\_app\_secret) | Server Secret do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_tenant_id"></a> [rbac\_aad\_tenant\_id](#input\_rbac\_aad\_tenant\_id) | ID do tenant usada para o aplicativo do Azure Active Directory. Se isso não for especificado, a ID do tenant da assinatura atual será utilizado. | `string` | `null` | no |
| <a name="input_replication"></a> [replication](#input\_replication) | Que tipo de replicação será usada pela Storage Account. | `string` | `"GRS"` | no |
| <a name="input_resource_group_names"></a> [resource\_group\_names](#input\_resource\_group\_names) | O nome do seu Resource Group | `list(string)` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Habilitar Role Based Access Control. | `bool` | `false` | no |
| <a name="input_route_tables_ids"></a> [route\_tables\_ids](#input\_route\_tables\_ids) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_route_tables_ids-spoke"></a> [route\_tables\_ids-spoke](#input\_route\_tables\_ids-spoke) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_scale_units"></a> [scale\_units](#input\_scale\_units) | O número de unidades de escala com as quais provisionar o Bastion. Por padrão e 2 | `number` | `2` | no |
| <a name="input_shareable_link_enabled"></a> [shareable\_link\_enabled](#input\_shareable\_link\_enabled) | O recurso Link compartilhável está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_sizegbdisk"></a> [sizegbdisk](#input\_sizegbdisk) | Especifica o tamanho do disco de dados em gigabyte | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU do Registro de Container. Aceita os valores `Standard`, `Premium` ou `Basic`. | `string` | `"Standard"` | no |
| <a name="input_sku_bastion_name"></a> [sku\_bastion\_name](#input\_sku\_bastion\_name) | O SKU do Bastion Host (Basic ou Standard). | `string` | n/a | yes |
| <a name="input_sku_gw"></a> [sku\_gw](#input\_sku\_gw) | Configuração do tamanho e capacidade do gateway de rede virtual. As opções válidas são Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ e VpnGw5AZ | `string` | `"VpnGw1"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Definição da SKU (standard ou premium). | `string` | n/a | yes |
| <a name="input_sku_pip"></a> [sku\_pip](#input\_sku\_pip) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_pip_gw"></a> [sku\_pip\_gw](#input\_sku\_pip\_gw) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_sku_tier_aks"></a> [sku\_tier\_aks](#input\_sku\_tier\_aks) | O nível de SKU que deve ser usado para este cluster Kubernetes. Os valores possíveis são Free e Paid. Por padãro e Free | `string` | `"Free"` | no |
| <a name="input_sku_tier_gw"></a> [sku\_tier\_gw](#input\_sku\_tier\_gw) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Quantidade de dias para retenção do 'soft delete'. (90 >= days >= 7) | `number` | `90` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Chave púclica SSH para acesso ao sistema do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | Obrigatório caso `static_website_enabled` seja `true`. Bloco que define caminho para os arquivos do website (ver exemplo de código). | `map(any)` | `{}` | no |
| <a name="input_static_website_enabled"></a> [static\_website\_enabled](#input\_static\_website\_enabled) | Especifica se o armazenamento para websites estáticos será habilitado. | `bool` | `false` | no |
| <a name="input_storacc_containers"></a> [storacc\_containers](#input\_storacc\_containers) | Utilizá-lo quando houver a necessidade de criar containers dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storacc_shares"></a> [storacc\_shares](#input\_storacc\_shares) | Utilizá-lo quando houver a necessidade de criar file shares dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Nome da Storage Account. | `string` | n/a | yes |
| <a name="input_storage_uri"></a> [storage\_uri](#input\_storage\_uri) | O Blob Endpoint da Conta de Armazenamento que deve conter os arquivos de diagnóstico da máquina virtual. | `string` | n/a | yes |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies"></a> [subnet\_enforce\_private\_link\_service\_network\_policies](#input\_subnet\_enforce\_private\_link\_service\_network\_policies) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_service\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_service\_network\_policies-spoke) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names-spoke"></a> [subnet\_names-spoke](#input\_subnet\_names-spoke) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names_aks"></a> [subnet\_names\_aks](#input\_subnet\_names\_aks) | Nome da Subnet do AKS com CNI | `string` | `""` | no |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes-spoke"></a> [subnet\_prefixes-spoke](#input\_subnet\_prefixes-spoke) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_subnet_service_endpoints-spoke"></a> [subnet\_service\_endpoints-spoke](#input\_subnet\_service\_endpoints-spoke) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_tags_acr"></a> [tags\_acr](#input\_tags\_acr) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_aks"></a> [tags\_aks](#input\_tags\_aks) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_bastion"></a> [tags\_bastion](#input\_tags\_bastion) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_dns_private"></a> [tags\_dns\_private](#input\_tags\_dns\_private) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_gw"></a> [tags\_gw](#input\_tags\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_key_vault"></a> [tags\_key\_vault](#input\_tags\_key\_vault) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_local_gw"></a> [tags\_local\_gw](#input\_tags\_local\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_log_analytcs"></a> [tags\_log\_analytcs](#input\_tags\_log\_analytcs) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_network_watcher"></a> [tags\_network\_watcher](#input\_tags\_network\_watcher) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip"></a> [tags\_public\_ip](#input\_tags\_public\_ip) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip_gw"></a> [tags\_public\_ip\_gw](#input\_tags\_public\_ip\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_rg"></a> [tags\_rg](#input\_tags\_rg) | Lista de mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_tags_storage"></a> [tags\_storage](#input\_tags\_storage) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vm-win"></a> [tags\_vm-win](#input\_tags\_vm-win) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_hub"></a> [tags\_vnet\_hub](#input\_tags\_vnet\_hub) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_spoke"></a> [tags\_vnet\_spoke](#input\_tags\_vnet\_spoke) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Que tipo de performance espera-se. Aceita os valores `Standard` e `Premium`. | `string` | `"Standard"` | no |
| <a name="input_tunneling_enabled"></a> [tunneling\_enabled](#input\_tunneling\_enabled) | O recurso Tunneling está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_type_gw"></a> [type\_gw](#input\_type\_gw) | O tipo do Gateway de Rede Virtual. As opções válidas são ExpressRoute ou Vpn | `string` | `"Vpn"` | no |
| <a name="input_type_local_gw"></a> [type\_local\_gw](#input\_type\_local\_gw) | O tipo de conexão. As opções válidas são ExpressRoute, IPsec ou Vnet2Vnet | `string` | `"IPsec"` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Usado para especificar se o UltraSSD está habilitado no pool de nós padrão. Default é false. | `bool` | `false` | no |
| <a name="input_use_network_existing_to_peering"></a> [use\_network\_existing\_to\_peering](#input\_use\_network\_existing\_to\_peering) | Criação de peering entre vnets que ja existem selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | Controla se os gateways remotos podem ser utilizados na rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Especifica o nome da Máquina Virtual. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size da VM do default node, por padrão Standard\_D2\_v2 | `list(string)` | <pre>[<br>  "Standard_D2_v2"<br>]</pre> | no |
| <a name="input_vm_size_default"></a> [vm\_size\_default](#input\_vm\_size\_default) | Size da VM do default node | `string` | `"Standard_D2_v2"` | no |
| <a name="input_vm_size_win"></a> [vm\_size\_win](#input\_vm\_size\_win) | Especifica o tamanho da Máquina Virtual | `string` | n/a | yes |
| <a name="input_vnet_links"></a> [vnet\_links](#input\_vnet\_links) | Esses Links habilitam a resolução e o registro de DNS dentro das Redes Virtuais do Azure usando o DNS Privado do Azure. | <pre>list(object({<br>    name                 = string<br>    virtual_network_name = string<br>    registration_enabled = bool<br>    rg_name              = string<br>  }))</pre> | `[]` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vnet_name-spoke"></a> [vnet\_name-spoke](#input\_vnet\_name-spoke) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vpn_type_gw"></a> [vpn\_type\_gw](#input\_vpn\_type\_gw) | O tipo de roteamento do Virtual Network Gateway. As opções válidas são RouteBased ou PolicyBased | `string` | `"RouteBased"` | no |
| <a name="input_windows_admin_password"></a> [windows\_admin\_password](#input\_windows\_admin\_password) | Senha do usuario admin do sitema windows | `string` | n/a | yes |
| <a name="input_windows_admin_username"></a> [windows\_admin\_username](#input\_windows\_admin\_username) | Usuário administrador de sistemas windows. Por padrão Solonetwork | `string` | `"Solonetwork"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | n/a |
| <a name="output_access_policy"></a> [access\_policy](#output\_access\_policy) | n/a |
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | n/a |
| <a name="output_analytics_id"></a> [analytics\_id](#output\_analytics\_id) | n/a |
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | n/a |
| <a name="output_azure_bastion_host_id"></a> [azure\_bastion\_host\_id](#output\_azure\_bastion\_host\_id) | n/a |
| <a name="output_azure_bastion_host_pip"></a> [azure\_bastion\_host\_pip](#output\_azure\_bastion\_host\_pip) | n/a |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | n/a |
| <a name="output_gateway_id"></a> [gateway\_id](#output\_gateway\_id) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | n/a |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | n/a |
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | n/a |
| <a name="output_network_watcher_location"></a> [network\_watcher\_location](#output\_network\_watcher\_location) | n/a |
| <a name="output_network_watcher_name"></a> [network\_watcher\_name](#output\_network\_watcher\_name) | n/a |
| <a name="output_pip_name"></a> [pip\_name](#output\_pip\_name) | n/a |
| <a name="output_pip_vpn_name"></a> [pip\_vpn\_name](#output\_pip\_vpn\_name) | n/a |
| <a name="output_rg_location"></a> [rg\_location](#output\_rg\_location) | n/a |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | n/a |
| <a name="output_storage_access_key"></a> [storage\_access\_key](#output\_storage\_access\_key) | n/a |
| <a name="output_storage_account_container"></a> [storage\_account\_container](#output\_storage\_account\_container) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
| <a name="output_storage_account_primary_web_host"></a> [storage\_account\_primary\_web\_host](#output\_storage\_account\_primary\_web\_host) | n/a |
| <a name="output_storage_account_url"></a> [storage\_account\_url](#output\_storage\_account\_url) | n/a |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | n/a |
| <a name="output_vm_ip"></a> [vm\_ip](#output\_vm\_ip) | n/a |
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | n/a |
| <a name="output_vnet_address_space-spoke"></a> [vnet\_address\_space-spoke](#output\_vnet\_address\_space-spoke) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |
| <a name="output_vnet_name-spoke"></a> [vnet\_name-spoke](#output\_vnet\_name-spoke) | n/a |
| <a name="output_vnet_subnet_names"></a> [vnet\_subnet\_names](#output\_vnet\_subnet\_names) | n/a |
| <a name="output_vnet_subnet_names-spoke"></a> [vnet\_subnet\_names-spoke](#output\_vnet\_subnet\_names-spoke) | n/a |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.29.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.27.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.13.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acr"></a> [acr](#module\_acr) | ../../modules/acr | n/a |
| <a name="module_aks"></a> [aks](#module\_aks) | ../../modules/aks | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ../../modules/bastion | n/a |
| <a name="module_dns_private"></a> [dns\_private](#module\_dns\_private) | ../../modules/dns/private | n/a |
| <a name="module_gatway_vpn"></a> [gatway\_vpn](#module\_gatway\_vpn) | ../../modules/network_gateway | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../../modules/key_vault | n/a |
| <a name="module_key_vault_access_policy"></a> [key\_vault\_access\_policy](#module\_key\_vault\_access\_policy) | ../../modules/access_policy | n/a |
| <a name="module_local_gw"></a> [local\_gw](#module\_local\_gw) | ../../modules/local_network_gateway | n/a |
| <a name="module_network_watcher"></a> [network\_watcher](#module\_network\_watcher) | ../../modules/network_watcher | n/a |
| <a name="module_pip"></a> [pip](#module\_pip) | ../../modules/pip | n/a |
| <a name="module_pip_vpn"></a> [pip\_vpn](#module\_pip\_vpn) | ../../modules/pip | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage | n/a |
| <a name="module_vm-win"></a> [vm-win](#module\_vm-win) | ../../modules/vm-windows | n/a |
| <a name="module_vnet-hub"></a> [vnet-hub](#module\_vnet-hub) | ../../modules/vnet | n/a |
| <a name="module_vnet-spoke"></a> [vnet-spoke](#module\_vnet-spoke) | ../../modules/vnet | n/a |
| <a name="module_wks_log"></a> [wks\_log](#module\_wks\_log) | ../../modules/log_analytics | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | Permite que você gerencie os Registros A de DNS no DNS Privado do Azure. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | n/a | `list(any)` | `[]` | no |
| <a name="input_acr_enable_admin"></a> [acr\_enable\_admin](#input\_acr\_enable\_admin) | Habilita usuário administrativo no Azure Container Registry | `string` | n/a | yes |
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | Nome do Registro de Container. Precisa ser um nome único porque a partir daqui será gerado o nome do registry. | `string` | n/a | yes |
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_address_space-spoke"></a> [address\_space-spoke](#input\_address\_space-spoke) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_admin_linux"></a> [admin\_linux](#input\_admin\_linux) | Usuário administrador de sistemas Linux | `string` | n/a | yes |
| <a name="input_admin_win_pass"></a> [admin\_win\_pass](#input\_admin\_win\_pass) | A senha associada à conta do administrador local. | `string` | n/a | yes |
| <a name="input_admin_win_username"></a> [admin\_win\_username](#input\_admin\_win\_username) | Especifica o nome da conta do administrador local. | `string` | n/a | yes |
| <a name="input_agent_count"></a> [agent\_count](#input\_agent\_count) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_agent_count_default"></a> [agent\_count\_default](#input\_agent\_count\_default) | Número de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_aks_dns_ip"></a> [aks\_dns\_ip](#input\_aks\_dns\_ip) | IP do DNS (deve estar dentro do range de IP do `aks_network_cidr`). | `string` | n/a | yes |
| <a name="input_aks_docker_bridge"></a> [aks\_docker\_bridge](#input\_aks\_docker\_bridge) | Endereço CIDR para ser usado como Docker Bridge. | `string` | n/a | yes |
| <a name="input_aks_enable_attach_acr"></a> [aks\_enable\_attach\_acr](#input\_aks\_enable\_attach\_acr) | Força o attach ou não do Kubernetes Services com o Azure Container Services (Obrigatório verificar a documentação adequada) | `bool` | n/a | yes |
| <a name="input_aks_network_cidr"></a> [aks\_network\_cidr](#input\_aks\_network\_cidr) | Endereço CIDR da rede do Kubernetes Service. | `string` | n/a | yes |
| <a name="input_aks_service_principal_app_id"></a> [aks\_service\_principal\_app\_id](#input\_aks\_service\_principal\_app\_id) | Credencial para conexão com service principal. | `string` | n/a | yes |
| <a name="input_aks_service_principal_client_secret"></a> [aks\_service\_principal\_client\_secret](#input\_aks\_service\_principal\_client\_secret) | Credencial para conexão com service principal | `string` | n/a | yes |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Metodo de aloação do Public, a opção is\_public\_ip\_enabled deve ser True. Por padão é static | `string` | `"Static"` | no |
| <a name="input_allocation_method_pip"></a> [allocation\_method\_pip](#input\_allocation\_method\_pip) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allocation_method_pip_gw"></a> [allocation\_method\_pip\_gw](#input\_allocation\_method\_pip\_gw) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allow_forwarded_traffic"></a> [allow\_forwarded\_traffic](#input\_allow\_forwarded\_traffic) | Controla se o tráfego encaminhado de VMs na rede virtual remota é permitido. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_gateway_transit"></a> [allow\_gateway\_transit](#input\_allow\_gateway\_transit) | Os controles gatewayLinks podem ser usados ​​no link da rede virtual remota para a rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_virtual_network_access"></a> [allow\_virtual\_network\_access](#input\_allow\_virtual\_network\_access) | Controla se as VMs na rede virtual remota podem acessar as VMs na rede virtual local. O padrão é true. | `bool` | `true` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | Range de IPs que são liberados para gerência dos server nodes. | `set(string)` | `null` | no |
| <a name="input_auto_scaling_default"></a> [auto\_scaling\_default](#input\_auto\_scaling\_default) | Ativa o auto scaling dos nopdes linux. por padrão false. | `bool` | `false` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Habilitar ou não o add-on de Azure Policy para Kubernetes. Por padão é False | `bool` | `false` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Especifica o nome do Bastion Host | `string` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | specifica os requisitos de cache para o disco do sistema operaciona. Por padrão é ReadOnly | `string` | `"ReadOnly"` | no |
| <a name="input_client_configuration"></a> [client\_configuration](#input\_client\_configuration) | If set it will activate point-to-site configuration. | <pre>object({<br>    address_space = string<br>    protocols     = list(string)<br>    certificate   = string<br>  })</pre> | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | Permite que você gerencie registros CNAME de DNS no DNS privado do Azure. | <pre>list(object({<br>    name   = string<br>    ttl    = number<br>    record = string<br>  }))</pre> | `[]` | no |
| <a name="input_copy_paste_enabled"></a> [copy\_paste\_enabled](#input\_copy\_paste\_enabled) | O recurso Copiar/Colar está habilitado para o Bastion. Padrões para True | `bool` | `true` | no |
| <a name="input_create_vnet_peering"></a> [create\_vnet\_peering](#input\_create\_vnet\_peering) | Criação de peering entre vnets selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_disable_local_account"></a> [disable\_local\_account](#input\_disable\_local\_account) | Desabilita o acesso ao cluster com usuários locais. Por padrão é True | `bool` | `true` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Prefixo DNS do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_dns_private_name"></a> [dns\_private\_name](#input\_dns\_private\_name) | Especifica o nome do DNS privado | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers-spoke"></a> [dns\_servers-spoke](#input\_dns\_servers-spoke) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers_to_nic"></a> [dns\_servers\_to\_nic](#input\_dns\_servers\_to\_nic) | Dns Server para criação nic. | `list(string)` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Ativa o auto scaling dos nopdes linux. por padrão false | `bool` | `false` | no |
| <a name="input_enable_automatic_upgrades"></a> [enable\_automatic\_upgrades](#input\_enable\_automatic\_upgrades) | As atualizações automáticas estão habilitadas nesta máquina virtual. Padrões para false. | `bool` | `"false"` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | Habilita criptografia no default node pool, Por padão é false | `bool` | `false` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Propriedade que define se a autorização será feita via RBAC ao invés de access policies. | `bool` | `false` | no |
| <a name="input_enable_secure_transfer"></a> [enable\_secure\_transfer](#input\_enable\_secure\_transfer) | Força ou não a utilização de transferência de dados exclusivamente por HTTPS. | `bool` | `true` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Propriedade que define se máquinas virtuais do Azure têm permissão para recuperar certificados armazenados como segredos no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Propriedade que define se  o Azure Disk Encryption tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Propriedade que define se o Azure Resource Manager tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_existing_public_ip"></a> [existing\_public\_ip](#input\_existing\_public\_ip) | Usar um Public IP existente. Por padão e False | `bool` | `false` | no |
| <a name="input_file_copy_enabled"></a> [file\_copy\_enabled](#input\_file\_copy\_enabled) | O recurso de cópia de arquivo está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_gateway_name"></a> [gateway\_name](#input\_gateway\_name) | Name of virtual gateway. | `string` | n/a | yes |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Habilitar ou não Roteamento HTTP de Aplicação. Por padão é True | `bool` | `true` | no |
| <a name="input_id_ddos_plan"></a> [id\_ddos\_plan](#input\_id\_ddos\_plan) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_id_ddos_plan-spoke"></a> [id\_ddos\_plan-spoke](#input\_id\_ddos\_plan-spoke) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_img_offer"></a> [img\_offer](#input\_img\_offer) | Especifica a oferta da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_publisher"></a> [img\_publisher](#input\_img\_publisher) | Especifica o editor da imagem. | `string` | n/a | yes |
| <a name="input_img_sku"></a> [img\_sku](#input\_img\_sku) | Especifica o SKU da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_version"></a> [img\_version](#input\_img\_version) | Especifica a versão da imagem usada para criar a máquina virtual. | `string` | `"latest"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | O endereço IP estático que deve ser usado. | `string` | n/a | yes |
| <a name="input_ip_allocation"></a> [ip\_allocation](#input\_ip\_allocation) | O método de alocação usado para o endereço IP privado. O padão é Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | O nome da configuração de IP | `string` | n/a | yes |
| <a name="input_ip_connect_enabled"></a> [ip\_connect\_enabled](#input\_ip\_connect\_enabled) | O recurso IP Connect está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_ip_version_pip"></a> [ip\_version\_pip](#input\_ip\_version\_pip) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_ip_version_pip_gw"></a> [ip\_version\_pip\_gw](#input\_ip\_version\_pip\_gw) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_is_ddos_plan_enabled"></a> [is\_ddos\_plan\_enabled](#input\_is\_ddos\_plan\_enabled) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_ddos_plan_enabled-spoke"></a> [is\_ddos\_plan\_enabled-spoke](#input\_is\_ddos\_plan\_enabled-spoke) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_identity_enabled"></a> [is\_identity\_enabled](#input\_is\_identity\_enabled) | Habilitar ou não o uso de identidade gerenciada. | `bool` | `false` | no |
| <a name="input_is_public_ip_enabled"></a> [is\_public\_ip\_enabled](#input\_is\_public\_ip\_enabled) | Criar um novo Public IP para VM. Por padrão é False | `bool` | `false` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Versão do Kubernetes. Por opadão é 1.19.9 | `string` | `"1.19.9"` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Qual SKU do do blob storage é usado. | `string` | `"StorageV2"` | no |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | Nome do cofre. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_labels_default"></a> [labels\_default](#input\_labels\_default) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `map(any)` | `{}` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | Modelo de SKU do Load Balancer no cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_license_act"></a> [license\_act](#input\_license\_act) | Especifica o tipo BYOL para esta máquina virtual | `string` | n/a | yes |
| <a name="input_local_networks"></a> [local\_networks](#input\_local\_networks) | List of local virtual network connections to connect to gateway. | <pre>list(<br>    object({<br>      name            = string<br>      gateway_address = string<br>      address_space   = list(string)<br>      shared_key      = string<br>      ipsec_policy    = any<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | A região do datacenter onde seus recursos serão criados. | `string` | `"eastus2"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID do Log Analytics. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Nome do workspace do Log Analytics. É obrigatório caso `enable_log_analytics_workspace` for marcado como `true` | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Define a SKU utilizada pelo Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Define o número de dias em que os logs serão armazenados no Workspace. | `number` | `30` | no |
| <a name="input_managed_disk_type"></a> [managed\_disk\_type](#input\_managed\_disk\_type) | Especifica o tipo de disco gerenciado a ser criado. | `string` | `"Standard_LRS"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Número maximo de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_max_nodes_default"></a> [max\_nodes\_default](#input\_max\_nodes\_default) | Número maximo de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | Quantidade máxima de Pods por node (dentro do Default node). | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "1"<br>]</pre> | no |
| <a name="input_min_nodes_default"></a> [min\_nodes\_default](#input\_min\_nodes\_default) | Número de nodes do Cluster Kubernetes. | `string` | `1` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Este pool de nós deve ser usado para recursos do kube-system ou do user. Por padrão user | `list(string)` | n/a | yes |
| <a name="input_name_pool_default"></a> [name\_pool\_default](#input\_name\_pool\_default) | Nome do pool do Cluster Kubernetes. | `string` | `"agentpool"` | no |
| <a name="input_nat_gateway_ids"></a> [nat\_gateway\_ids](#input\_nat\_gateway\_ids) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_nat_gateway_ids-spoke"></a> [nat\_gateway\_ids-spoke](#input\_nat\_gateway\_ids-spoke) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_network_acls_bypass"></a> [network\_acls\_bypass](#input\_network\_acls\_bypass) | Propriedade que define se os serviços do Azure podem realizar operações no cofre. (AzureServices ou None) | `string` | `"None"` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | Ação a ser realizada quando o tráfego de rede de origem for diferente das regras especificadas. (Allow ou Deny) | `string` | `"Deny"` | no |
| <a name="input_network_acls_ip_rules"></a> [network\_acls\_ip\_rules](#input\_network\_acls\_ip\_rules) | Um ou mais endereços de IP ou blocos CIDR que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_acls_virtual_network_subnet_ids"></a> [network\_acls\_virtual\_network\_subnet\_ids](#input\_network\_acls\_virtual\_network\_subnet\_ids) | Um ou mais IDs de subnets que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Modelo de plugin de rede utilizado no Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Politicas de redes do Azure CNI clico ou azure | `string` | `"azure"` | no |
| <a name="input_network_watcher_name"></a> [network\_watcher\_name](#input\_network\_watcher\_name) | Nome do network watcher | `string` | n/a | yes |
| <a name="input_node_av_zone"></a> [node\_av\_zone](#input\_node\_av\_zone) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |
| <a name="input_node_pool"></a> [node\_pool](#input\_node\_pool) | Nome do node pool do Cluster Kubernetes. | `list(string)` | `[]` | no |
| <a name="input_node_vm_disk_size"></a> [node\_vm\_disk\_size](#input\_node\_vm\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `number` | `30` | no |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_nsg_ids-spoke"></a> [nsg\_ids-spoke](#input\_nsg\_ids-spoke) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_oms_agent_enabled"></a> [oms\_agent\_enabled](#input\_oms\_agent\_enabled) | Habilita o OMS Agent no Cluster Kubernetes. | `bool` | `true` | no |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Tipo de sistema operacional dos nodes. Aceita os valores `Windows` ou `Linux`. | `list(string)` | n/a | yes |
| <a name="input_pip_name"></a> [pip\_name](#input\_pip\_name) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_pip_name_gw"></a> [pip\_name\_gw](#input\_pip\_name\_gw) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Habilita que o cluster teha suas APIs dipostas somente para a rede interna. Por padrão é False | `bool` | `false` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Define como o endereço IP privado da interface virtual dos gateways é atribuído. As opções válidas são Static ou Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | O Agente Convidado da Máquina Virtual do Azure deve ser instalado nesta Máquina Virtual. Padrões para True. | `bool` | `true` | no |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | ID do Public IP existente, a opção existing\_public\_ip tem que estar como True. Por padão é null | `string` | `null` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Sku para criação do novo Public IP, a opção is\_public\_ip\_enabled deve ser True. Por padão é basic | `string` | `"Basic"` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Propriedade que define se a feature Purge Protection será habilitada. | `bool` | `false` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | Object ID dos grupos com acesso administrativo ao cluster Kubernetes. | `any` | `null` | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | Habilita Role Based Access Control based com Azure AD | `bool` | `null` | no |
| <a name="input_rbac_aad_client_app_id"></a> [rbac\_aad\_client\_app\_id](#input\_rbac\_aad\_client\_app\_id) | Client ID da aplicação do Azure Active Directory. | `string` | `null` | no |
| <a name="input_rbac_aad_managed"></a> [rbac\_aad\_managed](#input\_rbac\_aad\_managed) | Integração com Azure Active Directory, habilitado, significa que o Azure criará/gerenciará a entidade de Serviço usada para integração. | `bool` | `false` | no |
| <a name="input_rbac_aad_server_app_id"></a> [rbac\_aad\_server\_app\_id](#input\_rbac\_aad\_server\_app\_id) | Server ID do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_server_app_secret"></a> [rbac\_aad\_server\_app\_secret](#input\_rbac\_aad\_server\_app\_secret) | Server Secret do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_tenant_id"></a> [rbac\_aad\_tenant\_id](#input\_rbac\_aad\_tenant\_id) | ID do tenant usada para o aplicativo do Azure Active Directory. Se isso não for especificado, a ID do tenant da assinatura atual será utilizado. | `string` | `null` | no |
| <a name="input_replication"></a> [replication](#input\_replication) | Que tipo de replicação será usada pela Storage Account. | `string` | `"GRS"` | no |
| <a name="input_resource_group_names"></a> [resource\_group\_names](#input\_resource\_group\_names) | O nome do seu Resource Group | `list(string)` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Habilitar Role Based Access Control. | `bool` | `false` | no |
| <a name="input_route_tables_ids"></a> [route\_tables\_ids](#input\_route\_tables\_ids) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_route_tables_ids-spoke"></a> [route\_tables\_ids-spoke](#input\_route\_tables\_ids-spoke) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_scale_units"></a> [scale\_units](#input\_scale\_units) | O número de unidades de escala com as quais provisionar o Bastion. Por padrão e 2 | `number` | `2` | no |
| <a name="input_shareable_link_enabled"></a> [shareable\_link\_enabled](#input\_shareable\_link\_enabled) | O recurso Link compartilhável está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_sizegbdisk"></a> [sizegbdisk](#input\_sizegbdisk) | Especifica o tamanho do disco de dados em gigabyte | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU do Registro de Container. Aceita os valores `Standard`, `Premium` ou `Basic`. | `string` | `"Standard"` | no |
| <a name="input_sku_bastion_name"></a> [sku\_bastion\_name](#input\_sku\_bastion\_name) | O SKU do Bastion Host (Basic ou Standard). | `string` | n/a | yes |
| <a name="input_sku_gw"></a> [sku\_gw](#input\_sku\_gw) | Configuração do tamanho e capacidade do gateway de rede virtual. As opções válidas são Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ e VpnGw5AZ | `string` | `"VpnGw1"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Definição da SKU (standard ou premium). | `string` | n/a | yes |
| <a name="input_sku_pip"></a> [sku\_pip](#input\_sku\_pip) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_pip_gw"></a> [sku\_pip\_gw](#input\_sku\_pip\_gw) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_sku_tier_aks"></a> [sku\_tier\_aks](#input\_sku\_tier\_aks) | O nível de SKU que deve ser usado para este cluster Kubernetes. Os valores possíveis são Free e Paid. Por padãro e Free | `string` | `"Free"` | no |
| <a name="input_sku_tier_gw"></a> [sku\_tier\_gw](#input\_sku\_tier\_gw) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Quantidade de dias para retenção do 'soft delete'. (90 >= days >= 7) | `number` | `90` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Chave púclica SSH para acesso ao sistema do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | Obrigatório caso `static_website_enabled` seja `true`. Bloco que define caminho para os arquivos do website (ver exemplo de código). | `map(any)` | `{}` | no |
| <a name="input_static_website_enabled"></a> [static\_website\_enabled](#input\_static\_website\_enabled) | Especifica se o armazenamento para websites estáticos será habilitado. | `bool` | `false` | no |
| <a name="input_storacc_containers"></a> [storacc\_containers](#input\_storacc\_containers) | Utilizá-lo quando houver a necessidade de criar containers dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storacc_shares"></a> [storacc\_shares](#input\_storacc\_shares) | Utilizá-lo quando houver a necessidade de criar file shares dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Nome da Storage Account. | `string` | n/a | yes |
| <a name="input_storage_uri"></a> [storage\_uri](#input\_storage\_uri) | O Blob Endpoint da Conta de Armazenamento que deve conter os arquivos de diagnóstico da máquina virtual. | `string` | n/a | yes |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies"></a> [subnet\_enforce\_private\_link\_service\_network\_policies](#input\_subnet\_enforce\_private\_link\_service\_network\_policies) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_service\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_service\_network\_policies-spoke) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names-spoke"></a> [subnet\_names-spoke](#input\_subnet\_names-spoke) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names_aks"></a> [subnet\_names\_aks](#input\_subnet\_names\_aks) | Nome da Subnet do AKS com CNI | `string` | `""` | no |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes-spoke"></a> [subnet\_prefixes-spoke](#input\_subnet\_prefixes-spoke) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_subnet_service_endpoints-spoke"></a> [subnet\_service\_endpoints-spoke](#input\_subnet\_service\_endpoints-spoke) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_tags_acr"></a> [tags\_acr](#input\_tags\_acr) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_aks"></a> [tags\_aks](#input\_tags\_aks) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_bastion"></a> [tags\_bastion](#input\_tags\_bastion) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_dns_private"></a> [tags\_dns\_private](#input\_tags\_dns\_private) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_gw"></a> [tags\_gw](#input\_tags\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_key_vault"></a> [tags\_key\_vault](#input\_tags\_key\_vault) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_local_gw"></a> [tags\_local\_gw](#input\_tags\_local\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_log_analytcs"></a> [tags\_log\_analytcs](#input\_tags\_log\_analytcs) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_network_watcher"></a> [tags\_network\_watcher](#input\_tags\_network\_watcher) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip"></a> [tags\_public\_ip](#input\_tags\_public\_ip) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip_gw"></a> [tags\_public\_ip\_gw](#input\_tags\_public\_ip\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_rg"></a> [tags\_rg](#input\_tags\_rg) | Lista de mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_tags_storage"></a> [tags\_storage](#input\_tags\_storage) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vm-win"></a> [tags\_vm-win](#input\_tags\_vm-win) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_hub"></a> [tags\_vnet\_hub](#input\_tags\_vnet\_hub) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_spoke"></a> [tags\_vnet\_spoke](#input\_tags\_vnet\_spoke) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Que tipo de performance espera-se. Aceita os valores `Standard` e `Premium`. | `string` | `"Standard"` | no |
| <a name="input_tunneling_enabled"></a> [tunneling\_enabled](#input\_tunneling\_enabled) | O recurso Tunneling está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_type_gw"></a> [type\_gw](#input\_type\_gw) | O tipo do Gateway de Rede Virtual. As opções válidas são ExpressRoute ou Vpn | `string` | `"Vpn"` | no |
| <a name="input_type_local_gw"></a> [type\_local\_gw](#input\_type\_local\_gw) | O tipo de conexão. As opções válidas são ExpressRoute, IPsec ou Vnet2Vnet | `string` | `"IPsec"` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Usado para especificar se o UltraSSD está habilitado no pool de nós padrão. Default é false. | `bool` | `false` | no |
| <a name="input_use_network_existing_to_peering"></a> [use\_network\_existing\_to\_peering](#input\_use\_network\_existing\_to\_peering) | Criação de peering entre vnets que ja existem selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | Controla se os gateways remotos podem ser utilizados na rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Especifica o nome da Máquina Virtual. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size da VM do default node, por padrão Standard\_D2\_v2 | `list(string)` | <pre>[<br>  "Standard_D2_v2"<br>]</pre> | no |
| <a name="input_vm_size_default"></a> [vm\_size\_default](#input\_vm\_size\_default) | Size da VM do default node | `string` | `"Standard_D2_v2"` | no |
| <a name="input_vm_size_win"></a> [vm\_size\_win](#input\_vm\_size\_win) | Especifica o tamanho da Máquina Virtual | `string` | n/a | yes |
| <a name="input_vnet_links"></a> [vnet\_links](#input\_vnet\_links) | Esses Links habilitam a resolução e o registro de DNS dentro das Redes Virtuais do Azure usando o DNS Privado do Azure. | <pre>list(object({<br>    name                 = string<br>    virtual_network_name = string<br>    registration_enabled = bool<br>    rg_name              = string<br>  }))</pre> | `[]` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vnet_name-spoke"></a> [vnet\_name-spoke](#input\_vnet\_name-spoke) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vpn_type_gw"></a> [vpn\_type\_gw](#input\_vpn\_type\_gw) | O tipo de roteamento do Virtual Network Gateway. As opções válidas são RouteBased ou PolicyBased | `string` | `"RouteBased"` | no |
| <a name="input_windows_admin_password"></a> [windows\_admin\_password](#input\_windows\_admin\_password) | Senha do usuario admin do sitema windows | `string` | n/a | yes |
| <a name="input_windows_admin_username"></a> [windows\_admin\_username](#input\_windows\_admin\_username) | Usuário administrador de sistemas windows. Por padrão Solonetwork | `string` | `"Solonetwork"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | n/a |
| <a name="output_access_policy"></a> [access\_policy](#output\_access\_policy) | n/a |
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | n/a |
| <a name="output_analytics_id"></a> [analytics\_id](#output\_analytics\_id) | n/a |
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | n/a |
| <a name="output_azure_bastion_host_id"></a> [azure\_bastion\_host\_id](#output\_azure\_bastion\_host\_id) | n/a |
| <a name="output_azure_bastion_host_pip"></a> [azure\_bastion\_host\_pip](#output\_azure\_bastion\_host\_pip) | n/a |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | n/a |
| <a name="output_gateway_id"></a> [gateway\_id](#output\_gateway\_id) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | n/a |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | n/a |
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | n/a |
| <a name="output_network_watcher_location"></a> [network\_watcher\_location](#output\_network\_watcher\_location) | n/a |
| <a name="output_network_watcher_name"></a> [network\_watcher\_name](#output\_network\_watcher\_name) | n/a |
| <a name="output_pip_name"></a> [pip\_name](#output\_pip\_name) | n/a |
| <a name="output_pip_vpn_name"></a> [pip\_vpn\_name](#output\_pip\_vpn\_name) | n/a |
| <a name="output_rg_location"></a> [rg\_location](#output\_rg\_location) | n/a |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | n/a |
| <a name="output_storage_access_key"></a> [storage\_access\_key](#output\_storage\_access\_key) | n/a |
| <a name="output_storage_account_container"></a> [storage\_account\_container](#output\_storage\_account\_container) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
| <a name="output_storage_account_primary_web_host"></a> [storage\_account\_primary\_web\_host](#output\_storage\_account\_primary\_web\_host) | n/a |
| <a name="output_storage_account_url"></a> [storage\_account\_url](#output\_storage\_account\_url) | n/a |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | n/a |
| <a name="output_vm_ip"></a> [vm\_ip](#output\_vm\_ip) | n/a |
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | n/a |
| <a name="output_vnet_address_space-spoke"></a> [vnet\_address\_space-spoke](#output\_vnet\_address\_space-spoke) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |
| <a name="output_vnet_name-spoke"></a> [vnet\_name-spoke](#output\_vnet\_name-spoke) | n/a |
| <a name="output_vnet_subnet_names"></a> [vnet\_subnet\_names](#output\_vnet\_subnet\_names) | n/a |
| <a name="output_vnet_subnet_names-spoke"></a> [vnet\_subnet\_names-spoke](#output\_vnet\_subnet\_names-spoke) | n/a |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.29.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.27.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.13.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acr"></a> [acr](#module\_acr) | ../../modules/acr | n/a |
| <a name="module_aks"></a> [aks](#module\_aks) | ../../modules/aks | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ../../modules/bastion | n/a |
| <a name="module_dns_private"></a> [dns\_private](#module\_dns\_private) | ../../modules/dns/private | n/a |
| <a name="module_gatway_vpn"></a> [gatway\_vpn](#module\_gatway\_vpn) | ../../modules/network_gateway | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../../modules/key_vault | n/a |
| <a name="module_key_vault_access_policy"></a> [key\_vault\_access\_policy](#module\_key\_vault\_access\_policy) | ../../modules/access_policy | n/a |
| <a name="module_local_gw"></a> [local\_gw](#module\_local\_gw) | ../../modules/local_network_gateway | n/a |
| <a name="module_network_watcher"></a> [network\_watcher](#module\_network\_watcher) | ../../modules/network_watcher | n/a |
| <a name="module_pip"></a> [pip](#module\_pip) | ../../modules/pip | n/a |
| <a name="module_pip_vpn"></a> [pip\_vpn](#module\_pip\_vpn) | ../../modules/pip | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage | n/a |
| <a name="module_vm-win"></a> [vm-win](#module\_vm-win) | ../../modules/vm-windows | n/a |
| <a name="module_vnet-hub"></a> [vnet-hub](#module\_vnet-hub) | ../../modules/vnet | n/a |
| <a name="module_vnet-spoke"></a> [vnet-spoke](#module\_vnet-spoke) | ../../modules/vnet | n/a |
| <a name="module_wks_log"></a> [wks\_log](#module\_wks\_log) | ../../modules/log_analytics | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | Permite que você gerencie os Registros A de DNS no DNS Privado do Azure. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | n/a | `list(any)` | `[]` | no |
| <a name="input_acr_enable_admin"></a> [acr\_enable\_admin](#input\_acr\_enable\_admin) | Habilita usuário administrativo no Azure Container Registry | `string` | n/a | yes |
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | Nome do Registro de Container. Precisa ser um nome único porque a partir daqui será gerado o nome do registry. | `string` | n/a | yes |
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_address_space-spoke"></a> [address\_space-spoke](#input\_address\_space-spoke) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_admin_linux"></a> [admin\_linux](#input\_admin\_linux) | Usuário administrador de sistemas Linux | `string` | n/a | yes |
| <a name="input_admin_win_pass"></a> [admin\_win\_pass](#input\_admin\_win\_pass) | A senha associada à conta do administrador local. | `string` | n/a | yes |
| <a name="input_admin_win_username"></a> [admin\_win\_username](#input\_admin\_win\_username) | Especifica o nome da conta do administrador local. | `string` | n/a | yes |
| <a name="input_agent_count"></a> [agent\_count](#input\_agent\_count) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_agent_count_default"></a> [agent\_count\_default](#input\_agent\_count\_default) | Número de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_aks_dns_ip"></a> [aks\_dns\_ip](#input\_aks\_dns\_ip) | IP do DNS (deve estar dentro do range de IP do `aks_network_cidr`). | `string` | n/a | yes |
| <a name="input_aks_docker_bridge"></a> [aks\_docker\_bridge](#input\_aks\_docker\_bridge) | Endereço CIDR para ser usado como Docker Bridge. | `string` | n/a | yes |
| <a name="input_aks_enable_attach_acr"></a> [aks\_enable\_attach\_acr](#input\_aks\_enable\_attach\_acr) | Força o attach ou não do Kubernetes Services com o Azure Container Services (Obrigatório verificar a documentação adequada) | `bool` | n/a | yes |
| <a name="input_aks_network_cidr"></a> [aks\_network\_cidr](#input\_aks\_network\_cidr) | Endereço CIDR da rede do Kubernetes Service. | `string` | n/a | yes |
| <a name="input_aks_service_principal_app_id"></a> [aks\_service\_principal\_app\_id](#input\_aks\_service\_principal\_app\_id) | Credencial para conexão com service principal. | `string` | n/a | yes |
| <a name="input_aks_service_principal_client_secret"></a> [aks\_service\_principal\_client\_secret](#input\_aks\_service\_principal\_client\_secret) | Credencial para conexão com service principal | `string` | n/a | yes |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Metodo de aloação do Public, a opção is\_public\_ip\_enabled deve ser True. Por padão é static | `string` | `"Static"` | no |
| <a name="input_allocation_method_pip"></a> [allocation\_method\_pip](#input\_allocation\_method\_pip) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allocation_method_pip_gw"></a> [allocation\_method\_pip\_gw](#input\_allocation\_method\_pip\_gw) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allow_forwarded_traffic"></a> [allow\_forwarded\_traffic](#input\_allow\_forwarded\_traffic) | Controla se o tráfego encaminhado de VMs na rede virtual remota é permitido. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_gateway_transit"></a> [allow\_gateway\_transit](#input\_allow\_gateway\_transit) | Os controles gatewayLinks podem ser usados ​​no link da rede virtual remota para a rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_virtual_network_access"></a> [allow\_virtual\_network\_access](#input\_allow\_virtual\_network\_access) | Controla se as VMs na rede virtual remota podem acessar as VMs na rede virtual local. O padrão é true. | `bool` | `true` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | Range de IPs que são liberados para gerência dos server nodes. | `set(string)` | `null` | no |
| <a name="input_auto_scaling_default"></a> [auto\_scaling\_default](#input\_auto\_scaling\_default) | Ativa o auto scaling dos nopdes linux. por padrão false. | `bool` | `false` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Habilitar ou não o add-on de Azure Policy para Kubernetes. Por padão é False | `bool` | `false` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Especifica o nome do Bastion Host | `string` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | specifica os requisitos de cache para o disco do sistema operaciona. Por padrão é ReadOnly | `string` | `"ReadOnly"` | no |
| <a name="input_client_configuration"></a> [client\_configuration](#input\_client\_configuration) | If set it will activate point-to-site configuration. | <pre>object({<br>    address_space = string<br>    protocols     = list(string)<br>    certificate   = string<br>  })</pre> | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | Permite que você gerencie registros CNAME de DNS no DNS privado do Azure. | <pre>list(object({<br>    name   = string<br>    ttl    = number<br>    record = string<br>  }))</pre> | `[]` | no |
| <a name="input_copy_paste_enabled"></a> [copy\_paste\_enabled](#input\_copy\_paste\_enabled) | O recurso Copiar/Colar está habilitado para o Bastion. Padrões para True | `bool` | `true` | no |
| <a name="input_create_vnet_peering"></a> [create\_vnet\_peering](#input\_create\_vnet\_peering) | Criação de peering entre vnets selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_disable_local_account"></a> [disable\_local\_account](#input\_disable\_local\_account) | Desabilita o acesso ao cluster com usuários locais. Por padrão é True | `bool` | `true` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Prefixo DNS do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_dns_private_name"></a> [dns\_private\_name](#input\_dns\_private\_name) | Especifica o nome do DNS privado | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers-spoke"></a> [dns\_servers-spoke](#input\_dns\_servers-spoke) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers_to_nic"></a> [dns\_servers\_to\_nic](#input\_dns\_servers\_to\_nic) | Dns Server para criação nic. | `list(string)` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Ativa o auto scaling dos nopdes linux. por padrão false | `bool` | `false` | no |
| <a name="input_enable_automatic_upgrades"></a> [enable\_automatic\_upgrades](#input\_enable\_automatic\_upgrades) | As atualizações automáticas estão habilitadas nesta máquina virtual. Padrões para false. | `bool` | `"false"` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | Habilita criptografia no default node pool, Por padão é false | `bool` | `false` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Propriedade que define se a autorização será feita via RBAC ao invés de access policies. | `bool` | `false` | no |
| <a name="input_enable_secure_transfer"></a> [enable\_secure\_transfer](#input\_enable\_secure\_transfer) | Força ou não a utilização de transferência de dados exclusivamente por HTTPS. | `bool` | `true` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Propriedade que define se máquinas virtuais do Azure têm permissão para recuperar certificados armazenados como segredos no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Propriedade que define se  o Azure Disk Encryption tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Propriedade que define se o Azure Resource Manager tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_existing_public_ip"></a> [existing\_public\_ip](#input\_existing\_public\_ip) | Usar um Public IP existente. Por padão e False | `bool` | `false` | no |
| <a name="input_file_copy_enabled"></a> [file\_copy\_enabled](#input\_file\_copy\_enabled) | O recurso de cópia de arquivo está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_gateway_name"></a> [gateway\_name](#input\_gateway\_name) | Name of virtual gateway. | `string` | n/a | yes |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Habilitar ou não Roteamento HTTP de Aplicação. Por padão é True | `bool` | `true` | no |
| <a name="input_id_ddos_plan"></a> [id\_ddos\_plan](#input\_id\_ddos\_plan) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_id_ddos_plan-spoke"></a> [id\_ddos\_plan-spoke](#input\_id\_ddos\_plan-spoke) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_img_offer"></a> [img\_offer](#input\_img\_offer) | Especifica a oferta da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_publisher"></a> [img\_publisher](#input\_img\_publisher) | Especifica o editor da imagem. | `string` | n/a | yes |
| <a name="input_img_sku"></a> [img\_sku](#input\_img\_sku) | Especifica o SKU da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_version"></a> [img\_version](#input\_img\_version) | Especifica a versão da imagem usada para criar a máquina virtual. | `string` | `"latest"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | O endereço IP estático que deve ser usado. | `string` | n/a | yes |
| <a name="input_ip_allocation"></a> [ip\_allocation](#input\_ip\_allocation) | O método de alocação usado para o endereço IP privado. O padão é Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | O nome da configuração de IP | `string` | n/a | yes |
| <a name="input_ip_connect_enabled"></a> [ip\_connect\_enabled](#input\_ip\_connect\_enabled) | O recurso IP Connect está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_ip_version_pip"></a> [ip\_version\_pip](#input\_ip\_version\_pip) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_ip_version_pip_gw"></a> [ip\_version\_pip\_gw](#input\_ip\_version\_pip\_gw) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_is_ddos_plan_enabled"></a> [is\_ddos\_plan\_enabled](#input\_is\_ddos\_plan\_enabled) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_ddos_plan_enabled-spoke"></a> [is\_ddos\_plan\_enabled-spoke](#input\_is\_ddos\_plan\_enabled-spoke) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_identity_enabled"></a> [is\_identity\_enabled](#input\_is\_identity\_enabled) | Habilitar ou não o uso de identidade gerenciada. | `bool` | `false` | no |
| <a name="input_is_public_ip_enabled"></a> [is\_public\_ip\_enabled](#input\_is\_public\_ip\_enabled) | Criar um novo Public IP para VM. Por padrão é False | `bool` | `false` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Versão do Kubernetes. Por opadão é 1.19.9 | `string` | `"1.19.9"` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Qual SKU do do blob storage é usado. | `string` | `"StorageV2"` | no |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | Nome do cofre. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_labels_default"></a> [labels\_default](#input\_labels\_default) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `map(any)` | `{}` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | Modelo de SKU do Load Balancer no cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_license_act"></a> [license\_act](#input\_license\_act) | Especifica o tipo BYOL para esta máquina virtual | `string` | n/a | yes |
| <a name="input_local_networks"></a> [local\_networks](#input\_local\_networks) | List of local virtual network connections to connect to gateway. | <pre>list(<br>    object({<br>      name            = string<br>      gateway_address = string<br>      address_space   = list(string)<br>      shared_key      = string<br>      ipsec_policy    = any<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | A região do datacenter onde seus recursos serão criados. | `string` | `"eastus2"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID do Log Analytics. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Nome do workspace do Log Analytics. É obrigatório caso `enable_log_analytics_workspace` for marcado como `true` | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Define a SKU utilizada pelo Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Define o número de dias em que os logs serão armazenados no Workspace. | `number` | `30` | no |
| <a name="input_managed_disk_type"></a> [managed\_disk\_type](#input\_managed\_disk\_type) | Especifica o tipo de disco gerenciado a ser criado. | `string` | `"Standard_LRS"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Número maximo de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_max_nodes_default"></a> [max\_nodes\_default](#input\_max\_nodes\_default) | Número maximo de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | Quantidade máxima de Pods por node (dentro do Default node). | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "1"<br>]</pre> | no |
| <a name="input_min_nodes_default"></a> [min\_nodes\_default](#input\_min\_nodes\_default) | Número de nodes do Cluster Kubernetes. | `string` | `1` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Este pool de nós deve ser usado para recursos do kube-system ou do user. Por padrão user | `list(string)` | n/a | yes |
| <a name="input_name_pool_default"></a> [name\_pool\_default](#input\_name\_pool\_default) | Nome do pool do Cluster Kubernetes. | `string` | `"agentpool"` | no |
| <a name="input_nat_gateway_ids"></a> [nat\_gateway\_ids](#input\_nat\_gateway\_ids) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_nat_gateway_ids-spoke"></a> [nat\_gateway\_ids-spoke](#input\_nat\_gateway\_ids-spoke) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_network_acls_bypass"></a> [network\_acls\_bypass](#input\_network\_acls\_bypass) | Propriedade que define se os serviços do Azure podem realizar operações no cofre. (AzureServices ou None) | `string` | `"None"` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | Ação a ser realizada quando o tráfego de rede de origem for diferente das regras especificadas. (Allow ou Deny) | `string` | `"Deny"` | no |
| <a name="input_network_acls_ip_rules"></a> [network\_acls\_ip\_rules](#input\_network\_acls\_ip\_rules) | Um ou mais endereços de IP ou blocos CIDR que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_acls_virtual_network_subnet_ids"></a> [network\_acls\_virtual\_network\_subnet\_ids](#input\_network\_acls\_virtual\_network\_subnet\_ids) | Um ou mais IDs de subnets que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Modelo de plugin de rede utilizado no Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Politicas de redes do Azure CNI clico ou azure | `string` | `"azure"` | no |
| <a name="input_network_watcher_name"></a> [network\_watcher\_name](#input\_network\_watcher\_name) | Nome do network watcher | `string` | n/a | yes |
| <a name="input_node_av_zone"></a> [node\_av\_zone](#input\_node\_av\_zone) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |
| <a name="input_node_pool"></a> [node\_pool](#input\_node\_pool) | Nome do node pool do Cluster Kubernetes. | `list(string)` | `[]` | no |
| <a name="input_node_vm_disk_size"></a> [node\_vm\_disk\_size](#input\_node\_vm\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `number` | `30` | no |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_nsg_ids-spoke"></a> [nsg\_ids-spoke](#input\_nsg\_ids-spoke) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_oms_agent_enabled"></a> [oms\_agent\_enabled](#input\_oms\_agent\_enabled) | Habilita o OMS Agent no Cluster Kubernetes. | `bool` | `true` | no |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Tipo de sistema operacional dos nodes. Aceita os valores `Windows` ou `Linux`. | `list(string)` | n/a | yes |
| <a name="input_pip_name"></a> [pip\_name](#input\_pip\_name) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_pip_name_gw"></a> [pip\_name\_gw](#input\_pip\_name\_gw) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Habilita que o cluster teha suas APIs dipostas somente para a rede interna. Por padrão é False | `bool` | `false` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Define como o endereço IP privado da interface virtual dos gateways é atribuído. As opções válidas são Static ou Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | O Agente Convidado da Máquina Virtual do Azure deve ser instalado nesta Máquina Virtual. Padrões para True. | `bool` | `true` | no |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | ID do Public IP existente, a opção existing\_public\_ip tem que estar como True. Por padão é null | `string` | `null` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Sku para criação do novo Public IP, a opção is\_public\_ip\_enabled deve ser True. Por padão é basic | `string` | `"Basic"` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Propriedade que define se a feature Purge Protection será habilitada. | `bool` | `false` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | Object ID dos grupos com acesso administrativo ao cluster Kubernetes. | `any` | `null` | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | Habilita Role Based Access Control based com Azure AD | `bool` | `null` | no |
| <a name="input_rbac_aad_client_app_id"></a> [rbac\_aad\_client\_app\_id](#input\_rbac\_aad\_client\_app\_id) | Client ID da aplicação do Azure Active Directory. | `string` | `null` | no |
| <a name="input_rbac_aad_managed"></a> [rbac\_aad\_managed](#input\_rbac\_aad\_managed) | Integração com Azure Active Directory, habilitado, significa que o Azure criará/gerenciará a entidade de Serviço usada para integração. | `bool` | `false` | no |
| <a name="input_rbac_aad_server_app_id"></a> [rbac\_aad\_server\_app\_id](#input\_rbac\_aad\_server\_app\_id) | Server ID do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_server_app_secret"></a> [rbac\_aad\_server\_app\_secret](#input\_rbac\_aad\_server\_app\_secret) | Server Secret do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_tenant_id"></a> [rbac\_aad\_tenant\_id](#input\_rbac\_aad\_tenant\_id) | ID do tenant usada para o aplicativo do Azure Active Directory. Se isso não for especificado, a ID do tenant da assinatura atual será utilizado. | `string` | `null` | no |
| <a name="input_replication"></a> [replication](#input\_replication) | Que tipo de replicação será usada pela Storage Account. | `string` | `"GRS"` | no |
| <a name="input_resource_group_names"></a> [resource\_group\_names](#input\_resource\_group\_names) | O nome do seu Resource Group | `list(string)` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Habilitar Role Based Access Control. | `bool` | `false` | no |
| <a name="input_route_tables_ids"></a> [route\_tables\_ids](#input\_route\_tables\_ids) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_route_tables_ids-spoke"></a> [route\_tables\_ids-spoke](#input\_route\_tables\_ids-spoke) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_scale_units"></a> [scale\_units](#input\_scale\_units) | O número de unidades de escala com as quais provisionar o Bastion. Por padrão e 2 | `number` | `2` | no |
| <a name="input_shareable_link_enabled"></a> [shareable\_link\_enabled](#input\_shareable\_link\_enabled) | O recurso Link compartilhável está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_sizegbdisk"></a> [sizegbdisk](#input\_sizegbdisk) | Especifica o tamanho do disco de dados em gigabyte | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU do Registro de Container. Aceita os valores `Standard`, `Premium` ou `Basic`. | `string` | `"Standard"` | no |
| <a name="input_sku_bastion_name"></a> [sku\_bastion\_name](#input\_sku\_bastion\_name) | O SKU do Bastion Host (Basic ou Standard). | `string` | n/a | yes |
| <a name="input_sku_gw"></a> [sku\_gw](#input\_sku\_gw) | Configuração do tamanho e capacidade do gateway de rede virtual. As opções válidas são Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ e VpnGw5AZ | `string` | `"VpnGw1"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Definição da SKU (standard ou premium). | `string` | n/a | yes |
| <a name="input_sku_pip"></a> [sku\_pip](#input\_sku\_pip) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_pip_gw"></a> [sku\_pip\_gw](#input\_sku\_pip\_gw) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_sku_tier_aks"></a> [sku\_tier\_aks](#input\_sku\_tier\_aks) | O nível de SKU que deve ser usado para este cluster Kubernetes. Os valores possíveis são Free e Paid. Por padãro e Free | `string` | `"Free"` | no |
| <a name="input_sku_tier_gw"></a> [sku\_tier\_gw](#input\_sku\_tier\_gw) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Quantidade de dias para retenção do 'soft delete'. (90 >= days >= 7) | `number` | `90` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Chave púclica SSH para acesso ao sistema do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | Obrigatório caso `static_website_enabled` seja `true`. Bloco que define caminho para os arquivos do website (ver exemplo de código). | `map(any)` | `{}` | no |
| <a name="input_static_website_enabled"></a> [static\_website\_enabled](#input\_static\_website\_enabled) | Especifica se o armazenamento para websites estáticos será habilitado. | `bool` | `false` | no |
| <a name="input_storacc_containers"></a> [storacc\_containers](#input\_storacc\_containers) | Utilizá-lo quando houver a necessidade de criar containers dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storacc_shares"></a> [storacc\_shares](#input\_storacc\_shares) | Utilizá-lo quando houver a necessidade de criar file shares dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Nome da Storage Account. | `string` | n/a | yes |
| <a name="input_storage_uri"></a> [storage\_uri](#input\_storage\_uri) | O Blob Endpoint da Conta de Armazenamento que deve conter os arquivos de diagnóstico da máquina virtual. | `string` | n/a | yes |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies"></a> [subnet\_enforce\_private\_link\_service\_network\_policies](#input\_subnet\_enforce\_private\_link\_service\_network\_policies) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_service\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_service\_network\_policies-spoke) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names-spoke"></a> [subnet\_names-spoke](#input\_subnet\_names-spoke) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names_aks"></a> [subnet\_names\_aks](#input\_subnet\_names\_aks) | Nome da Subnet do AKS com CNI | `string` | `""` | no |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes-spoke"></a> [subnet\_prefixes-spoke](#input\_subnet\_prefixes-spoke) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_subnet_service_endpoints-spoke"></a> [subnet\_service\_endpoints-spoke](#input\_subnet\_service\_endpoints-spoke) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_tags_acr"></a> [tags\_acr](#input\_tags\_acr) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_aks"></a> [tags\_aks](#input\_tags\_aks) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_bastion"></a> [tags\_bastion](#input\_tags\_bastion) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_dns_private"></a> [tags\_dns\_private](#input\_tags\_dns\_private) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_gw"></a> [tags\_gw](#input\_tags\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_key_vault"></a> [tags\_key\_vault](#input\_tags\_key\_vault) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_local_gw"></a> [tags\_local\_gw](#input\_tags\_local\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_log_analytcs"></a> [tags\_log\_analytcs](#input\_tags\_log\_analytcs) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_network_watcher"></a> [tags\_network\_watcher](#input\_tags\_network\_watcher) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip"></a> [tags\_public\_ip](#input\_tags\_public\_ip) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip_gw"></a> [tags\_public\_ip\_gw](#input\_tags\_public\_ip\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_rg"></a> [tags\_rg](#input\_tags\_rg) | Lista de mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_tags_storage"></a> [tags\_storage](#input\_tags\_storage) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vm-win"></a> [tags\_vm-win](#input\_tags\_vm-win) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_hub"></a> [tags\_vnet\_hub](#input\_tags\_vnet\_hub) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_spoke"></a> [tags\_vnet\_spoke](#input\_tags\_vnet\_spoke) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Que tipo de performance espera-se. Aceita os valores `Standard` e `Premium`. | `string` | `"Standard"` | no |
| <a name="input_tunneling_enabled"></a> [tunneling\_enabled](#input\_tunneling\_enabled) | O recurso Tunneling está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_type_gw"></a> [type\_gw](#input\_type\_gw) | O tipo do Gateway de Rede Virtual. As opções válidas são ExpressRoute ou Vpn | `string` | `"Vpn"` | no |
| <a name="input_type_local_gw"></a> [type\_local\_gw](#input\_type\_local\_gw) | O tipo de conexão. As opções válidas são ExpressRoute, IPsec ou Vnet2Vnet | `string` | `"IPsec"` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Usado para especificar se o UltraSSD está habilitado no pool de nós padrão. Default é false. | `bool` | `false` | no |
| <a name="input_use_network_existing_to_peering"></a> [use\_network\_existing\_to\_peering](#input\_use\_network\_existing\_to\_peering) | Criação de peering entre vnets que ja existem selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | Controla se os gateways remotos podem ser utilizados na rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Especifica o nome da Máquina Virtual. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size da VM do default node, por padrão Standard\_D2\_v2 | `list(string)` | <pre>[<br>  "Standard_D2_v2"<br>]</pre> | no |
| <a name="input_vm_size_default"></a> [vm\_size\_default](#input\_vm\_size\_default) | Size da VM do default node | `string` | `"Standard_D2_v2"` | no |
| <a name="input_vm_size_win"></a> [vm\_size\_win](#input\_vm\_size\_win) | Especifica o tamanho da Máquina Virtual | `string` | n/a | yes |
| <a name="input_vnet_links"></a> [vnet\_links](#input\_vnet\_links) | Esses Links habilitam a resolução e o registro de DNS dentro das Redes Virtuais do Azure usando o DNS Privado do Azure. | <pre>list(object({<br>    name                 = string<br>    virtual_network_name = string<br>    registration_enabled = bool<br>    rg_name              = string<br>  }))</pre> | `[]` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vnet_name-spoke"></a> [vnet\_name-spoke](#input\_vnet\_name-spoke) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vpn_type_gw"></a> [vpn\_type\_gw](#input\_vpn\_type\_gw) | O tipo de roteamento do Virtual Network Gateway. As opções válidas são RouteBased ou PolicyBased | `string` | `"RouteBased"` | no |
| <a name="input_windows_admin_password"></a> [windows\_admin\_password](#input\_windows\_admin\_password) | Senha do usuario admin do sitema windows | `string` | n/a | yes |
| <a name="input_windows_admin_username"></a> [windows\_admin\_username](#input\_windows\_admin\_username) | Usuário administrador de sistemas windows. Por padrão Solonetwork | `string` | `"Solonetwork"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | n/a |
| <a name="output_access_policy"></a> [access\_policy](#output\_access\_policy) | n/a |
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | n/a |
| <a name="output_analytics_id"></a> [analytics\_id](#output\_analytics\_id) | n/a |
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | n/a |
| <a name="output_azure_bastion_host_id"></a> [azure\_bastion\_host\_id](#output\_azure\_bastion\_host\_id) | n/a |
| <a name="output_azure_bastion_host_pip"></a> [azure\_bastion\_host\_pip](#output\_azure\_bastion\_host\_pip) | n/a |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | n/a |
| <a name="output_gateway_id"></a> [gateway\_id](#output\_gateway\_id) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | n/a |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | n/a |
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | n/a |
| <a name="output_network_watcher_location"></a> [network\_watcher\_location](#output\_network\_watcher\_location) | n/a |
| <a name="output_network_watcher_name"></a> [network\_watcher\_name](#output\_network\_watcher\_name) | n/a |
| <a name="output_pip_name"></a> [pip\_name](#output\_pip\_name) | n/a |
| <a name="output_pip_vpn_name"></a> [pip\_vpn\_name](#output\_pip\_vpn\_name) | n/a |
| <a name="output_rg_location"></a> [rg\_location](#output\_rg\_location) | n/a |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | n/a |
| <a name="output_storage_access_key"></a> [storage\_access\_key](#output\_storage\_access\_key) | n/a |
| <a name="output_storage_account_container"></a> [storage\_account\_container](#output\_storage\_account\_container) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
| <a name="output_storage_account_primary_web_host"></a> [storage\_account\_primary\_web\_host](#output\_storage\_account\_primary\_web\_host) | n/a |
| <a name="output_storage_account_url"></a> [storage\_account\_url](#output\_storage\_account\_url) | n/a |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | n/a |
| <a name="output_vm_ip"></a> [vm\_ip](#output\_vm\_ip) | n/a |
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | n/a |
| <a name="output_vnet_address_space-spoke"></a> [vnet\_address\_space-spoke](#output\_vnet\_address\_space-spoke) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |
| <a name="output_vnet_name-spoke"></a> [vnet\_name-spoke](#output\_vnet\_name-spoke) | n/a |
| <a name="output_vnet_subnet_names"></a> [vnet\_subnet\_names](#output\_vnet\_subnet\_names) | n/a |
| <a name="output_vnet_subnet_names-spoke"></a> [vnet\_subnet\_names-spoke](#output\_vnet\_subnet\_names-spoke) | n/a |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.29.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.27.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.13.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acr"></a> [acr](#module\_acr) | ../../modules/acr | n/a |
| <a name="module_aks"></a> [aks](#module\_aks) | ../../modules/aks | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ../../modules/bastion | n/a |
| <a name="module_dns_private"></a> [dns\_private](#module\_dns\_private) | ../../modules/dns/private | n/a |
| <a name="module_gatway_vpn"></a> [gatway\_vpn](#module\_gatway\_vpn) | ../../modules/network_gateway | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../../modules/key_vault | n/a |
| <a name="module_key_vault_access_policy"></a> [key\_vault\_access\_policy](#module\_key\_vault\_access\_policy) | ../../modules/access_policy | n/a |
| <a name="module_local_gw"></a> [local\_gw](#module\_local\_gw) | ../../modules/local_network_gateway | n/a |
| <a name="module_network_watcher"></a> [network\_watcher](#module\_network\_watcher) | ../../modules/network_watcher | n/a |
| <a name="module_pip"></a> [pip](#module\_pip) | ../../modules/pip | n/a |
| <a name="module_pip_vpn"></a> [pip\_vpn](#module\_pip\_vpn) | ../../modules/pip | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage | n/a |
| <a name="module_vm-win"></a> [vm-win](#module\_vm-win) | ../../modules/vm-windows | n/a |
| <a name="module_vnet-hub"></a> [vnet-hub](#module\_vnet-hub) | ../../modules/vnet | n/a |
| <a name="module_vnet-spoke"></a> [vnet-spoke](#module\_vnet-spoke) | ../../modules/vnet | n/a |
| <a name="module_wks_log"></a> [wks\_log](#module\_wks\_log) | ../../modules/log_analytics | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | Permite que você gerencie os Registros A de DNS no DNS Privado do Azure. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | n/a | `list(any)` | `[]` | no |
| <a name="input_acr_enable_admin"></a> [acr\_enable\_admin](#input\_acr\_enable\_admin) | Habilita usuário administrativo no Azure Container Registry | `string` | n/a | yes |
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | Nome do Registro de Container. Precisa ser um nome único porque a partir daqui será gerado o nome do registry. | `string` | n/a | yes |
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_address_space-spoke"></a> [address\_space-spoke](#input\_address\_space-spoke) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_admin_linux"></a> [admin\_linux](#input\_admin\_linux) | Usuário administrador de sistemas Linux | `string` | n/a | yes |
| <a name="input_admin_win_pass"></a> [admin\_win\_pass](#input\_admin\_win\_pass) | A senha associada à conta do administrador local. | `string` | n/a | yes |
| <a name="input_admin_win_username"></a> [admin\_win\_username](#input\_admin\_win\_username) | Especifica o nome da conta do administrador local. | `string` | n/a | yes |
| <a name="input_agent_count"></a> [agent\_count](#input\_agent\_count) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_agent_count_default"></a> [agent\_count\_default](#input\_agent\_count\_default) | Número de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_aks_dns_ip"></a> [aks\_dns\_ip](#input\_aks\_dns\_ip) | IP do DNS (deve estar dentro do range de IP do `aks_network_cidr`). | `string` | n/a | yes |
| <a name="input_aks_docker_bridge"></a> [aks\_docker\_bridge](#input\_aks\_docker\_bridge) | Endereço CIDR para ser usado como Docker Bridge. | `string` | n/a | yes |
| <a name="input_aks_enable_attach_acr"></a> [aks\_enable\_attach\_acr](#input\_aks\_enable\_attach\_acr) | Força o attach ou não do Kubernetes Services com o Azure Container Services (Obrigatório verificar a documentação adequada) | `bool` | n/a | yes |
| <a name="input_aks_network_cidr"></a> [aks\_network\_cidr](#input\_aks\_network\_cidr) | Endereço CIDR da rede do Kubernetes Service. | `string` | n/a | yes |
| <a name="input_aks_service_principal_app_id"></a> [aks\_service\_principal\_app\_id](#input\_aks\_service\_principal\_app\_id) | Credencial para conexão com service principal. | `string` | n/a | yes |
| <a name="input_aks_service_principal_client_secret"></a> [aks\_service\_principal\_client\_secret](#input\_aks\_service\_principal\_client\_secret) | Credencial para conexão com service principal | `string` | n/a | yes |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Metodo de aloação do Public, a opção is\_public\_ip\_enabled deve ser True. Por padão é static | `string` | `"Static"` | no |
| <a name="input_allocation_method_pip"></a> [allocation\_method\_pip](#input\_allocation\_method\_pip) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allocation_method_pip_gw"></a> [allocation\_method\_pip\_gw](#input\_allocation\_method\_pip\_gw) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allow_forwarded_traffic"></a> [allow\_forwarded\_traffic](#input\_allow\_forwarded\_traffic) | Controla se o tráfego encaminhado de VMs na rede virtual remota é permitido. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_gateway_transit"></a> [allow\_gateway\_transit](#input\_allow\_gateway\_transit) | Os controles gatewayLinks podem ser usados ​​no link da rede virtual remota para a rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_virtual_network_access"></a> [allow\_virtual\_network\_access](#input\_allow\_virtual\_network\_access) | Controla se as VMs na rede virtual remota podem acessar as VMs na rede virtual local. O padrão é true. | `bool` | `true` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | Range de IPs que são liberados para gerência dos server nodes. | `set(string)` | `null` | no |
| <a name="input_auto_scaling_default"></a> [auto\_scaling\_default](#input\_auto\_scaling\_default) | Ativa o auto scaling dos nopdes linux. por padrão false. | `bool` | `false` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Habilitar ou não o add-on de Azure Policy para Kubernetes. Por padão é False | `bool` | `false` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Especifica o nome do Bastion Host | `string` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | specifica os requisitos de cache para o disco do sistema operaciona. Por padrão é ReadOnly | `string` | `"ReadOnly"` | no |
| <a name="input_client_configuration"></a> [client\_configuration](#input\_client\_configuration) | If set it will activate point-to-site configuration. | <pre>object({<br>    address_space = string<br>    protocols     = list(string)<br>    certificate   = string<br>  })</pre> | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | Permite que você gerencie registros CNAME de DNS no DNS privado do Azure. | <pre>list(object({<br>    name   = string<br>    ttl    = number<br>    record = string<br>  }))</pre> | `[]` | no |
| <a name="input_copy_paste_enabled"></a> [copy\_paste\_enabled](#input\_copy\_paste\_enabled) | O recurso Copiar/Colar está habilitado para o Bastion. Padrões para True | `bool` | `true` | no |
| <a name="input_create_vnet_peering"></a> [create\_vnet\_peering](#input\_create\_vnet\_peering) | Criação de peering entre vnets selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_disable_local_account"></a> [disable\_local\_account](#input\_disable\_local\_account) | Desabilita o acesso ao cluster com usuários locais. Por padrão é True | `bool` | `true` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Prefixo DNS do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_dns_private_name"></a> [dns\_private\_name](#input\_dns\_private\_name) | Especifica o nome do DNS privado | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers-spoke"></a> [dns\_servers-spoke](#input\_dns\_servers-spoke) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers_to_nic"></a> [dns\_servers\_to\_nic](#input\_dns\_servers\_to\_nic) | Dns Server para criação nic. | `list(string)` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Ativa o auto scaling dos nopdes linux. por padrão false | `bool` | `false` | no |
| <a name="input_enable_automatic_upgrades"></a> [enable\_automatic\_upgrades](#input\_enable\_automatic\_upgrades) | As atualizações automáticas estão habilitadas nesta máquina virtual. Padrões para false. | `bool` | `"false"` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | Habilita criptografia no default node pool, Por padão é false | `bool` | `false` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Propriedade que define se a autorização será feita via RBAC ao invés de access policies. | `bool` | `false` | no |
| <a name="input_enable_secure_transfer"></a> [enable\_secure\_transfer](#input\_enable\_secure\_transfer) | Força ou não a utilização de transferência de dados exclusivamente por HTTPS. | `bool` | `true` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Propriedade que define se máquinas virtuais do Azure têm permissão para recuperar certificados armazenados como segredos no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Propriedade que define se  o Azure Disk Encryption tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Propriedade que define se o Azure Resource Manager tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_existing_public_ip"></a> [existing\_public\_ip](#input\_existing\_public\_ip) | Usar um Public IP existente. Por padão e False | `bool` | `false` | no |
| <a name="input_file_copy_enabled"></a> [file\_copy\_enabled](#input\_file\_copy\_enabled) | O recurso de cópia de arquivo está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_gateway_name"></a> [gateway\_name](#input\_gateway\_name) | Name of virtual gateway. | `string` | n/a | yes |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Habilitar ou não Roteamento HTTP de Aplicação. Por padão é True | `bool` | `true` | no |
| <a name="input_id_ddos_plan"></a> [id\_ddos\_plan](#input\_id\_ddos\_plan) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_id_ddos_plan-spoke"></a> [id\_ddos\_plan-spoke](#input\_id\_ddos\_plan-spoke) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_img_offer"></a> [img\_offer](#input\_img\_offer) | Especifica a oferta da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_publisher"></a> [img\_publisher](#input\_img\_publisher) | Especifica o editor da imagem. | `string` | n/a | yes |
| <a name="input_img_sku"></a> [img\_sku](#input\_img\_sku) | Especifica o SKU da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_version"></a> [img\_version](#input\_img\_version) | Especifica a versão da imagem usada para criar a máquina virtual. | `string` | `"latest"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | O endereço IP estático que deve ser usado. | `string` | n/a | yes |
| <a name="input_ip_allocation"></a> [ip\_allocation](#input\_ip\_allocation) | O método de alocação usado para o endereço IP privado. O padão é Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | O nome da configuração de IP | `string` | n/a | yes |
| <a name="input_ip_connect_enabled"></a> [ip\_connect\_enabled](#input\_ip\_connect\_enabled) | O recurso IP Connect está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_ip_version_pip"></a> [ip\_version\_pip](#input\_ip\_version\_pip) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_ip_version_pip_gw"></a> [ip\_version\_pip\_gw](#input\_ip\_version\_pip\_gw) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_is_ddos_plan_enabled"></a> [is\_ddos\_plan\_enabled](#input\_is\_ddos\_plan\_enabled) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_ddos_plan_enabled-spoke"></a> [is\_ddos\_plan\_enabled-spoke](#input\_is\_ddos\_plan\_enabled-spoke) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_identity_enabled"></a> [is\_identity\_enabled](#input\_is\_identity\_enabled) | Habilitar ou não o uso de identidade gerenciada. | `bool` | `false` | no |
| <a name="input_is_public_ip_enabled"></a> [is\_public\_ip\_enabled](#input\_is\_public\_ip\_enabled) | Criar um novo Public IP para VM. Por padrão é False | `bool` | `false` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Versão do Kubernetes. Por opadão é 1.19.9 | `string` | `"1.19.9"` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Qual SKU do do blob storage é usado. | `string` | `"StorageV2"` | no |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | Nome do cofre. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_labels_default"></a> [labels\_default](#input\_labels\_default) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `map(any)` | `{}` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | Modelo de SKU do Load Balancer no cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_license_act"></a> [license\_act](#input\_license\_act) | Especifica o tipo BYOL para esta máquina virtual | `string` | n/a | yes |
| <a name="input_local_networks"></a> [local\_networks](#input\_local\_networks) | List of local virtual network connections to connect to gateway. | <pre>list(<br>    object({<br>      name            = string<br>      gateway_address = string<br>      address_space   = list(string)<br>      shared_key      = string<br>      ipsec_policy    = any<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | A região do datacenter onde seus recursos serão criados. | `string` | `"eastus2"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID do Log Analytics. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Nome do workspace do Log Analytics. É obrigatório caso `enable_log_analytics_workspace` for marcado como `true` | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Define a SKU utilizada pelo Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Define o número de dias em que os logs serão armazenados no Workspace. | `number` | `30` | no |
| <a name="input_managed_disk_type"></a> [managed\_disk\_type](#input\_managed\_disk\_type) | Especifica o tipo de disco gerenciado a ser criado. | `string` | `"Standard_LRS"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Número maximo de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_max_nodes_default"></a> [max\_nodes\_default](#input\_max\_nodes\_default) | Número maximo de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | Quantidade máxima de Pods por node (dentro do Default node). | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "1"<br>]</pre> | no |
| <a name="input_min_nodes_default"></a> [min\_nodes\_default](#input\_min\_nodes\_default) | Número de nodes do Cluster Kubernetes. | `string` | `1` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Este pool de nós deve ser usado para recursos do kube-system ou do user. Por padrão user | `list(string)` | n/a | yes |
| <a name="input_name_pool_default"></a> [name\_pool\_default](#input\_name\_pool\_default) | Nome do pool do Cluster Kubernetes. | `string` | `"agentpool"` | no |
| <a name="input_nat_gateway_ids"></a> [nat\_gateway\_ids](#input\_nat\_gateway\_ids) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_nat_gateway_ids-spoke"></a> [nat\_gateway\_ids-spoke](#input\_nat\_gateway\_ids-spoke) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_network_acls_bypass"></a> [network\_acls\_bypass](#input\_network\_acls\_bypass) | Propriedade que define se os serviços do Azure podem realizar operações no cofre. (AzureServices ou None) | `string` | `"None"` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | Ação a ser realizada quando o tráfego de rede de origem for diferente das regras especificadas. (Allow ou Deny) | `string` | `"Deny"` | no |
| <a name="input_network_acls_ip_rules"></a> [network\_acls\_ip\_rules](#input\_network\_acls\_ip\_rules) | Um ou mais endereços de IP ou blocos CIDR que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_acls_virtual_network_subnet_ids"></a> [network\_acls\_virtual\_network\_subnet\_ids](#input\_network\_acls\_virtual\_network\_subnet\_ids) | Um ou mais IDs de subnets que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Modelo de plugin de rede utilizado no Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Politicas de redes do Azure CNI clico ou azure | `string` | `"azure"` | no |
| <a name="input_network_watcher_name"></a> [network\_watcher\_name](#input\_network\_watcher\_name) | Nome do network watcher | `string` | n/a | yes |
| <a name="input_node_av_zone"></a> [node\_av\_zone](#input\_node\_av\_zone) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |
| <a name="input_node_pool"></a> [node\_pool](#input\_node\_pool) | Nome do node pool do Cluster Kubernetes. | `list(string)` | `[]` | no |
| <a name="input_node_vm_disk_size"></a> [node\_vm\_disk\_size](#input\_node\_vm\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `number` | `30` | no |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_nsg_ids-spoke"></a> [nsg\_ids-spoke](#input\_nsg\_ids-spoke) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_oms_agent_enabled"></a> [oms\_agent\_enabled](#input\_oms\_agent\_enabled) | Habilita o OMS Agent no Cluster Kubernetes. | `bool` | `true` | no |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Tipo de sistema operacional dos nodes. Aceita os valores `Windows` ou `Linux`. | `list(string)` | n/a | yes |
| <a name="input_pip_name"></a> [pip\_name](#input\_pip\_name) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_pip_name_gw"></a> [pip\_name\_gw](#input\_pip\_name\_gw) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Habilita que o cluster teha suas APIs dipostas somente para a rede interna. Por padrão é False | `bool` | `false` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Define como o endereço IP privado da interface virtual dos gateways é atribuído. As opções válidas são Static ou Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | O Agente Convidado da Máquina Virtual do Azure deve ser instalado nesta Máquina Virtual. Padrões para True. | `bool` | `true` | no |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | ID do Public IP existente, a opção existing\_public\_ip tem que estar como True. Por padão é null | `string` | `null` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Sku para criação do novo Public IP, a opção is\_public\_ip\_enabled deve ser True. Por padão é basic | `string` | `"Basic"` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Propriedade que define se a feature Purge Protection será habilitada. | `bool` | `false` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | Object ID dos grupos com acesso administrativo ao cluster Kubernetes. | `any` | `null` | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | Habilita Role Based Access Control based com Azure AD | `bool` | `null` | no |
| <a name="input_rbac_aad_client_app_id"></a> [rbac\_aad\_client\_app\_id](#input\_rbac\_aad\_client\_app\_id) | Client ID da aplicação do Azure Active Directory. | `string` | `null` | no |
| <a name="input_rbac_aad_managed"></a> [rbac\_aad\_managed](#input\_rbac\_aad\_managed) | Integração com Azure Active Directory, habilitado, significa que o Azure criará/gerenciará a entidade de Serviço usada para integração. | `bool` | `false` | no |
| <a name="input_rbac_aad_server_app_id"></a> [rbac\_aad\_server\_app\_id](#input\_rbac\_aad\_server\_app\_id) | Server ID do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_server_app_secret"></a> [rbac\_aad\_server\_app\_secret](#input\_rbac\_aad\_server\_app\_secret) | Server Secret do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_tenant_id"></a> [rbac\_aad\_tenant\_id](#input\_rbac\_aad\_tenant\_id) | ID do tenant usada para o aplicativo do Azure Active Directory. Se isso não for especificado, a ID do tenant da assinatura atual será utilizado. | `string` | `null` | no |
| <a name="input_replication"></a> [replication](#input\_replication) | Que tipo de replicação será usada pela Storage Account. | `string` | `"GRS"` | no |
| <a name="input_resource_group_names"></a> [resource\_group\_names](#input\_resource\_group\_names) | O nome do seu Resource Group | `list(string)` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Habilitar Role Based Access Control. | `bool` | `false` | no |
| <a name="input_route_tables_ids"></a> [route\_tables\_ids](#input\_route\_tables\_ids) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_route_tables_ids-spoke"></a> [route\_tables\_ids-spoke](#input\_route\_tables\_ids-spoke) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_scale_units"></a> [scale\_units](#input\_scale\_units) | O número de unidades de escala com as quais provisionar o Bastion. Por padrão e 2 | `number` | `2` | no |
| <a name="input_shareable_link_enabled"></a> [shareable\_link\_enabled](#input\_shareable\_link\_enabled) | O recurso Link compartilhável está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_sizegbdisk"></a> [sizegbdisk](#input\_sizegbdisk) | Especifica o tamanho do disco de dados em gigabyte | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU do Registro de Container. Aceita os valores `Standard`, `Premium` ou `Basic`. | `string` | `"Standard"` | no |
| <a name="input_sku_bastion_name"></a> [sku\_bastion\_name](#input\_sku\_bastion\_name) | O SKU do Bastion Host (Basic ou Standard). | `string` | n/a | yes |
| <a name="input_sku_gw"></a> [sku\_gw](#input\_sku\_gw) | Configuração do tamanho e capacidade do gateway de rede virtual. As opções válidas são Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ e VpnGw5AZ | `string` | `"VpnGw1"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Definição da SKU (standard ou premium). | `string` | n/a | yes |
| <a name="input_sku_pip"></a> [sku\_pip](#input\_sku\_pip) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_pip_gw"></a> [sku\_pip\_gw](#input\_sku\_pip\_gw) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_sku_tier_aks"></a> [sku\_tier\_aks](#input\_sku\_tier\_aks) | O nível de SKU que deve ser usado para este cluster Kubernetes. Os valores possíveis são Free e Paid. Por padãro e Free | `string` | `"Free"` | no |
| <a name="input_sku_tier_gw"></a> [sku\_tier\_gw](#input\_sku\_tier\_gw) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Quantidade de dias para retenção do 'soft delete'. (90 >= days >= 7) | `number` | `90` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Chave púclica SSH para acesso ao sistema do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | Obrigatório caso `static_website_enabled` seja `true`. Bloco que define caminho para os arquivos do website (ver exemplo de código). | `map(any)` | `{}` | no |
| <a name="input_static_website_enabled"></a> [static\_website\_enabled](#input\_static\_website\_enabled) | Especifica se o armazenamento para websites estáticos será habilitado. | `bool` | `false` | no |
| <a name="input_storacc_containers"></a> [storacc\_containers](#input\_storacc\_containers) | Utilizá-lo quando houver a necessidade de criar containers dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storacc_shares"></a> [storacc\_shares](#input\_storacc\_shares) | Utilizá-lo quando houver a necessidade de criar file shares dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Nome da Storage Account. | `string` | n/a | yes |
| <a name="input_storage_uri"></a> [storage\_uri](#input\_storage\_uri) | O Blob Endpoint da Conta de Armazenamento que deve conter os arquivos de diagnóstico da máquina virtual. | `string` | n/a | yes |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies"></a> [subnet\_enforce\_private\_link\_service\_network\_policies](#input\_subnet\_enforce\_private\_link\_service\_network\_policies) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_service\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_service\_network\_policies-spoke) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names-spoke"></a> [subnet\_names-spoke](#input\_subnet\_names-spoke) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names_aks"></a> [subnet\_names\_aks](#input\_subnet\_names\_aks) | Nome da Subnet do AKS com CNI | `string` | `""` | no |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes-spoke"></a> [subnet\_prefixes-spoke](#input\_subnet\_prefixes-spoke) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_subnet_service_endpoints-spoke"></a> [subnet\_service\_endpoints-spoke](#input\_subnet\_service\_endpoints-spoke) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_tags_acr"></a> [tags\_acr](#input\_tags\_acr) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_aks"></a> [tags\_aks](#input\_tags\_aks) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_bastion"></a> [tags\_bastion](#input\_tags\_bastion) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_dns_private"></a> [tags\_dns\_private](#input\_tags\_dns\_private) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_gw"></a> [tags\_gw](#input\_tags\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_key_vault"></a> [tags\_key\_vault](#input\_tags\_key\_vault) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_local_gw"></a> [tags\_local\_gw](#input\_tags\_local\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_log_analytcs"></a> [tags\_log\_analytcs](#input\_tags\_log\_analytcs) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_network_watcher"></a> [tags\_network\_watcher](#input\_tags\_network\_watcher) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip"></a> [tags\_public\_ip](#input\_tags\_public\_ip) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip_gw"></a> [tags\_public\_ip\_gw](#input\_tags\_public\_ip\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_rg"></a> [tags\_rg](#input\_tags\_rg) | Lista de mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_tags_storage"></a> [tags\_storage](#input\_tags\_storage) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vm-win"></a> [tags\_vm-win](#input\_tags\_vm-win) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_hub"></a> [tags\_vnet\_hub](#input\_tags\_vnet\_hub) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_spoke"></a> [tags\_vnet\_spoke](#input\_tags\_vnet\_spoke) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Que tipo de performance espera-se. Aceita os valores `Standard` e `Premium`. | `string` | `"Standard"` | no |
| <a name="input_tunneling_enabled"></a> [tunneling\_enabled](#input\_tunneling\_enabled) | O recurso Tunneling está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_type_gw"></a> [type\_gw](#input\_type\_gw) | O tipo do Gateway de Rede Virtual. As opções válidas são ExpressRoute ou Vpn | `string` | `"Vpn"` | no |
| <a name="input_type_local_gw"></a> [type\_local\_gw](#input\_type\_local\_gw) | O tipo de conexão. As opções válidas são ExpressRoute, IPsec ou Vnet2Vnet | `string` | `"IPsec"` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Usado para especificar se o UltraSSD está habilitado no pool de nós padrão. Default é false. | `bool` | `false` | no |
| <a name="input_use_network_existing_to_peering"></a> [use\_network\_existing\_to\_peering](#input\_use\_network\_existing\_to\_peering) | Criação de peering entre vnets que ja existem selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | Controla se os gateways remotos podem ser utilizados na rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Especifica o nome da Máquina Virtual. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size da VM do default node, por padrão Standard\_D2\_v2 | `list(string)` | <pre>[<br>  "Standard_D2_v2"<br>]</pre> | no |
| <a name="input_vm_size_default"></a> [vm\_size\_default](#input\_vm\_size\_default) | Size da VM do default node | `string` | `"Standard_D2_v2"` | no |
| <a name="input_vm_size_win"></a> [vm\_size\_win](#input\_vm\_size\_win) | Especifica o tamanho da Máquina Virtual | `string` | n/a | yes |
| <a name="input_vnet_links"></a> [vnet\_links](#input\_vnet\_links) | Esses Links habilitam a resolução e o registro de DNS dentro das Redes Virtuais do Azure usando o DNS Privado do Azure. | <pre>list(object({<br>    name                 = string<br>    virtual_network_name = string<br>    registration_enabled = bool<br>    rg_name              = string<br>  }))</pre> | `[]` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vnet_name-spoke"></a> [vnet\_name-spoke](#input\_vnet\_name-spoke) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vpn_type_gw"></a> [vpn\_type\_gw](#input\_vpn\_type\_gw) | O tipo de roteamento do Virtual Network Gateway. As opções válidas são RouteBased ou PolicyBased | `string` | `"RouteBased"` | no |
| <a name="input_windows_admin_password"></a> [windows\_admin\_password](#input\_windows\_admin\_password) | Senha do usuario admin do sitema windows | `string` | n/a | yes |
| <a name="input_windows_admin_username"></a> [windows\_admin\_username](#input\_windows\_admin\_username) | Usuário administrador de sistemas windows. Por padrão Solonetwork | `string` | `"Solonetwork"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | n/a |
| <a name="output_access_policy"></a> [access\_policy](#output\_access\_policy) | n/a |
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | n/a |
| <a name="output_analytics_id"></a> [analytics\_id](#output\_analytics\_id) | n/a |
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | n/a |
| <a name="output_azure_bastion_host_id"></a> [azure\_bastion\_host\_id](#output\_azure\_bastion\_host\_id) | n/a |
| <a name="output_azure_bastion_host_pip"></a> [azure\_bastion\_host\_pip](#output\_azure\_bastion\_host\_pip) | n/a |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | n/a |
| <a name="output_gateway_id"></a> [gateway\_id](#output\_gateway\_id) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | n/a |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | n/a |
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | n/a |
| <a name="output_network_watcher_location"></a> [network\_watcher\_location](#output\_network\_watcher\_location) | n/a |
| <a name="output_network_watcher_name"></a> [network\_watcher\_name](#output\_network\_watcher\_name) | n/a |
| <a name="output_pip_name"></a> [pip\_name](#output\_pip\_name) | n/a |
| <a name="output_pip_vpn_name"></a> [pip\_vpn\_name](#output\_pip\_vpn\_name) | n/a |
| <a name="output_rg_location"></a> [rg\_location](#output\_rg\_location) | n/a |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | n/a |
| <a name="output_storage_access_key"></a> [storage\_access\_key](#output\_storage\_access\_key) | n/a |
| <a name="output_storage_account_container"></a> [storage\_account\_container](#output\_storage\_account\_container) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
| <a name="output_storage_account_primary_web_host"></a> [storage\_account\_primary\_web\_host](#output\_storage\_account\_primary\_web\_host) | n/a |
| <a name="output_storage_account_url"></a> [storage\_account\_url](#output\_storage\_account\_url) | n/a |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | n/a |
| <a name="output_vm_ip"></a> [vm\_ip](#output\_vm\_ip) | n/a |
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | n/a |
| <a name="output_vnet_address_space-spoke"></a> [vnet\_address\_space-spoke](#output\_vnet\_address\_space-spoke) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |
| <a name="output_vnet_name-spoke"></a> [vnet\_name-spoke](#output\_vnet\_name-spoke) | n/a |
| <a name="output_vnet_subnet_names"></a> [vnet\_subnet\_names](#output\_vnet\_subnet\_names) | n/a |
| <a name="output_vnet_subnet_names-spoke"></a> [vnet\_subnet\_names-spoke](#output\_vnet\_subnet\_names-spoke) | n/a |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.29.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.27.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.13.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acr"></a> [acr](#module\_acr) | ../../modules/acr | n/a |
| <a name="module_aks"></a> [aks](#module\_aks) | ../../modules/aks | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ../../modules/bastion | n/a |
| <a name="module_dns_private"></a> [dns\_private](#module\_dns\_private) | ../../modules/dns/private | n/a |
| <a name="module_gatway_vpn"></a> [gatway\_vpn](#module\_gatway\_vpn) | ../../modules/network_gateway | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../../modules/key_vault | n/a |
| <a name="module_key_vault_access_policy"></a> [key\_vault\_access\_policy](#module\_key\_vault\_access\_policy) | ../../modules/access_policy | n/a |
| <a name="module_local_gw"></a> [local\_gw](#module\_local\_gw) | ../../modules/local_network_gateway | n/a |
| <a name="module_network_watcher"></a> [network\_watcher](#module\_network\_watcher) | ../../modules/network_watcher | n/a |
| <a name="module_pip"></a> [pip](#module\_pip) | ../../modules/pip | n/a |
| <a name="module_pip_vpn"></a> [pip\_vpn](#module\_pip\_vpn) | ../../modules/pip | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage | n/a |
| <a name="module_vm-win"></a> [vm-win](#module\_vm-win) | ../../modules/vm-windows | n/a |
| <a name="module_vnet-hub"></a> [vnet-hub](#module\_vnet-hub) | ../../modules/vnet | n/a |
| <a name="module_vnet-spoke"></a> [vnet-spoke](#module\_vnet-spoke) | ../../modules/vnet | n/a |
| <a name="module_wks_log"></a> [wks\_log](#module\_wks\_log) | ../../modules/log_analytics | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | Permite que você gerencie os Registros A de DNS no DNS Privado do Azure. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | n/a | `list(any)` | `[]` | no |
| <a name="input_acr_enable_admin"></a> [acr\_enable\_admin](#input\_acr\_enable\_admin) | Habilita usuário administrativo no Azure Container Registry | `string` | n/a | yes |
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | Nome do Registro de Container. Precisa ser um nome único porque a partir daqui será gerado o nome do registry. | `string` | n/a | yes |
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_address_space-spoke"></a> [address\_space-spoke](#input\_address\_space-spoke) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_admin_linux"></a> [admin\_linux](#input\_admin\_linux) | Usuário administrador de sistemas Linux | `string` | n/a | yes |
| <a name="input_admin_win_pass"></a> [admin\_win\_pass](#input\_admin\_win\_pass) | A senha associada à conta do administrador local. | `string` | n/a | yes |
| <a name="input_admin_win_username"></a> [admin\_win\_username](#input\_admin\_win\_username) | Especifica o nome da conta do administrador local. | `string` | n/a | yes |
| <a name="input_agent_count"></a> [agent\_count](#input\_agent\_count) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_agent_count_default"></a> [agent\_count\_default](#input\_agent\_count\_default) | Número de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_aks_dns_ip"></a> [aks\_dns\_ip](#input\_aks\_dns\_ip) | IP do DNS (deve estar dentro do range de IP do `aks_network_cidr`). | `string` | n/a | yes |
| <a name="input_aks_docker_bridge"></a> [aks\_docker\_bridge](#input\_aks\_docker\_bridge) | Endereço CIDR para ser usado como Docker Bridge. | `string` | n/a | yes |
| <a name="input_aks_enable_attach_acr"></a> [aks\_enable\_attach\_acr](#input\_aks\_enable\_attach\_acr) | Força o attach ou não do Kubernetes Services com o Azure Container Services (Obrigatório verificar a documentação adequada) | `bool` | n/a | yes |
| <a name="input_aks_network_cidr"></a> [aks\_network\_cidr](#input\_aks\_network\_cidr) | Endereço CIDR da rede do Kubernetes Service. | `string` | n/a | yes |
| <a name="input_aks_service_principal_app_id"></a> [aks\_service\_principal\_app\_id](#input\_aks\_service\_principal\_app\_id) | Credencial para conexão com service principal. | `string` | n/a | yes |
| <a name="input_aks_service_principal_client_secret"></a> [aks\_service\_principal\_client\_secret](#input\_aks\_service\_principal\_client\_secret) | Credencial para conexão com service principal | `string` | n/a | yes |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Metodo de aloação do Public, a opção is\_public\_ip\_enabled deve ser True. Por padão é static | `string` | `"Static"` | no |
| <a name="input_allocation_method_pip"></a> [allocation\_method\_pip](#input\_allocation\_method\_pip) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allocation_method_pip_gw"></a> [allocation\_method\_pip\_gw](#input\_allocation\_method\_pip\_gw) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allow_forwarded_traffic"></a> [allow\_forwarded\_traffic](#input\_allow\_forwarded\_traffic) | Controla se o tráfego encaminhado de VMs na rede virtual remota é permitido. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_gateway_transit"></a> [allow\_gateway\_transit](#input\_allow\_gateway\_transit) | Os controles gatewayLinks podem ser usados ​​no link da rede virtual remota para a rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_virtual_network_access"></a> [allow\_virtual\_network\_access](#input\_allow\_virtual\_network\_access) | Controla se as VMs na rede virtual remota podem acessar as VMs na rede virtual local. O padrão é true. | `bool` | `true` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | Range de IPs que são liberados para gerência dos server nodes. | `set(string)` | `null` | no |
| <a name="input_auto_scaling_default"></a> [auto\_scaling\_default](#input\_auto\_scaling\_default) | Ativa o auto scaling dos nopdes linux. por padrão false. | `bool` | `false` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Habilitar ou não o add-on de Azure Policy para Kubernetes. Por padão é False | `bool` | `false` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Especifica o nome do Bastion Host | `string` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | specifica os requisitos de cache para o disco do sistema operaciona. Por padrão é ReadOnly | `string` | `"ReadOnly"` | no |
| <a name="input_client_configuration"></a> [client\_configuration](#input\_client\_configuration) | If set it will activate point-to-site configuration. | <pre>object({<br>    address_space = string<br>    protocols     = list(string)<br>    certificate   = string<br>  })</pre> | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | Permite que você gerencie registros CNAME de DNS no DNS privado do Azure. | <pre>list(object({<br>    name   = string<br>    ttl    = number<br>    record = string<br>  }))</pre> | `[]` | no |
| <a name="input_copy_paste_enabled"></a> [copy\_paste\_enabled](#input\_copy\_paste\_enabled) | O recurso Copiar/Colar está habilitado para o Bastion. Padrões para True | `bool` | `true` | no |
| <a name="input_create_vnet_peering"></a> [create\_vnet\_peering](#input\_create\_vnet\_peering) | Criação de peering entre vnets selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_disable_local_account"></a> [disable\_local\_account](#input\_disable\_local\_account) | Desabilita o acesso ao cluster com usuários locais. Por padrão é True | `bool` | `true` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Prefixo DNS do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_dns_private_name"></a> [dns\_private\_name](#input\_dns\_private\_name) | Especifica o nome do DNS privado | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers-spoke"></a> [dns\_servers-spoke](#input\_dns\_servers-spoke) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers_to_nic"></a> [dns\_servers\_to\_nic](#input\_dns\_servers\_to\_nic) | Dns Server para criação nic. | `list(string)` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Ativa o auto scaling dos nopdes linux. por padrão false | `bool` | `false` | no |
| <a name="input_enable_automatic_upgrades"></a> [enable\_automatic\_upgrades](#input\_enable\_automatic\_upgrades) | As atualizações automáticas estão habilitadas nesta máquina virtual. Padrões para false. | `bool` | `"false"` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | Habilita criptografia no default node pool, Por padão é false | `bool` | `false` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Propriedade que define se a autorização será feita via RBAC ao invés de access policies. | `bool` | `false` | no |
| <a name="input_enable_secure_transfer"></a> [enable\_secure\_transfer](#input\_enable\_secure\_transfer) | Força ou não a utilização de transferência de dados exclusivamente por HTTPS. | `bool` | `true` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Propriedade que define se máquinas virtuais do Azure têm permissão para recuperar certificados armazenados como segredos no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Propriedade que define se  o Azure Disk Encryption tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Propriedade que define se o Azure Resource Manager tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_existing_public_ip"></a> [existing\_public\_ip](#input\_existing\_public\_ip) | Usar um Public IP existente. Por padão e False | `bool` | `false` | no |
| <a name="input_file_copy_enabled"></a> [file\_copy\_enabled](#input\_file\_copy\_enabled) | O recurso de cópia de arquivo está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_gateway_name"></a> [gateway\_name](#input\_gateway\_name) | Name of virtual gateway. | `string` | n/a | yes |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Habilitar ou não Roteamento HTTP de Aplicação. Por padão é True | `bool` | `true` | no |
| <a name="input_id_ddos_plan"></a> [id\_ddos\_plan](#input\_id\_ddos\_plan) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_id_ddos_plan-spoke"></a> [id\_ddos\_plan-spoke](#input\_id\_ddos\_plan-spoke) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_img_offer"></a> [img\_offer](#input\_img\_offer) | Especifica a oferta da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_publisher"></a> [img\_publisher](#input\_img\_publisher) | Especifica o editor da imagem. | `string` | n/a | yes |
| <a name="input_img_sku"></a> [img\_sku](#input\_img\_sku) | Especifica o SKU da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_version"></a> [img\_version](#input\_img\_version) | Especifica a versão da imagem usada para criar a máquina virtual. | `string` | `"latest"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | O endereço IP estático que deve ser usado. | `string` | n/a | yes |
| <a name="input_ip_allocation"></a> [ip\_allocation](#input\_ip\_allocation) | O método de alocação usado para o endereço IP privado. O padão é Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | O nome da configuração de IP | `string` | n/a | yes |
| <a name="input_ip_connect_enabled"></a> [ip\_connect\_enabled](#input\_ip\_connect\_enabled) | O recurso IP Connect está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_ip_version_pip"></a> [ip\_version\_pip](#input\_ip\_version\_pip) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_ip_version_pip_gw"></a> [ip\_version\_pip\_gw](#input\_ip\_version\_pip\_gw) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_is_ddos_plan_enabled"></a> [is\_ddos\_plan\_enabled](#input\_is\_ddos\_plan\_enabled) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_ddos_plan_enabled-spoke"></a> [is\_ddos\_plan\_enabled-spoke](#input\_is\_ddos\_plan\_enabled-spoke) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_identity_enabled"></a> [is\_identity\_enabled](#input\_is\_identity\_enabled) | Habilitar ou não o uso de identidade gerenciada. | `bool` | `false` | no |
| <a name="input_is_public_ip_enabled"></a> [is\_public\_ip\_enabled](#input\_is\_public\_ip\_enabled) | Criar um novo Public IP para VM. Por padrão é False | `bool` | `false` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Versão do Kubernetes. Por opadão é 1.19.9 | `string` | `"1.19.9"` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Qual SKU do do blob storage é usado. | `string` | `"StorageV2"` | no |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | Nome do cofre. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_labels_default"></a> [labels\_default](#input\_labels\_default) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `map(any)` | `{}` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | Modelo de SKU do Load Balancer no cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_license_act"></a> [license\_act](#input\_license\_act) | Especifica o tipo BYOL para esta máquina virtual | `string` | n/a | yes |
| <a name="input_local_networks"></a> [local\_networks](#input\_local\_networks) | List of local virtual network connections to connect to gateway. | <pre>list(<br>    object({<br>      name            = string<br>      gateway_address = string<br>      address_space   = list(string)<br>      shared_key      = string<br>      ipsec_policy    = any<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | A região do datacenter onde seus recursos serão criados. | `string` | `"eastus2"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID do Log Analytics. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Nome do workspace do Log Analytics. É obrigatório caso `enable_log_analytics_workspace` for marcado como `true` | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Define a SKU utilizada pelo Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Define o número de dias em que os logs serão armazenados no Workspace. | `number` | `30` | no |
| <a name="input_managed_disk_type"></a> [managed\_disk\_type](#input\_managed\_disk\_type) | Especifica o tipo de disco gerenciado a ser criado. | `string` | `"Standard_LRS"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Número maximo de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_max_nodes_default"></a> [max\_nodes\_default](#input\_max\_nodes\_default) | Número maximo de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | Quantidade máxima de Pods por node (dentro do Default node). | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "1"<br>]</pre> | no |
| <a name="input_min_nodes_default"></a> [min\_nodes\_default](#input\_min\_nodes\_default) | Número de nodes do Cluster Kubernetes. | `string` | `1` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Este pool de nós deve ser usado para recursos do kube-system ou do user. Por padrão user | `list(string)` | n/a | yes |
| <a name="input_name_pool_default"></a> [name\_pool\_default](#input\_name\_pool\_default) | Nome do pool do Cluster Kubernetes. | `string` | `"agentpool"` | no |
| <a name="input_nat_gateway_ids"></a> [nat\_gateway\_ids](#input\_nat\_gateway\_ids) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_nat_gateway_ids-spoke"></a> [nat\_gateway\_ids-spoke](#input\_nat\_gateway\_ids-spoke) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_network_acls_bypass"></a> [network\_acls\_bypass](#input\_network\_acls\_bypass) | Propriedade que define se os serviços do Azure podem realizar operações no cofre. (AzureServices ou None) | `string` | `"None"` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | Ação a ser realizada quando o tráfego de rede de origem for diferente das regras especificadas. (Allow ou Deny) | `string` | `"Deny"` | no |
| <a name="input_network_acls_ip_rules"></a> [network\_acls\_ip\_rules](#input\_network\_acls\_ip\_rules) | Um ou mais endereços de IP ou blocos CIDR que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_acls_virtual_network_subnet_ids"></a> [network\_acls\_virtual\_network\_subnet\_ids](#input\_network\_acls\_virtual\_network\_subnet\_ids) | Um ou mais IDs de subnets que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Modelo de plugin de rede utilizado no Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Politicas de redes do Azure CNI clico ou azure | `string` | `"azure"` | no |
| <a name="input_network_watcher_name"></a> [network\_watcher\_name](#input\_network\_watcher\_name) | Nome do network watcher | `string` | n/a | yes |
| <a name="input_node_av_zone"></a> [node\_av\_zone](#input\_node\_av\_zone) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |
| <a name="input_node_pool"></a> [node\_pool](#input\_node\_pool) | Nome do node pool do Cluster Kubernetes. | `list(string)` | `[]` | no |
| <a name="input_node_vm_disk_size"></a> [node\_vm\_disk\_size](#input\_node\_vm\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `number` | `30` | no |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_nsg_ids-spoke"></a> [nsg\_ids-spoke](#input\_nsg\_ids-spoke) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_oms_agent_enabled"></a> [oms\_agent\_enabled](#input\_oms\_agent\_enabled) | Habilita o OMS Agent no Cluster Kubernetes. | `bool` | `true` | no |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Tipo de sistema operacional dos nodes. Aceita os valores `Windows` ou `Linux`. | `list(string)` | n/a | yes |
| <a name="input_pip_name"></a> [pip\_name](#input\_pip\_name) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_pip_name_gw"></a> [pip\_name\_gw](#input\_pip\_name\_gw) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Habilita que o cluster teha suas APIs dipostas somente para a rede interna. Por padrão é False | `bool` | `false` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Define como o endereço IP privado da interface virtual dos gateways é atribuído. As opções válidas são Static ou Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | O Agente Convidado da Máquina Virtual do Azure deve ser instalado nesta Máquina Virtual. Padrões para True. | `bool` | `true` | no |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | ID do Public IP existente, a opção existing\_public\_ip tem que estar como True. Por padão é null | `string` | `null` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Sku para criação do novo Public IP, a opção is\_public\_ip\_enabled deve ser True. Por padão é basic | `string` | `"Basic"` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Propriedade que define se a feature Purge Protection será habilitada. | `bool` | `false` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | Object ID dos grupos com acesso administrativo ao cluster Kubernetes. | `any` | `null` | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | Habilita Role Based Access Control based com Azure AD | `bool` | `null` | no |
| <a name="input_rbac_aad_client_app_id"></a> [rbac\_aad\_client\_app\_id](#input\_rbac\_aad\_client\_app\_id) | Client ID da aplicação do Azure Active Directory. | `string` | `null` | no |
| <a name="input_rbac_aad_managed"></a> [rbac\_aad\_managed](#input\_rbac\_aad\_managed) | Integração com Azure Active Directory, habilitado, significa que o Azure criará/gerenciará a entidade de Serviço usada para integração. | `bool` | `false` | no |
| <a name="input_rbac_aad_server_app_id"></a> [rbac\_aad\_server\_app\_id](#input\_rbac\_aad\_server\_app\_id) | Server ID do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_server_app_secret"></a> [rbac\_aad\_server\_app\_secret](#input\_rbac\_aad\_server\_app\_secret) | Server Secret do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_tenant_id"></a> [rbac\_aad\_tenant\_id](#input\_rbac\_aad\_tenant\_id) | ID do tenant usada para o aplicativo do Azure Active Directory. Se isso não for especificado, a ID do tenant da assinatura atual será utilizado. | `string` | `null` | no |
| <a name="input_replication"></a> [replication](#input\_replication) | Que tipo de replicação será usada pela Storage Account. | `string` | `"GRS"` | no |
| <a name="input_resource_group_names"></a> [resource\_group\_names](#input\_resource\_group\_names) | O nome do seu Resource Group | `list(string)` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Habilitar Role Based Access Control. | `bool` | `false` | no |
| <a name="input_route_tables_ids"></a> [route\_tables\_ids](#input\_route\_tables\_ids) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_route_tables_ids-spoke"></a> [route\_tables\_ids-spoke](#input\_route\_tables\_ids-spoke) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_scale_units"></a> [scale\_units](#input\_scale\_units) | O número de unidades de escala com as quais provisionar o Bastion. Por padrão e 2 | `number` | `2` | no |
| <a name="input_shareable_link_enabled"></a> [shareable\_link\_enabled](#input\_shareable\_link\_enabled) | O recurso Link compartilhável está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_sizegbdisk"></a> [sizegbdisk](#input\_sizegbdisk) | Especifica o tamanho do disco de dados em gigabyte | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU do Registro de Container. Aceita os valores `Standard`, `Premium` ou `Basic`. | `string` | `"Standard"` | no |
| <a name="input_sku_bastion_name"></a> [sku\_bastion\_name](#input\_sku\_bastion\_name) | O SKU do Bastion Host (Basic ou Standard). | `string` | n/a | yes |
| <a name="input_sku_gw"></a> [sku\_gw](#input\_sku\_gw) | Configuração do tamanho e capacidade do gateway de rede virtual. As opções válidas são Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ e VpnGw5AZ | `string` | `"VpnGw1"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Definição da SKU (standard ou premium). | `string` | n/a | yes |
| <a name="input_sku_pip"></a> [sku\_pip](#input\_sku\_pip) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_pip_gw"></a> [sku\_pip\_gw](#input\_sku\_pip\_gw) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_sku_tier_aks"></a> [sku\_tier\_aks](#input\_sku\_tier\_aks) | O nível de SKU que deve ser usado para este cluster Kubernetes. Os valores possíveis são Free e Paid. Por padãro e Free | `string` | `"Free"` | no |
| <a name="input_sku_tier_gw"></a> [sku\_tier\_gw](#input\_sku\_tier\_gw) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Quantidade de dias para retenção do 'soft delete'. (90 >= days >= 7) | `number` | `90` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Chave púclica SSH para acesso ao sistema do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | Obrigatório caso `static_website_enabled` seja `true`. Bloco que define caminho para os arquivos do website (ver exemplo de código). | `map(any)` | `{}` | no |
| <a name="input_static_website_enabled"></a> [static\_website\_enabled](#input\_static\_website\_enabled) | Especifica se o armazenamento para websites estáticos será habilitado. | `bool` | `false` | no |
| <a name="input_storacc_containers"></a> [storacc\_containers](#input\_storacc\_containers) | Utilizá-lo quando houver a necessidade de criar containers dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storacc_shares"></a> [storacc\_shares](#input\_storacc\_shares) | Utilizá-lo quando houver a necessidade de criar file shares dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Nome da Storage Account. | `string` | n/a | yes |
| <a name="input_storage_uri"></a> [storage\_uri](#input\_storage\_uri) | O Blob Endpoint da Conta de Armazenamento que deve conter os arquivos de diagnóstico da máquina virtual. | `string` | n/a | yes |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies"></a> [subnet\_enforce\_private\_link\_service\_network\_policies](#input\_subnet\_enforce\_private\_link\_service\_network\_policies) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_service\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_service\_network\_policies-spoke) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names-spoke"></a> [subnet\_names-spoke](#input\_subnet\_names-spoke) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names_aks"></a> [subnet\_names\_aks](#input\_subnet\_names\_aks) | Nome da Subnet do AKS com CNI | `string` | `""` | no |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes-spoke"></a> [subnet\_prefixes-spoke](#input\_subnet\_prefixes-spoke) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_subnet_service_endpoints-spoke"></a> [subnet\_service\_endpoints-spoke](#input\_subnet\_service\_endpoints-spoke) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_tags_acr"></a> [tags\_acr](#input\_tags\_acr) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_aks"></a> [tags\_aks](#input\_tags\_aks) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_bastion"></a> [tags\_bastion](#input\_tags\_bastion) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_dns_private"></a> [tags\_dns\_private](#input\_tags\_dns\_private) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_gw"></a> [tags\_gw](#input\_tags\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_key_vault"></a> [tags\_key\_vault](#input\_tags\_key\_vault) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_local_gw"></a> [tags\_local\_gw](#input\_tags\_local\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_log_analytcs"></a> [tags\_log\_analytcs](#input\_tags\_log\_analytcs) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_network_watcher"></a> [tags\_network\_watcher](#input\_tags\_network\_watcher) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip"></a> [tags\_public\_ip](#input\_tags\_public\_ip) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip_gw"></a> [tags\_public\_ip\_gw](#input\_tags\_public\_ip\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_rg"></a> [tags\_rg](#input\_tags\_rg) | Lista de mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_tags_storage"></a> [tags\_storage](#input\_tags\_storage) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vm-win"></a> [tags\_vm-win](#input\_tags\_vm-win) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_hub"></a> [tags\_vnet\_hub](#input\_tags\_vnet\_hub) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_spoke"></a> [tags\_vnet\_spoke](#input\_tags\_vnet\_spoke) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Que tipo de performance espera-se. Aceita os valores `Standard` e `Premium`. | `string` | `"Standard"` | no |
| <a name="input_tunneling_enabled"></a> [tunneling\_enabled](#input\_tunneling\_enabled) | O recurso Tunneling está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_type_gw"></a> [type\_gw](#input\_type\_gw) | O tipo do Gateway de Rede Virtual. As opções válidas são ExpressRoute ou Vpn | `string` | `"Vpn"` | no |
| <a name="input_type_local_gw"></a> [type\_local\_gw](#input\_type\_local\_gw) | O tipo de conexão. As opções válidas são ExpressRoute, IPsec ou Vnet2Vnet | `string` | `"IPsec"` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Usado para especificar se o UltraSSD está habilitado no pool de nós padrão. Default é false. | `bool` | `false` | no |
| <a name="input_use_network_existing_to_peering"></a> [use\_network\_existing\_to\_peering](#input\_use\_network\_existing\_to\_peering) | Criação de peering entre vnets que ja existem selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | Controla se os gateways remotos podem ser utilizados na rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Especifica o nome da Máquina Virtual. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size da VM do default node, por padrão Standard\_D2\_v2 | `list(string)` | <pre>[<br>  "Standard_D2_v2"<br>]</pre> | no |
| <a name="input_vm_size_default"></a> [vm\_size\_default](#input\_vm\_size\_default) | Size da VM do default node | `string` | `"Standard_D2_v2"` | no |
| <a name="input_vm_size_win"></a> [vm\_size\_win](#input\_vm\_size\_win) | Especifica o tamanho da Máquina Virtual | `string` | n/a | yes |
| <a name="input_vnet_links"></a> [vnet\_links](#input\_vnet\_links) | Esses Links habilitam a resolução e o registro de DNS dentro das Redes Virtuais do Azure usando o DNS Privado do Azure. | <pre>list(object({<br>    name                 = string<br>    virtual_network_name = string<br>    registration_enabled = bool<br>    rg_name              = string<br>  }))</pre> | `[]` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vnet_name-spoke"></a> [vnet\_name-spoke](#input\_vnet\_name-spoke) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vpn_type_gw"></a> [vpn\_type\_gw](#input\_vpn\_type\_gw) | O tipo de roteamento do Virtual Network Gateway. As opções válidas são RouteBased ou PolicyBased | `string` | `"RouteBased"` | no |
| <a name="input_windows_admin_password"></a> [windows\_admin\_password](#input\_windows\_admin\_password) | Senha do usuario admin do sitema windows | `string` | n/a | yes |
| <a name="input_windows_admin_username"></a> [windows\_admin\_username](#input\_windows\_admin\_username) | Usuário administrador de sistemas windows. Por padrão Solonetwork | `string` | `"Solonetwork"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | n/a |
| <a name="output_access_policy"></a> [access\_policy](#output\_access\_policy) | n/a |
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | n/a |
| <a name="output_analytics_id"></a> [analytics\_id](#output\_analytics\_id) | n/a |
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | n/a |
| <a name="output_azure_bastion_host_id"></a> [azure\_bastion\_host\_id](#output\_azure\_bastion\_host\_id) | n/a |
| <a name="output_azure_bastion_host_pip"></a> [azure\_bastion\_host\_pip](#output\_azure\_bastion\_host\_pip) | n/a |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | n/a |
| <a name="output_gateway_id"></a> [gateway\_id](#output\_gateway\_id) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | n/a |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | n/a |
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | n/a |
| <a name="output_network_watcher_location"></a> [network\_watcher\_location](#output\_network\_watcher\_location) | n/a |
| <a name="output_network_watcher_name"></a> [network\_watcher\_name](#output\_network\_watcher\_name) | n/a |
| <a name="output_pip_name"></a> [pip\_name](#output\_pip\_name) | n/a |
| <a name="output_pip_vpn_name"></a> [pip\_vpn\_name](#output\_pip\_vpn\_name) | n/a |
| <a name="output_rg_location"></a> [rg\_location](#output\_rg\_location) | n/a |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | n/a |
| <a name="output_storage_access_key"></a> [storage\_access\_key](#output\_storage\_access\_key) | n/a |
| <a name="output_storage_account_container"></a> [storage\_account\_container](#output\_storage\_account\_container) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
| <a name="output_storage_account_primary_web_host"></a> [storage\_account\_primary\_web\_host](#output\_storage\_account\_primary\_web\_host) | n/a |
| <a name="output_storage_account_url"></a> [storage\_account\_url](#output\_storage\_account\_url) | n/a |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | n/a |
| <a name="output_vm_ip"></a> [vm\_ip](#output\_vm\_ip) | n/a |
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | n/a |
| <a name="output_vnet_address_space-spoke"></a> [vnet\_address\_space-spoke](#output\_vnet\_address\_space-spoke) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |
| <a name="output_vnet_name-spoke"></a> [vnet\_name-spoke](#output\_vnet\_name-spoke) | n/a |
| <a name="output_vnet_subnet_names"></a> [vnet\_subnet\_names](#output\_vnet\_subnet\_names) | n/a |
| <a name="output_vnet_subnet_names-spoke"></a> [vnet\_subnet\_names-spoke](#output\_vnet\_subnet\_names-spoke) | n/a |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | n/a |
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.29.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.27.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.13.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.33.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acr"></a> [acr](#module\_acr) | ../../modules/acr | n/a |
| <a name="module_aks"></a> [aks](#module\_aks) | ../../modules/aks | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ../../modules/bastion | n/a |
| <a name="module_dns_private"></a> [dns\_private](#module\_dns\_private) | ../../modules/dns/private | n/a |
| <a name="module_gatway_vpn"></a> [gatway\_vpn](#module\_gatway\_vpn) | ../../modules/network_gateway | n/a |
| <a name="module_key_vault"></a> [key\_vault](#module\_key\_vault) | ../../modules/key_vault | n/a |
| <a name="module_key_vault_access_policy"></a> [key\_vault\_access\_policy](#module\_key\_vault\_access\_policy) | ../../modules/access_policy | n/a |
| <a name="module_local_gw"></a> [local\_gw](#module\_local\_gw) | ../../modules/local_network_gateway | n/a |
| <a name="module_network_watcher"></a> [network\_watcher](#module\_network\_watcher) | ../../modules/network_watcher | n/a |
| <a name="module_pip"></a> [pip](#module\_pip) | ../../modules/pip | n/a |
| <a name="module_pip_vpn"></a> [pip\_vpn](#module\_pip\_vpn) | ../../modules/pip | n/a |
| <a name="module_storage_account"></a> [storage\_account](#module\_storage\_account) | ../../modules/storage | n/a |
| <a name="module_vm-win"></a> [vm-win](#module\_vm-win) | ../../modules/vm-windows | n/a |
| <a name="module_vnet-hub"></a> [vnet-hub](#module\_vnet-hub) | ../../modules/vnet | n/a |
| <a name="module_vnet-spoke"></a> [vnet-spoke](#module\_vnet-spoke) | ../../modules/vnet | n/a |
| <a name="module_wks_log"></a> [wks\_log](#module\_wks\_log) | ../../modules/log_analytics | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | Permite que você gerencie os Registros A de DNS no DNS Privado do Azure. | <pre>list(object({<br>    name    = string<br>    ttl     = number<br>    records = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_access_policies"></a> [access\_policies](#input\_access\_policies) | n/a | `list(any)` | `[]` | no |
| <a name="input_acr_enable_admin"></a> [acr\_enable\_admin](#input\_acr\_enable\_admin) | Habilita usuário administrativo no Azure Container Registry | `string` | n/a | yes |
| <a name="input_acr_name"></a> [acr\_name](#input\_acr\_name) | Nome do Registro de Container. Precisa ser um nome único porque a partir daqui será gerado o nome do registry. | `string` | n/a | yes |
| <a name="input_active_active"></a> [active\_active](#input\_active\_active) | If true, an active-active Virtual Network Gateway will be created. An active-active gateway requires a HighPerformance or an UltraPerformance sku. If false, an active-standby gateway will be created. Defaults to false. | `bool` | `false` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_address_space-spoke"></a> [address\_space-spoke](#input\_address\_space-spoke) | Range de ip da rede virtual | `list(string)` | n/a | yes |
| <a name="input_admin_linux"></a> [admin\_linux](#input\_admin\_linux) | Usuário administrador de sistemas Linux | `string` | n/a | yes |
| <a name="input_admin_win_pass"></a> [admin\_win\_pass](#input\_admin\_win\_pass) | A senha associada à conta do administrador local. | `string` | n/a | yes |
| <a name="input_admin_win_username"></a> [admin\_win\_username](#input\_admin\_win\_username) | Especifica o nome da conta do administrador local. | `string` | n/a | yes |
| <a name="input_agent_count"></a> [agent\_count](#input\_agent\_count) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_agent_count_default"></a> [agent\_count\_default](#input\_agent\_count\_default) | Número de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_aks_dns_ip"></a> [aks\_dns\_ip](#input\_aks\_dns\_ip) | IP do DNS (deve estar dentro do range de IP do `aks_network_cidr`). | `string` | n/a | yes |
| <a name="input_aks_docker_bridge"></a> [aks\_docker\_bridge](#input\_aks\_docker\_bridge) | Endereço CIDR para ser usado como Docker Bridge. | `string` | n/a | yes |
| <a name="input_aks_enable_attach_acr"></a> [aks\_enable\_attach\_acr](#input\_aks\_enable\_attach\_acr) | Força o attach ou não do Kubernetes Services com o Azure Container Services (Obrigatório verificar a documentação adequada) | `bool` | n/a | yes |
| <a name="input_aks_network_cidr"></a> [aks\_network\_cidr](#input\_aks\_network\_cidr) | Endereço CIDR da rede do Kubernetes Service. | `string` | n/a | yes |
| <a name="input_aks_service_principal_app_id"></a> [aks\_service\_principal\_app\_id](#input\_aks\_service\_principal\_app\_id) | Credencial para conexão com service principal. | `string` | n/a | yes |
| <a name="input_aks_service_principal_client_secret"></a> [aks\_service\_principal\_client\_secret](#input\_aks\_service\_principal\_client\_secret) | Credencial para conexão com service principal | `string` | n/a | yes |
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Metodo de aloação do Public, a opção is\_public\_ip\_enabled deve ser True. Por padão é static | `string` | `"Static"` | no |
| <a name="input_allocation_method_pip"></a> [allocation\_method\_pip](#input\_allocation\_method\_pip) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allocation_method_pip_gw"></a> [allocation\_method\_pip\_gw](#input\_allocation\_method\_pip\_gw) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_allow_forwarded_traffic"></a> [allow\_forwarded\_traffic](#input\_allow\_forwarded\_traffic) | Controla se o tráfego encaminhado de VMs na rede virtual remota é permitido. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_gateway_transit"></a> [allow\_gateway\_transit](#input\_allow\_gateway\_transit) | Os controles gatewayLinks podem ser usados ​​no link da rede virtual remota para a rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_allow_virtual_network_access"></a> [allow\_virtual\_network\_access](#input\_allow\_virtual\_network\_access) | Controla se as VMs na rede virtual remota podem acessar as VMs na rede virtual local. O padrão é true. | `bool` | `true` | no |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | Range de IPs que são liberados para gerência dos server nodes. | `set(string)` | `null` | no |
| <a name="input_auto_scaling_default"></a> [auto\_scaling\_default](#input\_auto\_scaling\_default) | Ativa o auto scaling dos nopdes linux. por padrão false. | `bool` | `false` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | Habilitar ou não o add-on de Azure Policy para Kubernetes. Por padão é False | `bool` | `false` | no |
| <a name="input_bastion_name"></a> [bastion\_name](#input\_bastion\_name) | Especifica o nome do Bastion Host | `string` | n/a | yes |
| <a name="input_caching"></a> [caching](#input\_caching) | specifica os requisitos de cache para o disco do sistema operaciona. Por padrão é ReadOnly | `string` | `"ReadOnly"` | no |
| <a name="input_client_configuration"></a> [client\_configuration](#input\_client\_configuration) | If set it will activate point-to-site configuration. | <pre>object({<br>    address_space = string<br>    protocols     = list(string)<br>    certificate   = string<br>  })</pre> | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Nome do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_cname_records"></a> [cname\_records](#input\_cname\_records) | Permite que você gerencie registros CNAME de DNS no DNS privado do Azure. | <pre>list(object({<br>    name   = string<br>    ttl    = number<br>    record = string<br>  }))</pre> | `[]` | no |
| <a name="input_copy_paste_enabled"></a> [copy\_paste\_enabled](#input\_copy\_paste\_enabled) | O recurso Copiar/Colar está habilitado para o Bastion. Padrões para True | `bool` | `true` | no |
| <a name="input_create_vnet_peering"></a> [create\_vnet\_peering](#input\_create\_vnet\_peering) | Criação de peering entre vnets selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_disable_local_account"></a> [disable\_local\_account](#input\_disable\_local\_account) | Desabilita o acesso ao cluster com usuários locais. Por padrão é True | `bool` | `true` | no |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | Prefixo DNS do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_dns_private_name"></a> [dns\_private\_name](#input\_dns\_private\_name) | Especifica o nome do DNS privado | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers-spoke"></a> [dns\_servers-spoke](#input\_dns\_servers-spoke) | Customizar Dns server da rede virtual, por padrão Default (Azure-provided) | `list(string)` | `[]` | no |
| <a name="input_dns_servers_to_nic"></a> [dns\_servers\_to\_nic](#input\_dns\_servers\_to\_nic) | Dns Server para criação nic. | `list(string)` | n/a | yes |
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | Ativa o auto scaling dos nopdes linux. por padrão false | `bool` | `false` | no |
| <a name="input_enable_automatic_upgrades"></a> [enable\_automatic\_upgrades](#input\_enable\_automatic\_upgrades) | As atualizações automáticas estão habilitadas nesta máquina virtual. Padrões para false. | `bool` | `"false"` | no |
| <a name="input_enable_bgp"></a> [enable\_bgp](#input\_enable\_bgp) | If true, BGP (Border Gateway Protocol) will be enabled for this Virtual Network Gateway. Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | Habilita criptografia no default node pool, Por padão é false | `bool` | `false` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_public_ip"></a> [enable\_public\_ip](#input\_enable\_public\_ip) | Habilita ou não se os nós devem ter um endereço IP público. Default é false. | `bool` | `false` | no |
| <a name="input_enable_rbac_authorization"></a> [enable\_rbac\_authorization](#input\_enable\_rbac\_authorization) | Propriedade que define se a autorização será feita via RBAC ao invés de access policies. | `bool` | `false` | no |
| <a name="input_enable_secure_transfer"></a> [enable\_secure\_transfer](#input\_enable\_secure\_transfer) | Força ou não a utilização de transferência de dados exclusivamente por HTTPS. | `bool` | `true` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | Propriedade que define se máquinas virtuais do Azure têm permissão para recuperar certificados armazenados como segredos no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | Propriedade que define se  o Azure Disk Encryption tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | Propriedade que define se o Azure Resource Manager tem permissão para recuperar segredos armazenados no cofre. | `bool` | `false` | no |
| <a name="input_existing_public_ip"></a> [existing\_public\_ip](#input\_existing\_public\_ip) | Usar um Public IP existente. Por padão e False | `bool` | `false` | no |
| <a name="input_file_copy_enabled"></a> [file\_copy\_enabled](#input\_file\_copy\_enabled) | O recurso de cópia de arquivo está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_gateway_name"></a> [gateway\_name](#input\_gateway\_name) | Name of virtual gateway. | `string` | n/a | yes |
| <a name="input_global_tags"></a> [global\_tags](#input\_global\_tags) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | Habilitar ou não Roteamento HTTP de Aplicação. Por padão é True | `bool` | `true` | no |
| <a name="input_id_ddos_plan"></a> [id\_ddos\_plan](#input\_id\_ddos\_plan) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_id_ddos_plan-spoke"></a> [id\_ddos\_plan-spoke](#input\_id\_ddos\_plan-spoke) | Id do Plano DDOS | `string` | `null` | no |
| <a name="input_img_offer"></a> [img\_offer](#input\_img\_offer) | Especifica a oferta da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_publisher"></a> [img\_publisher](#input\_img\_publisher) | Especifica o editor da imagem. | `string` | n/a | yes |
| <a name="input_img_sku"></a> [img\_sku](#input\_img\_sku) | Especifica o SKU da imagem usada para criar a máquina virtual. | `string` | n/a | yes |
| <a name="input_img_version"></a> [img\_version](#input\_img\_version) | Especifica a versão da imagem usada para criar a máquina virtual. | `string` | `"latest"` | no |
| <a name="input_ip_address"></a> [ip\_address](#input\_ip\_address) | O endereço IP estático que deve ser usado. | `string` | n/a | yes |
| <a name="input_ip_allocation"></a> [ip\_allocation](#input\_ip\_allocation) | O método de alocação usado para o endereço IP privado. O padão é Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_ip_configuration_name"></a> [ip\_configuration\_name](#input\_ip\_configuration\_name) | O nome da configuração de IP | `string` | n/a | yes |
| <a name="input_ip_connect_enabled"></a> [ip\_connect\_enabled](#input\_ip\_connect\_enabled) | O recurso IP Connect está ativado para o Bastion. Padrões para False | `bool` | `false` | no |
| <a name="input_ip_version_pip"></a> [ip\_version\_pip](#input\_ip\_version\_pip) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_ip_version_pip_gw"></a> [ip\_version\_pip\_gw](#input\_ip\_version\_pip\_gw) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_is_ddos_plan_enabled"></a> [is\_ddos\_plan\_enabled](#input\_is\_ddos\_plan\_enabled) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_ddos_plan_enabled-spoke"></a> [is\_ddos\_plan\_enabled-spoke](#input\_is\_ddos\_plan\_enabled-spoke) | Determina se esta ativado para o plano DDOS. Por padrão e False | `bool` | `false` | no |
| <a name="input_is_identity_enabled"></a> [is\_identity\_enabled](#input\_is\_identity\_enabled) | Habilitar ou não o uso de identidade gerenciada. | `bool` | `false` | no |
| <a name="input_is_public_ip_enabled"></a> [is\_public\_ip\_enabled](#input\_is\_public\_ip\_enabled) | Criar um novo Public IP para VM. Por padrão é False | `bool` | `false` | no |
| <a name="input_k8s_version"></a> [k8s\_version](#input\_k8s\_version) | Versão do Kubernetes. Por opadão é 1.19.9 | `string` | `"1.19.9"` | no |
| <a name="input_kind"></a> [kind](#input\_kind) | Qual SKU do do blob storage é usado. | `string` | `"StorageV2"` | no |
| <a name="input_kv_name"></a> [kv\_name](#input\_kv\_name) | Nome do cofre. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_labels_default"></a> [labels\_default](#input\_labels\_default) | mapa de rótulos do Kubernetes que devem ser aplicados aos nós no pool. | `map(any)` | `{}` | no |
| <a name="input_lb_sku"></a> [lb\_sku](#input\_lb\_sku) | Modelo de SKU do Load Balancer no cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_license_act"></a> [license\_act](#input\_license\_act) | Especifica o tipo BYOL para esta máquina virtual | `string` | n/a | yes |
| <a name="input_local_networks"></a> [local\_networks](#input\_local\_networks) | List of local virtual network connections to connect to gateway. | <pre>list(<br>    object({<br>      name            = string<br>      gateway_address = string<br>      address_space   = list(string)<br>      shared_key      = string<br>      ipsec_policy    = any<br>    })<br>  )</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | A região do datacenter onde seus recursos serão criados. | `string` | `"eastus2"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | ID do Log Analytics. | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_name"></a> [log\_analytics\_workspace\_name](#input\_log\_analytics\_workspace\_name) | Nome do workspace do Log Analytics. É obrigatório caso `enable_log_analytics_workspace` for marcado como `true` | `string` | n/a | yes |
| <a name="input_log_analytics_workspace_sku"></a> [log\_analytics\_workspace\_sku](#input\_log\_analytics\_workspace\_sku) | Define a SKU utilizada pelo Log Analytics Workspace. | `string` | `"PerGB2018"` | no |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | Define o número de dias em que os logs serão armazenados no Workspace. | `number` | `30` | no |
| <a name="input_managed_disk_type"></a> [managed\_disk\_type](#input\_managed\_disk\_type) | Especifica o tipo de disco gerenciado a ser criado. | `string` | `"Standard_LRS"` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | Número maximo de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "3"<br>]</pre> | no |
| <a name="input_max_nodes_default"></a> [max\_nodes\_default](#input\_max\_nodes\_default) | Número maximo de nodes do Cluster Kubernetes. | `string` | `3` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | Quantidade máxima de Pods por node (dentro do Default node). | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | Número de nodes windows do Cluster Kubernetes. | `list(string)` | <pre>[<br>  "1"<br>]</pre> | no |
| <a name="input_min_nodes_default"></a> [min\_nodes\_default](#input\_min\_nodes\_default) | Número de nodes do Cluster Kubernetes. | `string` | `1` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | Este pool de nós deve ser usado para recursos do kube-system ou do user. Por padrão user | `list(string)` | n/a | yes |
| <a name="input_name_pool_default"></a> [name\_pool\_default](#input\_name\_pool\_default) | Nome do pool do Cluster Kubernetes. | `string` | `"agentpool"` | no |
| <a name="input_nat_gateway_ids"></a> [nat\_gateway\_ids](#input\_nat\_gateway\_ids) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_nat_gateway_ids-spoke"></a> [nat\_gateway\_ids-spoke](#input\_nat\_gateway\_ids-spoke) | Mapa de NAT Gateway ids. | `map(string)` | `{}` | no |
| <a name="input_network_acls_bypass"></a> [network\_acls\_bypass](#input\_network\_acls\_bypass) | Propriedade que define se os serviços do Azure podem realizar operações no cofre. (AzureServices ou None) | `string` | `"None"` | no |
| <a name="input_network_acls_default_action"></a> [network\_acls\_default\_action](#input\_network\_acls\_default\_action) | Ação a ser realizada quando o tráfego de rede de origem for diferente das regras especificadas. (Allow ou Deny) | `string` | `"Deny"` | no |
| <a name="input_network_acls_ip_rules"></a> [network\_acls\_ip\_rules](#input\_network\_acls\_ip\_rules) | Um ou mais endereços de IP ou blocos CIDR que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_acls_virtual_network_subnet_ids"></a> [network\_acls\_virtual\_network\_subnet\_ids](#input\_network\_acls\_virtual\_network\_subnet\_ids) | Um ou mais IDs de subnets que devem ter acesso ao cofre. | `list(string)` | `[]` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | Modelo de plugin de rede utilizado no Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_network_policy"></a> [network\_policy](#input\_network\_policy) | Politicas de redes do Azure CNI clico ou azure | `string` | `"azure"` | no |
| <a name="input_network_watcher_name"></a> [network\_watcher\_name](#input\_network\_watcher\_name) | Nome do network watcher | `string` | n/a | yes |
| <a name="input_node_av_zone"></a> [node\_av\_zone](#input\_node\_av\_zone) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |
| <a name="input_node_pool"></a> [node\_pool](#input\_node\_pool) | Nome do node pool do Cluster Kubernetes. | `list(string)` | `[]` | no |
| <a name="input_node_vm_disk_size"></a> [node\_vm\_disk\_size](#input\_node\_vm\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `number` | `30` | no |
| <a name="input_nsg_ids"></a> [nsg\_ids](#input\_nsg\_ids) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_nsg_ids-spoke"></a> [nsg\_ids-spoke](#input\_nsg\_ids-spoke) | Ids de Network Security Group para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_oms_agent_enabled"></a> [oms\_agent\_enabled](#input\_oms\_agent\_enabled) | Habilita o OMS Agent no Cluster Kubernetes. | `bool` | `true` | no |
| <a name="input_os_disk_size"></a> [os\_disk\_size](#input\_os\_disk\_size) | Tamanho em GB do disco de SO do Node. Por padrão é 30GB | `list(number)` | <pre>[<br>  30<br>]</pre> | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | Tipo de sistema operacional dos nodes. Aceita os valores `Windows` ou `Linux`. | `list(string)` | n/a | yes |
| <a name="input_pip_name"></a> [pip\_name](#input\_pip\_name) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_pip_name_gw"></a> [pip\_name\_gw](#input\_pip\_name\_gw) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | Habilita que o cluster teha suas APIs dipostas somente para a rede interna. Por padrão é False | `bool` | `false` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | Define como o endereço IP privado da interface virtual dos gateways é atribuído. As opções válidas são Static ou Dynamic | `string` | `"Dynamic"` | no |
| <a name="input_provision_vm_agent"></a> [provision\_vm\_agent](#input\_provision\_vm\_agent) | O Agente Convidado da Máquina Virtual do Azure deve ser instalado nesta Máquina Virtual. Padrões para True. | `bool` | `true` | no |
| <a name="input_public_ip_id"></a> [public\_ip\_id](#input\_public\_ip\_id) | ID do Public IP existente, a opção existing\_public\_ip tem que estar como True. Por padão é null | `string` | `null` | no |
| <a name="input_public_ip_sku"></a> [public\_ip\_sku](#input\_public\_ip\_sku) | Sku para criação do novo Public IP, a opção is\_public\_ip\_enabled deve ser True. Por padão é basic | `string` | `"Basic"` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | Propriedade que define se a feature Purge Protection será habilitada. | `bool` | `false` | no |
| <a name="input_rbac_aad_admin_group_object_ids"></a> [rbac\_aad\_admin\_group\_object\_ids](#input\_rbac\_aad\_admin\_group\_object\_ids) | Object ID dos grupos com acesso administrativo ao cluster Kubernetes. | `any` | `null` | no |
| <a name="input_rbac_aad_azure_rbac_enabled"></a> [rbac\_aad\_azure\_rbac\_enabled](#input\_rbac\_aad\_azure\_rbac\_enabled) | Habilita Role Based Access Control based com Azure AD | `bool` | `null` | no |
| <a name="input_rbac_aad_client_app_id"></a> [rbac\_aad\_client\_app\_id](#input\_rbac\_aad\_client\_app\_id) | Client ID da aplicação do Azure Active Directory. | `string` | `null` | no |
| <a name="input_rbac_aad_managed"></a> [rbac\_aad\_managed](#input\_rbac\_aad\_managed) | Integração com Azure Active Directory, habilitado, significa que o Azure criará/gerenciará a entidade de Serviço usada para integração. | `bool` | `false` | no |
| <a name="input_rbac_aad_server_app_id"></a> [rbac\_aad\_server\_app\_id](#input\_rbac\_aad\_server\_app\_id) | Server ID do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_server_app_secret"></a> [rbac\_aad\_server\_app\_secret](#input\_rbac\_aad\_server\_app\_secret) | Server Secret do Azure Active Directory Application. | `string` | `null` | no |
| <a name="input_rbac_aad_tenant_id"></a> [rbac\_aad\_tenant\_id](#input\_rbac\_aad\_tenant\_id) | ID do tenant usada para o aplicativo do Azure Active Directory. Se isso não for especificado, a ID do tenant da assinatura atual será utilizado. | `string` | `null` | no |
| <a name="input_replication"></a> [replication](#input\_replication) | Que tipo de replicação será usada pela Storage Account. | `string` | `"GRS"` | no |
| <a name="input_resource_group_names"></a> [resource\_group\_names](#input\_resource\_group\_names) | O nome do seu Resource Group | `list(string)` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | Habilitar Role Based Access Control. | `bool` | `false` | no |
| <a name="input_route_tables_ids"></a> [route\_tables\_ids](#input\_route\_tables\_ids) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_route_tables_ids-spoke"></a> [route\_tables\_ids-spoke](#input\_route\_tables\_ids-spoke) | Ids de tabelas de rotas para atrelar na subnet | `map(string)` | `{}` | no |
| <a name="input_scale_units"></a> [scale\_units](#input\_scale\_units) | O número de unidades de escala com as quais provisionar o Bastion. Por padrão e 2 | `number` | `2` | no |
| <a name="input_shareable_link_enabled"></a> [shareable\_link\_enabled](#input\_shareable\_link\_enabled) | O recurso Link compartilhável está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_sizegbdisk"></a> [sizegbdisk](#input\_sizegbdisk) | Especifica o tamanho do disco de dados em gigabyte | `string` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | SKU do Registro de Container. Aceita os valores `Standard`, `Premium` ou `Basic`. | `string` | `"Standard"` | no |
| <a name="input_sku_bastion_name"></a> [sku\_bastion\_name](#input\_sku\_bastion\_name) | O SKU do Bastion Host (Basic ou Standard). | `string` | n/a | yes |
| <a name="input_sku_gw"></a> [sku\_gw](#input\_sku\_gw) | Configuração do tamanho e capacidade do gateway de rede virtual. As opções válidas são Basic, Standard, HighPerformance, UltraPerformance, ErGw1AZ, ErGw2AZ, ErGw3AZ, VpnGw1, VpnGw2, VpnGw3, VpnGw4, VpnGw5, VpnGw1AZ, VpnGw2AZ, VpnGw3AZ, VpnGw4AZ e VpnGw5AZ | `string` | `"VpnGw1"` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | Definição da SKU (standard ou premium). | `string` | n/a | yes |
| <a name="input_sku_pip"></a> [sku\_pip](#input\_sku\_pip) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_pip_gw"></a> [sku\_pip\_gw](#input\_sku\_pip\_gw) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_sku_tier_aks"></a> [sku\_tier\_aks](#input\_sku\_tier\_aks) | O nível de SKU que deve ser usado para este cluster Kubernetes. Os valores possíveis são Free e Paid. Por padãro e Free | `string` | `"Free"` | no |
| <a name="input_sku_tier_gw"></a> [sku\_tier\_gw](#input\_sku\_tier\_gw) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | Quantidade de dias para retenção do 'soft delete'. (90 >= days >= 7) | `number` | `90` | no |
| <a name="input_ssh_public_key"></a> [ssh\_public\_key](#input\_ssh\_public\_key) | Chave púclica SSH para acesso ao sistema do Cluster Kubernetes. | `string` | n/a | yes |
| <a name="input_static_website"></a> [static\_website](#input\_static\_website) | Obrigatório caso `static_website_enabled` seja `true`. Bloco que define caminho para os arquivos do website (ver exemplo de código). | `map(any)` | `{}` | no |
| <a name="input_static_website_enabled"></a> [static\_website\_enabled](#input\_static\_website\_enabled) | Especifica se o armazenamento para websites estáticos será habilitado. | `bool` | `false` | no |
| <a name="input_storacc_containers"></a> [storacc\_containers](#input\_storacc\_containers) | Utilizá-lo quando houver a necessidade de criar containers dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storacc_shares"></a> [storacc\_shares](#input\_storacc\_shares) | Utilizá-lo quando houver a necessidade de criar file shares dentro da storage account. <br>No bloco chamado, só é necessário colocar o nome do container em `name` e qual o tipo de acesso em `container_access_type`. Valores válidos para o tipo são: `blob`, `container` ou `private`. | `map(any)` | `{}` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | Nome da Storage Account. | `string` | n/a | yes |
| <a name="input_storage_uri"></a> [storage\_uri](#input\_storage\_uri) | O Blob Endpoint da Conta de Armazenamento que deve conter os arquivos de diagnóstico da máquina virtual. | `string` | n/a | yes |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_endpoint_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_endpoint\_network\_policies-spoke) | A map of subnet name to enable/disable private link endpoint network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies"></a> [subnet\_enforce\_private\_link\_service\_network\_policies](#input\_subnet\_enforce\_private\_link\_service\_network\_policies) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_enforce_private_link_service_network_policies-spoke"></a> [subnet\_enforce\_private\_link\_service\_network\_policies-spoke](#input\_subnet\_enforce\_private\_link\_service\_network\_policies-spoke) | A map of subnet name to enable/disable private link service network policies on the subnet. | `map(bool)` | `{}` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names-spoke"></a> [subnet\_names-spoke](#input\_subnet\_names-spoke) | Nomes das subnets | `list(string)` | n/a | yes |
| <a name="input_subnet_names_aks"></a> [subnet\_names\_aks](#input\_subnet\_names\_aks) | Nome da Subnet do AKS com CNI | `string` | `""` | no |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_prefixes-spoke"></a> [subnet\_prefixes-spoke](#input\_subnet\_prefixes-spoke) | Range de ip da subnet | `list(string)` | n/a | yes |
| <a name="input_subnet_service_endpoints"></a> [subnet\_service\_endpoints](#input\_subnet\_service\_endpoints) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_subnet_service_endpoints-spoke"></a> [subnet\_service\_endpoints-spoke](#input\_subnet\_service\_endpoints-spoke) | A map of subnet name to service endpoints to add to the subnet. | `map(any)` | `{}` | no |
| <a name="input_tags_acr"></a> [tags\_acr](#input\_tags\_acr) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_aks"></a> [tags\_aks](#input\_tags\_aks) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_bastion"></a> [tags\_bastion](#input\_tags\_bastion) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_dns_private"></a> [tags\_dns\_private](#input\_tags\_dns\_private) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_gw"></a> [tags\_gw](#input\_tags\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_key_vault"></a> [tags\_key\_vault](#input\_tags\_key\_vault) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_local_gw"></a> [tags\_local\_gw](#input\_tags\_local\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_log_analytcs"></a> [tags\_log\_analytcs](#input\_tags\_log\_analytcs) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_network_watcher"></a> [tags\_network\_watcher](#input\_tags\_network\_watcher) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip"></a> [tags\_public\_ip](#input\_tags\_public\_ip) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_public_ip_gw"></a> [tags\_public\_ip\_gw](#input\_tags\_public\_ip\_gw) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_rg"></a> [tags\_rg](#input\_tags\_rg) | Lista de mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `list(map(any))` | <pre>[<br>  {}<br>]</pre> | no |
| <a name="input_tags_storage"></a> [tags\_storage](#input\_tags\_storage) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vm-win"></a> [tags\_vm-win](#input\_tags\_vm-win) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_hub"></a> [tags\_vnet\_hub](#input\_tags\_vnet\_hub) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tags_vnet_spoke"></a> [tags\_vnet\_spoke](#input\_tags\_vnet\_spoke) | Mapa de caracteres identificando através de `chave = valor` quais são os rótulos dos recursos. | `map(any)` | `{}` | no |
| <a name="input_tier"></a> [tier](#input\_tier) | Que tipo de performance espera-se. Aceita os valores `Standard` e `Premium`. | `string` | `"Standard"` | no |
| <a name="input_tunneling_enabled"></a> [tunneling\_enabled](#input\_tunneling\_enabled) | O recurso Tunneling está habilitado para o Bastion Host. Padrões para False | `bool` | `false` | no |
| <a name="input_type_gw"></a> [type\_gw](#input\_type\_gw) | O tipo do Gateway de Rede Virtual. As opções válidas são ExpressRoute ou Vpn | `string` | `"Vpn"` | no |
| <a name="input_type_local_gw"></a> [type\_local\_gw](#input\_type\_local\_gw) | O tipo de conexão. As opções válidas são ExpressRoute, IPsec ou Vnet2Vnet | `string` | `"IPsec"` | no |
| <a name="input_ultra_ssd_enabled"></a> [ultra\_ssd\_enabled](#input\_ultra\_ssd\_enabled) | Usado para especificar se o UltraSSD está habilitado no pool de nós padrão. Default é false. | `bool` | `false` | no |
| <a name="input_use_network_existing_to_peering"></a> [use\_network\_existing\_to\_peering](#input\_use\_network\_existing\_to\_peering) | Criação de peering entre vnets que ja existem selecione true, por padrão False | `bool` | `false` | no |
| <a name="input_use_remote_gateways"></a> [use\_remote\_gateways](#input\_use\_remote\_gateways) | Controla se os gateways remotos podem ser utilizados na rede virtual local. O padrão é false. | `bool` | `false` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Especifica o nome da Máquina Virtual. | `string` | n/a | yes |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | Size da VM do default node, por padrão Standard\_D2\_v2 | `list(string)` | <pre>[<br>  "Standard_D2_v2"<br>]</pre> | no |
| <a name="input_vm_size_default"></a> [vm\_size\_default](#input\_vm\_size\_default) | Size da VM do default node | `string` | `"Standard_D2_v2"` | no |
| <a name="input_vm_size_win"></a> [vm\_size\_win](#input\_vm\_size\_win) | Especifica o tamanho da Máquina Virtual | `string` | n/a | yes |
| <a name="input_vnet_links"></a> [vnet\_links](#input\_vnet\_links) | Esses Links habilitam a resolução e o registro de DNS dentro das Redes Virtuais do Azure usando o DNS Privado do Azure. | <pre>list(object({<br>    name                 = string<br>    virtual_network_name = string<br>    registration_enabled = bool<br>    rg_name              = string<br>  }))</pre> | `[]` | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vnet_name-spoke"></a> [vnet\_name-spoke](#input\_vnet\_name-spoke) | Nome da rede virtual | `string` | n/a | yes |
| <a name="input_vpn_type_gw"></a> [vpn\_type\_gw](#input\_vpn\_type\_gw) | O tipo de roteamento do Virtual Network Gateway. As opções válidas são RouteBased ou PolicyBased | `string` | `"RouteBased"` | no |
| <a name="input_windows_admin_password"></a> [windows\_admin\_password](#input\_windows\_admin\_password) | Senha do usuario admin do sitema windows | `string` | n/a | yes |
| <a name="input_windows_admin_username"></a> [windows\_admin\_username](#input\_windows\_admin\_username) | Usuário administrador de sistemas windows. Por padrão Solonetwork | `string` | `"Solonetwork"` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Availability Zones habilitadas para o cluster Kubernetes. Por padrão é [1, 2, 3] | `list(number)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | n/a |
| <a name="output_access_policy"></a> [access\_policy](#output\_access\_policy) | n/a |
| <a name="output_acr_id"></a> [acr\_id](#output\_acr\_id) | n/a |
| <a name="output_analytics_id"></a> [analytics\_id](#output\_analytics\_id) | n/a |
| <a name="output_app_id"></a> [app\_id](#output\_app\_id) | n/a |
| <a name="output_azure_bastion_host_id"></a> [azure\_bastion\_host\_id](#output\_azure\_bastion\_host\_id) | n/a |
| <a name="output_azure_bastion_host_pip"></a> [azure\_bastion\_host\_pip](#output\_azure\_bastion\_host\_pip) | n/a |
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | n/a |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | n/a |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | n/a |
| <a name="output_cname_records"></a> [cname\_records](#output\_cname\_records) | n/a |
| <a name="output_gateway_id"></a> [gateway\_id](#output\_gateway\_id) | n/a |
| <a name="output_host"></a> [host](#output\_host) | n/a |
| <a name="output_identity"></a> [identity](#output\_identity) | n/a |
| <a name="output_instrumentation_key"></a> [instrumentation\_key](#output\_instrumentation\_key) | n/a |
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | n/a |
| <a name="output_key_vault_name"></a> [key\_vault\_name](#output\_key\_vault\_name) | n/a |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | n/a |
| <a name="output_network_watcher_id"></a> [network\_watcher\_id](#output\_network\_watcher\_id) | n/a |
| <a name="output_network_watcher_location"></a> [network\_watcher\_location](#output\_network\_watcher\_location) | n/a |
| <a name="output_network_watcher_name"></a> [network\_watcher\_name](#output\_network\_watcher\_name) | n/a |
| <a name="output_pip_name"></a> [pip\_name](#output\_pip\_name) | n/a |
| <a name="output_pip_vpn_name"></a> [pip\_vpn\_name](#output\_pip\_vpn\_name) | n/a |
| <a name="output_rg_location"></a> [rg\_location](#output\_rg\_location) | n/a |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | n/a |
| <a name="output_storage_access_key"></a> [storage\_access\_key](#output\_storage\_access\_key) | n/a |
| <a name="output_storage_account_container"></a> [storage\_account\_container](#output\_storage\_account\_container) | n/a |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | n/a |
| <a name="output_storage_account_name"></a> [storage\_account\_name](#output\_storage\_account\_name) | n/a |
| <a name="output_storage_account_primary_web_host"></a> [storage\_account\_primary\_web\_host](#output\_storage\_account\_primary\_web\_host) | n/a |
| <a name="output_storage_account_url"></a> [storage\_account\_url](#output\_storage\_account\_url) | n/a |
| <a name="output_vm_id"></a> [vm\_id](#output\_vm\_id) | n/a |
| <a name="output_vm_ip"></a> [vm\_ip](#output\_vm\_ip) | n/a |
| <a name="output_vnet_address_space"></a> [vnet\_address\_space](#output\_vnet\_address\_space) | n/a |
| <a name="output_vnet_address_space-spoke"></a> [vnet\_address\_space-spoke](#output\_vnet\_address\_space-spoke) | n/a |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | n/a |
| <a name="output_vnet_name-spoke"></a> [vnet\_name-spoke](#output\_vnet\_name-spoke) | n/a |
| <a name="output_vnet_subnet_names"></a> [vnet\_subnet\_names](#output\_vnet\_subnet\_names) | n/a |
| <a name="output_vnet_subnet_names-spoke"></a> [vnet\_subnet\_names-spoke](#output\_vnet\_subnet\_names-spoke) | n/a |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | n/a |
