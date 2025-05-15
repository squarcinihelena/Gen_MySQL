-- Criação do banco de dados
CREATE DATABASE db_farmacia_bem_estar;

-- Seleciona o banco de dados
USE db_farmacia_bem_estar;

-- Criação da tabela de categorias
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL
);

-- Criação da tabela de produtos
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    fabricante VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção de registros na tabela de categorias
INSERT INTO tb_categorias (nome_categoria, descricao) VALUES
('Medicamentos', 'Produtos destinados ao tratamento de doenças.'),
('Vitaminas', 'Suplementos vitamínicos e minerais.'),
('Higiene', 'Produtos de uso pessoal para higiene.'),
('Cosméticos', 'Produtos para cuidados estéticos e beleza.'),
('Primeiros Socorros', 'Itens utilizados em situações emergenciais.');

-- Inserção de registros na tabela de produtos
INSERT INTO tb_produtos (nome_produto, fabricante, preco, quantidade, categoria_id) VALUES
('Dipirona Sódica 500mg', 'Neo Química', 8.90, 100, 1),
('Vitamina C 1g', 'Sanofi', 27.50, 50, 2),
('Shampoo Anticaspa 300ml', 'Head & Shoulders', 19.90, 40, 3),
('Protetor Solar FPS 60', 'La Roche-Posay', 89.90, 25, 4),
('Curativo Adesivo', 'Nexcare', 12.00, 150, 5),
('Ibuprofeno 600mg', 'Medley', 16.50, 80, 1),
('Sabonete Líquido Antisséptico', 'Protex', 11.90, 60, 3),
('Base Líquida FPS 30', 'Vult', 55.00, 30, 4);

-- SELECT: Produtos com valor maior que R$ 50,00
SELECT * FROM tb_produtos
WHERE preco > 50.00;

-- SELECT: Produtos com valor entre R$ 5,00 e R$ 60,00
SELECT * FROM tb_produtos
WHERE preco BETWEEN 5.00 AND 60.00;

-- SELECT: Produtos cujo nome contenha a letra 'C'
SELECT * FROM tb_produtos
WHERE nome_produto LIKE '%C%';

-- SELECT com INNER JOIN: unir produtos e categorias
SELECT p.id, p.nome_produto, p.fabricante, p.preco, p.quantidade, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- SELECT com INNER JOIN: produtos da categoria "Cosméticos"
SELECT p.id, p.nome_produto, p.fabricante, p.preco, p.quantidade, c.nome_categoria
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.nome_categoria = 'Cosméticos';