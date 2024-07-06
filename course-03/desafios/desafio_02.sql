/*
    1 Traga todos os dados da cliente Maria Silva.
    2 Busque o ID do pedidov e o ID do cliente dos pedidos onde o status esteja como entregue.
    3 Retorne todos os produtos onde o preço seja maior que 10 e menor que 15.
    4 Busque o nome e cargo dos colaboradores que foram contratados entre 2022-01-01 e 2022-06-31.
    5 Recupere o nome do cliente que fez o primeiro pedido.
    6 Liste os produtos que nunca foram pedidos.
    7 Liste os nomes dos clientes que fizeram pedidos entre 2023-01-01 e 2023-12-31.
    8 Recupere os nomes dos produtos que estão em menos de 15 pedidos.
    9 Liste os produtos e o ID do pedido que foram realizados pelo cliente "Pedro Alves" ou pela cliente "Ana Rodrigues".
    10 Recupere o nome e o ID do cliente que mais comprou(valor) no Serenatto.
*/

-- Traga todos os dados da cliente Maria Silva

SELECT * from clientes where nome = 'Maria Silva';

-- Busque o ID do pedido e o ID do cliente dos pedidos onde o status esteja como entregue.

SELECT id as idpedido, idcliente from pedidos where status = 'Entregue';

-- Retorne todos os produtos onde o preço seja maior que 10 e menor que 15.

SELECT * from produtos WHERE preco BETWEEN 10 AND 15;
SELECT * from produtos WHERE preco > 10 AND preco < 15;

-- Busque o nome e cargo dos colaboradores que foram contratados entre 2022-01-01 e 2022-06-31.
SELECT nome, cargo FROM colaboradores WHERE datacontratacao BETWEEN '2022-01-01' AND '2022-06-31';

-- Recupere o nome do cliente que fez o primeiro pedido.
SELECT cl.nome 
	from pedidos pd
    join clientes cl
    on cl.id = pd.idcliente
      where pd.id = 1;

-- Liste os produtos que nunca foram pedidos.
SELECT * from produtos;
SELECT * from itenspedidos;

SELECT pr.id, pr.nome
	from produtos pr
    LEFT join itenspedidos ip
	on pr.id = ip.idproduto
    WHERE ip.idproduto is NULL;

-- Recupere os nomes dos produtos que estão em menos de 15 pedidos.
SELECT * from produtos;
SELECT * from itenspedidos;

SELECT pr.nome 
	from produtos pr 
    join itenspedidos ip
    on (pr.id = ip.idproduto)
    GROUP by ip.idproduto
    HAVING COUNT(ip.idPedido) < 15;
    
-- Liste os produtos e o ID do pedido que foram realizados pelo cliente "Pedro Alves" 
-- ou pela cliente "Ana Rodrigues".

SELECT id from clientes where nome = 'Pedro Alves';
SELECT id from clientes where nome = 'Ana Rodrigues';

SELECT pr.nome, pe.id
	from produtos pr
	join itenspedidos ip
    on (pr.id = ip.idproduto)
    JOIN pedidos pe
    on (ip.idpedido = pe.id)
    where pe.idcliente = (
      SELECT id from clientes where nome = 'Pedro Alves'
    ) or pe.idcliente = (
    	SELECT id from clientes where nome = 'Ana Rodrigues'
    )
    ORDER by pr.nome asc;
    
    
SELECT p.nome, ip.idpedido
  FROM produtos AS p
  INNER JOIN itenspedidos AS ip ON P.id = ip.idProduto
  INNER JOIN pedidos AS pd ON ip.idPedido = pd.id
  INNER JOIN clientes AS c ON pd.idCliente = c.id
  WHERE c.nome IN ('Pedro Alves', 'Ana Rodrigues')
  ORDER by p.nome asc;

-- Recupere o nome e o ID do cliente que mais comprou(valor) no Serenatto.
SELECT p.idCliente, c.nome, SUM(ip.quantidade * ip.precounitario) as valortotal 
  FROM clientes c 
  INNER JOIN pedidos p ON c.id = p.idcliente 
  INNER JOIN itenspedidos ip ON p.id = ip.idpedido 
  GROUP BY p.idCliente 
  ORDER BY valortotal DESC 
  LIMIT 3;
