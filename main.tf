provider "azurerm" {
}

module "RG" {
  source = "./modules/create-resource-group"
  name   = var.name
}

module "sql" {
  source          = "./modules/create-sql-db"
  name            = var.name
  rg_name         = module.RG.rg_name
  rg_location     = module.RG.rg_location
  SQL_SERVER_USER = var.SQL_SERVER_USER
  SQL_SERVER_PW   = var.SQL_SERVER_PW
}

module "app-service"  {
  source                      = "./modules/create-app-service"
  name                        = var.name
  rg_name                     = module.RG.rg_name
  rg_location                 = module.RG.rg_location
  tier                        = var.tier
  size                        = var.size
  app_settings                = var.app_settings
  https_only                  = var.https_only
  always_on                   = var.always_on
  fully_qualified_domain_name = module.sql.fully_qualified_domain_name
  db_name                     = module.sql.db_name
  server_name                 = module.sql.server_name
  SQL_SERVER_USER             = var.SQL_SERVER_USER
  SQL_SERVER_PW               = var.SQL_SERVER_PW
}

module "app-gateway" {
  source                = "./modules/create-resource-group"
  name                  = var.name
  rg_name               = module.RG.rg_name
  rg_location           = module.RG.rg_location
  tier                  = var.tier
  sku_name              = var.sku_name
  backend_address_pools = [{
    name= "${var.name}-beap" 
    ip_addresses= module.app-service.possible_outbound_ip_addresses
  }]
  backend_http_settings = var.backend_http_settings
  http_listeners        = var.http_listeners
  request_routing_rules = var.request_routing_rules
}