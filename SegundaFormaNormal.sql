-- 2 Norma Formal

--  Eliminar dependências parciais, 
-- movendo dados relacionados a entidades independentes (como clientes) para tabelas separadas.

-- Passo 1: Criar a tabela Clientes.
CREATE TABLE tb_clientes(
    ClienteID INT PRIMARY KEY AUTO_INCREMENT, -- ID autoincrementado para facilitar
    ClienteNome VARCHAR(100),
    ClienteEndereco VARCHAR(200)
);

-- Inserir os clientes únicos da tabela não normalizada
INSERT INTO tb_clientes (ClienteNome, ClienteEndereco)
SELECT DISTINCT ClienteNome, ClienteEndereco
FROM tb_pedidos;


-- Passo 2: Adicionar a Coluna ClienteID em tb_pedidos
-- Adicionamos uma coluna ClienteID na tabela PedidosNaoNormalizados para referenciar a tabela Clientes.

ALTER TABLE tb_pedidos
ADD COLUMN ClienteID INT;

-- Atualizar `ClienteID` com base na relação entre `ClienteNome` e `ClienteEndereco`
UPDATE tb_pedidos AS p
SET ClienteID = (
    SELECT c.ClienteID
    FROM tb_clientes AS c
    WHERE c.ClienteNome = p.ClienteNome 
    AND c.ClienteEndereco = p.ClienteEndereco
);


SET SQL_SAFE_UPDATES = 0; -- (Caso dê erro, executar esse comando) - Permite UPDATE sem WHERE

-- Passo 3: Remover as colunas redundantes de Cliente
ALTER TABLE tb_pedidos
DROP COLUMN ClienteNome,
DROP COLUMN ClienteEndereco;

-- Passo 4: Configurar a Chave Estrangeira
ALTER TABLE tb_pedidos
ADD CONSTRAINT fk_tb_pedidos_tb_clientes
FOREIGN KEY (ClienteID)
REFERENCES tb_clientes(ClienteID);


