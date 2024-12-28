provider "azurerm" {
  features {}

  subscription_id = "3ebff09f-5eca-4a88-ba53-58"
  client_id       = "fbf9de03-82da-4173-9c19-"
  client_secret   = "1gW8Q~W5rPAVS_m.NotZ6gjRyXwZ"
  tenant_id       = "d0c9eb6b-390f-4f09-9c3b-33e"
}

# terraform {
#   backend "azurerm" {
#     resource_group_name  = "sr-proj1-dev-rg"
#     storage_account_name = "srproj1devsgac"
#     container_name       = "tfstate"
#     key                  = "dev.terraform.tfstate"
#   }
# }

data "azurerm_virtual_network" "vnet" {
  name                = var.vnet
  resource_group_name = var.rgname
}

data "azurerm_subnet" "snet1" {
  name                 = var.snet
  virtual_network_name = var.vnet
  resource_group_name  = var.rgname
}

resource "azurerm_public_ip" "publicip" {
  name                = var.pubip
  resource_group_name = var.rgname
  location            = var.rglocation
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic
  location            = var.rglocation
  resource_group_name = var.rgname

  ip_configuration {
    name                          = var.snet
    subnet_id                     = data.azurerm_subnet.snet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.publicip.id
  }
}
#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = data.azurerm_subnet.snet.id
#     private_ip_address_allocation = "Dynamic"
#     public_ip_address_id          = data.azurerm_public_ip.pubip.id
#   }
# }

data "azurerm_network_security_group" "nsg" {
  name                = var.nsg
  resource_group_name = var.rgname
}

resource "azurerm_network_interface_security_group_association" "nsg-nic" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}

resource "azurerm_windows_virtual_machine" "virtualmachine" {
  name                = var.vm
  computer_name       = "srinivas"
  resource_group_name = var.rgname
  location            = var.rglocation
  size                = "Standard_Ds1_v2"
  admin_username      = "srinivas"
  admin_password      = "Welcome@12345"
  network_interface_ids = [azurerm_network_interface.nic.id,]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
