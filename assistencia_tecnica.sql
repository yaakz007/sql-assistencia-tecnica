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

INSERT INTO pecas (nome, preco, estoque)
VALUES ('RTX 5070', 8570.00, 2);

INSERT INTO pecas (nome, preco, estoque)
VALUES ('Ryzen 7 5700x', 2500.00, 5);

-- Dados de exemplo: ordens de serviço
INSERT INTO ordens_servico (cliente_id, descricao, valor, data_entrada)
VALUES (1, 'Troca de tela do notebook', 600.00, '2026-10-10');

INSERT INTO ordens_servico (cliente_id, descricao, valor, data_entrada)
VALUES (3, 'Instalação placa de vídeo', 50.00, '2026-10-08');

-- Ordem de teste que será cancelada
INSERT INTO ordens_servico (cliente_id, descricao, valor, data_entrada)
VALUES (2, 'Orçamento cancelado', 0.00, '2026-10-14');

-- Cliente mudou de telefone
UPDATE clientes
SET telefone = '47988880001'
WHERE id = 1;

-- Remove a ordem de serviço cancelada
DELETE FROM ordens_servico
WHERE id = 3;

-- Atualiza o preço da tela
UPDATE pecas
SET preco = 550.00
WHERE id = 1;

-- Atualiza preço e estoque da RTX (duas colunas de uma vez)
UPDATE pecas
SET preco = 9100.00, estoque = 1
WHERE nome = 'RTX 5070';

-- Remove a peça Ryzen
DELETE FROM pecas
WHERE nome = 'Ryzen 7 5700x';

-- Mais dados para as consultas
INSERT INTO pecas (nome, preco, estoque)
VALUES ('Bateria notebook 6 células', 180.00, 0);

INSERT INTO pecas (nome, preco, estoque)
VALUES ('SSD 480GB', 320.50, 12);

INSERT INTO pecas (nome, preco, estoque)
VALUES ('Memória RAM 8GB', 210.00, 7);

INSERT INTO ordens_servico (cliente_id, descricao, valor, data_entrada)
VALUES (1, 'Troca de bateria do notebook', 180.00, '2026-10-12');

INSERT INTO ordens_servico (cliente_id, descricao, valor, data_entrada)
VALUES (4, 'Formatação e instalação de SSD', 350.00, '2026-10-13');

INSERT INTO ordens_servico (cliente_id, descricao, valor, data_entrada)
VALUES (3, 'Limpeza e troca de pasta térmica', 120.00, '2026-10-09');

-- Peças com preço acima de 300
SELECT * FROM pecas WHERE preco > 300;

-- Ordens que mencionam "notebook"
SELECT * FROM ordens_servico WHERE descricao LIKE '%notebook%';

-- Ordens entre duas datas
SELECT * FROM ordens_servico
WHERE data_entrada BETWEEN '2026-10-09' AND '2026-10-12';

-- Mais exemplos com SELECT
SELECT * FROM pecas WHERE estoque = 0;

SELECT * FROM clientes WHERE cidade = 'Blumenau';

SELECT * FROM ordens_servico ORDER BY valor DESC;

SELECT COUNT(*) FROM ordens_servico;

SELECT COUNT(*) FROM ordens_servico WHERE cliente_id = 1;

SELECT DISTINCT cidade FROM clientes;

SELECT * FROM pecas ORDER BY preco DESC;

SELECT COUNT(*) FROM clientes;

SELECT * FROM pecas WHERE nome LIKE '%RTX%';

SELECT * FROM pecas WHERE preco BETWEEN 200 AND 600;

-- Tabela de teste: criada e apagada logo depois (DROP TABLE)
CREATE TABLE teste (id INT PRIMARY KEY);

DROP TABLE teste;