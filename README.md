# PostgreSQL & PGAdmin4 - Ambiente Containerizado

Este projeto utiliza Docker para criar um ambiente isolado com o SGBD PostgreSQL e a interface de administração PGAdmin4, facilitando o desenvolvimento, testes e administração de bancos de dados.

## Recursos Utilizados

- **Docker Compose**: Orquestração dos containers.
- **Imagens Oficiais**:
  - `postgres`: Banco de dados relacional PostgreSQL.
  - `dpage/pgadmin4`: Interface web para administração do PostgreSQL.
- **Persistência de Dados**: Volume dedicado para garantir que os dados do banco não sejam perdidos ao remover o container.
- **Rede Personalizada**: Containers conectados em uma rede Docker exclusiva para comunicação segura.
- **Limites de Recursos**: O container do PostgreSQL está configurado para utilizar apenas **1 CPU** e **512MB de RAM**, ideal para ambientes de desenvolvimento e testes locais.

## Estrutura dos Arquivos

- `pgsql.docker-compose.yml`: Configuração do serviço PostgreSQL.
- `pgadmin.docker-compose.yml`: Configuração do serviço PGAdmin4.
- `data/pgsql/`: Volume persistente dos dados do banco.
- `.env` ou `env.sample`: Variáveis de ambiente para configuração dos serviços.

## Como Utilizar

1. **Configurar variáveis de ambiente**
   - Copie o arquivo `env.sample` para `.env` e ajuste as variáveis conforme necessário.

2. **Subir o ambiente**
   ```sh
   # utilizando docker compose
   # obs: a depender da versão, retire o hífen (-) do comando e execute docker compose
   docker-compose -f pgsql.docker-compose.yml up -d
   docker-compose -f pgadmin.docker-compose.yml up -d

   # utilizando make
   make pgsql # para subir apenas o postgresql
   make pgadmin # para subir apenas o pgAdmin
   make full # para subir os dois serviços de vez
   ```

3. **Acessar os serviços**
   - **PostgreSQL**: Porta `15432` (localhost:15432)
   - **PGAdmin4**: Normalmente disponível na porta `16543` (verifique o compose do PGAdmin)

4. **Limites de Recursos**
   - O serviço PostgreSQL está limitado a **1 CPU** e **512MB de RAM** para evitar consumo excessivo da máquina local.

## Observações

- Para ambientes de produção, recomenda-se ajustar os limites de recursos conforme a demanda.
- O volume `data/pgsql` garante persistência dos dados mesmo após remoção dos containers.
- A rede `pgNetwork` permite comunicação segura e isolada entre os serviços.

---

Desenvolvido com ❤️ por [Mário.dev](https://bymario.dev)

Contribuições e sugestões são bem-vindas!
