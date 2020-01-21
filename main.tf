provider "azurerm" {
}

module "RG" {
  source = "./modules/create-resource-group"
  name   = var.name
}

module "app-service"  {
  source       = "./modules/create-app-service"
  name         = var.name
  rg_name      = module.RG.rg_name
  rg_location  = module.RG.rg_location
  tier         = var.tier
  size         = var.size
  app_settings = var.app_settings
  https_only   = var.https_only
  always_on    = var.always_on
} 

module "sql" {
  source      = "./modules/create-sql-db"
  name        = var.name
  rg_name     = module.RG.rg_name
  rg_location = module.RG.rg_location
}