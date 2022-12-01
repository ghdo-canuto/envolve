
###String com carctéres aleatórios para tornar o recurso único
resource "random_id" "vm" {
  byte_length = 4
}

data "azurerm_resource_group" "vm" {
  name = var.resource_group_name
}

data "azurerm_subnet" "vm" {
    name = var.sn_name
    resource_group_name =  var.resource_group_name_nic
    virtual_network_name = var.subnet_vnet_nic
}

###Provisionamento da NIC que a VM irá fazer uso
resource "azurerm_network_interface" "vmnic" {
  name                  = lower(join("-", ["nic", var.vm_name, random_id.vm.hex]))
  location              = var.location 
  resource_group_name   = data.azurerm_subnet.vm.resource_group_name
  dns_servers           = var.dns_servers_to_nic
  tags                  = var.tags

  ip_configuration {
    name                          = lower(join("-", ["priv-ip", var.vm_name, random_id.vm.hex]))
    subnet_id                     = data.azurerm_subnet.vm.id
    private_ip_address_allocation = var.ip_allocation
    private_ip_address            = var.ip_allocation == "Static" ? var.ip_address : null
    private_ip_address_version    = "IPv4"
    primary                       = true
    public_ip_address_id          = var.existing_public_ip == true ? var.public_ip_id : var.is_public_ip_enabled ? azurerm_public_ip.vm[0].id : null
  }
}

### Provisionamento da VM sem disco extra anexado
resource "azurerm_windows_virtual_machine" "vm-windows" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vmnic.id]
  size                  = var.vm_size
  license_type          = var.license_act
  tags                  = var.tags
  admin_username        = var.admin_win_username
  admin_password        = var.admin_win_pass
  computer_name         = var.vm_name
  provision_vm_agent    = var.provision_vm_agent

  os_disk {
    name                    = join("-", ["disk", var.vm_name, random_id.vm.hex])
    caching                 = var.caching
    disk_size_gb            = var.sizegbdisk
    storage_account_type    = var.managed_disk_type
  }

  source_image_reference {
    publisher = var.img_publisher
    offer     = var.img_offer
    sku       = var.img_sku
    version   = var.img_version
  }   

  boot_diagnostics {
    storage_account_uri = var.storage_uri
  }
}

resource "azurerm_public_ip" "vm" {
  count               = var.is_public_ip_enabled ? 1 : 0
  name                = lower(join("-", [var.vm_name, "pub-ip"]))
  resource_group_name = data.azurerm_subnet.vm.resource_group_name
  location            = var.location
  allocation_method   = var.allocation_method
  sku                 = var.public_ip_sku
  tags                = var.tags
}