variable "environment" {
  description = "Environment name"
  type        = string
  # VULNERABILIDAD: Valor por defecto con secreto
  default     = "production"
}

variable "database_password" {
  description = "Database password"
  type        = string
  # VULNERABILIDAD: Password hardcodeado como default
  default     = "DefaultSecretPassword123!"
  sensitive   = true
}

variable "api_keys" {
  description = "API keys for external services"
  type        = map(string)
  # VULNERABILIDAD: API keys hardcodeadas
  default = {
    stripe_secret = "sk_live_51234567890abcdefghijklmnopqrstuvwxyz"
    github_token  = "ghp_1234567890abcdefghijklmnopqrstuvwxyz12"
    slack_webhook = "https://hooks.slack.com/services/T12345678/B12345678/abcdefghijklmnopqrstuvwx"
  }
  sensitive = true
}

# VULNERABILIDAD: Locals con secretos
locals {
  database_config = {
    host     = "prod-db.company.com"
    username = "admin"
    password = "LocalsSecretPass123!"
    port     = 5432
  }
  
  jwt_secret = "terraform-locals-jwt-secret-2023"
  redis_password = "LocalsRedisPass123!"
}
