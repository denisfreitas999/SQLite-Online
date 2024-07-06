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