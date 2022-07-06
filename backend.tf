terraform {
  backend "azurerm" {
    resource_group_name  = "myrg-1"
    storage_account_name = "task2demo"
    container_name       = "demo"
    key                  = "prod.terraform.tfstate"
  }
}
