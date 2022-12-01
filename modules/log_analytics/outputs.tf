output "analytics_id" {
  value = azurerm_log_analytics_workspace.wks_log.id
}

output "instrumentation_key" {
  value = azurerm_application_insights.wks_log.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.wks_log.app_id
}