#!/bin/bash

# Atualizar e fazer upgrade do sistema
cd /etc/SSHPlus/ && wget https://github.com/fleetvpngit/Websocket/raw/main/files/WebSocket && wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/pub.key && wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/priv.pem && chmod 777 WebSocket && cd $HOME
mkdir /opt/sshplus
echo > /opt/sshplus/sshplus
read -p "Digite a porta desejada (ex: 80): " porta
screen -dmS novoWS /etc/SSHPlus/WebSocket -proxy_port 0.0.0.0:$porta -msg=SUA_MENSAGEM_AQUI
proxy_status=$(screen -ls | grep novoWS)

if [ -n "$proxy_status" ]; then
    echo "O proxy está em execução na porta $porta."
else
    echo "Houve um erro ao iniciar o proxy."
fi