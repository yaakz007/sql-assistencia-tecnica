-- Recomeça do zero a cada execução
DROP DATABASE IF EXISTS assistencia_tecnica;
CREATE DATABASE assistencia_tecnica;
USE assistencia_tecnica;

-- Tabela de clientes
CREATE TABLE clientes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(50)
);

-- Tabela de ordens de serviço
CREATE TABLE ordens_servico (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    valor DECIMAL(10,2),
    data_entrada DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabela de peças
CREATE TABLE pecas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2),
    estoque INT
);

-- Adiciona o telefone na tabela de clientes
ALTER TABLE clientes ADD COLUMN telefone VARCHAR(20);

-- Dados de exemplo: clientes
INSERT INTO clientes (nome, cidade, telefone)
VALUES ('Maria Silva', 'Blumenau', '47999990001');

INSERT INTO clientes (nome, cidade, telefone)
VALUES ('João Pereira', 'Gaspar', '47999990002');

INSERT INTO clientes (nome, cidade, telefone)
VALUES ('Lucas Gabriel', 'Dubai', '47999990003');

INSERT INTO clientes (nome, cidade, telefone)
VALUES ('Ana Souza', 'Indaial', '47999990004');

INSERT INTO clientes (nome, cidade, telefone)
VALUES ('Pedro Henrique', 'Brusque', '47999990005');

INSERT INTO clientes (nome, cidade, telefone)
VALUES ('Julia Martins', 'Itajaí', '47999990006');

INSERT INTO clientes (nome, cidade, telefone)
VALUES ('Gabriel Costa', 'Joinville', '47999990007');

INSERT INTO clientes (nome, cidade, telefone)
VALUES ('Beatriz Oliveira', 'Florianópolis', '47999990008');

INSERT INTO clientes (nome, cidade, telefone)
VALUES ('Rafael Santos', 'Timbó', '47999990009');

INSERT INTO clientes (nome, cidade, telefone)
VALUES ('Camila Rodrigues', 'Pomerode', '47999990010');

-- Dados de exemplo: peças
INSERT INTO pecas (nome, preco, estoque)
VALUES ('Tela 15.6 polegadas', 450.00, 5);

-- Dados de exemplo: ordens de serviço
INSERT INTO ordens_servico (cliente_id, descricao, valor, data_entrada)
VALUES (1, 'Troca de tela do notebook', 600.00, '2026-10-10');