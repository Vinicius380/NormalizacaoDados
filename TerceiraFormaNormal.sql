-- 3 Forma Normal 

-- Eliminamos dependências transitivas
-- movendo dados que dependem de outras colunas (como ProdutoNome e PrecoUnitario) para tabelas separadas.

-- Passo 1: Criar a tabela tb_produtos
CREATE TABLE bd_comercial.tb_produtos (
    ProdutoID INT PRIMARY KEY,
    ProdutoNome VARCHAR(100),
    PrecoUnitario DECIMAL(10, 2)
);

-- Passo 1:Inserir os dados dos produtos
INSERT INTO bd_comercial.tb_produtos (ProdutoID, ProdutoNome, PrecoUnitario)
SELECT DISTINCT ProdutoID, ProdutoNome, PrecoUnitario
FROM bd_comercial.tb_detalhesPedidos;

-- Passo 2: Remover ProdutoNome e PrecoUnitario da tabela tb_detalhesPedidos
ALTER TABLE tb_detalhesPedidos
DROP COLUMN ProdutoNome,
DROP COLUMN PrecoUnitario;

-- Passo 3: Configurar a chave estrangeira de ProdutoID
ALTER TABLE tb_detalhesPedidos
ADD CONSTRAINT fk_tb_detalhesPedidos_tb_produtos
FOREIGN KEY (ProdutoID)
REFERENCES tb_produtos(ProdutoID);