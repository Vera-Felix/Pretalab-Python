# Aula 5 — SQLite3 + Python (CRUD em versão simples)

Prática rápida para criar um banco **SQLite** no Python e treinar **CRUD** (Create, Read, Update, Delete).

Link link banco dados:
https://www.db-fiddle.com/f/un5JtiAyZywEnCnpmdRGr2/4 - aula 5

## 1) O que vamos fazer
- Criar o arquivo **`usuarios.db`**.
- Criar 4 tabelas: `usuarios`, `produtos`, `pedidos`, `itens_pedido`.
- Inserir dados de exemplo.
- Fazer consultas (`SELECT`), atualização (`UPDATE`) e exclusão (`DELETE`).

## 2) Pré‑requisitos
- Python 3 (Colab ou VS Code).
- Biblioteca **sqlite3** (já vem com o Python).

## 3) Como executar
**Opção A — Rápida (1 célula):** cole o *script único* do seu notebook e rode. Ele cria as tabelas, insere/atualiza os dados e imprime os resultados.

**Opção B — Por etapas:**
1. Abrir conexão e ativar FKs: `sqlite3.connect('usuarios.db')` e `PRAGMA foreign_keys = ON`.
2. Criar tabelas com `CREATE TABLE IF NOT EXISTS ...`.
3. Inserir dados (ou usar UPSERT) em `usuarios` e `produtos`.
4. Rodar consultas de leitura/atualização/exclusão.
5. `con.commit()` e `con.close()` ao final.

## 4) Estrutura (resumo)
**usuarios**: id (PK), nome, email (UNIQUE), senha, data_criacao.

**produtos**: id (PK), nome, preco, estoque. *(Opcional: índice único no nome para UPSERT.)*

**pedidos**: id (PK), usuario_id → `usuarios(id)`, data_pedido, status.

**itens_pedido**: id (PK), pedido_id → `pedidos(id)`, produto_id → `produtos(id)`, quantidade, preco_unitario.

## 5) CRUD — exemplos rápidos
**SELECT (ler):**
```sql
SELECT id, nome, email FROM usuarios ORDER BY id;
SELECT id, nome, preco, estoque FROM produtos ORDER BY id;
```
**UPDATE (atualizar estoque com segurança):**
```python
cur.execute(
    "UPDATE produtos SET estoque = estoque - ? WHERE id = ? AND estoque >= ?",
    (1, 1, 1)
)
con.commit()
```
**DELETE (apagar usuário):**
```python
cur.execute("DELETE FROM usuarios WHERE id = ?", (3,))
con.commit()
```

## 6) Dicas e erros comuns
- **UNIQUE e-mail**: se rodar o seed duas vezes, use UPSERT ou `INSERT OR IGNORE`.
- **Banco fechado**: se aparecer *Cannot operate on a closed database*, crie nova conexão (`connect`) e novo `cursor`.
- **Chaves estrangeiras**: ative sempre `PRAGMA foreign_keys = ON` após `connect()`.

---

## 7) PostgreSQL (online) — prática com a tabela `livros`
**Onde rodar:** DB‑Fiddle / SQLFiddle (PostgreSQL). 
> Dica: use o painel **Schema SQL** para criar e popular; use o painel **Query SQL** para consultar.

### A) Schema SQL (criar e popular)
```sql
DROP TABLE IF EXISTS livros;

CREATE TABLE livros (
  id SERIAL PRIMARY KEY,
  titulo VARCHAR(200) NOT NULL,
  autor  VARCHAR(200) NOT NULL,
  ano_publicacao INTEGER
);

INSERT INTO livros (titulo, autor, ano_publicacao) VALUES
  ('Grande Sertão: Veredas', 'João Guimarães Rosa', 1956),
  ('Quincas Borba', 'Machado de Assis', 1891),
  ('Um Quarto com Vista', 'E. M. Forster', 1908);
```

### B) Query SQL (consultar/atualizar/apagar)
```sql
-- ver tudo
SELECT * FROM livros;

-- filtros
SELECT * FROM livros WHERE autor = 'Machado de Assis';
SELECT * FROM livros WHERE ano_publicacao < 1900;

-- atualizar (use id para ser mais seguro)
UPDATE livros SET ano_publicacao = 1909 WHERE id = 3;  -- ou pelo titulo
-- UPDATE livros SET ano_publicacao = 1909 WHERE titulo = 'Um Quarto com Vista';

-- apagar um registro
DELETE FROM livros WHERE id = 2;

-- ordenação e limites
SELECT * FROM livros ORDER BY ano_publicacao ASC LIMIT 3;  -- mais antigos

-- agregações
SELECT autor, COUNT(*) AS total FROM livros GROUP BY autor ORDER BY total DESC;
```

