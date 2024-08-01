#!/bin/sh
#agregar usuario
useradd -m ticcol -s /bin/bash && echo "ticcol:T1CC0L2O!7" | chpasswd
usermod -aG sudo ticcol
sleep 5

#Cabecera
chmod -x /etc/update-motd.d/*
cd /etc/update-motd.d
rm 00-header
wget https://raw.githubusercontent.com/viejojavi/header/main/00-header
chmod +x 00-header
echo "Header Listo"
sleep 5

#Instalar Drivers TBS
#sudo su
#apt install curl
#curl -sSf https://cdn.cesbo.com/astra/scripts/drv-tbs.sh | sh

#Cambian el modo de la TBS SAT
#echo "options stid135 mode=1" > /etc/modprobe.d/stid135.conf

#Validar TBS
#ls /dev/dvb
#sleep 5

#Instalar Astra
sudo -s
apt -y install \
    build-essential \
    patchutils \
    libproc-processtable-perl \
    linux-headers-$(uname -r) \
    git
rm -rf /lib/modules/$(uname -r)/extra
rm -rf /lib/modules/$(uname -r)/kernel/drivers/media
rm -rf /lib/modules/$(uname -r)/kernel/drivers/staging/media
git clone --depth=1 https://github.com/tbsdtv/media_build.git /usr/src/media_build
git clone --depth=1 https://github.com/tbsdtv/linux_media.git -b latest /usr/src/media
cd /usr/src/media_build
make dir DIR=../media
make allyesconfig
make
make install
curl -L http://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v1.0.tar.bz2 | tar -C /lib/firmware/ -jxf -
#shutdown -r now

curl -Lo /usr/bin/astra https://cesbo.com/astra-latest
chmod +x /usr/bin/astra
astra -v
astra init

# Habilitar para cambiar puerto
# astra init 45000
systemctl start astra
systemctl enable astra

#EPG - Agregator
curl -Lo /etc/astra/epg-aggregator.lua https://cdn.cesbo.com/astra/scripts/epg-aggregator/epg-aggregator.lua
cd /etc/systemd/system/
 wget https://cdn.cesbo.com/astra/scripts/epg-aggregator/astra-epg.service
 systemctl start astra-epg
 systemctl enable astra-epg
 (crontab -l ; echo "0 4 * * * systemctl restart astra-epg") | crontab -

#Instalar Oscam
apt-get update
apt-get -y install subversion dialog
svn co http://svn.speedbox.me/svn/oscam-install/trunk oscam
chmod -R 0755 oscam
cd oscam
./install.sh

#Reiniciar
reboot
