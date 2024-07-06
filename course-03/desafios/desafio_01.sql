--  Mão na massa: encontrando clientes sem pedidos
/*
Você é um(a) gerente de uma loja online e deseja 
identificar os clientes que fizeram pedidos e 
aqueles que ainda não fizeram nenhum pedido em 
sua loja. Você tem duas tabelas em seu banco 
de dados: "Clientes" e "Pedidos". A tabela 
"Clientes" contém informações sobre os clientes, 
enquanto a tabela "Pedidos" registra informações 
sobre os pedidos feitos por esses clientes. 
Seu desafio é encontrar os clientes que não fizeram pedidos em sua loja.

Tabela "Clientes":

ID (chave primária)
Nome
Email
Tabela "Pedidos":

ID (chave primária)
IDcliente (chave estrangeira)
DataPedido
Seu desafio é criar uma consulta SQL que retorne o nome dos clientes que ainda não fizeram 
pedidos em sua loja.
*/

create table clientes (
	id INT PRIMARY key,
  	nome varchar (255),
  	email varchar (255)
);

CREATE table pedidos (
	id INT PRIMARY key,
  	idcliente INT,
  	datapedido DATE,
  	FOREIGN key (idcliente) REFERENCES clientes (id)
);


INSERT INTO clientes (id, nome, email) VALUES
(1, 'João Silva', 'joao.silva@example.com'),
(2, 'Maria Santos', 'maria.santos@example.com'),
(3, 'Pedro Oliveira', 'pedro.oliveira@example.com'),
(4, 'Ana Souza', 'ana.souza@example.com'),
(5, 'Carlos Pereira', 'carlos.pereira@example.com'),
(6, 'Mariana Lima', 'mariana.lima@example.com'),
(7, 'José Santos', 'jose.santos@example.com'),
(8, 'Fernanda Costa', 'fernanda.costa@example.com'),
(9, 'Rafaela Almeida', 'rafaela.almeida@example.com'),
(10, 'Lucas Rocha', 'lucas.rocha@example.com');

-- Inserindo dados na tabela pedidos
INSERT INTO pedidos (id, idcliente, datapedido) VALUES
(1, 3, '2024-07-01'),
(2, 1, '2024-07-02'),
(3, 5, '2024-07-03'),
(4, 2, '2024-07-04'),
(5, 4, '2024-07-05'),
(6, 6, '2024-07-06'),
(7, 8, '2024-07-07'),
(8, 10, '2024-07-08'),
(9, 7, '2024-07-09'),
(10, 9, '2024-07-10');

-- Inserindo mais dados na tabela clientes
INSERT INTO clientes (id, nome, email) VALUES
(11, 'Patrícia Santos', 'patricia.santos@example.com'),
(12, 'Gustavo Oliveira', 'gustavo.oliveira@example.com'),
(13, 'Juliana Costa', 'juliana.costa@example.com'),
(14, 'Anderson Silva', 'anderson.silva@example.com'),
(15, 'Fernanda Lima', 'fernanda.lima@example.com');


-- Inserindo mais dados na tabela pedidos
INSERT INTO pedidos (id, idcliente, datapedido) VALUES
(11, 11, '2024-07-11'),
(12, 12, '2024-07-12');

-- Resposta
SELECT cl.nome
	from pedidos pd
    right JOIN clientes cl 
    on cl.id = pd.idcliente
    where idcliente IS NULL;