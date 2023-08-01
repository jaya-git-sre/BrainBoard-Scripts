resource "azurerm_resource_group" "resource_group" {
  name     = "rg-test"
  location = "west europe"
}

resource "azurerm_storage_account" "storage_account" {
  name                     = "sample_storage_account"
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = {
    environment = "Dev"
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "storage_account_container"
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "private"
}
