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

