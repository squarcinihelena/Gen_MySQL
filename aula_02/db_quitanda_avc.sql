-- Apagar Banco de Dados db_quitanda
DROP DATABASE db_quitanda;

-- Recriar o Banco de dados db_quitanda
CREATE DATABASE db_quitanda;

-- Selecionar o Banco de Dados db_quitanda
USE db_quitanda;

-- Criar a tabela tb_categorias
CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere dados na tabela tb_categorias
INSERT INTO tb_categorias (descricao)
VALUES ("Frutas");

INSERT INTO tb_categorias (descricao)
VALUES ("Verduras");

INSERT INTO tb_categorias (descricao)
VALUES ("Legumes");

INSERT INTO tb_categorias (descricao)
VALUES ("Temperos");


INSERT INTO tb_categorias (descricao)
VALUES ("Ovos");

INSERT INTO tb_categorias (descricao)
VALUES ("outros");

-- Lista todos os dados da tabela tb_categorias
SELECT * FROM tb_categorias;

-- Criar a Tabela tb_produtos
CREATE TABLE tb_produtos(
id bigint AUTO_INCREMENT,
nome varchar(255) NOT NULL,
quantidade int, 
dtvalidade date NULL,
preco decimal(6, 2),
categoria_id bigint, 
PRIMARY KEY (id),
FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Insere dados na tabela tb_produtos
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Ovo Branco", 1000, "2022-03-07", 15.00, 5);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Agrião", 1500, "2022-03-06", 3.00, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Cenoura", 1800, "2022-03-09", 3.50, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Tomate", 1105, "2022-03-15", 3.00, 3);

INSERT INTO tb_produtos(nome, quantidade, dtvalidade, preco, categoria_id)
VALUES("Rabanete", 1200, "2022-03-15", 13.00, 3);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Cinza", 1118, 0.50);

INSERT INTO tb_produtos(nome, quantidade, preco)
VALUES("Sacola Verde", 1118, 0.50);

-- Visualiza todos os dados da tabela tb_produtos
SELECT * FROM tb_produtos;

SELECT * FROM tb_produtos ORDER BY nome;

SELECT * FROM tb_produtos ORDER BY nome, preco DESC;

SELECT * FROM tb_produtos WHERE NOT categoria_id = 2;

SELECT * FROM tb_produtos WHERE preco IN( 5, 10, 15);

## Comando abaixo é igual preco >= 5 AND preco <= 10
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 10;

SELECT * FROM tb_produtos WHERE dtvalidade BETWEEN "2022-03-07" AND "2022-03-10" ORDER BY dtvalidade DESC;

## Nome tem RA
SELECT * FROM tb_produtos WHERE nome LIKE "%RA%";

## Nome termina com RA
SELECT * FROM tb_produtos WHERE nome LIKE "%RA";

## Nome começa com RA
SELECT * FROM tb_produtos WHERE nome LIKE "RA%";

# O MySQL Workbench usa uma collation que ignora o case sensitivy: utf8mb4_0900_ai_ci
# ai significa accent insensitivy e ci para case insensitivy
# isso já vem configurado dentro do default collation
# Nem todos os bancos de dados estão configurados para isso

SELECT @@collation_database;

## Conta todos os registros
SELECT COUNT(*) FROM tb_produtos;

## Conta somente as linhas que não estão com a categoria_id nula
SELECT COUNT(categoria_id) FROM tb_produtos;

## Soma os valores da coluna preco e dá o nome de soma_preco
SELECT SUM(preco) AS soma_preco FROM tb_produtos;

## Calcula a media da coluna preco e dá o nome de media_preco
SELECT AVG(preco) AS media_preco FROM tb_produtos;

## Seleciona a categoria, calcula a media como media_preco e agrupa os valores por categoria
SELECT categoria_id, AVG(preco) AS media_preco FROM tb_produtos GROUP BY categoria_id;

## Formata a saída de preço
SELECT categoria_id, CONCAT( 'R$', FORMAT(AVG(preco), 2, 'pt_BR')) AS media_preco FROM tb_produtos GROUP BY categoria_id;

## Formata o campo data
SELECT nome, DATE_FORMAT(dtvalidade, '%d/%m/%Y') AS 'Data de Validade' FROM tb_produtos;

SELECT MAX(preco) AS 'Preço máximo' FROM tb_produtos;

SELECT MIN(preco) AS 'Preço mínimo' FROM tb_produtos;

-- INNER JOIN
# Traga todos os produtos que fazem associação com a tabela de categorias
# através do campo categoria_id de tb_produtos e id de tb_categorias
SELECT * FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- LEFT JOIN
# Traga todos os produtos que fazem ou não associação com a tabela de categorias
# através do campo categoria_id de tb_produtos e id de tb_categorias
SELECT * FROM tb_produtos LEFT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

-- RIGHT JOIN
# Traga tudo de categorias e todos os produtos que fazem associação com a tabela de categorias
# através do campo categoria_id de tb_produtos e id de tb_categorias
SELECT * FROM tb_produtos RIGHT JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id;

## Calculo do preço médio das categorias com base nos produtos
SELECT tb_categorias.descricao, CONCAT( 'R$', FORMAT(AVG(preco), 2, 'pt_BR')) AS media_preco 
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.descricao;


SELECT tb_categorias.descricao, CONCAT( 'R$', FORMAT(AVG(preco), 2, 'pt_BR')) AS media_preco 
FROM tb_produtos INNER JOIN tb_categorias
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.descricao
HAVING AVG(preco) > 5;