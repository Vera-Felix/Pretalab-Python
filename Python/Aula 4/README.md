# Aula 4 – Banco de Dados e Consultas SQL

Nesta aula criamos um **banco de dados relacional** completo e praticamos consultas SQL para análise de informações.

Link: https://www.db-fiddle.com/f/pRMvaWFs8DsDd2QVJTnepY/9 - aula 4

## 📚 Conteúdo abordado

- Criação das tabelas:
  - `usuarios`
  - `enderecos`
  - `produtos`
  - `pedidos`
  - `itens_pedido`
  - `pagamentos`
- Inserção de **20 registros de exemplo** em cada tabela
- Consultas SQL com:
  - `SELECT *`
  - `DISTINCT`
  - `ORDER BY`
  - `LIMIT`
  - `COUNT`, `SUM`, `MAX`, `MIN`, `AVG`
  - `GROUP BY` e `HAVING`
  - Filtros com `WHERE`, `LIKE`, `BETWEEN`

---

## ▶️ Arquivo da aula

- **`Aula_4_Banco_e_Consultas.sql`** → contém todo o script de criação das tabelas, inserts e consultas.

---

## 🔎 Exemplos de consultas

## 🔎 Exemplos de consultas

-- Pagamentos aguardando aprovação
select * from pagamentos
where status = 'Aguardando';

-- Produtos mais caros
select * from produtos
order by preco desc
limit 5;

-- Total gasto por método de pagamento
select metodo, sum(valor) as total_gasto
from pagamentos
where status = 'Aprovado'
group by metodo
order by total_gasto desc;

-- Número de pagamentos por método
select metodo, count(*) as quantidade
from pagamentos
group by metodo
order by quantidade desc;

-- Total gasto por usuário acima de 1000
select usuario_id, sum(valor) as total_gasto
from pagamentos
where status = 'Aprovado'
group by usuario_id
having sum(valor) > 1000
order by total_gasto desc;

-- Maior valor gasto por usuário
select usuario_id, max(valor) as total_gasto
from pagamentos
group by usuario_id
order by total_gasto desc;

-- Menor valor gasto por usuário
select usuario_id, min(valor) as total_gasto
from pagamentos
group by usuario_id
order by total_gasto desc;

-- Valor médio gasto por usuário
select usuario_id, avg(valor) as total_gasto
from pagamentos
group by usuario_id
order by total_gasto desc;

-- Produtos com valor de itens vendidos acima de 2000
select produto_id, sum(quantidade*preco_unitario) as valor
from itens_pedido
group by produto_id
having sum(quantidade*preco_unitario) > 2000
order by valor desc;

-- Usuários cujo nome começa com J
select * from usuarios where nome like 'J%';

-- Usuários cujo nome começa com Maria
select * from usuarios where nome like 'Maria %';

-- Usuários cujo nome começa com R
select * from usuarios where nome like 'R%';

-- Produtos com estoque entre 5 e 15 (inclusive)
select * from produtos
where estoque between 5 and 15;

-- Mesma consulta, mas com > e <
select * from produtos
where estoque > 5 and estoque < 15;

✅ Conclusão

Nesta prática, aprendemos a explorar dados existentes usando SQL, aplicando filtros, ordenações e funções de agregação.
O exercício mostrou como responder perguntas comuns em bancos de dados, como:

Quais são os produtos mais caros?

Quanto os usuários gastaram?

Quantos pedidos estão em cada status?