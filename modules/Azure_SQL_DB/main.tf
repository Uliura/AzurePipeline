resource "azurerm_mssql_server" "server" {
  name                         = "${var.db_name}-sqlsvr"
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = var.server_version
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_password
}

resource "azurerm_mssql_database" "db" {
  name                             = var.db_name
  server_id                        = azurerm_mssql_server.server.id
}




