#!/bin/bash

# Ora Protokol Node Kurulum Script'i

# 1. Sistemi güncelle ve yükselt
echo "Sistem güncelleniyor ve yükseltiliyor..."
sudo apt update -y && sudo apt upgrade -y

# 2. Docker ve Docker Compose'u yükle
echo "Docker ve Docker Compose yükleniyor..."
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -y
sudo apt-get install docker-ce docker-compose -y

# 3. Önbelleğe alınmış GitHub kimlik bilgilerini temizle (varsa)
echo "Önbelleğe alınmış GitHub kimlik bilgileri temizleniyor..."
git config --global --unset credential.helper

# 4. Ora Protokol repository'sini HTTPS kullanarak klonla (public repo)
echo "Ora Protokol repository'si klonlanıyor..."
git clone https://github.com/ora-io/tora-docker-compose || { echo "Repository klonlanamadı. Çıkış yapılıyor."; exit 1; }
cd tora-docker-compose

# 5. .env.example dosyasını .env olarak kopyala
echo ".env.example dosyası .env olarak kopyalanıyor..."
cp .env.example .env

# 6. Ortam değişkenleri için kullanıcı girdilerini iste
echo "Lütfen Metamask Özel Anahtarınızı girin:"
read PRIVATE_KEY
echo "Lütfen MAINNET WSS URL'nizi girin:"
read MAINNET_WSS
echo "Lütfen MAINNET HTTP URL'nizi girin:"
read MAINNET_HTTP
echo "Lütfen SEPOLIA WSS URL'nizi girin:"
read SEPOLIA_WSS
echo "Lütfen SEPOLIA HTTP URL'nizi girin:"
read SEPOLIA_HTTP

# 7. .env dosyasındaki boş değerleri kullanıcı girdileri ile güncelle
echo ".env dosyası kullanıcı girdileri ile güncelleniyor..."
sed -i "s|PRIV_KEY=\"\"|PRIV_KEY=\"${PRIVATE_KEY}\"|" .env
sed -i "s|MAINNET_WSS=\"\"|MAINNET_WSS=\"${MAINNET_WSS}\"|" .env
sed -i "s|MAINNET_HTTP=\"\"|MAINNET_HTTP=\"${MAINNET_HTTP}\"|" .env
sed -i "s|SEPOLIA_WSS=\"\"|SEPOLIA_WSS=\"${SEPOLIA_WSS}\"|" .env
sed -i "s|SEPOLIA_HTTP=\"\"|SEPOLIA_HTTP=\"${SEPOLIA_HTTP}\"|" .env

# 8. CRYPTOLOSS
.
.
.
.

echo "#########################################"
echo "#                                       #"
echo "#            CRYPTOLOSS                 #"
echo "#                                       #"
echo "#########################################"
.
.
echo "#### Twitter : @Cryptoloss1 #####"
.
.
.
# 9. Docker Compose kullanarak node'u başlat
echo "Ora Protokol node'u başlatılıyor 5-10dk kadar sürebilir..."
sysctl vm.overcommit_memory=1
docker-compose up -d
.
.
echo "Ora Protokol Node kurulumu tamamlandı."
.
echo "Log kontrol için : docker logs -f ora-tora"
.
.
echo "Sorularınız için t.me/CryptolossChat telegram kanalına gelebilirsiniz."




