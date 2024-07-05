/*
Abaixo estão 10 exercícios de SQL que abrangem uma variedade de tópicos, desde funções de agregação e string até operadores lógicos e cláusulas de filtragem. Esses exercícios são projetados para serem aplicados em um banco de dados genérico e podem precisar de ajustes para se adequarem a esquemas específicos.

Selecione os primeiros 5 registros da tabela clientes, ordenando-os pelo nome em ordem crescente.

Encontre todos os produtos na tabela produtos que não têm uma descrição associada (suponha que a coluna de descrição possa ser nula).

Liste os funcionários cujo nome começa com 'A' e termina com 's' na tabela funcionarios.

Exiba o departamento e a média salarial dos funcionários em cada departamento na tabela funcionarios, agrupando por departamento, apenas para os departamentos cuja média salarial é superior a $5000.

Selecione todos os clientes da tabela clientes e concatene o primeiro e o último nome, além de calcular o comprimento total do nome completo.

Para cada venda na tabela vendas, exiba o ID da venda, a data da venda e a diferença em dias entre a data da venda e a data atual.

Selecione todos os itens da tabela pedidos e arredonde o preço total para o número inteiro mais próximo.

Converta a coluna data_string da tabela eventos, que está em formato de texto (YYYY-MM-DD), para o tipo de data e selecione todos os eventos após '2023-01-01'.

Na tabela avaliacoes, classifique cada avaliação como 'Boa', 'Média', ou 'Ruim' com base na pontuação: 1-3 para 'Ruim', 4-7 para 'Média', e 8-10 para 'Boa'.

Altere o nome da coluna data_nasc para data_nascimento na tabela funcionarios e selecione todos os funcionários que nasceram após '1990-01-01'.

*/

-- Item 1
SELECT * FROM clientes
ORDER BY nome ASC
limit 5;

-- Item 2
SELECT * from produtos
	where descricao ISNULL;

-- Item 3
SELECT * from funcionarios
	where nome LIKE 'A%s';

SELECT * FROM funcionarios WHERE nome LIKE 'A%' AND nome LIKE '%s';

-- Item 4
SELECT departamento, AVG(salario) AS media_salarial 
	from funcionarios
	GROUP by departamento
    HAVING AVG(salario) > 5000;	

-- Item 5
SELECT nome || ' ' || sobrenome AS nome_completo,
	LENGTH(nome || ' ' || sobrenome) AS comprimento_nome
	FROM clientes;

-- Item 6
SELECT id_venda, data da venda, JULIANDAY(now) - JULIANDAY(data_da_venda) AS diferenca_dias
	from vendas;

-- Item 7
SELECT id, ROUND(preco_total) AS preco_arredondado
    FROM pedidos;

-- Item 8
SELECT *
    FROM eventos
    WHERE CAST(data_string AS DATE) > '2023-01-01';

-- Item 9
SELECT id,
  case
    WHEn pontuacao BETWEEN 1 and 3 then 'Ruim'
    when pontuacao BETWEEN 4 and 7 THEN 'Média'
    ELSE 'Boa';
  end as classificacao
  FROM avaliacoes;

-- Item 10
-- Renomeando a coluna
ALTER TABLE funcionarios RENAME COLUMN data_nasc TO data_nascimento;

-- Selecionando funcionários
SELECT * FROM funcionarios WHERE CAST(data_nascimento AS DATE) > '1990-01-01';
