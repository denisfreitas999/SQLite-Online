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