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