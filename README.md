# Infra Testes New Account

Este repositório contém a infraestrutura como código para a criação e configuração de novas contas de teste na AWS utilizando o Terraform.

## Estrutura do Repositório

- **dev/**: Configurações e variáveis específicas para o ambiente de desenvolvimento.
- **qas/**: Configurações e variáveis específicas para o ambiente de qualidade.
- **prd/**: Configurações e variáveis específicas para o ambiente de produção.
- **.github/workflows/**: Configurações de CI/CD para automação de deploy.

## Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) instalado na máquina local.
- Credenciais de acesso à AWS configuradas.

## Como Usar

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/infra-testes-new-account.git
   cd infra-testes-new-account
   ```

2. Inicialize o Terraform:
   ```bash
   terraform init
   ```

3. Planeje as alterações de infraestrutura:
   ```bash
   terraform plan -var="environment=dev"
   ```

4. Aplique as alterações:
   ```bash
   terraform apply -var="environment=dev"
   ```

## Variáveis de Configuração

As variáveis de configuração estão definidas nos arquivos `variables.tf` em cada diretório de ambiente. Certifique-se de ajustar as variáveis conforme necessário para o seu caso de uso específico.

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

## Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
/*******  4485ef4c-e9d1-4fd7-b24a-a3acb5cbf9fc  *******/
