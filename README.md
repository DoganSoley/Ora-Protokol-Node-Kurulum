![GRAiWvUbsAARfpK](https://github.com/user-attachments/assets/4508306b-a99e-4cd3-8fdf-42f26ee00265)

# Ora Protokol Node Kurulumu

# Minimum Sunucu Gereksinimleri

8 GB RAM

1 GB CPU

50 GB SSD

Ubuntu 22.04

Ben hetzner'in cx32 6.30€'luk sunucusunu aldım yeterli olur.

Yeni kayıt olanlara digitalocean 2 aylık 200$ free hesap veriyor daha önce kullanmadıysanız bu [Link](https://t.co/5O8WuAtuHs)'e gidip kayıt olarak ücretsiz sunucu alabilirsiniz.

Kurulum videosu : [Link](https://youtu.be/)

İlk başta bir tane metamask cüzdanı kuralım veya mevcutta varsa onu da kullanabilirsiniz.(içerisinde varlık olan cüzdanı kullanmanızı tavsiye etmiyorum yeni açın ne olur ne olmaz)

Kurulumda RPC kullanıcaz ben Alchemy'den aldım [Alchemy Link](https://dashboard.alchemy.com/)

ETH Sepolia ağında da test ETH'ye ihtiyacımız olacak bunun için herhangi bir yerden faucet alabilirsiniz ben google'nin faucetini kullanıyorum gmail ile giriş yapıp alabilirsiniz. [ETH Sepolia Faucet Link](https://cloud.google.com/application/web3/faucet/ethereum)

Kurulumdan önce RPC'leri ve Faucet'i hazır edin.

Başlamadan önce Bu[Link](https://www.ora.io/app/points-program)'e giderek metamaskınızı bağlayın ve kayıt olun referans kısmına benim referans kodumu girebilirsiniz size 5 puan verecek. 

Ref Kodum ;

```
NZSSYZ
```

Kurulum tek kod halinde sunucuya bağlandıktan sonra direkt bu kodu girin yüklenirken arada ENTER diye soracak ENTER'a tıklayıp devam edin.

```
wget https://raw.githubusercontent.com/DoganSoley/Ora-Protokol-Node-Kurulum/main/cryptoloss-script.sh && chmod +x cryptoloss-script.sh && ./cryptoloss-script.sh
```
Yükleme bittikten sonra metamask özel anahtarınızı girmenizi isteyecek nerden bakıldığınız bilmiyorsanız ;

![Ekran Alıntısı](https://github.com/user-attachments/assets/b2036c32-0f90-4c5c-8c7e-ed0765f92104)

Özel anahtarı girdikten sonra sizden WSS ve HTTP isteyecek Alchemyden aldığınız Mainnet ve Sepolia HTTP ve WSS'leri istediği sırayla girin.

Daha sonra yüklenmenin bitmesini bekleyin yükleme bittikten sonra ;

```
docker logs -f ora-tora
```

Kodunu yazarak logları kontrol edin bu şekilde bir ekran geldiyse sorun yoktur ; ( Sonrasında CTRL+C ile kapatabilirsiniz)

![image](https://github.com/user-attachments/assets/b6a658b3-351e-4756-83cb-b901bf0eea2d)

Son olarak Ora üzerinden tx atıp node'den kontrol edelim çalışıp çalışmadığını.

Bu [Link](https://www.ora.io/app/opml/openlm/)'e gidin cüzdanınızı bağlayın.

![image](https://github.com/user-attachments/assets/27a27a38-0cd1-462b-a66e-7d597239a942)

Görseldeki gibi prompt yazıp "GENERATE"ye tıklayın ve metamask üzerinden işlemi onaylayın.

Daha sonra node'ye tekrar geri gelip log kontrol kodunu tekrar yazın ;

![image](https://github.com/user-attachments/assets/eabee640-9e6d-4725-a70d-69fe10c75cbd)

Bu şekilde bir tx çıktısı aldıysanız tamamdır CTRL + C ile veya direkt terminali kapatarak çıkabilirsiniz o çalışmaya devam eder.Kontrol etmek için 1-2 günde bir girip arada log kontrol koduyla çalışıp çalışmadığına bakabilirsiniz.

Puanlarınızı bu [Link](https://www.ora.io/app/tasks/dashboard)'den kontrol edebilirsiniz.
