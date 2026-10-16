#!/bin/bash
# Troque iSgnik antes de executar. Repositório: github.com/iSgnik/portifolio (já existe).
git init
git add .
git commit -m "feat: versão 1.0 do portfólio"
git branch -M main
git remote add origin https://github.com/iSgnik/portifolio.git
# Se o repositório já tiver README no GitHub, rode antes: git pull origin main --allow-unrelated-histories
git push -u origin main
git tag v1.0 && git push origin v1.0

# Alteração para a etapa "realizar alterações e enviar":
echo "- Atualização: seção de documentos adicionada" >> README.md
git add README.md
git commit -m "docs: atualiza README com seção de documentos"
git push
