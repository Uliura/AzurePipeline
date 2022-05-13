terraform {
   backend "azurerm" {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.RESOURCE_GROUP_NAME
  location = var.LOCATION
}

module "sql-database" {
  source              = "./modules/Azure_SQL_DB"
  resource_group_name = var.RESOURCE_GROUP_NAME
  location            = var.LOCATION
  db_name             = var.DB_NAME
  sql_admin_username  = var.SQL_ADMIN_USERNAME
  sql_password        = var.SQL_PASSWORD 

depends_on = [
  azurerm_resource_group.rg
] 
}

module "dotNetApp" {
  source                    = "./modules/App"
  app_service_plan_name     = var.APP_SERVICE_PLAN_NAME
  resource_group_name       = var.RESOURCE_GROUP_NAME
  location                  = var.LOCATION
  app_plan_sku_name         = var.APP_PLAN_SKU_NAME
  app_plan_os_type          = var.APP_PLAN_OS_TYPE
  app_service_name          = var.APP_SERVICE_NAME
  connection_name           = var.CONNECTION_NAME
  connection_type           = var.CONNECTION_TYPE
  connection_string_value   = module.sql-database.connection_string
  current_stack             = var.CURRENT_STACK
  dotnet_version            = var.DOTNET_VERSION
depends_on = [
  module.sql-database
]

}