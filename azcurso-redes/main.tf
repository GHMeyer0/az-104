provider "azurerm" {
  features {
  }
}

resource "azurerm_resource_group" "azcurso_redes" {
    location = "eastus"
    name = "azcurso-redes"
}

resource "azurerm_virtual_network" "azcurso_vnet01" {
    address_space = [ "192.168.0.0/16" ]
    name = "azcurso-vnet01"
    resource_group_name = azurerm_resource_group.azcurso_redes.name
    location = azurerm_resource_group.azcurso_redes.location
}

resource "azurerm_subnet" "frontend" {
  name = "Frontend"
  address_prefixes = [ "192.168.2.0/24" ]
  virtual_network_name = azurerm_virtual_network.azcurso_vnet01.name
  resource_group_name = azurerm_resource_group.azcurso_redes.name
}

resource "azurerm_subnet" "backend" {
  name = "Backend"
  address_prefixes = [ "192.168.1.0/24" ]
  virtual_network_name = azurerm_virtual_network.azcurso_vnet01.name
  resource_group_name = azurerm_resource_group.azcurso_redes.name
}