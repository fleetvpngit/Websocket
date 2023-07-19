#!/bin/bash

# Função para exibir uma mensagem de status
exibir_status() {
    echo -e "\n----------------------------------"
    echo "$1"
    echo "----------------------------------"
}

exibir_status "INSTALADOR DO WEBSOCKET"

exibir_status "Baixando e instalando arquivos do WebSocket..."

# Baixar os arquivos necessários e dar permissões
cd /etc/SSHPlus/ && wget https://github.com/fleetvpngit/Websocket/raw/main/files/WebSocket && wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/pub.key && wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/priv.pem && chmod 777 WebSocket && cd $HOME

exibir_status "Configurando o diretório SSHPlus..."

# Criar diretório /opt/sshplus e criar arquivo vazio
mkdir /opt/sshplus
echo > /opt/sshplus/sshplus

exibir_status "Configurando o WebSocket..."

# Solicitar a porta desejada para o WebSocket
read -p "Digite a porta desejada para o WebSocket (ex: 80, 8080): " porta

# Executar comando com a porta e a mensagem fornecidas
screen -dmS novoWS /etc/SSHPlus/WebSocket -proxy_port 0.0.0.0:$porta -msg=SUA_MENSAGEM_AQUI

exibir_status "Verificando o status do proxy..."

# Verificar se o proxy está em execução
proxy_status=$(screen -ls | grep novoWS)

if [ -n "$proxy_status" ]; then
    exibir_status "O proxy está em execução na porta $porta."
else
    exibir_status "Houve um erro ao iniciar o proxy."
fi
