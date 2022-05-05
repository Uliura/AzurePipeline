output "webapp_ips" {
  value = azurerm_linux_web_app.webapp.outbound_ip_addresses
}