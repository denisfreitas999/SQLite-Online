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
