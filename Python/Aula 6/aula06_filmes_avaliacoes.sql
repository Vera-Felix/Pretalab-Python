-- ==============================================
-- Aula 06 - Banco de Dados: Filmes e Avaliações
-- Arquivo: aula06_filmes_avaliacoes.sql
-- ==============================================

-- 1. Limpar tabelas antigas (se existirem)
DROP TABLE IF EXISTS avaliacoes;
DROP TABLE IF EXISTS filmes;

-- 2. Criar tabela de filmes
CREATE TABLE filmes (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    genero VARCHAR(200) NOT NULL,
    ano_lancamento INT
);

-- 3. Criar tabela de avaliações
CREATE TABLE avaliacoes (
    id SERIAL PRIMARY KEY,
    filme_id INT NOT NULL,
    nota INT NOT NULL CHECK (nota BETWEEN 1 AND 5),
    comentario TEXT,
    FOREIGN KEY (filme_id) REFERENCES filmes(id)
);

-- 4. Inserir 20 filmes
INSERT INTO filmes (titulo, genero, ano_lancamento) VALUES
('O Poderoso Chefão', 'Drama', 1972),
('Vingadores: Ultimato', 'Ação', 2019),
('Toy Story', 'Animação', 1995),
('Parasita', 'Drama', 2019),
('Coringa', 'Drama', 2019),
('Jurassic Park', 'Aventura', 1993),
('Matrix', 'Ficção Científica', 1999),
('Shrek', 'Animação', 2001),
('Titanic', 'Romance', 1997),
('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia', 2001),
('Pantera Negra', 'Ação', 2018),
('Se Beber, Não Case!', 'Comédia', 2009),
('Procurando Nemo', 'Animação', 2003),
('O Iluminado', 'Terror', 1980),
('Clube da Luta', 'Drama', 1999),
('Cidade de Deus', 'Drama', 2002),
('Homem-Aranha: Sem Volta Para Casa', 'Ação', 2021),
('Divertida Mente', 'Animação', 2015),
('O Rei Leão', 'Animação', 1994),
('Forrest Gump', 'Drama', 1994);

-- 5. Inserir 40 avaliações (2 para cada filme)
INSERT INTO avaliacoes (filme_id, nota, comentario) VALUES
(1, 5, 'Um clássico absoluto.'),(1, 4, 'Longo, mas excelente.'),
(2, 5, 'Final épico.'),(2, 3, 'Muito efeito, pouca história.'),
(3, 5, 'Mudou a animação.'),(3, 4, 'Funciona para todas as idades.'),
(4, 5, 'Genial e tenso.'),(4, 4, 'Pesado, porém brilhante.'),
(5, 5, 'Atuação impecável.'),(5, 3, 'Sombrio pra meu gosto.'),
(6, 5, 'Revolucionário nos efeitos.'),(6, 4, 'Dinossauros realistas.'),
(7, 5, 'Virada na ficção científica.'),(7, 4, 'Algumas partes confusas.'),
(8, 4, 'Divertido e esperto.'),(8, 5, 'Trilha sonora ótima.'),
(9, 5, 'Emocionante.'),(9, 3, 'Meloso.'),
(10, 5, 'Obra-prima épica.'),(10, 4, 'Longo, mas vale.'),
(11, 5, 'Representatividade + ação.'),(11, 4, 'Bom, faltou desenvolvimento.'),
(12, 4, 'Rende boas risadas.'),(12, 3, 'Algumas piadas forçadas.'),
(13, 5, 'Linda história.'),(13, 4, 'Visual ótimo.'),
(14, 5, 'Terror psicológico clássico.'),(14, 3, 'Ritmo lento às vezes.'),
(15, 5, 'Final surpreendente.'),(15, 4, 'Roteiro muito bom.'),
(16, 5, 'Impactante e real.'),(16, 4, 'Duro, mas necessário.'),
(17, 5, 'Reunião épica.'),(17, 4, 'Fan service divertido.'),
(18, 5, 'Sensível e criativo.'),(18, 4, 'Reflexivo sobre emoções.'),
(19, 5, 'Atemporal.'),(19, 4, 'Trilha inesquecível.'),
(20, 5, 'Inspirador.'),(20, 4, 'Grande cinema.');

-- 6. Consultas básicas

-- 6.1. Liste todos os filmes de um único gênero
SELECT * FROM filmes
WHERE genero = 'Drama';

-- 6.2. Liste apenas os filmes lançados depois de 2010
SELECT * FROM filmes
WHERE ano_lancamento > 2010;

-- 6.3. Liste todos os filmes em ordem alfabética de título
SELECT * FROM filmes
ORDER BY titulo ASC;

-- 6.4. Liste todos os filmes ordenados pelo ano de lançamento (mais recente primeiro)
SELECT * FROM filmes
ORDER BY ano_lancamento DESC;

-- 6.5. Liste todas as avaliações ordenadas por nota decrescente
SELECT * FROM avaliacoes
ORDER BY nota DESC;

-- 6.6. Selecione todas as avaliações com nota maior ou igual a 4
SELECT * FROM avaliacoes
WHERE nota >= 4;

-- 6.7. Selecione os comentários em que aparece as palavras 'bom' ou 'gostei'
SELECT * FROM avaliacoes
WHERE comentario LIKE '%bom%' OR comentario LIKE '%gostei%';

-- 6.8. Verifique quantos filmes existem na tabela para cada gênero
SELECT genero, COUNT(*) AS total_genero
FROM filmes
GROUP BY genero;

-- 6.9. Calcule a média das notas por filme
SELECT filme_id, AVG(nota) AS media_nota
FROM avaliacoes
GROUP BY filme_id;

-- 6.10. Liste apenas os filmes com nota média maior que 4
SELECT filme_id, AVG(nota) AS media_nota
FROM avaliacoes
GROUP BY filme_id
HAVING AVG(nota) > 4;

-- 7. Atualizações e exclusões

-- 7.1. Atualize a nota de uma avaliação (exemplo: id=3, de 3 para 4)
UPDATE avaliacoes
SET nota = 4
WHERE id = 3;

-- 7.2. Delete todas as avaliações com nota igual a 1
DELETE FROM avaliacoes
WHERE nota = 1;

-- 7.3. Conferir atualização
SELECT * FROM avaliacoes WHERE id = 3;

-- 7.4. Conferir se ainda existem notas 1
SELECT * FROM avaliacoes WHERE nota = 1;