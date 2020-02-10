# Arquivo de outputs

output "keyvault_vault_uri" {
  description = "URL do Key Vault que armazena as secrets usadas no projeto."
  value       = data.azurerm_key_vault.keyvault.vault_uri
}

