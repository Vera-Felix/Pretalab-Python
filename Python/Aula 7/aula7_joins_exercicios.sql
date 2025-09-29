-- 1. Tabelas
CREATE TABLE livros (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    autor TEXT NOT NULL,
    ano INTEGER,
    preco DECIMAL(6,2)
);

CREATE TABLE clientes (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    email TEXT
);

CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY,
    cliente_id INTEGER,
    livro_id INTEGER,
    quantidade INTEGER,
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (livro_id) REFERENCES livros(id)
);

-- 2. Inserindo livros
INSERT INTO livros (id, titulo, autor, ano, preco) VALUES
(1, 'Dom Casmurro', 'Machado de Assis', 1899, 29.90),
(2, '1984', 'George Orwell', 1949, 35.50),
(3, 'O Senhor dos Anéis', 'J.R.R. Tolkien', 1954, 59.90),
(4, 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 1997, 39.90),
(5, 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 25.00),
(6, 'A Revolução dos Bichos', 'George Orwell', 1945, 28.00),
(7, 'Capitães da Areia', 'Jorge Amado', 1937, 32.00),
(8, 'Cem Anos de Solidão', 'Gabriel García Márquez', 1967, 45.00),
(9, 'It - A Coisa', 'Stephen King', 1986, 49.90),
(10, 'O Hobbit', 'J.R.R. Tolkien', 1937, 34.90);

-- 3. Inserindo clientes
INSERT INTO clientes (id, nome, email) VALUES
(1, 'Ana', 'ana@email.com'),
(2, 'Bruno', 'bruno@email.com'),
(3, 'Carla', 'carla@email.com'),
(4, 'Daniel', 'daniel@email.com'),
(5, 'Elisa', 'elisa@email.com');

-- 4. Inserindo pedidos
INSERT INTO pedidos (id, cliente_id, livro_id, quantidade, data_pedido) VALUES
(101, 1, 1, 1, '2023-01-15'),
(102, 1, 4, 2, '2023-02-10'),
(103, 2, 2, 1, '2023-01-20'),
(104, 2, 6, 1, '2023-03-05'),
(105, 3, 3, 1, '2023-02-15'),
(106, 3, 10, 1, '2023-02-25'),
(107, 4, 5, 3, '2023-03-01'),
(108, 5, 7, 1, '2023-03-10'),
(109, 5, 8, 2, '2023-03-12'),
(110, 5, 9, 1, '2023-04-01');

/* Exercício 1 – INNER JOIN básico
Liste os pedidos mostrando o nome do cliente e o título do livro comprado. */
SELECT c.nome, l.titulo
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
JOIN livros l ON l.id = p.livro_id;

-- Exercício 2 – LEFT JOIN
-- Liste todos os clientes e seus pedidos, incluindo os clientes que ainda não compraram nada
select c.nome, p.id, p.livro_id, p.quantidade, p.data_pedido
from clientes c
left join pedidos p on p.cliente_id = c.id;

-- Exercício 3 – RIGHT JOIN
-- Liste todos os pedidos e os clientes correspondentes, incluindo pedidos que possam estar sem cliente cadastrado.
-- Exercício 3 – "RIGHT JOIN" simulado em SQLite
-- Objetivo: listar TODOS os pedidos e (quando houver) os clientes correspondentes

SELECT
  p.id          AS pedido_id,
  p.cliente_id  AS cliente_id_no_pedido,
  p.livro_id,
  p.quantidade,
  p.data_pedido,
  c.id          AS cliente_id_existente,
  c.nome        AS nome_cliente,
  c.email       AS email_cliente
FROM pedidos p
LEFT JOIN clientes c
  ON p.cliente_id = c.id;

-- Exercício 4 – FULL OUTER JOIN
-- Liste todos os clientes e todos os pedidos, mesmo que não haja correspondência entre eles.
SELECT 
  c.id   AS cliente_id,
  c.nome AS nome_cliente,
  c.email,
  p.id   AS pedido_id,
  p.livro_id,
  p.quantidade,
  p.data_pedido
FROM clientes c
FULL OUTER JOIN pedidos p
  ON c.id = p.cliente_id;
  
-- Exercício 5 – JOIN com 3 tabelas
-- Mostre os pedidos com nome do cliente, título do livro e a quantidade comprada.
SELECT 
  p.id        AS pedido_id,
  c.nome      AS nome_cliente,
  l.titulo    AS titulo_livro,
  p.quantidade
FROM pedidos p
JOIN clientes c ON p.cliente_id = c.id
JOIN livros   l ON p.livro_id   = l.id;