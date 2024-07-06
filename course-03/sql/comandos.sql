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
