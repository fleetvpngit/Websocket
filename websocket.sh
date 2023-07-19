#!/bin/bash
sudo apt update
sudo apt upgrade -y
cd /etc/SSHPlus/ && wget https://github.com/fleetvpngit/Websocket/raw/main/files/WebSocket && wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/pub.key && wget https://raw.githubusercontent.com/fleetvpngit/Websocket/main/files/priv.pem && chmod 777 WebSocket && cd $HOME
mkdir /opt/sshplus
echo > /opt/sshplus/sshplus
screen -dmS novoWS /etc/SSHPlus/WebSocket -proxy_port 0.0.0.0:80 -msg=SUA_MENSAGEM_AQUI