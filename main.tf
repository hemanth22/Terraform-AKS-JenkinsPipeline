#Declare variables

variable "ARM_CLIENT_ID" {}

variable "ARM_CLIENT_SECRET" {}

# Configure the Microsoft Azure Provider.
provider "azurerm" {
  version = "~>1.31"
}

# create a resource group

resource "azurerm_resource_group" "ak8s" {
  name     = "ak8s-resources"
  location = "westus"
}

resource "azurerm_kubernetes_cluster" "ak8s" {
  name                = "ak8s-aks1"
  location            = azurerm_resource_group.ak8s.location
  resource_group_name = azurerm_resource_group.ak8s.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  service_principal {
    client_id     = var.ARM_CLIENT_ID
    client_secret = var.ARM_CLIENT_SECRET
  }

  tags = {
    Environment = "Production"
  }
}


output "client_certificate" {
  value = azurerm_kubernetes_cluster.ak8s.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.ak8s.kube_config_raw
}
