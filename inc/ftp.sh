# PROFTP  Setup Program 
# DjAmol Group Pvt Ltd.
# WWW.DjAmol.Com
# djamolpatil@gmail.com

## Pro ftpd installation
#rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm
rpm -ivh http://ftp.astral.ro/mirrors/fedora/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install proftpd proftpd-utils
cp -f $SCRIPTPATH/conf/proftpd.conf /etc/proftpd.conf
 mkdir /etc/proftpd; touch /etc/proftpd/passwd.vhosts;chmod 640 /etc/proftpd/passwd.vhosts
cp -f $SCRIPTPATH/conf/ftpd-rsa.pem /etc/proftpd/ftpd-rsa.pem
cp -f $SCRIPTPATH/conf/ftpd-rsa-key.pem /etc/proftpd/ftpd-rsa-key.pem
 chmod 600 /etc/proftpd/*.pem

systemctl start proftpd.service
systemctl enable proftpd.service

## INSTALLation End proftpd
date +"%r" >> $BUILD;echo "PROFTPD Program Complete" >> $BUILD
