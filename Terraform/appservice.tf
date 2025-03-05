resource "azurerm_app_service_plan" "serviceplan" {
  name                = "asp_test_uat"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Free"
    size = "F1"
  }
}

resource "azurerm_app_service" "appservice" {
  name                    = "testlabuat"
  location                = data.azurerm_resource_group.rg.location
  resource_group_name     = data.azurerm_resource_group.rg.name
  app_service_plan_id     = azurerm_app_service_plan.serviceplan.id
  https_only              = true
  client_affinity_enabled = true

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = false
    DOCKER_REGISTRY_SERVER_URL          = "https://test.azurecr.io"
    DOCKER_REGISTRY_SERVER_USERNAME     = "test"
    DOCKER_REGISTRY_SERVER_PASSWORD     = "pj1xWUqCOqMCbCBygJ+gMu4V3M3gfIvR"
  }

  identity {
    type = "SystemAssigned"
  }
}
