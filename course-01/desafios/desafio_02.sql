
/*

Desafio
Sua missão é dar os primeiros passos para configurar e usar esse banco de dados.

1 - Criar tabelas
O primeiro passo é definir a estrutura do banco de dados, criando tabelas para armazenar informações específicas. Utilizaremos SQL (Structured Query Language) para criar as tabelas. Aqui estão os dados que você pode utilizar:

Tabela "Alunos" armazenará informações sobre os estudantes, como:

ID do Aluno: Um identificador único para cada aluno.
Nome do Aluno: O nome completo do aluno.
Data de Nascimento: A data de nascimento do aluno.
Gênero: O gênero do aluno (masculino, feminino, outros).
Endereço: O endereço do aluno.
Telefone de Contato: O número de telefone de contato do aluno.
E-mail: O endereço de e-mail do aluno.
Tabela "Professores" conterá detalhes sobre os professores da escola:

ID do Professor: Um identificador único para cada professor.
Nome do Professor: O nome completo do professor.
Data de Nascimento: A data de nascimento do professor.
Gênero: O gênero do professor.
Telefone de Contato: O número de telefone de contato do professor.
E-mail: O endereço de e-mail do professor.
Tabela "Disciplinas" manterá registros das matérias oferecidas, incluindo:

ID da Disciplina: Um identificador único para cada disciplina.
Nome da Disciplina: O nome da disciplina.
Descrição: Uma descrição da disciplina.
Carga Horária: A carga horária da disciplina.
ID do Professor: Uma chave estrangeira que faz referência ao professor que leciona a disciplina.
Tabela "Turmas" será usada para registrar turmas específicas:

ID da Turma: Um identificador único para cada turma.
Nome da Turma: O nome ou código da turma.
Ano Letivo: O ano letivo da turma.
ID do Professor Orientador: Uma chave estrangeira que faz referência ao professor que orienta a turma.
Tabela "Turma_Disciplinas" armazenara os dados das associações entre turmas e disciplinas:

ID da Turma: Uma lista de chaves estrangeiras que fazem referência as turmas existentes.
ID das Disciplinas: Uma lista de chaves estrangeiras que fazem referência às disciplinas ministradas na turma.
OBS.: Os dois campos juntos formam a chave primaria da tabela

Tabela "Turma_Alunos" será usada para registrar os dados das associações entre turmas e alunos:

ID da Turma: Uma lista de chaves estrangeiras que fazem referência as turmas existentes.
ID dos Alunos: Uma lista de chaves estrangeiras que fazem referência aos alunos matriculados na turma.
OBS.: Os dois campos juntos formam a chave primaria da tabela

Tabela "Notas" guardará as notas dos alunos em diferentes disciplinas:

ID da Nota: Um identificador único para cada nota.
ID do Aluno: Uma chave estrangeira que faz referência ao aluno.
ID da Disciplina: Uma chave estrangeira que faz referência à disciplina.
Valor da Nota: A nota atribuída ao aluno na disciplina.
Data da Avaliação: A data em que a avaliação foi realizada.

*/

CREATE table alunos (
	id_aluno INT PRIMARY KEY,
  	nome VARCHAR (255),
  	data_nascimento DATE,
  	genero VARCHAR (50),
  	endereco VARCHAR (255),
  	telefone VARCHAR (20),
  	email VARCHAR (255)
);

CREATE TABLE professores (
	id_professor INT PRIMARY KEY,
  	nome VARCHAR (255),
  	data_nascimento DATE,
  	genero VARCHAR (50),
  	telefone VARCHAR (20),
  	email VARCHAR (255)
);

CREATE table disciplinas (
	id_disciplina INT PRIMARY KEY,
  	nome_disciplina VARCHAR (255),
  	descricao VARCHAR (255),
  	carga_horaria INT,
  	id_professor INT,
  	FOREIGN KEY (id_professor) REFERENCES professores (id_professor) 
);

CREATE table turmas (
	id_turma INT PRIMARY key,
  	nome_turma VARCHAR (255),
  	ano_letivo INT,
  	id_professor_orientador INT,
  	FOREIGN key (id_professor_orientador) REFERENCES professores (id_professor)
);

CREATE table turma_disciplinas (
	id_turma INT,
  	id_disciplina INT,
  	PRIMARY key (id_turma, id_disciplina),
  	FOREIGN key (id_turma) REFERENCES turmas (id_turma),
  	FOREIGN key (id_disciplina) REFERENCES disciplinas (id_disciplina)
);

CREATE TABLE turma_alunos (
	id_aluno INT,
  	id_turma INT,
  	PRIMARY KEY (id_aluno, id_turma),
  	FOREIGN key (id_aluno) REFERENCES alunos (id_aluno),
  	FOREIGN KEY (id_turma) REFERENCES turmas (id_turma)
);

CREATE TABLE notas (
	id_nota INT PRIMARY key,
  	id_aluno INT,
  	id_disciplina INT,
  	valor_nota FLOAT,
  	data_avaliacao DATE,
  	FOREIGN key (id_aluno) REFERENCES alunos (id_aluno),
  	FOREIGN key (id_disciplina) REFERENCES disciplinas (id_disciplina)
);


/*
2 - Inserir dados
Depois de criar as tabelas, é hora de inserir os dados contidos na pasta db_desafio_02
*/

INSERT INTO alunos (id_aluno, nome, data_nascimento, genero, endereco, telefone, email) VALUES
(1,'João Silva','2005-03-15','Masculino','Rua das Flores, 123','(11) 9876-5432','joao@email.com'),
(2,'Maria Santos','2006-06-20','Feminino','Avenida Principal, 456','(11) 8765-4321','maria@email.com'),
(3,'Pedro Soares','2004-01-10','Masculino','Rua Central, 789','(11) 7654-3210','pedro@email.com'),
(4,'Ana Lima','2005-04-02','Feminino','Rua da Escola, 56','(11) 8765-4321','ana@email.com'),
(5,'Mariana Fernandes','2005-08-12','Feminino','Avenida da Paz, 789','(11) 5678-1234','mariana@email.com'),
(6,'Lucas Costa','2003-11-25','Masculino','Rua Principal, 456','(11) 1234-5678','lucas@email.com'),
(7,'Isabela Santos','2006-09-10','Feminino','Rua da Amizade, 789','(11) 9876-5432','isabela@email.com'),
(8,'Gustavo Pereira','2004-05-15','Masculino','Avenida dos Sonhos, 123','(11) 7654-3210','gustavo@email.com'),
(9,'Carolina Oliveira','2005-02-20','Feminino','Rua da Alegria, 456','(11) 8765-4321','carolina@email.com'),
(10,'Daniel Silva','2003-10-05','Masculino','Avenida Central, 789','(11) 1234-5678','daniel@email.com'),
(11,'Larissa Souza','2004-12-08','Feminino','Rua da Felicidade, 123','(11) 9876-5432','larissa@email.com'),
(12,'Bruno Costa','2005-07-30','Masculino','Avenida Principal, 456','(11) 7654-3210','bruno@email.com'),
(13,'Camila Rodrigues','2006-03-22','Feminino','Rua das Estrelas, 789','(11) 8765-4321','camila@email.com'),
(14,'Rafael Fernandes','2004-11-18','Masculino','Avenida dos Sonhos, 123','(11) 1234-5678','rafael@email.com'),
(15,'Letícia Oliveira','2005-01-05','Feminino','Rua da Alegria, 456','(11) 9876-5432','leticia@email.com'),
(16,'Fernanda Lima','2004-02-12','Feminino','Rua da Esperança, 789','(11) 4567-8901','fernanda@email.com'),
(17,'Vinícius Santos','2003-07-28','Masculino','Avenida da Amizade, 123','(11) 8901-2345','vinicius@email.com'),
(18,'Juliana Pereira','2006-09-01','Feminino','Rua das Rosas, 789','(11) 3456-7890','juliana@email.com');

INSERT INTO professores (id_professor, nome, data_nascimento, genero, telefone, email) VALUES
(1,'Ana Oliveira','1980-05-25','Feminino','(11) 1234-5678','ana@email.com'),
(2,'Carlos Ferreira','1975-09-12','Masculino','(11) 2345-6789','carlos@email.com'),
(3,'Mariana Santos','1982-03-15','Feminino','(11) 3456-7890','mariana@email.com'),
(4,'Ricardo Silva','1978-08-20','Masculino','(11) 7890-1234','ricardo@email.com'),
(5,'Fernanda Lima','1985-01-30','Feminino','(11) 4567-8901','fernanda@email.com');


INSERT into disciplinas (
  id_disciplina, 
  nome_disciplina, 
  descricao, 
  carga_horaria, 
  id_professor
) VALUES
(1,'Matematica','Estudo de conceitos matematicos avançados',60,1),
(2,'Historia','Historia mundial e local',45,2),
(3,'Fisica','Principios fundamentais da fisica',60,1),
(4,'Quimica','Estudo da quimica e suas aplicações',45,3),
(5,'Ingles','Aulas de ingles para iniciantes',45,4),
(6,'Artes','Exploração da criatividade artistica',30,5);

insert into turmas (id_turma, nome_turma, ano_letivo, id_professor_orientador) VALUES
('1','Turma A','2023','1'),
('2','Turma B','2023','2'),
('3','Turma C','2023','3'),
('4','Turma D','2023','4'),
('5','Turma E','2023','5');

INSERT INTO turma_disciplinas (id_turma, id_disciplina) VALUES 
 ('1','1'), 
 ('2','2'), 
 ('3','3'), 
 ('4','4'), 
 ('5','5'), 
 ('1','3'), 
 ('2','1'), 
 ('3','2');

INSERT INTO turma_alunos (id_turma,id_aluno) VALUES 
 ('1','1'), 
 ('2','2'), 
 ('3','3'), 
 ('4','4'), 
 ('5','5'), 
 ('1','6'), 
 ('2','7'), 
 ('3','8'), 
 ('4','9'), 
 ('5','10');

INSERT INTO notas (id_nota,id_aluno,id_disciplina,valor_nota,data_avaliacao) VALUES 
(2,1,1,6.19,'07/07/2023'),
(3,1,2,7.18,'07/07/2023'),
(4,1,3,7.47,'07/07/2023'),
(5,1,4,7.46,'07/07/2023'),
(6,1,5,4.35,'07/07/2023'),
(7,1,6,4.43,'07/07/2023'),
(8,1,7,0.76,'07/07/2023'),
(9,1,8,9.22,'07/07/2023'),
(10,1,9,9.04,'07/07/2023'),
(11,1,10,3.28,'07/07/2023'),
(12,2,1,1.34,'07/09/2023'),
(13,2,2,3.1,'07/09/2023'),
(14,2,3,1.66,'07/09/2023'),
(15,2,4,0.03,'07/09/2023'),
(16,2,5,4.34,'07/09/2023'),
(17,2,6,4.02,'07/09/2023'),
(18,2,7,8.79,'07/09/2023'),
(19,2,8,1.17,'07/09/2023'),
(20,2,9,8.26,'07/09/2023'),
(21,2,10,3.41,'07/09/2023'),
(22,3,1,6.82,'07/27/2023'),
(23,3,2,8.21,'07/27/2023'),
(24,3,3,1.3,'07/27/2023'),
(25,3,4,4.01,'07/27/2023'),
(26,3,5,0.25,'07/27/2023'),
(27,3,6,6.63,'07/27/2023'),
(28,3,7,9.74,'07/27/2023'),
(29,3,8,3.77,'07/27/2023'),
(30,3,9,0.58,'07/27/2023'),
(31,3,10,8.52,'07/27/2023'),
(32,4,1,8.37,'08/08/2023'),
(33,4,2,0.26,'08/08/2023'),
(34,4,3,5.95,'08/08/2023'),
(35,4,4,6.98,'08/08/2023'),
(36,4,5,6.18,'08/08/2023'),
(37,4,6,4.79,'08/08/2023'),
(38,4,7,7.96,'08/08/2023'),
(39,4,8,0.62,'08/08/2023'),
(40,4,9,7.77,'08/08/2023'),
(41,4,10,5.81,'08/08/2023'),
(42,5,1,2.25,'08/15/2023'),
(43,5,2,5.82,'08/15/2023'),
(44,5,3,4.11,'08/15/2023'),
(45,5,4,7.99,'08/15/2023'),
(46,5,5,3.23,'08/15/2023'),
(47,5,6,8.09,'08/15/2023'),
(48,5,7,8.24,'08/15/2023'),
(49,5,8,3.33,'08/15/2023'),
(50,5,9,4.24,'08/15/2023'),
(51,5,10,0.11,'08/15/2023');

/*
3 - Realizar consultas simples
Com os dados inseridos nas tabelas, podemos realizar consultas simples para obter informações úteis, como:

Consulta 1: Executar consultas para verificar se os dados foram importados corretamente em todas as tabelas.
Consulta 2: Retorne as informações de todos os alunos ordenados pelo nome.
Consulta 3: Retornar a disciplina que possui a carga horaria maior que 40.
Consulta 4: Buscar as notas que são maiores que 6 e menores que 8.
*/

-- Consulta 1:
SELECT * from alunos;
SELECT * from disciplinas;
SELECT * from notas;
SELECT * from professores;
SELECT * from turmas;
SELECT * from turma_alunos;
SELECT * from turma_disciplinas;

-- Consulta 2:
select * from alunos ORDER by nome;

-- Consulta 3:
SELECT * from disciplinas where carga_horaria > 40;

-- Consulta 4:
select * from notas where valor_nota > 6 and valor_nota < 8
