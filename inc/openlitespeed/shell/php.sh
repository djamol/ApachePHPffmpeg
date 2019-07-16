
SRC_Source=$1/src
cpu_num=$2
PWD_DIR=$1

cd $SRC_Source

FILE=php.tar.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";
		if wget https://github.com/djamol/centos-INSTALLER/raw/master/src/php.tar.gz -O $FILE; then 
		echo -e "\033[33;32m php download Success";date +"%r" >> $BUILD;echo "Success : Download File $FILE" >> $BUILD
		else
		echo -e "\033[33;31m php download Failed";date +"%r" >> $BUILD;echo "Failed : Download File $FILE" >> $BUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $FILE" >> $BUILD
fi

FILE=php-litespeed-6.6.tgz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";
		if wget https://github.com/djamol/centos-INSTALLER/raw/master/src/openlite/php-litespeed-6.6.tgz -O php-litespeed-6.6.tgz -O $FILE; then 
		echo -e "\033[33;32m php download Success";date +"%r" >> $BUILD;echo "Success : Download File $FILE" >> $BUILD
		else
		echo -e "\033[33;31m php download Failed";date +"%r" >> $BUILD;echo "Failed : Download File $FILE" >> $BUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $FILE" >> $BUILD
fi

##&&&&&& extract php files
#wget -c https://github.com/djamol/centos-INSTALLER/raw/master/src/openlite/php-litespeed-6.6.tgz -O php-litespeed-6.6.tgz
[ -f /etc/redhat-release ] && yum install -y autoconf213 || apt-get install autoconf2.13 -y

[ ! -s /usr/local/lsws/phpbuild ] && mkdir -p /usr/local/lsws/phpbuild

cd $SRC_Source

tar zxf php-litespeed-6.6.tgz
tar zxf php.tar.gz
mv litespeed php-5.6.20/sapi/litespeed/
mv php-5.6.20 /usr/local/lsws/phpbuild
cd /usr/local/lsws/phpbuild/php-5.6.20
make clean
touch ac*
[ -f /etc/redhat-release ] && export PHP_AUTOCONF=/usr/bin/autoconf-2.13 || export PHP_AUTOCONF=/usr/bin/autoconf2.13
##./buildconf --force
##./configure --prefix=/usr/local/lsws/lsphp5 --disable-fileinfo --disable-opcache --enable-bcmath --enable-calendar --enable-ftp --enable-mbstring --enable-soap --enable-zip --enable-gd-native-ttf --enable-libxml --enable-pdo --enable-sockets --with-gettext --with-curl=/opt/curl-ssl --with-freetype-dir=/usr --with-gd --with-jpeg-dir==/usr --with-kerberos --with-libxml-dir=/opt/libmcrypt/ --with-mysql --with-mysqli --with-mysql-sock=/var/lib/mysql/mysql.sock --with-openssl=/usr/local/ssl --with-pcre-regex=/usr/local/pcre --with-pdo-mysql --with-pdo-sqlite --with-pic --with-png-dir=/usr --with-xpm-dir=/usr --with-zlib --with-zlib-dir=/usr
##Addition
###      --with-libdir=lib64 --enable-shmop  --enable-sysvsem --enable-sysvshm --enable-magic-quotes --with-iconv --enable-inline-optimization --with-curlwrappers  --with-mhash  --enable-xml --disable-rpath --enable-mbregex --enable-pcntl --with-ldap --with-ldap-sasl --with-xmlrpc --disable-debug  --with-litespeed
./configure --prefix=/usr/local/lsws/lsphp5 --disable-fileinfo --disable-opcache --enable-bcmath --enable-calendar --enable-ftp --enable-mbstring --enable-soap --enable-zip --enable-gd-native-ttf --enable-libxml --enable-pdo --enable-sockets --with-gettext --with-curl=/opt/curl-ssl --with-freetype-dir=/usr --with-gd --with-jpeg-dir==/usr --with-kerberos --with-libxml-dir=/opt/libmcrypt/ --with-mysql --with-mysqli --with-mysql-sock=/var/lib/mysql/mysql.sock --with-openssl  --with-pdo-mysql --with-pdo-sqlite --with-pic --with-png-dir=/usr --with-xpm-dir=/usr --with-zlib --with-zlib-dir=/usr --with-libdir=lib64 --enable-shmop  --enable-sysvsem --enable-sysvshm --with-iconv --enable-inline-optimization  --with-mhash  --enable-xml --disable-rpath --enable-mbregex --enable-pcntl --with-ldap --with-ldap-sasl --with-xmlrpc --disable-debug  --with-litespeed

cpu_num=`cat /proc/cpuinfo | grep processor | wc -l`
make -j $cpu_num
make -k install
[ ! -s /usr/local/lsws/lsphp5/lib ] && mkdir -p /usr/local/lsws/lsphp5/lib

 cp -rf php.ini-production /usr/local/lsws/lsphp5/lib/php.ini

cd /usr/local/lsws/fcgi-bin

[ -e "lsphp-5.6.20" ] && mv -s lsphp-5.6.20 lsphp-5.6.20.bak

cp /usr/local/lsws/phpbuild/php-5.6.20/sapi/litespeed/php lsphp-5.6.20
ln -sf lsphp-5.6.20 lsphp5
ln -sf lsphp-5.6.20 lsphp55
chmod a+x lsphp-5.6.20
chown -R lsadm:lsadm /usr/local/lsws/phpbuild/php-5.6.20

sed -i 's/post_max_size = 8M/post_max_size = 50M/g' /usr/local/lsws/lsphp5/lib/php.ini
sed -i 's/short_open_tag = Off/short_open_tag = On/g' /usr/local/lsws/lsphp5/lib/php.ini
sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 50M/g' /usr/local/lsws/lsphp5/lib/php.ini
sed -i 's/;date.timezone =/date.timezone = Asia\/Kolkata/g' /usr/local/lsws/lsphp5/lib/php.ini
sed -i 's/disable_functions =.*/disable_functions = passthru,exec,system,chroot,chgrp,chown,shell_exec,proc_open,proc_get_status,ini_alter,ini_restore,dl,openlog,syslog,readlink,symlink,popepassthru,stream_socket_server/g' /usr/local/lsws/lsphp5/lib/php.ini
sed -i 's/display_errors = On/display_errors = Off/g' /usr/local/lsws/lsphp5/lib/php.ini
sed -i 's/expose_php = On/expose_php = Off/g' /usr/local/lsws/lsphp5/lib/php.ini

service lsws restart
