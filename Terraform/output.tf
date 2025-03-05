output "id" {
  value = data.azurerm_resource_group.rg.id
}

#output "appservicedefaultroute" {
#  value = azurerm_app_service.appservice.default_site_hostname
#}

#output "postgressserver" {
#  value = azurerm_postgresql_server.postgresserver.fqdn
#}

#output "kubernetes" {
#  sensitive = true
#  value = azurerm_kubernetes_cluster.aks.kube_config_raw
#}

#output "redis" {
#  sensitive = true
#  value = azurerm_redis_cache.redis.primary_connection_string
#}

#output "storage" {
#  sensitive = true
#  value = azurerm_storage_account.sa.primary_connection_string
#}