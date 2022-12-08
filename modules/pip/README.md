## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |
| [azurerm_resource_group.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_method_pip"></a> [allocation\_method\_pip](#input\_allocation\_method\_pip) | Define o método de alocação para este endereço IP (Static ou Dynamic). | `string` | n/a | yes |
| <a name="input_ip_version_pip"></a> [ip\_version\_pip](#input\_ip\_version\_pip) | Definição da SKU (IPv6 ou IPv4). | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | A região do datacenter onde seus recursos serão criados. | `string` | n/a | yes |
| <a name="input_pip_name"></a> [pip\_name](#input\_pip\_name) | Nome do Public IP. | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Nome do Resource Group | `string` | n/a | yes |
| <a name="input_sku_pip"></a> [sku\_pip](#input\_sku\_pip) | Definição da SKU (Basic ou standard). | `string` | n/a | yes |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | O nível de SKU que deve ser usado para o IP público (Regional ou Global). | `string` | `"Regional"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pip_name"></a> [pip\_name](#output\_pip\_name) | Nome do ip publico |
