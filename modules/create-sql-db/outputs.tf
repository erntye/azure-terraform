output "fully_qualified_domain_name" {
  value = azurerm_sql_server.sqlserver.fully_qualified_domain_name
}

output "db_name" {
  value = azurerm_sql_database.sqldb.name
}

output "server_name" {
  value = azurerm_sql_server.sqlserver.name
}
