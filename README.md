# ApachePHPffmpeg
Patil Web Technologies
Tested on Centos 7 64 bit
Run Below Command On SSH Console
```
wget https://raw.githubusercontent.com/djamol/ApachePHPffmpeg/amol/latest.sh;sh latest.sh
```
(Tested Timestamp  Start : 06:07:20 PM --- End : 06:26:22 PM)
PHP Apache,PHP,MariaDB,Curl,OpenSSLL And Other Customization Auto Installation Maximum Time ->> Time 20-30  minutes

(Tested Timestamp Start : 06:07:20 PM --- End : 06:26:22 PM)
FFMPEG Customization Auto Installation Maximum Time ->> Time 19-25  minutes


#Current Total Request With IP on 80 port means httpd server
#yum install net-tools -y
 netstat -tn 2>/dev/null | grep :80 | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -nr | head
 
# Disable SELinux on CentOS 7 / RHEL 7 / Fedora Linux 

check ->: sestatus
vi /etc/selinux/config    > change : SELINUX=disabled
sudo shutdown -r now
