resource "azurerm_resource_group" "rg" {
  name = "${var.name}RG"
  location = "Southeast Asia"
}

resource "azurerm_app_service_plan" "asp" {
  name                = "${var.name}ASP"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  sku {
    tier = var.tier
    size = var.size
  }
}

resource "azurerm_app_service" "as" {
  name                = "${var.name}AS"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  app_settings        = var.app_settings
  https_only          = var.https_only
  site_config {
    always_on = var.always_on
  }
}
