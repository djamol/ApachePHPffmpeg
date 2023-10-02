# BIND DNS SETUP (binddns.sh)
# DjAmol Group Pvt Ltd.
# WWW.DjAmol.Com
# djamolpatil@gmail.com


#Install From Source
apt install libuv libuv-devel libnghttp2-devel libcap-devel # openssl-devel  try without openssl devel rpm

cd $SCRIPTPATH/src
FILE=bind-9.18.1.tar.xz
if [ ! -f $FILE ]
then
		echo -e "\033[33;34m file " $FILE " does not exist.";date +"%r" >> $BUILD;echo "Status : Downloading $FILE" >> $BUILD
		wget http://bind.org/bind-9.18.1.tar.xz
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Exist $FILE" >> $BUILD
fi

# tar xf bind-9.18.1.tar.xz
cd bind-9.18.1
./configure --with-openssl --enable-threads --with-libxml2 --prefix=/usr/local/named
make 
make install
chkconfig named on
chkconfig --level 35 named on
service named start

if [ $OSN = "debian" ]
        then
#Install From RPM
if apt -y install bind9; then 
echo -e "\033[33;32m Debian BIND DNS Success "
date +"%r" >> $BUILD;echo "Success :Debian BIND DNS Install" >> $BUILD
#chkconfig named on
chkconfig --level 35 named on
service named start

else
echo -e "\033[33;31m apt -y BIND DNS Failed";date +"%r" >> $BUILD;echo "Failed : debianBIND DNS Install" >> $BUILD
		echo "Failed :Debian BIND DNS INSTALL" >> $FAILBUILD

fi

else

#Install From RPM
if apt -y install bind; then 
echo -e "\033[33;32m apt -y BIND DNS Success "
date +"%r" >> $BUILD;echo "Success : BIND DNS Install" >> $BUILD
#chkconfig named on
chkconfig --level 35 named on
service named start

else
echo -e "\033[33;31m apt -y BIND DNS Failed";date +"%r" >> $BUILD;echo "Failed : BIND DNS Install" >> $BUILD
		echo "Failed : BIND DNS INSTALL" >> $FAILBUILD

fi

fi
