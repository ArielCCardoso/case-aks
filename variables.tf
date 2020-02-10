# Arquivo de variaveis
variable "location" {
  description = "Local/Região onde serão criados os recursos. Para consulta completa acesse: https://azure.microsoft.com/regions"
  type        = string
  default     = "eastus2"
}

variable "aks_name" {
  description = "Nome do serviço AKS que será criado na Azure."
  type        = string
  default     = "aks-cart-branco"
}

variable "kubernetes_version" {
  description = "Versão do Kubernestes usada no AKS."
  type        = string
  default     = "1.14.8"
}

variable "resource_group_name" {
  description = "Nome do Grupo de Recursos onde o serviço será criado."
  type        = string
  default     = "case-cartao-branco"
}

variable "dns_prefix" {
  description = "Nome do DNS para o AKS"
  type        = string
  default     = "aks-cart-branco-arielccardoso"
}

variable "network_plugin" {
  description = "Plugin da rede do AKS - https://docs.microsoft.com/pt-br/azure/aks/networking-overview"
  type        = string
  default     = "kubenet"
}

variable "node_pool_name" {
  description = "Nome do Agent do Cluster do AKS - https://www.terraform.io/docs/providers/azurerm/r/kubernetes_cluster.html#node_pool"
  type        = string
  default     = "cbnode"
}

variable "node_pool_count" {
  description = "Numero de Nodes do Agent do Cluster do AKS."
  type        = string
  default     = "3"
}

variable "node_pool_vm_size" {
  description = "Tamanho da VM dos Nodes do Agent do Cluster do AKS."
  type        = string
  default     = "Standard_B2s"
}

variable "key_vault_name" {
  description = "Nome do cofre de chaves onde estão armazenadas senhas e chaves de acesso."
  type        = string
  default     = "vaultarielccardoso"
}

variable "key_service_principal_client_id" {
  description = "Chave armazenada no Key Vault para o Client ID do service principal usado pelo AKS para garantia de estado."
  type        = string
  default     = "ArmClientId"
}

variable "key_service_principal_client_secret" {
  description = "Chave armazenada no Key Vault para o Client Secret do service principal usado pelo AKS para garantia de estado."
  type        = string
  default     = "ArmClientSecret"
}

variable "admin_username" {
  description = "Nome do usuário de SO admnistrativos das maquinas do AKS."
  type        = string
  default     = "aksadmin"
}

variable "key_ssh_key" {
  description = "Chave armazenada no Key Vault para a chave SSH usada no login do AKS."
  type        = string
  default     = "SSHPublicKey"
}

variable "tags" {
  description = "Tags associadas aos recursos criados na Azure."
  type        = map(string)
  default = {
    Maintenance = "Ariel C. Cardoso <arielccardoso@live.com>"
  }
}

