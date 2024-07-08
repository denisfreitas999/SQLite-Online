-- 01 Qual é o número de Clientes que existem na base de dados ?
SELECT count(*) as numero_clientes from clientes ;

-- 02 Quantos produtos foram vendidos no ano de 2022 ?
SELECT count(*) as qtd_produtos_2020
	from vendas v
    join itens_venda iv
    on (v.id_venda = iv.venda_id)
    WHERE strftime('%Y', v.data_venda) = '2022';
    
-- 03 Qual a categoria que mais vendeu em 2022 ? 
SELECT c.nome_categoria, COUNT(*) as qtd_prod_cat_maior_qtd_vendas_2022
	from vendas v
    join itens_venda iv on (v.id_venda = iv.venda_id)
    join produtos p on (iv.produto_id = p.id_produto)
    join categorias c ON (p.categoria_id = c.id_categoria)
    WHERE strftime('%Y', v.data_venda) = '2022'
    GROUP by c.nome_categoria
    ORDER by qtd_prod_cat_maior_qtd_vendas_2022 desc
    LIMIT 1;

-- 04 Qual o primeiro ano disponível na base ?
SELECT MIN(strftime('%Y', data_venda))  as primeiro_ano
  from vendas;

-- 05 Qual o nome do fornecedor que mais vendeu no primeiro ano disponível na base?  
SELECT f.nome, COUNT(p.id_produto) as qtd_prod_vendidos
	from vendas v
    JOIN itens_venda iv on (v.id_venda = iv.venda_id)
    join produtos p on (iv.produto_id = p.id_produto)
    join fornecedores f on (p.fornecedor_id = f.id_fornecedor)
    WHERE strftime('%Y', data_venda) = (
      SELECT MIN(strftime('%Y', data_venda)) as primeiro_ano
      from vendas
    )
    GROUP by f.nome
    ORDER by qtd_prod_vendidos DESC
    LIMIT 1;

-- 06 Quanto ele vendeu no primeiro ano disponível na base de dados?
SELECT f.nome, MIN(strftime('%Y', data_venda)) as ano,COUNT(p.id_produto) as qtd_prod_vendidos
	from vendas v
    JOIN itens_venda iv on (v.id_venda = iv.venda_id)
    join produtos p on (iv.produto_id = p.id_produto)
    join fornecedores f on (p.fornecedor_id = f.id_fornecedor)
    WHERE strftime('%Y', data_venda) = (
      SELECT MIN(strftime('%Y', data_venda)) as primeiro_ano
      from vendas
    )
    GROUP by f.nome
    ORDER by qtd_prod_vendidos DESC
    LIMIT 1;

-- 07 Quais as duas categorias que mais venderam no total de todos os anos?
SELECT * from vendas;
SELECT * from itens_venda;
SELECT * from produtos;
SELECT * from categorias

SELECT c.nome_categoria, count(id_produto) as qtd_produtos
	from vendas v 
    join itens_venda iv on (v.id_venda = iv.venda_id)
    join produtos p on (p.id_produto = iv.produto_id)
    join categorias c on (p.categoria_id = c.id_categoria)
    GROUP by c.nome_categoria
    ORDER by qtd_produtos DESC
    LIMIT 2;

-- 08 Crie uma tabela comparando as vendas ao longo do tempo das duas categorias que mais venderam no total de todos os anos.
SELECT * from vendas;
SELECT * from itens_venda;
SELECT * from produtos;
SELECT * from categorias

SELECT "Ano/Mês",
SUM(CASE WHEN Categoria=='Eletrônicos' THEN Qtd_Vendas ELSE 0 END) AS Eletrônicos,
SUM(CASE WHEN Categoria=='Vestuário' THEN Qtd_Vendas ELSE 0 END) AS Vestuário
FROM(
    SELECT COUNT(*) AS Qtd_Vendas, strftime('%Y/%m', v.data_venda) AS "Ano/Mês", c.nome_categoria AS Categoria
    FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN PRODUTOS p ON p.id_produto = iv.produto_id
    JOIN CATEGORIAS c ON c.id_categoria = p.categoria_id
    WHERE Categoria IN ('Eletrônicos', 'Vestuário')
    GROUP BY "Ano/Mês", Categoria
    ORDER BY "Ano/Mês", Categoria
)
GROUP BY "Ano/Mês";

-- 09 Calcule a porcentagem de vendas por categorias no ano de 2022.
WITH Total_Vendas AS (
SELECT COUNT(*) as Total_Vendas_2022
From itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
WHERE strftime('%Y', v.data_venda) = '2022'
)
SELECT Nome_Categoria, Qtd_Vendas, ROUND(100.0*Qtd_Vendas/tv.Total_Vendas_2022, 2) || '%' AS Porcentagem
FROM(
  SELECT c.nome_categoria AS Nome_Categoria, COUNT(iv.produto_id) AS Qtd_Vendas
  from itens_venda iv
  JOIN vendas v ON v.id_venda = iv.venda_id
  JOIN produtos p ON p.id_produto = iv.produto_id
  JOIN categorias c ON c.id_categoria = p.categoria_id
  WHERE strftime('%Y', v.data_venda) = '2022'
  GROUP BY Nome_Categoria
  ORDER BY Qtd_Vendas DESC
  ), Total_Vendas tv;

-- 10 Crie uma métrica mostrando a porcentagem de vendas a mais que a melhor categoria tem em relação a pior no ano de 2022.
WITH Total_Vendas AS (
  SELECT COUNT(*) as Total_Vendas_2022
  FROM itens_venda iv
  JOIN vendas v ON v.id_venda = iv.venda_id
  WHERE strftime('%Y', v.data_venda) = '2022'
),
Vendas_Por_Categoria AS (
  SELECT 
    c.nome_categoria AS Nome_Categoria, 
    COUNT(iv.produto_id) AS Qtd_Vendas
  FROM itens_venda iv
  JOIN vendas v ON v.id_venda = iv.venda_id
  JOIN produtos p ON p.id_produto = iv.produto_id
  JOIN categorias c ON c.id_categoria = p.categoria_id
  WHERE strftime('%Y', v.data_venda) = '2022'
  GROUP BY Nome_Categoria
),
Melhor_Pior_Categorias AS (
  SELECT 
    MIN(Qtd_Vendas) AS Pior_Vendas, 
    MAX(Qtd_Vendas) AS Melhor_Vendas
  FROM Vendas_Por_Categoria
)
-- O CROSS JOIN é utilizado aqui para combinar todas as linhas de Total_Vendas, 
-- Vendas_Por_Categoria e Melhor_Pior_Categorias, resultando em um único conjunto de dados.
SELECT 
  Nome_Categoria, 
  Qtd_Vendas, 
  ROUND(100.0*Qtd_Vendas/tv.Total_Vendas_2022, 2) || '%' AS Porcentagem,
  ROUND(100.0*(Qtd_Vendas - Melhor_Vendas) / Melhor_Vendas, 2) || '%' AS Porcentagem_Mais_Que_Melhor
FROM Vendas_Por_Categoria
CROSS JOIN Total_Vendas tv
CROSS JOIN Melhor_Pior_Categorias;