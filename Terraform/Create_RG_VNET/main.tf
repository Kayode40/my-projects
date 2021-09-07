# Configure the Azure Provider
provider "azurerm" {
  # whilst the `version` attribute is optional, we recommend pinning to a given version of the Provider
  version = "=2.20.0"
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "r1" {
  name     = "terra_rg"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "v1" {
  name                = "terra_vnet"
  resource_group_name = azurerm_resource_group.r1.name
  location            = azurerm_resource_group.r1.location
  address_space       = ["10.0.0.0/16"]
}