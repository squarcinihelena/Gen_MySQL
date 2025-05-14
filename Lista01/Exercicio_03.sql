-- Criação do banco de dados
CREATE DATABASE escola;
USE escola;

-- Criação da tabela estudantes
CREATE TABLE estudantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    turma VARCHAR(10),
    nota_final DECIMAL(3,1),
    status_matricula VARCHAR(20)
);

-- Inserção de 8 registros
INSERT INTO estudantes (nome, idade, turma, nota_final, status_matricula)
VALUES
('Ana Souza', 17, '3A', 8.5, 'Ativa'),
('Carlos Mendes', 16, '2B', 6.8, 'Ativa'),
('Fernanda Lima', 15, '1C', 7.5, 'Ativa'),
('João Ribeiro', 17, '3B', 5.2, 'Ativa'),
('Mariana Rocha', 16, '2A', 9.1, 'Ativa'),
('Eduardo Nunes', 15, '1A', 4.7, 'Ativa'),
('Beatriz Cardoso', 16, '2C', 7.8, 'Ativa'),
('Lucas Almeida', 14, '1B', 6.5, 'Ativa');

-- SELECT: estudantes com nota maior que 7.0
SELECT * FROM estudantes WHERE nota_final > 7.0;

-- SELECT: estudantes com nota menor que 7.0
SELECT * FROM estudantes WHERE nota_final < 7.0;

-- Atualizando um registro 
UPDATE estudantes SET nota_final = 6.0 WHERE id = 6;