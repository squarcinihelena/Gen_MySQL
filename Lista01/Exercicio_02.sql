-- Criação do banco de dados
CREATE DATABASE livraria_online;

-- Utilizando o banco de dados criado
USE livraria_online;

-- Criação da tabela de livros (produtos)
CREATE TABLE livros (
    id BIGINT AUTO_INCREMENT,   -- Identificador único de cada livro
    titulo VARCHAR(255),        -- Título do livro
    autor VARCHAR(255),         -- Autor do livro
    quantidade INT,             -- Quantidade disponível em estoque
    preco DECIMAL(8, 2),        -- Preço do livro
    categoria VARCHAR(100),     -- Categoria do livro (Ex: Ficção, Não-ficção, Romance, etc.)
    PRIMARY KEY (id)            -- Chave primária da tabela
);

-- Inserção de dados (8 livros diferentes)
INSERT INTO livros (titulo, autor, quantidade, preco, categoria)
VALUES
("O Hobbit", "J.R.R. Tolkien", 40, 69.90, "Fantasia"),
("O Alquimista", "Paulo Coelho", 50, 39.90, "Ficção"),
("O Livro do Desassossego", "Fernando Pessoa", 30, 49.90, "Literatura Portuguesa"),
("Laranja Mecânica", "Anthony Burgess", 25, 59.90, "Distopia"),
("Ilusões", "Richard Bach", 20, 29.90, "Filosofia"),
("A Divina Comédia", "Dante Alighieri", 15, 89.90, "Clássico"),
("Fahrenheit 451", "Ray Bradbury", 60, 49.90, "Distopia"),
("Gödel, Escher, Bach", "Douglas Hofstadter", 10, 99.90, "Matemática/Filosofia");

-- SELECT: Retornar todos os livros com preço maior que 50
SELECT * FROM livros WHERE preco > 50;

-- SELECT: Retornar todos os livros com preço menor ou igual a 50
SELECT * FROM livros WHERE preco <= 50;

-- Atualizando o preço de um livro específico
UPDATE livros SET preco = 79.90 WHERE id = 1; -- Atualizando o preço de "O Hobbit"