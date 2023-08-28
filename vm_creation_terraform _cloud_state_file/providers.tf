terraform {

  cloud {
    organization = "my-org-neha"    # set the env variable in terraform cloud 
                                    # ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID
    workspaces {                    # az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
      name = "devops-azure-app2"
    }
  }

  required_version = ">=0.12"

  required_providers {
    azapi = {
      source  = "azure/azapi"
      version = "~>1.5"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }

    null = {
      source  = "hashicorp/null"
      version = ">= 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}