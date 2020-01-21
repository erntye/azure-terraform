provider "azurerm" {
}

module "app-service" createas {
  source  = "modules/create-app-service"
  # insert the 6 required variables here
} 