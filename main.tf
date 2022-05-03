# provider "azurerm" {
#   subscription_id = "REPLACE-WITH-YOUR-SUBSCRIPTION-ID"
#   client_id       = "REPLACE-WITH-YOUR-CLIENT-ID"
#   client_secret   = "REPLACE-WITH-YOUR-CLIENT-SECRET"
#   tenant_id       = "REPLACE-WITH-YOUR-TENANT-ID"
# }

terraform {
   backend "local" {}
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"
}

module "sql-database" {
  source              = "./modules/Azure_SQL_DB"
  resource_group_name = var.resource_group_name
  location            = var.location
  db_name             = var.db_name
  sql_admin_username  = var.sql_admin_username
  sql_password        = var.sql_password 

depends_on = [
  azurerm_resource_group.rg
] 
}

module "dotNetApp" {
  source                    = "./modules/App"
  app_service_plan_name     = var.app_service_plan_name
  resource_group_name       = var.resource_group_name
  location                  = var.location
  app_plan_sku_name         = var.app_plan_sku_name
  app_plan_os_type          = var.app_plan_os_type
  app_service_name          = var.app_service_name
  connection_name           = var.connection_name
  connection_type           = var.connection_type
  connection_string_value   = module.sql-database.connection_string
depends_on = [
  module.sql-database
]

}