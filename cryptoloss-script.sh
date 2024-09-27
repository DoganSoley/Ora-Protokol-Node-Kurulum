#!/bin/bash

# Renk kodları
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Ora Protokol Node Kurulum Script'i

# 1. Sistemi güncelle ve yükselt
echo " "
echo -e "${GREEN}Sistem güncelleniyor ve yükseltiliyor...${NC}"
echo " "
sudo apt update -y && sudo apt upgrade -y

# 2. Docker ve Docker Compose'u yükle
echo " "
echo -e "${GREEN}Docker ve Docker Compose yükleniyor...${NC}"
echo " "
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -y
sudo apt-get install docker-ce docker-compose -y

# 3. Önbelleğe alınmış GitHub kimlik bilgilerini temizle (varsa)

git config --global --unset credential.helper

# 4. Ora Protokol repository'sini HTTPS kullanarak klonla (public repo)
echo " "
echo -e "${GREEN}Ora Protokol repository'si klonlanıyor...${NC}"
echo " "
git clone https://github.com/ora-io/tora-docker-compose || { echo "Repository klonlanamadı. Çıkış yapılıyor."; exit 1; }
cd tora-docker-compose

# 5. .env.example dosyasını .env olarak kopyala
echo " "
echo -e "${GREEN}.env.example dosyası .env olarak kopyalanıyor...${NC}"
echo " "
cp .env.example .env
echo " "
echo " "
# 6. Ortam değişkenleri için kullanıcı girdilerini iste
echo -e "${GREEN}Metamask Özel Anahtarınızı Girin:${NC}"
read PRIVATE_KEY
echo -e "${GREEN}ETH MAINNET WSS URL'nizi Girin:${NC}"
read MAINNET_WSS
echo -e "${GREEN}ETH MAINNET HTTP URL'nizi Girin:${NC}"
read MAINNET_HTTP
echo -e "${GREEN}ETH SEPOLIA WSS URL'nizi Girin:${NC}"
read SEPOLIA_WSS
echo -e "${GREEN}ETH SEPOLIA HTTP URL'nizi Girin:${NC}"
read SEPOLIA_HTTP

# 7. .env dosyasındaki boş değerleri kullanıcı girdileri ile güncelle
echo -e "${YELLOW}.env dosyası güncelleniyor...${NC}"
sed -i "s|PRIV_KEY=\"\"|PRIV_KEY=\"${PRIVATE_KEY}\"|" .env
sed -i "s|MAINNET_WSS=\"\"|MAINNET_WSS=\"${MAINNET_WSS}\"|" .env
sed -i "s|MAINNET_HTTP=\"\"|MAINNET_HTTP=\"${MAINNET_HTTP}\"|" .env
sed -i "s|SEPOLIA_WSS=\"\"|SEPOLIA_WSS=\"${SEPOLIA_WSS}\"|" .env
sed -i "s|SEPOLIA_HTTP=\"\"|SEPOLIA_HTTP=\"${SEPOLIA_HTTP}\"|" .env
sed -i "s|CONFIRM_CHAINS='.*'|CONFIRM_CHAINS='[\"sepolia\",\"mainnet\"]'|" .env

# 8. CRYPTOLOSS
echo " "
echo " "
echo " "
echo -e "${BLUE} ######  ########  ##    ## ########  ########  #######  ##        #######   ######   ######${NC}"
echo -e "${BLUE}##    ## ##     ##  ##  ##  ##     ##    ##    ##     ## ##       ##     ## ##    ## ##    ##${NC}"
echo -e "${BLUE}##       ##     ##   ####   ##     ##    ##    ##     ## ##       ##     ## ##       ##${NC}"
echo -e "${BLUE}##       ########     ##    ########     ##    ##     ## ##       ##     ##  ######   ######${NC}"
echo -e "${BLUE}##       ##   ##      ##    ##           ##    ##     ## ##       ##     ##       ##       ##${NC}"
echo -e "${BLUE}##    ## ##    ##     ##    ##           ##    ##     ## ##       ##     ## ##    ## ##    ##${NC}"
echo -e "${BLUE} ######  ##     ##    ##    ##           ##     #######  ########  #######   ######   ######${NC}"
echo " "
echo -e "${GREEN}#### Twitter : @Cryptoloss1 #####${NC}"
echo " "
echo " "
# 9. Docker Compose kullanarak node'u başlat
echo -e "${GREEN}Ora Protokol node'u başlatılıyor 5-10dk kadar sürebilir...${NC}"
echo " "
echo " "
sysctl vm.overcommit_memory=1
docker-compose up -d
echo " "
echo -e "${GREEN}Ora Protokol Node kurulumu tamamlandı.${NC}"
echo " "
echo -e "${GREEN}Log kontrol için : ${NC}""${YELLOW}docker logs -f ora-tora${NC}"
echo " "
echo -e "${GREEN}Sorularınız için ${NC}""${YELLOW}t.me/CryptolossChat${NC}""${GREEN} telegram kanalına gelebilirsiniz.${NC}"




