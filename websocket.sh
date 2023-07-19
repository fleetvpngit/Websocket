#!/bin/bash

# Função para exibir uma mensagem de status colorida
exibir_status() {
    local cor_azul='\033[1;34m'
    local cor_verde='\033[1;32m'
    local cor_vermelho='\033[1;31m'
    local cor_padrao='\033[0m'

    echo -e "\n----------------------------------"
    echo -e "$cor_azul$1$cor_padrao"
    echo "----------------------------------"
}

exibir_status "INSTALADOR DO WEBSOCKET"

exibir_status "${cor_verde}Baixando e instalando arquivos do WebSocket...${cor_padrao}"

# Baixar os arquivos necessários e dar permissões
cd /etc/SSHPlus/ && wget https://github.com/fleetvpngit/Websocket/raw/main/files/WebSocket && wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/pub.key && wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/priv.pem && chmod 777 WebSocket && cd $HOME

exibir_status "${cor_verde}Configurando o diretório SSHPlus...${cor_padrao}"

# Criar diretório /opt/sshplus e criar arquivo vazio
mkdir /opt/sshplus
echo > /opt/sshplus/sshplus

exibir_status "${cor_verde}Configurando o WebSocket...${cor_padrao}"

# Solicitar a porta desejada para o WebSocket
read -p "Digite a porta desejada para o WebSocket (ex: 80, 8080): " porta

# Executar comando com a porta e a mensagem fornecidas
screen -dmS novoWS /etc/SSHPlus/WebSocket -proxy_port 0.0.0.0:$porta -msg=SUA_MENSAGEM_AQUI

exibir_status "${cor_verde}Verificando o status do proxy...${cor_padrao}"

# Verificar se o proxy está em execução
proxy_status=$(screen -ls | grep novoWS)

if [ -n "$proxy_status" ]; then
    exibir_status "${cor_verde}O proxy está em execução na porta $porta.${cor_padrao}"
else
    exibir_status "${cor_vermelho}Houve um erro ao iniciar o proxy.${cor_padrao}"
fi
