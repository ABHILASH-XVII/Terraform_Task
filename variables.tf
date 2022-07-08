# Azure Resource Group Name 
variable "resource_group_name" {
  type = string
  default = "rg-default"  
}

# Azure Resources Location
variable "resource_group_location" {
  type = string
  default = "eastus2"  
}

# Virtual Network
variable "vnet_name" {
  type = string
  default = "vnet-default"
}
variable "vnet_address_space" {
  type = list(string)
  default = ["10.0.0.0/16"]
}

# Subnet1 Name
variable "subnet_name" {
  type = list(string)
  default = ["public", "private"]
}
# Subnet1 Address Space
variable "subnet_address" {
  default = ["10.0.0.0/27", "10.0.0.32/27"]
}

variable "nsg_name" {
  type = string
  default = "Security-Group1"
}

variable "nsg_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "nic_name"{
  type = string
  default = "NIC-1"
}

variable "ipconfig_name" {
  type = string
  default = "IPCONFIG_1"  
}

variable "vm_name" {
  type = string
  default = "VM-1"
}
