-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 01 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Consultando tabelas dos bancos

SELECT * from clientes;
SELECT * from colaboradores;
SELECT * from fornecedores;
SELECT * from produtos;
SELECT * from pedidos;
SELECT * from itenspedidos;

-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 02 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- União de informações com o UNION: (intersecção)
select rua, bairro, cidade, estado, cep from colaboradores
UNION
select  rua, bairro, cidade, estado, cep from fornecedores;

-- Note que o comando abaixo trás dois colaboradores que dividem o mesmo endereço
-- o UNION comum não consegue trazer com distinção os dois casos
SELECT * from colaboradores where rua = 'Rua das flores - 210'

-- Utilizando o UNION ALL para capturar todos os valores da união entre as tabelas (União)
select rua, bairro, cidade, estado, cep from colaboradores
UNION ALL
select  rua, bairro, cidade, estado, cep from fornecedores;

-- Adicionando o nome 
select nome, rua, bairro, cidade, estado, cep from colaboradores
UNION ALL
select  nome, rua, bairro, cidade, estado, cep from fornecedores;

-- Consulta aninhada com subconsulta
-- Esta consulta busca o cliente responsável pelo primeiro pedido, o pedido de ID = 1
SELECT * 
	FROM clientes
    WHERE 
    	id = (
          SELECT idcliente 
          from pedidos
          WHERE id = 1
    );

-- Esta consulta tras os id's dos clientes da tabela pedidos 
-- onde o mês da coluna datahorapedido é igual a 01
SELECT idcliente from pedidos WHERE strftime('%m', datahorapedido) = '01';

-- Consulta que utiliza a subconsulta acima para descobrir quem são os clientes
SELECT nome 
	from clientes 
    WHERE id IN (
      SELECT idcliente 
      	from pedidos 
      	WHERE strftime('%m', datahorapedido) = '01'
    );

-- Consulta a média dos preços dos produtos
SELECT AVG(preco) FROM produtos;

-- A consulta utiliza uma subconsulta para retonar os produtos que possuem o preço 
-- maior do que a média de preços dos produtos
SELECT nome, preco 
	FROM produtos
    GROUP by nome, preco
    HAVING preco > (
    	SELECT AVG(preco) FROM produtos
    );

-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 03 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Utilizando o inner join
select nome, p.id, p.datahorapedido
  from clientes c
  inner join pedidos p 
  on c.id = p.idcliente;

-- Utilizando o right join
SELECT * FROM produtos;
SELECT * from itenspedidos;

SELECT pr.nome, ip.idproduto, ip.idpedido
  FROM itenspedidos ip
  RIGHT JOIN produtos pr
  ON pr.id = ip.idproduto;

-- Usando o left join
INSERT INTO Clientes (id, Nome, Telefone, Email, Endereco)
VALUES (28, 'João Santos', '215555678', 'joao.santos@email.com', 'Avenida Principal, 456, Cidade B'),
       (29, 'Carla Ferreira', '315557890', 'carla.ferreira@email.com', 'Travessa das Ruas, 789, Cidade C');
       
SELECT * from clientes;

SELECT cl.nome, pd.id AS id_pedido
	from clientes cl 
    left join pedidos pd
    on cl.id = pd.idcliente;

-- Buscando os clientes que não fizeram pedidos no mês 10
SELECT cl.nome, x.id AS id_pedido
	from clientes cl 
    left join (
      SELECT pd.id, pd.idcliente
      from pedidos pd
      where strftime('%m', pd.datahorapedido) = '10'
    ) x
    on cl.id = x.idcliente
    where id_pedido is NULL;
    
-- Utilizando o FULL JOIN
-- Traz todos os pedidos cujo cliente é nulo
SELECT c.nome, p.id 
  FROM clientes c
  FULL JOIN pedidos p
  ON c.id = p.idcliente
  WHERE c.id IS NULL;
-- Traz todos os clientes cujo pedido é nulo
SELECT c.nome, p.id 
  FROM clientes c
  FULL JOIN pedidos p
  ON c.id = p.idcliente
  WHERE p.id IS NULL;

-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 04 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- calcule o valor total de cada pedido

-- Verificar tabelas
SELECT * from pedidos;
SELECT * from itenspedidos;

-- Unir as tabelas com correspondência 
SELECT * 
	from pedidos pd
    join itenspedidos ip
    on pd.id = ip.idpedido;
    
-- Simplificando consulta 
SELECT pd.id as id_pedido, ip.quantidade, ip.precounitario
	from pedidos pd
    join itenspedidos ip
    on pd.id = ip.idpedido;
    
--  Unindo a tabela de produtos para verificar se o preço unitário é igual ao preço do produto
SELECT pd.id as id_pedido, ip.quantidade,  pr.preco, ip.precounitario
	from pedidos pd
    join itenspedidos ip
    on pd.id = ip.idpedido
    JOIN produtos pr
    on ip.idproduto = pr.id;

--  Unindo a tabela clientes para trazer o nome dos clientes
-- calcula o valor da soma_pedido
SELECT cl.nome, pd.id as id_pedido, SUM(ip.precounitario) AS soma_pedido
	from pedidos pd
    join itenspedidos ip on pd.id = ip.idpedido
    join clientes cl on pd.idcliente = cl.id
    GROUP by pd.id, cl.nome;
    
-- Criando VIEW para ter acesso a uma tabela virtual da consulta feita anteriormente
CREATE VIEW ViewSomaPedido AS
  SELECT cl.nome, pd.id as id_pedido, SUM(ip.precounitario) AS soma_pedido
      from pedidos pd
      join itenspedidos ip on pd.id = ip.idpedido
      join clientes cl on pd.idcliente = cl.id
      GROUP by pd.id, cl.nome;

-- Consultando a View
select * from ViewSomaPedido;

-- Trabalhando com a view
SELECT nome FROM ViewValorTotalPedido
  WHERE ValorTotalPedido = 10;

SELECT nome FROM ViewValorTotalPedido
  WHERE ValorTotalPedido > 10;

SELECT nome FROM ViewValorTotalPedido
  WHERE ValorTotalPedido > 10 AND ValorTotalPedido < 14;

SELECT nome FROM ViewValorTotalPedido
  WHERE strftime('%m', datahorapedido) = '08'


--  calculando o valor do faturamento diário, ou seja, o valor dos pedidos que foram feitos por dia
SELECT DATE datahorapedido AS Dia, SUM(ip.precounitario) AS FaturamentoDiario
  FROM pedidos p
  JOIN itenspedidos ip
  ON p.id = ip.idpedido
  GROUP BY Dia
  ORDER BY Dia;

-- Criando tabela de faturamento diário
CREATE TABLE FaturamentoDiario (
    Dia DATE,
    FaturamentoTotal DECIMAL(10, 2)
);

-- Criando TRIGGER
CREATE TRIGGER CalculaFaturamentoDiario
AFTER INSERT ON itenspedidos
FOR EACH ROW
BEGIN
  DELETE FROM FaturamentoDiario;
  
  INSERT INTO FaturamentoDiario (Dia, FaturamentoTotal)
  SELECT DATE(p.datahorapedido) AS Dia, SUM(ip.precounitario * ip.quantidade) AS FaturamentoTotal
  FROM pedidos p
  JOIN itenspedidos ip ON p.id = ip.idpedido
  GROUP BY DATE(p.datahorapedido);
END;

-- Inserindo valores para testar a execução do TRIGGER
SELECT * FROM FaturamentoDiario;

SELECT * FROM pedidos;

SELECT * FROM itenspedidos;

INSERT INTO Pedidos(id, idcliente, datahorapedido, status)
VALUES (451, 27, '2023-10-07 14:30:00', 'Em Andamento');

INSERT INTO itenspedidos(idpedido, idproduto, quantidade, precounitario)
VALUES (451, 14, 1, 6.0),
       (451, 13, 1, 7.0);
       
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 05 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Por meio desse pragma, podemos modificar as configurações do nosso SQLite online. 
-- Informamos a ele que desejamos validar nossas chaves estrangeiras, estabelecendo foreign_keys = ON.
PRAGMA foreign_keys = ON

SELECT * from produtos where id = 31;

-- Atualizando dados
UPDATE produtos SET preco = 13.0 WHERE id = 31;

SELECT * from produtos where nome like 'Croissant%';

UPDATE produtos SET descricao = 'Croissant recheado com amêndoa.' WHERE id = 28;

-- Excluindo dados
SELECT * FROM colaboradores;

DELETE FROM colaboradores WHERE id = 3;

SELECT * FROM clientes;

-- DELETE FROM clientes WHERE id = 27;
SELECT * FROM clientes WHERE ID = 27;
SELECT * FROM pedidos WHERE idcliente = 27;
SELECT * FROM itenspedidos WHERE idpedido = 451;
DELETE FROM clientes WHERE id = 27;

-- RECUPERAÇÃO DE DADOS COM TRANSAÇÃO E ROLLBACK E COMMIT
BEGIN TRANSACTION;

SELECT * FROM clientes;

DELETE FROM clientes;

SELECT * FROM Pedidos;

UPDATE Pedidos SET Status = 'Concluído';

ROLLBACK;

COMMIT;