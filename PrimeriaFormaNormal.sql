-- 1 Forma Normal

--  Remover listas e garantir que cada valor seja atômico (Um produto por linha)

-- Passo 1: Criar uma nova tabela para armazenar itens detalhados.
CREATE TABLE tb_detalhesPedidos (
    DetalhesPedido_ID INT PRIMARY KEY AUTO_INCREMENT,
    PedidoID INT,
    ProdutoID INT,
    ProdutoNome VARCHAR(100),
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    FOREIGN KEY (PedidoID) REFERENCES bd_comercial.tb_pedidos (PedidoID)
);

-- Inserir os dados da tabela original
INSERT INTO tb_detalhesPedidos (PedidoID, ProdutoID, ProdutoNome, Quantidade, PrecoUnitario)
VALUES
(1, 101, 'Caneta Azul', 10, 2.50),
(1, 103, 'Lápis', 20, 1.00),
(2, 102, 'Caderno', 5, 15.00);

-- Passo 2: Atualizar a tabela tb_pedidos para remover as colunas de listas e mantê-la apenas com os dados do pedido.
ALTER TABLE tb_pedidos
DROP COLUMN ProdutoID,
DROP COLUMN ProdutoNome,
DROP COLUMN Quantidade,
DROP COLUMN PrecoUnitario;

-- Visualizando as tabelas
SELECT * FROM tb_detalhesPedidos;
SELECT * FROM tb_pedidos;

-- tabela tb_pedidos está livre de listas e cada pedido está registrado de forma simples.
-- ainda temos dependências parciais:
-- ClienteNome e ClienteEndereco dependem apenas de PedidoID, não de ProdutoID.
