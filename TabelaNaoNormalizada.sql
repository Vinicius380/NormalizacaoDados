
-- Criando o banco de dados
CREATE DATABASE bd_comercial;

USE bd_comercial;

-- Criação da tabela não normalizada
CREATE TABLE tb_pedidos(
    PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteNome VARCHAR(100),
    ClienteEndereco VARCHAR(200),
    ProdutoID VARCHAR(255), -- Lista de IDs dos produtos
    ProdutoNome VARCHAR(255), -- Lista de nomes dos produtos
    Quantidade VARCHAR(255), -- Lista de quantidades
    PrecoUnitario VARCHAR(255), -- Lista de preços unitários
    DataPedido DATE
);

-- Inserindo os dados
INSERT INTO tb_pedidos (PedidoID, ClienteNome, ClienteEndereco, ProdutoID, ProdutoNome, Quantidade, PrecoUnitario, DataPedido)
VALUES
(1, 'João Silva', 'Rua A, 123', '101,103', 'Caneta Azul,Lápis', '10,20', '2.50,1.00', '2024-11-01'),
(2, 'Maria Souza', 'Rua B, 456', '102', 'Caderno', '5', '15.00', '2024-11-02');

-- Visualizando a tabela
SELECT * FROM tb_pedidos;

-- Problemas desta tabela:
-- Redundância de dados (listas de IDs, nomes de produtos, quantidades e preços).
-- Dificuldade de manipulação de dados como parte de um processo de análise ou relatórios.