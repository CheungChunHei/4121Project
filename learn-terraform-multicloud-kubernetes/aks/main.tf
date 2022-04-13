resource "random_pet" "prefix" {}

provider "azurerm" {
  features {}
  subscription_id = 35a396f4-96d9-40d4-b3fa-49f684a22ac6
}

resource "azurerm_resource_group" "default" {
  name     = "${random_pet.prefix.id}-aks"
  location = "East Asia"

  tags = {
    environment = "Demo"
  }
}

resource "azurerm_kubernetes_cluster" "default" {
  name                = "${random_pet.prefix.id}-aks"
  location            = azurerm_resource_group.default.location
  resource_group_name = azurerm_resource_group.default.name
  dns_prefix          = "${random_pet.prefix.id}-k8s"

  default_node_pool {
    name            = "default"
    node_count      = 3
    vm_size         = "Standard_D2_v2"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "Demo"
  }
}
