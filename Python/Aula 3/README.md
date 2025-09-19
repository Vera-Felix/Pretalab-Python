# Aula 3 – Módulos e Web Scraping (Python)

Nesta aula trabalhamos com **módulos**, **funções** e **raspagem web (web scraping)**.  
Foram propostos 5 exercícios práticos para fixar os conteúdos.

---

## 📚 Exercícios

### Exercício 1 – Cadastro de Alunas
- Gerar nomes fictícios de alunas (usando `faker`).
- Criar matrículas aleatórias (`random`).
- Salvar em `alunas.txt`.

### Exercício 2 – Números Aleatórios
- Gerar números aleatórios.
- Salvar em `numeros.txt`.

### Exercício 3 – Frases Motivacionais
- Criar um arquivo `frases.txt` com 31 frases (uma por dia).
- Usar leitura e escrita de arquivos.

### Exercício 4 – Criando um módulo de utilidades (`arquivos.py`)
- Funções implementadas:
  - `contar_caracteres(nome_arquivo)` → número total de caracteres.
  - `contar_palavras(nome_arquivo)` → número de palavras.
  - `ler_conteudo(nome_arquivo, qtd_linhas)` → primeiras N linhas.
- Testado em `teste_arquivos.py`.

### Exercício 5 – Nível Avançado: Coletor de Notícias (`coletor.py`)
- Usa `requests` + `BeautifulSoup`.
- Coleta título e texto de uma página.
- Salva notícia em `noticia.txt`.
- Adiciona títulos em `noticias.txt`.
- Mostra resumo no console.

---

## ▶️ Como executar, pré-requisitos e estrutura
```bash
# executar
python teste_arquivos.py      # testa funções do arquivos.py
python coletor.py             # roda o coletor (versão simples)

# pré-requisitos
pip install faker requests beautifulsoup4

# estrutura da pasta
Aula 3/
├─ README.md
├─ arquivos.py
├─ teste_arquivos.py
├─ coletor.py
├─ alunas.txt
├─ numeros.txt
├─ frases.txt
├─ noticia.txt
├─ noticias.txt
└─ relatorio.txt