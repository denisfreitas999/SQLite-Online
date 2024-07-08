-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 01 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Verificando tabelas
SELECT * from categorias;
SELECT * from clientes;
SELECT * from fornecedores;
SELECT * from marcas;
SELECT * from produtos;
select * from vendas;

-- Quantidade de dados por tabela
SELECT COUNT(*) as Qtd, 'Categorias' as Tabela FROM categorias
UNION ALL
SELECT COUNT(*) as Qtd, 'Clientes' as Tabela FROM clientes
UNION ALL
SELECT COUNT(*) as Qtd, 'Fornecedores' as Tabela FROM fornecedores
UNION ALL
SELECT COUNT(*) as Qtd, 'ItensVenda' as Tabela FROM itens_venda
UNION ALL
SELECT COUNT(*) as Qtd, 'Marcas' as Tabela FROM marcas
UNION ALL
SELECT COUNT(*) as Qtd, 'Produtos' as Tabela FROM produtos
UNION ALL
SELECT COUNT(*) as Qtd, 'Vendas' as Tabela FROM vendas;

-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 02 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Explorando dados utilizando o LIMIT para coletar uma amostra
SELECT * FROM vendas LIMIT 5;

-- Explorando itens por data 
SELECT STRFTIME('%Y', data_venda) from vendas LIMIT 5;
SELECT DISTINCT(STRFTIME('%Y', data_venda)) as ano, STRFTIME('%m', data_venda) as mes ,COUNT(id_venda) as total_vendas FROM vendas
    WHERE Mes = '01' OR Mes = '11' OR Mes = '12'
    GROUP by ano, mes
	ORDER by ano;

-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 03 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- O papel dos fornecedores na Black Friday
SELECT strftime('%Y', v.data_venda) AS Ano, strftime('%m', v.data_venda) AS Mes, f.nome AS Nome_Fornecedor, COUNT(iv.produto_id) AS Qtd_Vendas
, SUM(v.total_venda) as Total_Vendas
FROM itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
JOIN produtos p ON p.id_produto = iv.produto_id
JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
WHERE Mes = '11'
GROUP BY Nome_Fornecedor, Ano
ORDER BY Nome_Fornecedor;

-- A categoria de produtos da Black Friday

SELECT strftime('%Y', v.data_venda) AS 'Ano', c.nome_categoria AS Nome_Categoria, COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
JOIN produtos p ON p.id_produto = iv.produto_id
JOIN categorias c ON c.id_categoria = p.categoria_id
WHERE strftime('%m', v.data_venda) = '11'
GROUP BY Nome_Categoria, 'Ano'
ORDER BY 'Ano', Qtd_Vendas DESC;

-- A performance das Black Friday anteriores e futuras
SELECT strftime('%Y/%m', v.data_venda) AS Ano_Mes, f.nome AS Nome_Fornecedor, COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
JOIN produtos p ON p.id_produto = iv.produto_id
JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
GROUP BY Nome_Fornecedor, Ano_Mes
ORDER BY Ano_Mes, Qtd_Vendas;

-- Análise da performance de vendas do fornecedor 'NebulaNetworks' ao longo do tempo
SELECT strftime('%Y/%m', v.data_venda) AS Ano_Mes, COUNT(iv.produto_id) AS Qtd_Vendas
FROM itens_venda iv
JOIN vendas v ON v.id_venda = iv.venda_id
JOIN produtos p ON p.id_produto = iv.produto_id
JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
WHERE f.nome='NebulaNetworks'
GROUP BY Ano_Mes
ORDER BY Ano_Mes, Qtd_Vendas;

-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 04 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Tabela de comparação entre as duas melhores com a que teve o menor desempenho na BF
SELECT Ano_Mes,
 SUM(CASE WHEN Nome_Fornecedor=='NebulaNetworks' THEN Qtd_Vendas ELSE 0 END) AS Qtd_Vendas_NebulaNetworks,
 SUM(CASE WHEN Nome_Fornecedor=='HorizonDistributors' THEN Qtd_Vendas ELSE 0 END) AS Qtd_Vendas_HorizonDistributors,
 SUM(CASE WHEN Nome_Fornecedor=='AstroSupply' THEN Qtd_Vendas ELSE 0 END) AS Qtd_Vendas_AstroSupply
 FROM(
   SELECT strftime('%Y/%m', v.data_venda) AS Ano_Mes, f.nome AS Nome_Fornecedor, COUNT(iv.produto_id) AS Qtd_Vendas
   from itens_venda iv
   JOIN vendas v ON v.id_venda = iv.venda_id
   JOIN produtos p ON p.id_produto = iv.produto_id
   JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
   WHERE Nome_Fornecedor='NebulaNetworks' OR Nome_Fornecedor='HorizonDistributors' OR Nome_Fornecedor='AstroSupply'
   GROUP BY Nome_Fornecedor, Ano_Mes
   ORDER BY Ano_Mes, Qtd_Vendas
  )
  GROUP BY Ano_Mes;

-- Categoria / Quantidade de vendas / porcentagem 
SELECT Nome_Categoria, Qtd_Vendas, ROUND(100.0*Qtd_Vendas/(SELECT COUNT(*) FROM itens_venda), 2) || '%' AS Porcentagem
FROM(
    SELECT c.nome_categoria AS Nome_Categoria, COUNT(iv.produto_id) AS Qtd_Vendas
    FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON p.id_produto = iv.produto_id
    JOIN categorias c ON c.id_categoria = p.categoria_id
    GROUP BY Nome_Categoria
    ORDER BY Qtd_Vendas DESC
    );

-- Fornecedor, Quantidade de vendas e porcentagem

SELECT Nome_Fornecedor, Qtd_Vendas, ROUND(100.0 * Qtd_Vendas / (SELECT COUNT(*) FROM itens_venda), 2) || '%' AS Porcentagem
FROM(
    SELECT f.nome AS Nome_Fornecedor, COUNT(iv.produto_id) AS Qtd_Vendas
    FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON p.id_produto = iv.produto_id
    JOIN fornecedores f ON f.id_fornecedor = p.fornecedor_id
    GROUP BY Nome_Fornecedor
    ORDER BY Qtd_Vendas DESC
    );

-- Nome Marca, Quantidade de Vendas e Porcentagem
SELECT Nome_Marca, Qtd_Vendas, ROUND(100.0 * Qtd_Vendas / (SELECT COUNT(*) FROM itens_venda), 2) || '%' AS Porcentagem
FROM(
    SELECT m.nome AS Nome_Marca, COUNT(iv.produto_id) AS Qtd_Vendas
    FROM itens_venda iv
    JOIN vendas v ON v.id_venda = iv.venda_id
    JOIN produtos p ON p.id_produto = iv.produto_id
    JOIN marcas m ON m.id_marca = p.marca_id
    GROUP BY Nome_Marca
    ORDER BY Qtd_Vendas DESC
    );

-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 05 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Agrupamento por mês e ano para verificar o histórico anual de vendas por mês e ano
SELECT Mes,
SUM(CASE WHEN Ano=='2020' THEN Qtd_Vendas ELSE 0 END) AS '2020',
SUM(CASE WHEN Ano=='2021' THEN Qtd_Vendas ELSE 0 END) AS '2021',
SUM(CASE WHEN Ano=='2022' THEN Qtd_Vendas ELSE 0 END) AS '2022',
SUM(CASE WHEN Ano=='2023' THEN Qtd_Vendas ELSE 0 END) AS '2023'
FROM(
    SELECT strftime('%m', data_venda) AS Mes, strftime('%Y', data_venda) AS Ano, COUNT(*) AS Qtd_Vendas
    FROM Vendas
    GROUP BY Mes, Ano
    ORDER BY Mes
    )
    GROUP BY Mes;

-- Utilizando o WITH para gerar tabelas temporárias para montar a tabela final
WITH Media_Vendas_Anteriores AS (SELECT AVG(Qtd_Vendas) AS Media_Qtd_Vendas
FROM (
    SELECT COUNT(*) AS Qtd_Vendas, strftime('%Y', v.data_venda) AS Ano
    FROM vendas v
    WHERE strftime('%m', v.data_venda) = '11' AND Ano != '2022'
    GROUP BY Ano
)), Vendas_Atual AS (SELECT Qtd_Vendas AS Qtd_Vendas_Atual
FROM(
    SELECT COUNT(*) AS Qtd_Vendas, strftime('%Y', v.data_venda) AS Ano
    FROM vendas v
    WHERE strftime('%m', v.data_venda) = '11' AND Ano = '2022'
    GROUP BY Ano
    ))
    SELECT
    mva.Media_Qtd_Vendas,
    va.Qtd_Vendas_Atual,
    ROUND((va.Qtd_Vendas_Atual - mva.Media_Qtd_Vendas)/mva.Media_Qtd_Vendas *100.0, 2) || '%' AS Porcentagem
    FROM Vendas_Atual va, Media_Vendas_Anteriores mva 