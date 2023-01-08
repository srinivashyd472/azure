variable "rgname" {
  type        = string
}
variable "rglocation" {
  type        = string
}
variable "vnet" {
  type        = string
}
variable "vnet-ipaddress" {
  type        = list(string)
}
variable "snet1" {
  type        = string
}
variable "snet1-ipaddress" {
  type        = list(string)
}
# while doing my terraform for backend for nic ipconfig we need to comment publick ip and id

variable "snet2" {
  type        = string
}

variable "snet2-ipaddress" {
  type        = list(string)
}
variable "nic" {
  type        = string
}
variable "nsg" {
  type        = string
}
variable "pubip" {
  type        = string
}
variable "vm" {
  type        = string
}
variable "size" {
  type        = string
}
variable "username" {
  type        = string
}
variable "password" {
  type        = string
}