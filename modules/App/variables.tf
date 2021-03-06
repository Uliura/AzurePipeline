variable "resource_group_name" {
  description = "Default resource group name that the database will be created in."
}

variable "location" {
  description = "The location/region where the database and server are created. Changing this forces a new resource to be created."
}

variable "app_service_plan_name" {
  type        = string
  description = "App Service Plan name in Azure"
}

variable "app_service_name" {
  type        = string
  description = "App Service name in Azure"
}

variable "app_plan_sku_name" {
  type        = string
}

variable "app_plan_os_type" {
  type        = string
}

variable "connection_name" {
  type        = string
}

variable "connection_type" {
  type        = string
}

variable "connection_string_value" {
  type        = string
}

variable "current_stack" {
  type        = string
}

variable "dotnet_version" {
  type        = string
}