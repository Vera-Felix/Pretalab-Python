# 🎬 Aula 6 – Banco de Dados (SQLite + Python)

Nesta aula trabalhamos com **bancos de dados relacionais** usando **SQLite** (via Python e o pacote `sqlite3`).  
O foco foi criar tabelas, inserir registros, executar consultas e aplicar operações **CRUD** (*Create, Read, Update, Delete*).

Link link banco dados:
https://www.db-fiddle.com/f/9E73GSb23NWJekFzmp6fHU/2 - aula 6

---

## 📑 Índice
- [📂 Arquivos da aula](#-arquivos-da-aula)
- [🗄️ Tabelas criadas](#️-tabelas-criadas)
  - [📌 filmes](#-filmes)
  - [📌 avaliacoes](#-avaliacoes)
- [📝 Etapas realizadas](#-etapas-realizadas)
- [🚀 Como executar](#-como-executar)
  - [▶️ No Colab](#️-no-colab)
  - [💻 No VS Code](#-no-vs-code)
- [📌 Conceitos importantes](#-conceitos-importantes)

---

## 📂 Arquivos da aula
- 📄 **`aula06_filmes_avaliacoes.sql`** → script SQL com criação das tabelas, inserções e consultas.  
- 🐍 **`aula06_sqlite_crud.py`** → código em Python para criar o banco **cinema.db** e implementar operações CRUD.  

## 🗄️ Tabelas criadas

### 📌 filmes
| Campo          | Tipo     | Restrição             |
|----------------|----------|-----------------------|
| id             | INTEGER  | PK, AUTOINCREMENT     |
| titulo         | TEXT     | NOT NULL              |
| genero         | TEXT     | NOT NULL              |
| ano_lancamento | INTEGER  | —                     |

### 📌 avaliacoes
| Campo      | Tipo     | Restrição                             |
|------------|----------|----------------------------------------|
| id         | INTEGER  | PK, AUTOINCREMENT                      |
| filme_id   | INTEGER  | FK → filmes(id)                        |
| nota       | INTEGER  | NOT NULL, CHECK (nota BETWEEN 1 AND 5) |
| comentario | TEXT     | Opcional                               |

## 📝 Etapas realizadas

1. **Criação do banco e tabelas**  
   - Banco: `cinema.db`  
   - Tabelas: `filmes` e `avaliacoes`.  

2. **Inserções iniciais**  
   - 20 filmes de gêneros variados (Drama, Ação, Animação, etc.).  
   - 40 avaliações (2 por filme, com notas entre 1 e 5).  

3. **Consultas (SELECT)**  
   Exemplos aplicados:
   - 🎭 Listar filmes de um único gênero.  
   - 📅 Filmes lançados após 2010.  
   - 🔤 Filmes em ordem alfabética (`ORDER BY titulo`).  
   - ⏳ Filmes por ano de lançamento (mais recentes primeiro).  
   - ⭐ Avaliações ordenadas por nota decrescente.  
   - 👍 Selecionar avaliações com nota ≥ 4.  
   - 💬 Buscar comentários contendo palavras (`LIKE '%bom%' OR '%gostei%'`).  
   - 🔢 Contar filmes por gênero (`COUNT` + `GROUP BY`).  
   - 📊 Média de notas por filme (`AVG`).  
   - 🏆 Filmes com nota média maior que 4 (`HAVING`).  

4. **Operações CRUD**  
   - 🆕 **Create (INSERT):** inserir filmes e avaliações.  
   - 🔍 **Read (SELECT):** listar registros com filtros e ordenações.  
   - ✏️ **Update (UPDATE):** alterar uma nota específica.  
   - 🗑️ **Delete (DELETE):** remover avaliações com nota = 1.  

5. **Validação**  
   - Uso de consultas `SELECT` para verificar resultados após `UPDATE` e `DELETE`.  

## 🚀 Como executar

### ▶️ No Colab
1. Criar conexão:
```python
import sqlite3
conn = sqlite3.connect("cinema.db")

2. Executar comandos SQL ou visualizar resultados com `pandas`:
```python
import pandas as pd
df = pd.read_sql_query("SELECT * FROM filmes;", conn)
display(df)