# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.25.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}

  subscription_id = "0baeb8ad-3e0a-4c8f-a740-07e0327cc188"
  #subscription_id = "c9ea6c6c-02d4-4c5d-975f-a46531e03e8c"
}