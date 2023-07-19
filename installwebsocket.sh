#!/bin/bash

# Função para exibir uma mensagem de status formatada
exibir_status() {
    local cor_azul='\033[1;34m'
    local cor_verde='\033[1;32m'
    local cor_vermelho='\033[1;31m'
    local cor_padrao='\033[0m'

    echo -e "\n\e[1m--------------------------------------------\e[0m"
    echo -e "$cor_azul$1$cor_padrao"
    echo -e "\e[1m--------------------------------------------\e[0m"
}

exibir_status "INSTALADOR DO WEBSOCKET"

# Verificar se os arquivos WebSocket, pub.key e priv.pem já existem
if [ ! -f "/etc/SSHPlus/WebSocket" ] || [ ! -f "/etc/SSHPlus/pub.key" ] || [ ! -f "/etc/SSHPlus/priv.pem" ]; then
    exibir_status "${cor_verde}Baixando e instalando arquivos do WebSocket...${cor_padrao}"

    # Baixar os arquivos necessários e dar permissões
    cd /etc/SSHPlus/ && wget https://github.com/fleetvpngit/Websocket/raw/main/files/WebSocket && wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/pub.key && wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/priv.pem && chmod 777 WebSocket && cd $HOME
else
    exibir_status "${cor_verde}Arquivos do WebSocket já estão presentes. Pulando o download.${cor_padrao}"
fi

exibir_status "${cor_verde}Configurando o diretório SSHPlus...${cor_padrao}"

# Criar diretório /opt/sshplus e criar arquivo vazio
mkdir -p /opt/sshplus
echo > /opt/sshplus/sshplus

exibir_status "${cor_verde}Configurando o WebSocket...${cor_padrao}"

# Solicitar a porta desejada para o WebSocket
read -p $'\e[1mDigite a porta desejada para o WebSocket (ex: 80, 8080): \e[0m' porta

# Solicitar a mensagem desejada para o WebSocket
read -p $'\e[1mDigite a mensagem desejada para o WebSocket: \e[0m' mensagem

# Executar comando com a porta e a mensagem fornecidas
screen -dmS novoWS /etc/SSHPlus/WebSocket -proxy_port 0.0.0.0:$porta -msg="$mensagem"

sleep 1

exibir_status "${cor_verde}Verificando o status do proxy...${cor_padrao}"

# Verificar se o proxy está em execução
proxy_status=$(screen -list | grep "novoWS")

if [ -n "$proxy_status" ]; then
    exibir_status "${cor_verde}O proxy está em execução na porta $porta.${cor_padrao}"
else
    exibir_status "${cor_vermelho}Houve um erro ao iniciar o proxy.${cor_padrao}"
fi
