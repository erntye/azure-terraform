resource "azurerm_app_service_plan" "asp" {
  name                = "${var.name}ASP"
  location            = var.rg_location
  resource_group_name = var.rg_name

  sku {
    tier = var.tier
    size = var.size
  }
}

resource "azurerm_app_service" "as" {
  name                = "${var.name}as"
  location            = var.rg_location
  resource_group_name = var.rg_name
  app_service_plan_id = azurerm_app_service_plan.asp.id
  app_settings        = var.app_settings
  https_only          = var.https_only
  
  site_config {
    always_on = var.always_on
  }

  connection_string {
    name  = "MyDbConnection"
    type  = "SQLAzure"
    #value = "Server=tcp:${var.fully_qualified_domain_name} Initial Catalog=${var.db_name};User ID=${var.SQL_SERVER_USER};Password=${var.SQL_SERVER_PW};Trusted_Connection=False;Encrypt=True;"
    value = "Data Source=tcp:${var.fully_qualified_domain_name},1433;Initial Catalog=${var.db_name};User Id=${var.SQL_SERVER_USER}@${var.server_name};Password=${var.SQL_SERVER_PW}"
  }


}
