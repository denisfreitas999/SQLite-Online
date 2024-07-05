-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 01 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Limitando resultados com o LIMIT
SELECT * from HistoricoEmprego
	ORDER by salario DESC
    LIMIT 5;

-- a cláusula LIMIT pode ser acompanhada por OFFSET para pular um número específico 
-- de linhas, uma funcionalidade que é especialmente útil para implementar paginação 
-- em aplicações web.

-- Por exemplo, para pular os primeiros 10 registros e retornar os seguintes 10, você usaria:
SELECT * FROM clientes
LIMIT 10 OFFSET 10;

-- Buscando itens com valores nulos com o ISNULL
SELECT * from HistoricoEmprego
	where datatermino ISNULL
	ORDER by salario DESC
    LIMIT 5;

-- Buscando itens com valores não nulos com o NOTNULL

SELECT * from HistoricoEmprego
	where datatermino NOTNULL
	ORDER by salario DESC
    LIMIT 5;

-- Buscando itens através do LIKE com informações depois do trecho
SELECT * from Treinamento
	where curso LIKE 'O poder%';

-- Buscando itens através do LIKE com informações antes e depois do trecho
SELECT * from Treinamento
	where curso LIKE '%realizar%';

-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 02 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Utilizando AND
SELECT * from HistoricoEmprego 
	where cargo = 'Professor'
    AND datatermino NOT NULL;

-- Utilizando OR
SELECT * from HistoricoEmprego 
	where cargo = 'Oftalmologista' 
	OR cargo = 'Dermatologista';

-- Utilizando o IN
SELECT * from HistoricoEmprego 
	where cargo IN ('Professor', 'Dermatologista', 'Oftalmologista');

-- Utilizando o NOT
SELECT * from HistoricoEmprego 
	where cargo NOT IN ('Professor', 'Dermatologista', 'Oftalmologista');

-- Misturando operadores
SELECT * FROM Treinamento
	WHERE (curso LIKE 'O direito%' AND instituicao = 'da Rocha')
	OR (curso LIKE 'O conforto%' AND instituicao = 'das Neves')

-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ################### ETAPA 03 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- ###################$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

-- Utilizando o MIN para capturar o mês com menor faturamento
SELECT mes, MIN(faturamento_bruto) FROM faturamento;

-- Utilizando o MAX para capturar o mês com maior faturamento
SELECT mes, MAX(faturamento_bruto) FROM faturamento;

-- Utilizando o SUM para capturar o número de novos clientes de 2023
SELECT SUM(numero_novos_clientes) AS 'Novos clientes 2023' from faturamento
	WHERE mes like '%2023';

-- Utilizando o AVG para calcular a média de lucro líquido da empresa
SELECT AVG(lucro_liquido) from faturamento;

-- Utilizando o COUNT para descobrir quantos colaboradores estão desempregados
SELECT COUNT(*) FROM HistoricoEmprego
	WHERE datatermino NOT NULL;

-- Utilizando o group by para trazer conjunto de informações de uma coluna específica
SELECT parentesco FROM Dependentes
GROUP BY parentesco;

-- Utilizando o group by para trazer conjunto de informações de uma coluna específica
-- Utilizando o count para trazer o número de ocorrências
SELECT parentesco, COUNT(*) FROM Dependentes
GROUP BY parentesco;

-- Utilizando a cláusula HAVING para adicionar condições de agregadores
select instituicao, COUNT(curso) as 'QTD Cursos' 
	from Treinamento
    GROUP BY(instituicao)
    HAVING COUNT(curso) > 2;

select instituicao, COUNT(curso) qtd_cursos 
	from Treinamento
    GROUP BY(instituicao)
    HAVING qtd_cursos > 2;

-- ############ ????????????????????????????? ################
-- A ordem das cláusulas em uma consulta SQL é importante: 
-- SELECT -> FROM -> WHERE -> GROUP BY -> HAVING -> ORDER BY.
-- ############ ????????????????????????????? #################


