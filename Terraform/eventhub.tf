resource "azurerm_eventhub_namespace" "evenhubnsp" {
  name                = "testlabuatnsp"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
  sku                 = "Standard"
  capacity            = 1
}

resource "azurerm_eventhub" "insertlogstopic" {
  name                = "insertlogs"
  partition_count     = 2
  message_retention   = 1
}