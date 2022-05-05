resource "azurerm_service_plan" "app_plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_name            = var.app_plan_sku_name
  os_type             = var.app_plan_os_type
}

resource "azurerm_windows_web_app" "webapp" {
  name                = var.app_service_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.app_plan.id

  site_config {
    application_stack {
      current_stack = dotnet
      dotnet_version = v4.0

  }
 
  }

 # app_settings = {
 #   "SOME_KEY" = "some-value"
 # }

  connection_string {
    name  = var.connection_name 
    type  = var.connection_type 
    value = var.connection_string_value 
  }
}
