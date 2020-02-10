# Arquivo do código da infraestrutura
terraform {
  backend "azurerm" {
    resource_group_name  = "case-cartao-branco"
    storage_account_name = "blobarielccardoso"
    container_name       = "terraform-states"
    key                  = "aks-cart-branco.terraform.tfstate"
  }
}

provider "azurerm" {
}

data "azurerm_key_vault" "keyvault" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "client_id" {
  name         = var.key_service_principal_client_id
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "client_secret" {
  name         = var.key_service_principal_client_secret
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

data "azurerm_key_vault_secret" "ssh_key" {
  name         = var.key_ssh_key
  key_vault_id = data.azurerm_key_vault.keyvault.id
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location
  dns_prefix          = var.dns_prefix
  resource_group_name = var.resource_group_name
  kubernetes_version  = var.kubernetes_version

  linux_profile {
    admin_username = var.admin_username
    ssh_key {
      key_data = data.azurerm_key_vault_secret.ssh_key.value
    }
  }

  default_node_pool {
    name         = var.node_pool_name
    node_count   = var.node_pool_count
    vm_size = var.node_pool_vm_size
  }

  service_principal {
    client_id     = data.azurerm_key_vault_secret.client_id.value
    client_secret = data.azurerm_key_vault_secret.client_secret.value
  }

  network_profile {
    network_plugin = var.network_plugin
  }

  tags = var.tags
}

