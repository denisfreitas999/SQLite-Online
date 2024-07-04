-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 01 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- Para retornarmos todos os dados de uma tabela utilizamos a seguinte estrutura:
SELECT *
FROM nome da tabela;
-- Como por exemplo, para retornar os dados da tabela de fornecedores utilizamos o seguinte código:
SELECT *
FROM tabelafornecedores;
-- Para retornarmos os dados filtrando por alguma característica específica utilizamos a cláusula WHERE da seguinte forma:
SELECT *
FROM nome da tabela
WHERE nome da coluna = dado que desejamos consultar;
-- Em vídeo utilizamos essa estrutura para filtrar os fornecedores que possuíam como país de origem a China:
SELECT *
FROM tabelafornecedores
WHERE país_de_origem = 'China' -- Para filtrarmos os dados distintos contidos em uma coluna específica usamos a cláusula DISTINCT da seguinte maneira:
SELECT DISTINCT id_produto
FROM tabela_de_vendas;
-- Usamos essa estrutura para filtrar os diferentes clientes existentes na tabela de pedidos dessa forma:
SELECT DISTINCT cliente
FROM tabelapedidos;
-- Liste todos os IDs únicos dos produtos vendidos pela empresa, ou seja, uma lista de produtos distintos. Utilize a cláusula DISTINCT para garantir que os IDs dos produtos sejam únicos.
SELECT DISTINCT id_produto
FROM tabela_de_vendas;
-- Identifique os clientes que se cadastraram na empresa antes de 2020. Liste o nome e a data de cadastro desses clientes. Utilize a cláusula WHERE para filtrar os registros.
SELECT nome_do_cliente,
  data_de_cadastro
FROM tabela_de_clientes
WHERE data_de_cadastro < '2020-01-01';
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 02 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- Criação da tabela de clientes com as colunas ID_Cliente, Nome_Cliente e Informacoes_de_Contato.
CREATE TABLE tabelaclientes (
  ID_Cliente INT PRIMARY KEY,
  Nome_Cliente VARCHAR (250),
  Informacoes_de_Contato VARCHAR (250)
);
-- Adicionando coluna Endereco_Cliente na tabela de clientes
ALTER TABLE tabelaclientes
ADD Endereco_Cliente VARCHAR (250);
-- Apagando a tabela demo do banco de dados
DROP TABLE demo;
-- O comando DROP em SQL é usado para excluir um objeto do banco de dados. Podemos excluir índices, tabelas, bancos de dados, usuários, funções, entre outros.
DROP tipo_do_objeto nome_do_objeto;
-- Por exemplo, para excluir uma tabela chamada "Estudantes", você usaria:
DROP TABLE Estudantes;
-- Agora se deseja excluir um banco de dados chamado “Colégio São Paulo”, seria assim:
DROP DATABASE Colégio_São_Paulo;
-- E caso queira excluir um esquema chamado “Turno da manhã”, contido em um banco de dados, fica assim:
DROP SCHEMA Turno_da_manhã;
-- Atenção: Cautela ao usar o comando DROP! Uma vez que um objeto é deletado, não pode ser recuperado.
-- O comando ALTER é usado para alterar a estrutura de um objeto existente em um banco de dados. Ele pode ser usado para adicionar, modificar ou excluir colunas em uma tabela existente. Também pode ser usado para adicionar e soltar várias restrições em uma tabela existente.
ALTER TABLE nome_da_tabela
ADD nome_da_coluna tipo_de_dado;
-- Por exemplo, para adicionar uma coluna chamada "Idade" à tabela "Estudantes", você usaria:
ALTER TABLE Estudantes
ADD Idade INT;
-- Para excluir uma coluna de uma tabela, usamos a sintaxe:
ALTER TABLE nome_da_tabela DROP COLUMN nome_da_coluna;
-- Por exemplo:
ALTER TABLE Estudantes DROP COLUMN Idade;
-- Criando tabela categorias
CREATE TABLE tabelacategorias (
  ID_Categoria INT PRIMARY KEY,
  Nome_Categoria VARCHAR (250),
  Desricao_Categoria TEXT
);
-- Criando tabela produtos
CREATE table tabelaprodutos (
  ID_Produto INT PRIMARY KEY,
  Nome_Produto VARCHAR (250),
  Descricao TEXT,
  Categoria INT,
  Preco_de_Compra DECIMAL (10, 2),
  Unidade VARCHAR (50),
  Fornecedor INT,
  Data_de_Inclusao DATE,
  FOREIGN KEY (Categoria) REFERENCES tabelacategorias (id_categoria),
  FOREIGN KEY (Fornecedor) REFERENCES tabelafornecedores (id)
);

-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 03 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Inserindo dados dentro da tabela clientes
INSERT INTO tabelaclientes (
    id_cliente,
    nome_cliente,
    informacoes_de_contato,
    endereco_cliente
  )
VALUES (
    '1',
    'Denisson Freitas',
    'denisson@email.com',
    'rua dos bobos numero 0'
  );
-- Inserindo 10 clientes de uma vez só!
INSERT INTO tabelaclientes (
    id_cliente,
    nome_cliente,
    informacoes_de_contato,
    endereco_cliente
  )
VALUES (
    '2',
    'Alice Oliveira',
    'alice@example.com',
    'Avenida Principal, 123'
  ),
  (
    '3',
    'Benjamin Santos',
    'benjamin@email.com',
    'Rua dos Bobos, 2'
  ),
  (
    '4',
    'Carla Mendes',
    'carla@example.com',
    'Travessa das Flores, 45'
  ),
  (
    '5',
    'Daniel Costa',
    'daniel@example.com',
    'Rua da Esperança, 789'
  ),
  (
    '6',
    'Eduardo Silva',
    'eduardo@example.com',
    'Rua Nova, 56'
  ),
  (
    '7',
    'Fernanda Almeida',
    'fernanda@example.com',
    'Avenida das Árvores, 101'
  ),
  (
    '8',
    'Gabriel Rocha',
    'gabriel@example.com',
    'Rua do Sol, 202'
  ),
  (
    '9',
    'Helena Martins',
    'helena@example.com',
    'Praça da Alegria, 303'
  ),
  (
    '10',
    'Igor Pereira',
    'igor@example.com',
    'Beco do Silêncio, 404'
  ),
  (
    '11',
    'Julia Fernandes',
    'julia@example.com',
    'Largo da Paz, 505'
  ) 
  
-- Criando tabela de pedidos gold
CREATE TABLE tabelapedidosgold (
  ID_pedido_gold INT PRIMARY KEY,
  Data_Do_Pedido_gold DATE,
  Status_gold VARCHAR(50),
  Total_Do_Pedido_gold DECIMAL(10, 2),
  Cliente_gold INT,
  Data_De_Envio_Estimada_gold DATE,
  FOREIGN KEY (cliente_gold) REFERENCES tabelaclientes(id_cliente)
);


-- Inserindo dados da tabela de pedidos para a tabela de pedidos gold, só pedidos acima de 400
INSERT INTO tabelapedidosgold
    (
       ID_pedido_gold, 
       Data_Do_Pedido_gold, 
       Status_gold, 
       Total_Do_Pedido_gold, 
       Cliente_gold, 
       Data_De_Envio_Estimada_gold
    )
SELECT
    id,
    data_do_pedido,
    status,
    total_do_pedido,
    cliente,
    data_de_envio_estimada
FROM tabelapedidos
WHERE total_do_pedido >= 400;

-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 04 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Realizando buscas com operadores lógicos
SELECT * FROM tabelapedidos WHERE total_do_pedido > 200;
SELECT * FROM tabelapedidos WHERE total_do_pedido >= 200;
SELECT * FROM tabelapedidos WHERE total_do_pedido <= 200;
SELECT * FROM tabelapedidos WHERE total_do_pedido < 200;
SELECT * FROM tabelapedidos WHERE total_do_pedido <> 200;
SELECT * FROM tabelapedidos WHERE total_do_pedido = 200;

-- Operadores lógicos e strings
SELECT * FROM tabelaclientes WHERE nome_cliente > 'C';

-- Operadores lógicos e datas
SELECT * FROM tabelapedidos WHERE data_do_pedido > '2023-09-19';

-- Filtros compostos - AND, OR, NOT e BETWEEN
SELECT * FROM tabelapedidos WHERE total_do_pedido >= 200 AND Status = 'Pendente';
SELECT * from tabelapedidos where status = 'Pendente' OR status = 'Processando';
SELECT * from tabelapedidos where not status = 'Pendente';
SELECT * 
	from tabelapedidos 
    where data_de_envio_estimada 
    BETWEEN '2023-08-01' 
    and '2023-09-01';

--  Ordenando os dados - ORDER BY
SELECT * 
	from tabelaprodutos 
	where preco_de_compra >= 200 
    and preco_de_compra <= 600
    order BY nome_produto;

-- Ordenando com DESC e ASC
SELECT * 
	from tabelaprodutos 
	where preco_de_compra >= 200 
    and preco_de_compra <= 600
    order BY nome_produto
    ASC;

SELECT * 
	from tabelaprodutos 
	where preco_de_compra >= 200 
    and preco_de_compra <= 600
    order BY nome_produto
    DESC;

-- Criando apelidos (ALIAS):
SELECT informacoes_de_contato AS email_cliente from tabelaclientes;

-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 05 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Atualizando dados - UPDATE
UPDATE tabelapedidos SET status = 'Enviado' where status = 'Processando';

UPDATE tabelaclientes 
	SET informacoes_de_contato = 'denisson@exemaple', endereco_cliente = 'Alameda das aves, 77'
    where id_cliente = 1; 

-- Deletando dados - DELETE

DELETE from tabelafornecedores WHERE país_de_origem = 'Turquia';

DELETE from tabelafornecedores where id > 35;