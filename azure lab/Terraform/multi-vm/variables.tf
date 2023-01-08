variable "rgname" {
  type        = string
  default     = "sr-proj1-dev-rg"
}
variable "rglocation" {
  type        = string
  default     = "West Europe"
}
variable "vnet" {
  type        = string
  default     = "sr-proj1-dev-vnet"
}
variable "snet1" {
  type        = string
  default     = "sr-proj1-dev-snet-frontend"
}
# while doing my terraform for backend for nic ipconfig we need to comment publick ip and id
variable "snet2" {
  type        = string
  default     = "sr-proj1-dev-snet-backend"
}
variable "nic" {
  type        = string
  default     = "sr-proj1-dev-nic"
}
variable "nsg" {
  type        = string
  default     = "sr-proj1-dev-nsg"
}
variable "pubip" {
  type        = string
  default     = "sr-proj1-dev-pubip"
}
variable "vm" {
  type        = string
  default     = "sr-proj1-dev-vm"
}
