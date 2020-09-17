terraform {
  required_providers {
    azurerm = {
      //source = "hashicorp/azurerm"
      azurerm = ">= 2.20.0"
    }
    panos = {
      //source = "paloaltonetworks/panos"
      version = "1.6.3"
    }
  }
  required_version = ">= 0.12.29"
}
