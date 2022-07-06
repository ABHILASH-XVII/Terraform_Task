# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.resource_group_location
}

# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create Subnet
resource "azurerm_subnet" "subnet" {
  count                = 2
  name                 = var.subnet_name[count.index]
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [element(var.subnet_address, count.index)]
}

resource "azurerm_network_security_group" "nsg1" {
  name                = "SecurityGroup1"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "SSH"
    priority                   = 200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}

resource "azurerm_subnet_network_security_group_association" "rg" {
  subnet_id                 = azurerm_subnet.subnet[0].id
  network_security_group_id = azurerm_network_security_group.nsg1.id
}


data "azurerm_network_security_group" "rg" {
  name                = "NSG1"
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet_network_security_group_association""association2" {
  subnet_id                 = azurerm_subnet.subnet[1].id
  network_security_group_id = data.azurerm_network_security_group.rg.id
}