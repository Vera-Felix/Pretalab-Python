-- =========================================
-- 0) (Re)criar a tabela do zero (DDL)
-- =========================================
DROP TABLE IF EXISTS livros;

CREATE TABLE livros (
  id SERIAL PRIMARY KEY,             -- chave primária auto-numérica
  titulo VARCHAR(200) NOT NULL,      -- título obrigatório
  autor  VARCHAR(200) NOT NULL,      -- autor obrigatório
  ano_publicacao INTEGER             -- ano (pode ser nulo)
);

-- =========================================
-- 1) CREATE (inserir registros)
-- =========================================
INSERT INTO livros (titulo, autor, ano_publicacao) VALUES
('Grande Sertão: Veredas', 'João Guimarães Rosa', 1956),
('Quincas Borba', 'Machado de Assis', 1891),
('Um Quarto com Vista', 'E. M. Forster', 1908),
('Vidas Secas', 'Graciliano Ramos', 1938),
('Capitães da Areia', 'Jorge Amado', 1937);

-- Conferir o que foi inserido
SELECT * FROM livros;

-- =========================================
-- 2) READ (consultas)
-- =========================================
-- Todos os livros
SELECT * FROM livros;

-- Apenas os livros de Machado de Assis
SELECT * FROM livros
WHERE autor = 'Machado de Assis';

-- Livros publicados antes de 1900
SELECT * FROM livros
WHERE ano_publicacao < 1900;

-- =========================================
-- 3) UPDATE (atualizar registros)
-- =========================================

-- Exemplo A: atualizar pelo TÍTULO (atenção a acentos e espaços)
UPDATE livros
SET ano_publicacao = 1909
WHERE titulo = 'Um Quarto com Vista';

-- Exemplo B (mais seguro): atualizar pelo ID
-- (substitua 3 pelo id correto, se quiser usar este formato)
-- UPDATE livros
-- SET ano_publicacao = 1909
-- WHERE id = 3;

-- Conferir a atualização
SELECT * FROM livros;

-- =========================================
-- 4) DELETE (excluir registros)
-- =========================================

-- Exemplo A: deletar pelo ID (use o id que quiser remover)
DELETE FROM livros
WHERE id = 2;

-- Exemplo B: deletar pelo TÍTULO (alternativa)
-- DELETE FROM livros
-- WHERE titulo = 'Quincas Borba';

-- Conferir a exclusão
SELECT * FROM livros;

-- =========================================
-- 5) Extras úteis (opcional)
-- =========================================

-- Contar quantos livros por autor
SELECT autor, COUNT(*) AS total
FROM livros
GROUP BY autor
ORDER BY total DESC, autor;

-- Top 3 livros mais antigos
SELECT *
FROM livros
WHERE ano_publicacao IS NOT NULL
ORDER BY ano_publicacao
LIMIT 3;

-- Buscar por parte do título (case-insensitive)
SELECT *
FROM livros
WHERE titulo ILIKE '%sertão%';