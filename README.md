# ApachePHPffmpeg

Tested on Centos 7 64 bit
Run Below Command On SSH Console
```
wget https://raw.githubusercontent.com/djamol/ApachePHPffmpeg/amol/latest.sh;sh latest.sh
```

Apache (+ Apache Mod -> Dos,APR,PCRE,APR-UTIL)

NGINX/OpenLiteSpeed (Reverse Proxy Server)

PHP

MariaDB (DB Server)

BIND DNS (DNS Server)

PRO FTP (FTP Server)

ConfigServer Security & Firewall (csf)

CRON JOB

AWStats

Geo IP

Mail Server(POSTFIX/SMTP/DoveCot)

Domain Keys Identified Mail (DKIM For mail Server)

Curl

FFMPEG

OpenSSL

Webmin Server UI Admin Panel

Much More...

(Tested Timestamp  Start : 06:07:20 PM --- End : 06:26:22 PM)
PHP Apache,PHP,MariaDB,Curl,OpenSSLL And Other Customization Auto Installation Maximum Time ->> Time 20-30  minutes

(Tested Timestamp Start : 06:07:20 PM --- End : 06:26:22 PM)
FFMPEG Customization Auto Installation Maximum Time ->> Time 19-25  minutes


#Current Total Request With IP on 80 port means httpd server
#apt install net-tools -y
 netstat -tn 2>/dev/null | grep :80 | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head
 
# Disable SELinux on CentOS 7 / RHEL 7 / Fedora Linux 

check ->: sestatus

vi /etc/selinux/config    > change : SELINUX=disabled

sudo shutdown -r now


TEST ONLINE SERVER TOOLS
SMTP (Sendmail/SMTP Mail Server)   https://www.gmass.co/smtp-test
DNS : network-tools.com , https://mxtoolbox.com/ ,https://api.hackertarget.com/zonetransfer/?q=example.com
