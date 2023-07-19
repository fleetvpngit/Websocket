#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

cd /etc/SSHPlus/ && wget https://github.com/fleetvpngit/Websocket/raw/main/files/WebSocket && wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/pub.key && wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/priv.pem && chmod 777 WebSocket && cd $HOME

mkdir /opt/sshplus
echo > /opt/sshplus/sshplus

read -p "Digite a porta desejada para o WebSocket (ex: 80, 8080): " porta

screen -dmS novoWS /etc/SSHPlus/WebSocket -proxy_port 0.0.0.0:$porta -msg=SUA_MENSAGEM_AQUI
proxy_status=$(screen -ls | grep novoWS)

if [ -n "$proxy_status" ]; then
    echo -e "${GREEN}O proxy está em execução na porta $porta.${NC}"
else
    echo -e "${RED}Houve um erro ao iniciar o proxy.${NC}"
fi
