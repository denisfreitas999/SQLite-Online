-- ################### ETAPA 01

-- Para retornarmos todos os dados de uma tabela utilizamos a seguinte estrutura:
SELECT * FROM nome da tabela;

-- Como por exemplo, para retornar os dados da tabela de fornecedores utilizamos o seguinte código:
SELECT * FROM tabelafornecedores;

-- Para retornarmos os dados filtrando por alguma característica específica utilizamos a cláusula WHERE da seguinte forma:
SELECT * FROM nome da tabela WHERE nome da coluna = dado que desejamos consultar; 

-- Em vídeo utilizamos essa estrutura para filtrar os fornecedores que possuíam como país de origem a China:
SELECT * FROM tabelafornecedores WHERE país_de_origem = 'China'

-- Para filtrarmos os dados distintos contidos em uma coluna específica usamos a cláusula DISTINCT da seguinte maneira:
SELECT DISTINCT id_produto FROM tabela_de_vendas;

-- Usamos essa estrutura para filtrar os diferentes clientes existentes na tabela de pedidos dessa forma:
SELECT DISTINCT cliente FROM tabelapedidos;

-- Liste todos os IDs únicos dos produtos vendidos pela empresa, ou seja, uma lista de produtos distintos. Utilize a cláusula DISTINCT para garantir que os IDs dos produtos sejam únicos.
SELECT DISTINCT id_produto FROM tabela_de_vendas;

-- Identifique os clientes que se cadastraram na empresa antes de 2020. Liste o nome e a data de cadastro desses clientes. Utilize a cláusula WHERE para filtrar os registros.
SELECT nome_do_cliente, data_de_cadastro FROM tabela_de_clientes WHERE data_de_cadastro < '2020-01-01';

-- ################### ETAPA 02
