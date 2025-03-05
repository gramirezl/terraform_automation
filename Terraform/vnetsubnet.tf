resource "azurerm_virtual_network" "aksvnet" {
  name                = "aks-vnet-uat"
  address_space       = ["172.16.0.0/16"]
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnetdefault" {
  name                 = "default-subnet-uat"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  address_prefixes     = ["172.16.240.0/24"]
}

resource "azurerm_subnet" "subnetgateway" {
  name                 = "GatewaySubnet"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  address_prefixes     = ["172.16.241.0/24"]
}