CREATE DATABASE db_quitanda;

USE db_quitanda;

CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    quantidade INT,
    data_validade DATE,
    preco DECIMAL(6 , 2 ),
    PRIMARY KEY(id)
);

INSERT INTO tb_produtos (nome, quantidade, data_validade, preco) 
VALUES ('Banana', 100, '2025-06-12', 5.99);

INSERT INTO tb_produtos (nome, quantidade, data_validade, preco) 
VALUES ('Maçã', 200, '2025-06-12', 15.99),
	   ('Cenoura', 2000, '2025-05-20', 12.99),
       ('Alface', 300, '2025-05-13', 3.99);
       
UPDATE tb_produtos
SET nome = 'Manga'
WHERE id = 3;
       
SELECT * FROM tb_produtos;

SELECT nome, preco FROM tb_produtos;


## UPDATE sem o WHERE **PERIGO**
## UPDATE tb_produtos SET preco = 1

UPDATE tb_produtos SET preco = 1 WHERE id = 1;

SELECT * FROM tb_produtos WHERE nome = "Banana" OR id = 3;

ALTER TABLE tb_produtos MODIFY preco decimal(6,2);

DELETE FROM tb_produtos WHERE id = 6;

## Desativar trava:
## SET SQL_SAFE_UPDATES = 0;

ALTER TABLE tb_produtos ADD descricao varchar(255);

ALTER TABLE tb_produtos DROP descricao;

ALTER TABLE tb_produtos CHANGE nome nome_produto varchar(255);