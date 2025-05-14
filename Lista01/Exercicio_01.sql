CREATE DATABASE rh_empresa;

USE rh_empresa;

CREATE TABLE tb_colaboradores ( 
    id BIGINT AUTO_INCREMENT,
    nome VARCHAR(255),
    dtnascimento DATE,
    cargo VARCHAR(255),
    salario DECIMAL(8 , 2 ),
    PRIMARY KEY (id)
);

INSERT INTO tb_colaboradores (nome, dtnascimento, cargo, salario)
VALUES 
("Ana Costa", "1990-05-12", "Analista de Sistemas", 3500.00),
("Carlos Lima", "1985-09-20", "Assistente de RH", 1800.00),
("Fernanda Alves", "1978-11-30", "Gerente Financeiro", 5000.00),
("João Pedro", "2000-01-15", "Estagiário de Marketing", 1200.00),
("Mariana Silva", "1995-07-08", "Desenvolvedora Back-End", 4200.00);

SELECT * FROM tb_colaboradores;

-- Seleciona os colaboradores com salário maior que 2000
SELECT * FROM tb_colaboradores WHERE salario > 2000;

-- Seleciona os colaboradores com salário menor que 2000
SELECT * FROM tb_colaboradores WHERE salario < 2000;

-- Atualiza o salário do colaborador com id = 4 (João Pedro)
UPDATE tb_colaboradores SET salario = 1500.00 WHERE id = 4;