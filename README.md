# Banco de dados: Assistência Técnica

Projeto de estudo em MySQL que modela uma assistência técnica de computadores:
clientes, ordens de serviço e peças.

## O que o script demonstra
- **DDL:** CREATE DATABASE, CREATE TABLE, ALTER TABLE, DROP TABLE
- **DML:** INSERT, UPDATE, DELETE (com WHERE)
- **Consultas:** SELECT com WHERE, LIKE, BETWEEN, ORDER BY, COUNT e DISTINCT
- **Relacionamento:** chave primária e chave estrangeira entre clientes e ordens de serviço

## Tabelas
- `clientes`: dados do cliente (nome, cidade, telefone)
- `ordens_servico`: serviços ligados a um cliente por chave estrangeira
- `pecas`: peças com preço e estoque

## Como rodar
O script recria o banco do zero a cada execução.

```bash
mysql -u SEU_USUARIO -p < assistencia_tecnica.sql
```
