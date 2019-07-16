BUILD=$1

if yum -y install bind; then 
echo -e "\033[33;32m yum -y BIND DNS Success "
date +"%r" >> $BUILD;echo "Success : BIND DNS Install" >> $BUILD
#chkconfig named on
chkconfig --level 35 named on
service named start

else
echo -e "\033[33;31m yum -y BIND DNS Failed";date +"%r" >> $BUILD;echo "Failed : BIND DNS Install" >> $BUILD
fi
