# 🐍 Pretalab Git e Github

**Repositório com materiais, apostilas e exercícios da formação em Python da Pretalab.**

```bash
# ========================
# 📂 Estrutura do projeto
# ========================
Apostila/     -> materiais e PDFs de estudo
Git_GitHub/   -> manuais de comandos Git
Outros arquivos de apoio

# ===========================
# 📖 Comandos básicos do Git
# ===========================
git init                       # inicia um novo repositório
git status                     # mostra o estado atual dos arquivos
git add .                      # adiciona todas as mudanças da pasta atual
git add NOME_DO_ARQUIVO        # adiciona apenas um arquivo específico
git commit -m "mensagem"       # salva mudanças no histórico
git branch -M main             # renomeia a branch atual para main
git remote add origin URL      # conecta repositório local ao remoto
git remote -v                  # lista as URLs configuradas
git push -u origin main        # envia commits da branch main
git pull                       # baixa mudanças do remoto
git log                        # mostra histórico completo
git log --oneline              # histórico resumido
git restore NOME_DO_ARQUIVO    # descarta mudanças não salvas
git restore --staged ARQUIVO   # tira arquivo da área de stage
git mv ANTIGO NOVO             # renomeia ou move arquivo/pasta
git rm NOME_DO_ARQUIVO         # remove arquivo do repositório

# ====================
# 🌿 Branches
# ====================

# Criar e listar
git branch                     # lista branches locais
git branch NOME                # cria uma nova branch

# Mudar de branch
git checkout NOME              # muda para a branch
git checkout -b NOME           # cria e já muda
git switch NOME                # alternativa ao checkout
git switch -c NOME             # cria e já muda

# Renomear
git branch -m NOVO             # renomeia branch atual
git branch -m ANTIGO NOVO      # renomeia branch específica

# Deletar
git branch -d NOME             # deleta branch já mesclada
git branch -D NOME             # força deleção
git push origin --delete NOME  # deleta branch remota

# Enviar branch
git push -u origin NOME        # envia e define upstream

# Trazer branches remotas
git fetch --all
git checkout -b NOME origin/NOME

# ====================
# 🔁 Rebase
# ====================

# Quando usar:
# - Atualizar sua branch de trabalho com a main
# - Manter histórico linear (sem merges extras)

# Fluxo: trazer main atualizada para sua feature
git checkout feature
git fetch origin
git rebase origin/main

# Se der conflito:
#   edite os arquivos (<<<<<<< ======= >>>>>>>)
git add .
git rebase --continue

# Se quiser desistir:
git rebase --abort

# Fluxo: atualizar main com origin/main
git checkout main
git fetch origin
git rebase origin/main

# Após rebase, ao enviar:
git push --force-with-lease

# ====================
# 📦 .gitignore
# ====================
# Ignorar arquivos temporários
*.log
*.tmp

# Ignorar pastas
node_modules/
__pycache__/

# ====================
# 🏷️ Git Tag
# ====================
git tag v1.0                          # cria tag leve
git tag -a v1.0 -m "Primeira versão"  # cria tag anotada
git tag                               # lista tags
git show v1.0                         # mostra detalhes
git push origin v1.0                  # envia tag específica
git push origin --tags                # envia todas as tags

# ====================
# ⚡ Git Alias
# ====================
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.lg "log --oneline --graph --all --decorate"

# Usando:
git co main       # checkout main
git ci -m "msg"   # commit com mensagem
git st            # status
git lg            # histórico resumido em árvore

# ====================
# 📌 Git Stash
# ====================
git stash          # guarda alterações e limpa a pasta
git stash list     # lista stashes
git stash pop      # aplica e remove
git stash apply    # aplica e mantém
git stash drop     # remove último stash
git stash clear    # limpa todos

# Fluxo típico:
git status
git stash
git checkout outra-branch
git pull
git checkout sua-branch
git stash pop

# ====================
# 🔗 Fork e Upstream
# ====================
# origin   -> seu fork
# upstream -> repositório original

git remote add upstream https://github.com/jaquelinedealmeida/pretalab-git-github-avancado.git
git remote -v
git fetch upstream
git checkout main
git merge upstream/main
git push origin main

# ====================
# 💡 Motivação
# ====================
Este repositório faz parte da minha jornada de aprendizado em tecnologia com a Pretalab 🚀
Cada commit aqui é um passo em direção ao meu objetivo de crescer na área de Python e Git.
Acredito que aprender é um processo contínuo e quero registrar cada conquista, por menor que pareça.

"Um passo de cada vez ainda é progresso." ✨
