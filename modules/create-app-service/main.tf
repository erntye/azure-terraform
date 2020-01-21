resource "azurerm_app_service_plan" "asp" {
  name                = "${var.name}asp"
  location            = var.rg_location
  resource_group_name = "${var.name}RG"

  sku {
    tier = var.tier
    size = var.size
  }
}

resource "azurerm_app_service" "as" {
  name                = "${var.name}as"
  location            = var.rg_location
  resource_group_name = "${var.name}asp"
  app_service_plan_id = azurerm_app_service_plan.asp.id
  app_settings        = var.app_settings
  https_only          = var.https_only
  site_config {
    always_on = var.always_on
  }
}
