FROM python:3.10-slim

WORKDIR /app

# 1. Instala dependências básicas do sistema
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# 2. Instala as bibliotecas Python necessárias
RUN pip install --no-cache-dir kaggle pyyaml

# 3. Cria o link simbólico para a CLI do Kaggle
RUN ln -s /usr/local/bin/kaggle /usr/local/bin/pip-kaggle || true

# 4. Copia os arquivos do repositório para dentro do contêiner
COPY . /app/

# 5. Garante permissão de execução no script de entrada
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
