-- Criação do banco de dados
CREATE DATABASE db_generation_game_online;

-- Seleciona o banco de dados para usar nas próximas operações
USE db_generation_game_online;

-- Criação da tabela de classes
CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY, -- Cria um identificador unico e sequencial para cada classe (chave primaria)
    nome_classe VARCHAR(50) NOT NULL,     -- Nome da classe, obrigatorio
    descricao TEXT NOT NULL               -- Descrição detalhada da classe, obrigatoria
);

-- Criação da tabela de personagens
CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,         -- Identificador unico e sequencial para cada personagem
    nome_personagem VARCHAR(100) NOT NULL,        -- Nome do personagem, obrigatório
    nivel INT NOT NULL,                           -- Nivel do personagem, obrigatório
    poder_ataque INT NOT NULL,                    -- Valor de ataque do personagem
    poder_defesa INT NOT NULL,                    -- Valor de defesa do personagem
    classe_id BIGINT,                             -- Campo que referencia a classe do personagem
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id) -- Cria uma chave estrangeira ligando à tabela tb_classes
    -- Isso garante integridade referencial: só é possível associar personagens a classes existentes
);

-- Inserção de registros na tabela de classes
INSERT INTO tb_classes (nome_classe, descricao) VALUES
('Guerreiro', 'Especialista em combate físico e força bruta.'),
('Cavaleiro', 'Defensores equilibrados com armaduras pesadas.'),
('Feiticeiro', 'Usuário de magias arcanas e sabedoria ancestral.'),
('Piromante', 'Manipulador das chamas e destruição elemental.'),
('Clérigo', 'Canaliza milagres para cura e proteção divina.');

-- Inserção de registros na tabela de personagens
-- O valor da chave estrangeira (classe_id) associa o personagem à classe correspondente
INSERT INTO tb_personagens (nome_personagem, nivel, poder_ataque, poder_defesa, classe_id) VALUES
('Artorias, o Caminhante do Abismo', 55, 4200, 1800, 1),   -- Guerreiro
('Siegward de Catarina', 40, 2300, 2100, 2),               -- Cavaleiro
('Eygon de Carim', 45, 2800, 1900, 5),                     -- Clérigo
('Solaire de Astora', 50, 3600, 2000, 2),                  -- Cavaleiro
('Ornstein, o Matador de Dragões', 58, 4100, 1750, 1),     -- Guerreiro
('Lucatiel de Mirrah', 38, 2400, 1600, 4),                 -- Piromante
('Rei Vendrick', 60, 3900, 2500, 2),                       -- Cavaleiro
('Gwyn, Senhor da Luz', 62, 4800, 2100, 3);                -- Feiticeiro

-- SELECT: Personagens com poder de ataque maior que 2000
-- Exemplo de filtro com operador de comparação
SELECT * FROM tb_personagens
WHERE poder_ataque > 2000;

-- SELECT: Personagens com poder de defesa entre 1000 e 2000
-- BETWEEN permite buscar por um intervalo fechado (inclusive os limites)
SELECT * FROM tb_personagens
WHERE poder_defesa BETWEEN 1000 AND 2000;

-- SELECT: Personagens cujo nome contém a letra 'C'
-- LIKE com %C% busca qualquer nome que contenha a letra 'C' em qualquer posição
SELECT * FROM tb_personagens
WHERE nome_personagem LIKE '%C%';

-- SELECT com INNER JOIN: unir personagens com suas classes
-- INNER JOIN permite cruzar os dados das tabelas baseados em correspondência da chave estrangeira
-- Aqui estamos exibindo os dados dos personagens junto com o nome da classe correspondente
SELECT p.id, p.nome_personagem, p.nivel, p.poder_ataque, p.poder_defesa, c.nome_classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id;

-- SELECT com INNER JOIN: apenas personagens da classe "Cavaleiro"
-- Igual ao anterior, mas com filtro adicional para trazer apenas quem pertence à classe "Cavaleiro"
SELECT p.id, p.nome_personagem, p.nivel, p.poder_ataque, p.poder_defesa, c.nome_classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome_classe = 'Cavaleiro';