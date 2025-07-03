#!/bin/bash
set -e


echo "Atualizando Linux"
apt update -y
apt upgrade -y
apt update -y


echo "Instalando Grafava V12"
apt-get install -y adduser libfontconfig1 musl

#Instala o Grafana v12
wget https://dl.grafana.com/oss/release/grafana_11.0.0_amd64.deb
dpkg -i grafana_11.0.0_amd64.deb

apt update

#Baixar Plugins 
grafana-cli plugins install alexanderzobnin-zabbix-app

grafana-cli plugins install volkovlabs-echarts-panel

grafana-cli plugins install grafana-clock-panel

grafana-cli plugins update-all

#Inicializa o Grafana junto com a Vm
systemctl daemon-reload
systemctl enable --now grafana-server
systemctl start grafana-server
