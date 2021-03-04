terraform {
  backend "azurerm" {
    resource_group_name  = "unmanaged"
    storage_account_name = "tfstaticstates"
    container_name       = "tfstate"
    key                  = "azcurso-redes.terraform.tfstate"
  }
}