resource "azurerm_sql_server" "sqlserver" {
  name                         = "${var.name}sqlserver"
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  version                      = "12.0"
  administrator_login          = var.SQL_SERVER_USER
  administrator_login_password = var.SQL_SERVER_PW
}

resource "azurerm_sql_database" "sqldb" {
  name                = "${var.name}sqldatabase"
  resource_group_name = ${var.rg_name}
  location            = ${var.rg_location}
  server_name         = "${azurerm_sql_server.sqlserver.name}"

}