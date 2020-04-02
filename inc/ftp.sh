# PROFTP  Setup Program 
# DjAmol Group Pvt Ltd.
# WWW.DjAmol.Com
# djamolpatil@gmail.com

## Pro ftpd installation
#rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
rpm -ivh http://ftp.astral.ro/mirrors/fedora/pub/epel/epel-release-latest-$OSV.noarch.rpm
yum -y install proftpd proftpd-utils


groupadd ftpgroup
useradd -G ftpgroup djamoltest -s /sbin/nologin -d /home/www2
#passwd djamol
chmod -R 1750 /home/www2
setsebool -P allow_ftpd_full_access=1
openssl req -x509 -nodes -newkey rsa:1024 -keyout /etc/pki/tls/certs/proftpd.pem -out /etc/pki/tls/certs/proftpd.pem
chmod  0440 /etc/pki/tls/certs/proftpd.pem
systemctl restart proftpd.service

cp -f $SCRIPTPATH/conf/proftpd.conf /etc/proftpd.conf
 mkdir /etc/proftpd; touch /etc/proftpd/passwd.vhosts;chmod 640 /etc/proftpd/passwd.vhosts
cp -f $SCRIPTPATH/conf/ftpd-rsa.pem /etc/proftpd/ftpd-rsa.pem
cp -f $SCRIPTPATH/conf/ftpd-rsa-key.pem /etc/proftpd/ftpd-rsa-key.pem
 chmod 600 /etc/proftpd/*.pem

systemctl start proftpd.service
systemctl enable proftpd.service

## INSTALLation End proftpd
date +"%r" >> $BUILD;echo "PROFTPD Program Complete" >> $BUILD
