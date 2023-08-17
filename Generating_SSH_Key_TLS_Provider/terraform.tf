terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      version = ">=3.0"
      source = "hashicorp/azurerm"
    }

    random = {
      version = ">=3.0.0"
      source = "hashicorp/random"
    }
  
    local = {
      source = "hashicorp/local"
      version = ">=2.4.0"
    }

    tls = {
      source = "hashicorp/tls"
      version = ">=3.1.0"
    }
  }

}

provider "azurerm" {
  features {
    
  }
}