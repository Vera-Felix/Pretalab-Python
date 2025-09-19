# Aula 3 – Módulos e Web Scraping (Python)

Nesta aula, organizamos o código em **módulos** e praticamos **raspagem web** (web scraping).

## 📚 Conteúdo
- `arquivos.py`: funções utilitárias
  - `contar_caracteres(nome_arquivo)`
  - `contar_palavras(nome_arquivo)`
  - `ler_conteudo(nome_arquivo, qtd_linhas)`
- `coletor.py`: coletor simples de “notícias”
  - usa `requests` + `BeautifulSoup`
  - salva texto em `noticia.txt`
  - acumula títulos em `noticias.txt`
  - mostra resumo no console

## ▶️ Como executar, pré-requisitos e estrutura
```bash
# executar
python teste_arquivos.py      # testa funções do arquivos.py
python coletor.py             # roda o coletor (versão simples)

# pré-requisitos
pip install requests beautifulsoup4

# estrutura da pasta
Aula 3/
├─ README.md
├─ arquivos.py
├─ teste_arquivos.py
├─ coletor.py
├─ alunas.txt
├─ frases.txt
├─ numeros.txt
├─ noticia.txt
├─ noticias.txt
└─ relatorio.txt