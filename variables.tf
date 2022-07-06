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



