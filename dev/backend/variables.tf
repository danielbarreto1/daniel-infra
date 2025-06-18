#OBRIGATÓRIO! ALTERAR APENAS REGION, CASO NECESSÁRIO!

variable "region" {
  description = "Região default do provider"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  type = string
}