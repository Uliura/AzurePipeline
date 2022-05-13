variable "RESOURCE_GROUP_NAME" {
  description = "Default resource group name that the database will be created in."
}

variable "LOCATION" {
  description = "The location/region where the database and server are created. Changing this forces a new resource to be created."
}

variable "DB_NAME" {
  description = "The name of the database to be created."
}

variable "SQL_ADMIN_USERNAME" {
  description = "The administrator username of the SQL Server."
}

variable "SQL_PASSWORD" {
  description = "The administrator password of the SQL Server."
}

variable "APP_SERVICE_PLAN_NAME" {
  type        = string
  description = "App Service Plan name in Azure"
}

variable "APP_SERVICE_NAME" {
  type        = string
  description = "App Service name in Azure"
}

variable "APP_PLAN_SKU_NAME" {
  type        = string
}

variable "APP_PLAN_OS_TYPE" {
  type        = string
}

variable "CONNECTION_NAME" {
  type        = string
}

variable "CONNECTION_TYPE" {
  type        = string
}

variable "CURRENT_STACK" {
  type        = string
}

variable "DOTNET_VERSION" {
  type        = string
}