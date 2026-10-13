#!/bin/bash
set -e

# Cria o diretório de credenciais e gera o arquivo JSON de autenticação
mkdir -p ~/.kaggle
echo "{\"username\":\"${KAGGLE_USERNAME}\",\"key\":\"${KAGGLE_KEY}\"}" > ~/.kaggle/kaggle.json
chmod 600 ~/.kaggle/kaggle.json

# Adiciona o caminho dos binários do Python ao PATH do sistema
export PATH="/usr/local/bin:$PATH"

echo "Iniciando controle remoto da TPU no Kaggle..."
exec python launch.py serve
