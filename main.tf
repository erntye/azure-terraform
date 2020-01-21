provider "azurerm" {
}

module "resource-group" {
  source = "./modules/create-resource-group"
  name                = var.name
}

module "app-service"  {
  source  = "./modules/create-app-service"
  name                = var.name
  rg_location            = var.rg_location
  tier = var.tier
  size = var.size
  app_settings        = var.app_settings
  https_only          = var.https_only
  always_on = var.always_on
} 