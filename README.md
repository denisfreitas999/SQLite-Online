# Projeto: Formação Conhecendo o SQL Overview

#### Course 01: SQLite online - Conhecendo instruções SQL (01 - 05)
#### Course 02: SQLite Online - executando consultas SQL (06 - 10)
#### Course 03: Realizando consultas com SQL: Joins, Views e transações (11 - 15)

## Índice
1. [Primeiros Passos com SQLite](#1-primeiros-passos-com-sqlite)
2. [Manipulação de Tabelas](#2-manipulação-de-tabelas)
3. [Inserção de Dados](#3-inserção-de-dados)
4. [Consultas Avançadas](#4-consultas-avançadas)
5. [Atualização e Exclusão de Dados](#5-atualização-e-exclusão-de-dados)
6. [Limitações e Filtros Nulos](#6-limitações-e-filtros-nulos)
7. [Operadores Lógicos e Consultas Complexas](#7-operadores-lógicos-e-consultas-complexas)
8. [Funções de Agregação e Agrupamento](#8-funções-de-agregação-e-agrupamento)
9. [Funções de String, Data e Numéricas](#9-funções-de-string-data-e-numéricas)
10. [Expressões CASE e Renomeação](#10-expressões-case-e-renomeação)
11. [Criação e Importação de Dados com Default](#11-criação-e-importação-de-dados-com-default)
12. [Criação e Importação de Dados com Default](#12-criação-e-importação-de-dados-com-default)
13. [Joins: INNER, RIGHT, LEFT e FULL](#13-joins-inner-right-left-e-full)
14. [VIEWs e TRIGGERs](#14-views-e-triggers)
15. [Transações e Operações de Dados](#15-transações-e-operações-de-dados)

## 1. Primeiros Passos com SQLite

Nesta etapa inicial, foco em configurar o ambiente e realizar consultas básicas:

- **Acessar o sqliteonline**: Navegar até o site sqliteonline para iniciar o trabalho com o banco de dados.
- **Importar arquivos no sqliteonline**: Importar arquivos de dados para a plataforma sqliteonline.
- **Utilizar o comando SELECT**: Realizar consultas básicas utilizando o comando SELECT.
- **Aplicar os filtros WHERE e DISTINCT**: Aplicar condições às consultas com WHERE e remover duplicatas com DISTINCT.

## 2. Manipulação de Tabelas

Nesta etapa, foco na criação e modificação de tabelas:

- **Criar tabelas através do comando CREATE TABLE**: Utilizar o comando CREATE TABLE para criar novas tabelas no banco de dados.
- **Alterar e excluir tabelas com os comandos ALTER TABLE e DROP TABLE**: Modificar a estrutura das tabelas com o comando ALTER TABLE e excluir tabelas com o comando DROP TABLE.
- **O que é uma chave primária e como criá-la através do comando PRIMARY KEY**: Definir uma chave primária em uma tabela utilizando o comando PRIMARY KEY.
- **O que é uma chave estrangeira e como criá-la através do comando FOREIGN KEY**: Criar relacionamentos entre tabelas através da definição de chaves estrangeiras com o comando FOREIGN KEY.

## 3. Inserção de Dados

Nesta etapa, foco na inserção de dados no banco:

- **Inserir uma linha de dados utilizando o comando INSERT**: Inserir uma linha de dados em uma tabela utilizando o comando INSERT.
- **Inserir múltiplas linhas de dados utilizando o comando INSERT**: Inserir múltiplas linhas de dados de uma vez utilizando o comando INSERT.
- **Utilizar o comando INSERT combinado com o SELECT**: Combinar o comando INSERT com o SELECT para inserir dados provenientes de outras consultas.

## 4. Consultas Avançadas

Nesta etapa, foco em filtros e ordenações avançadas:

- **Aplicar filtros (>,<,=,<>)**: Aplicar filtros de comparação (>,<,=,<>) nas consultas.
- **Utilizar filtros compostos (AND, OR, NOT BETWEEN)**: Utilizar filtros compostos como AND, OR e NOT BETWEEN para consultas mais complexas.
- **Ordenar os dados utilizando o comando ORDER BY**: Ordenar os resultados das consultas utilizando o comando ORDER BY.
- **Utilizar ALIAS nas consultas**: Utilizar ALIAS para renomear colunas e tabelas temporariamente nas consultas.

## 5. Atualização e Exclusão de Dados

Nesta etapa, foco na atualização e exclusão de dados no banco:

- **Alterar os dados utilizando o comando UPDATE**: Utilizar o comando UPDATE para alterar dados existentes nas tabelas.
- **Excluir os dados utilizando o comando DELETE**: Utilizar o comando DELETE para remover dados das tabelas.

## 6. Limitações e Filtros Nulos

Nesta etapa, foco na limitação de resultados e na filtragem de valores nulos:

- **Utilizar a cláusula LIMIT**: Restringir o número de resultados retornados por uma consulta utilizando a cláusula LIMIT.
- **Aplicar os operadores IS NULL e NOT NULL nas consultas**: Filtrar resultados que possuam valores nulos ou não nulos utilizando os operadores IS NULL e NOT NULL.

## 7. Operadores Lógicos e Consultas Complexas

Nesta etapa, foco no uso de operadores lógicos e na criação de consultas complexas:

- **Utilizar o comando LIKE**: Realizar buscas por padrões específicos dentro de colunas de texto utilizando o comando LIKE.
- **Utilizar os operadores lógicos**: Utilizar operadores lógicos (AND, OR, NOT) para combinar múltiplas condições em consultas.
- **Criar consultas mais complexas com os operadores lógicos**: Construir consultas avançadas que combinem várias condições utilizando operadores lógicos.

## 8. Funções de Agregação e Agrupamento

Nesta etapa, foco no uso de funções de agregação e agrupamento de dados:

- **Trabalhar com as funções de agregação - MAX, MIN e SUM**: Utilizar funções de agregação como MAX, MIN e SUM para calcular valores máximos, mínimos e somas de colunas.
- **Aplicar as funções de agregação - COUNT e AVG**: Contar o número de registros com COUNT e calcular médias com AVG.
- **Como utilizar a cláusula GROUP BY**: Agrupar resultados de consultas utilizando a cláusula GROUP BY.
- **Como utilizar a cláusula HAVING**: Filtrar grupos de resultados utilizando a cláusula HAVING.

## 9. Funções de String, Data e Numéricas

Nesta etapa, foco no uso de várias funções integradas para manipulação de dados:

- **Utilizar funções de string**: Manipular e formatar dados de texto utilizando funções de string.
- **Trabalhar com funções de data**: Manipular e formatar datas utilizando funções de data.
- **Utilizar funções numéricas**: Realizar operações matemáticas utilizando funções numéricas.
- **Aplicar funções de conversão**: Converter tipos de dados utilizando funções de conversão.

## 10. Expressões CASE e Renomeação

Nesta etapa, foco no uso de expressões condicionais e renomeação de objetos:

- **Usar a expressão CASE**: Implementar lógica condicional dentro de consultas SQL utilizando a expressão CASE.
- **Utilizar a cláusula RENAME**: Renomear tabelas e colunas utilizando a cláusula RENAME.

## 11. Criação e Importação de Dados com Default

Nesta etapa, foco na criação de tabelas com valores padrão e na importação de dados:

- **Criar tabelas utilizando default**: Definir valores padrão para colunas ao criar tabelas.
- **Inserir dados em tabelas com default**: Inserir dados em tabelas aproveitando os valores padrão definidos.
- **Realizar a importação de arquivos CSV para popular o banco de dados**: Importar dados de arquivos CSV para tabelas no banco de dados.

## 12. Criação e Importação de Dados com Default

Nesta etapa, foco na repetição prática da criação de tabelas com valores padrão e na importação de dados:

- **Criar tabelas utilizando default**: Reforçar o aprendizado na definição de valores padrão para colunas.
- **Inserir dados em tabelas com default**: Continuar a prática de inserção de dados em tabelas com valores padrão.
- **Realizar a importação de arquivos CSV para popular o banco de dados**: Repetir o processo de importação de dados de arquivos CSV para tabelas.

## 13. Joins: INNER, RIGHT, LEFT e FULL

Nesta etapa, foco na utilização de diferentes tipos de joins em consultas SQL:

- **Conhecer como utilizar o INNER JOIN**: Realizar junções internas para combinar dados de múltiplas tabelas.
- **Aprender a trabalhar com o RIGHT e LEFT JOIN**: Executar junções à direita e à esquerda para incluir todos os registros de uma tabela.
- **Executar consultas com FULL JOIN**: Utilizar junções completas para incluir todos os registros de ambas as tabelas, combinando onde houver correspondência.

## 14. VIEWs e TRIGGERs

Nesta etapa, foco na criação e utilização de VIEWs e TRIGGERs:

- **Conhecer como criar VIEWs**: Definir vistas (VIEWs) para simplificar consultas complexas.
- **Utilizar VIEWs em consultas**: Implementar VIEWs em consultas SQL para acessar dados de maneira simplificada.
- **Criar TRIGGER com INSERT**: Definir gatilhos (TRIGGERs) que executam automaticamente ao inserir dados.
- **Entender como acionar uma TRIGGER**: Compreender o mecanismo de acionamento de TRIGGERs em resposta a eventos específicos.

## 15. Transações e Operações de Dados

Nesta etapa, foco na manipulação avançada de dados e no controle de transações:

- **Atualizar dados utilizando o UPDATE**: Modificar registros existentes em tabelas utilizando o comando UPDATE.
- **Executar exclusão dos dados com o DELETE CASCADE**: Remover registros de tabelas com exclusão em cascata.
- **Conhecer sobre transações**: Compreender o conceito de transações no contexto de bancos de dados.
- **Iniciar transações e encerrar com COMMIT e ROLLBACK**: Executar transações e controlar sua conclusão ou reversão utilizando COMMIT e ROLLBACK.