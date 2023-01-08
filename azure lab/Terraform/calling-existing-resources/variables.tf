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
variable "snet" {
  type        = string
  default     = "sr-proj1-dev-snet-frontend"
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
  default     = "sr-proj1-dev-vm1"
}
