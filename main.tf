provider "azurerm" {
}

module "resource-group" {
  source = "modules/create-resource-group"
}

module "app-service"  {
  source  = "modules/create-app-service"
  # insert the 6 required variables here
} 