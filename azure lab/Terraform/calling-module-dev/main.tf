provider "azurerm" {
  features {}

  subscription_id = "3ebff09f-5eca-4a88-ba53-58f54c162e3f"
  client_id       = "fbf9de03-82da-4173-9c19-74fba30f5008"
  client_secret   = var.spn-client-secreat
  tenant_id       = "d0c9eb6b-390f-4f09-9c3b-33ebcf2fb544"
}

# terraform {
#   backend "azurerm" {
#     resource_group_name  = "sr-proj1-dev-rg"
#     storage_account_name = "srproj1devsgac"
#     container_name       = "tfstate"
#     key                  = "dev1.terraform.tfstate"
#   }
# }

module "calling-vm" {
    source = "../module/virtual-machine"

rgname          = "sr-proj1-dev-rg"
rglocation      = "West Europe"
vnet            = "sr-proj1-dev-vnet"
vnet-ipaddress  = ["10.0.0.0/16"]
snet1           = "sr-proj1-dev-snet-frontend"
snet1-ipaddress = ["10.0.2.0/24"]
# while doing my terraform for backend for nic ipconfig we need to comment publick ip and id
snet2           = "sr-proj1-dev-snet-backend"
snet2-ipaddress = ["10.0.3.0/24"]
nic             = "sr-proj1-dev-nic"
nsg             = "sr-proj1-dev-nsg"
pubip           = "sr-proj1-dev-pubip"
vm              = "sr-proj1-dev-vm"
size            = "Standard_DS1_v2"
username        = "srinivas"
password        = "Welcome@12345"

}
