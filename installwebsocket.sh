#!/bin/bash

# Função para solicitar entrada do usuário
obter_entrada_usuario() {
    read -p "$1" valor
    echo "$valor"
}

# Passo 1: Mudar para o diretório /etc/SSHPlus/
cd /etc/SSHPlus/ || { echo "Erro: diretório /etc/SSHPlus/ não encontrado"; exit 1; }

# Passo 2: Baixar os arquivos necessários
wget https://github.com/fleetvpngit/Websocket/raw/main/files/WebSocket || { echo "Erro: falha ao baixar o WebSocket"; exit 1; }
wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/pub.key || { echo "Erro: falha ao baixar o arquivo pub.key"; exit 1; }
wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/priv.pem || { echo "Erro: falha ao baixar o arquivo priv.pem"; exit 1; }
chmod 777 WebSocket

# Passo 3: Voltar para o diretório home
cd "$HOME" || { echo "Erro: falha ao voltar para o diretório home"; exit 1; }

# Passo 4: Verificar se o diretório /opt/sshplus já existe
if [ -d "/opt/sshplus" ]; then
    echo "O diretório /opt/sshplus já existe."
else
    # Passo 5: Criar o diretório /opt/sshplus
    mkdir -p /opt/sshplus || { echo "Erro: falha ao criar o diretório /opt/sshplus"; exit 1; }
fi

# Passo 6: Criar o arquivo vazio /opt/sshplus/sshplus
echo > /opt/sshplus/sshplus || { echo "Erro: falha ao criar o arquivo /opt/sshplus/sshplus"; exit 1; }

# Passo 7: Solicitar ao usuário a porta do proxy e a mensagem
porta_proxy=$(obter_entrada_usuario "Digite a porta do proxy (ex.: 80): ")
mensagem=$(obter_entrada_usuario "Digite a mensagem: ")

# Passo 8: Iniciar o WebSocket com a porta do proxy e a mensagem fornecidas pelo usuário
screen -dmS novoWS /etc/SSHPlus/WebSocket -proxy_port 0.0.0.0:"$porta_proxy" -msg="$mensagem" || { echo "Erro: falha ao iniciar o WebSocket"; exit 1; }

echo "WebSocket ativado na porta $porta_proxy com sucesso!"
