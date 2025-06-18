#OBRIGATÓRIO! NÃO ALTERAR!

locals {
  raw_config                = yamldecode(file(format("%s/../environments/${var.environment}.yaml", path.module)))
  environment               = lookup(local.raw_config.environments, var.environment, "err: invalid environment")
  account_id                = local.environment.account.id
  backend_name_prefix       = local.environment.backend.name_prefix
}

