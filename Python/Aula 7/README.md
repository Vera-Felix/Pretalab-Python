# 📚 Aula 7 – JOINS em SQL

Nesta aula trabalhamos com **junções de tabelas (JOINs)** em SQL, aplicando na prática diferentes tipos de combinações entre tabelas.

## 📂 Arquivos da aula
- **`aula7_joins.sql`** → script com criação das tabelas e inserção de dados (livros, clientes e pedidos).  
- **`aula7_joins_exercicios.sql`** → consultas SQL resolvendo os exercícios da aula (INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, JOIN com 3 tabelas).

## 🗄️ Tabelas criadas
- **`livros`** → informações de livros (título, autor, ano, preço).  
- **`clientes`** → cadastro de clientes (nome, email).  
- **`pedidos`** → pedidos realizados (cliente, livro, quantidade, data).

## 📝 Exercícios trabalhados
1. **INNER JOIN** → listar pedidos mostrando nome do cliente e título do livro.  
2. **LEFT JOIN** → listar todos os clientes e seus pedidos (inclui clientes sem pedidos).  
3. **RIGHT JOIN** → listar todos os pedidos e os clientes correspondentes (inclui pedidos sem cliente).  
4. **FULL OUTER JOIN** → listar todos os clientes e todos os pedidos, mesmo sem correspondência.  
5. **JOIN com 3 tabelas** → mostrar pedidos com nome do cliente, título do livro e quantidade comprada.  

## ▶️ Como executar
1. Abra o PostgreSQL (ou use o terminal no VS Code).  
2. Rode primeiro o script de tabelas e inserts e depois o script com os exercícios:
   ```sql
   \i aula7_joins.sql
   \i aula7_joins_exercicios.sql

✨ Essa aula consolidou o uso de JOINs para combinar informações de múltiplas tabelas e entender diferentes cenários de correspondência entre registros.