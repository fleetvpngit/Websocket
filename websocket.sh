#!/bin/bash
sudo apt update
sudo apt upgrade -y
cd /etc/SSHPlus/ && wget https://www.dropbox.com/s/muh8otpcjb9qa6d/WebSocket && wget https://www.dropbox.com/s/zv01bftfjj58wt8/pub.key && wget https://www.dropbox.com/s/pj5s9x23boj840q/priv.pem && chmod 777 WebSocket && cd $HOME
mkdir /opt/sshplus
echo > /opt/sshplus/sshplus
screen -dmS novoWS /etc/SSHPlus/WebSocket -proxy_port 0.0.0.0:80 -msg=SUA_MENSAGEM_AQUI