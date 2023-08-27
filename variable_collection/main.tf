terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      version = ">=3.0.0"
      source  = "hashicorp/azurerm"
    }
  }
}

provider "azurerm" {
  features {

  }
}


resource "azurerm_resource_group" "rg" {
  name     = "rg"
  location = "eastus"

}

resource "azurerm_virtual_network" "vnet" {
  for_each            = var.env
  name                = each.value.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = [each.value.ip]

}