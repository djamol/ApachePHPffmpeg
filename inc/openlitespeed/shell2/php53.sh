#!/bin/bash
#
# 
# 
# 
#

[ ! -s $SRC_DIR/php-5.6.20.tar.gz ] && wget -c http://www.php.net/distributions/php-5.6.20.tar.gz -O $SRC_DIR/php-5.6.20.tar.gz

[ ! -s $SRC_DIR/php-litespeed-6.6.tgz ]&& wget -c http://www.litespeedtech.com/packages/lsapi/php-litespeed-6.6.tgz -O $SRC_DIR/php-litespeed-6.6.tgz

[ -f /etc/redhat-release ] && yum install -y autoconf213 || apt-get install autoconf2.13 -y

[ ! -s /usr/local/lsws/phpbuild ] && mkdir -p /usr/local/lsws/phpbuild

cd $SRC_DIR
tar zxf php-litespeed-6.6.tgz
tar zxf php-5.6.20.tar.gz
mv $SRC_DIR/litespeed $SRC_DIR/php-5.6.20/sapi/litespeed/
mv $SRC_DIR/php-5.6.20 /usr/local/lsws/phpbuild
cd /usr/local/lsws/phpbuild/php-5.6.20

make clean
touch ac*
rm -rf autom4te.*
[ -f /etc/redhat-release ] && export PHP_AUTOCONF=/usr/bin/autoconf-2.13 || export PHP_AUTOCONF=/usr/bin/autoconf2.13
./buildconf --force

if [ `getconf LONG_BIT` = 64 ]; then
    ln -s /usr/local/mysql/lib /usr/local/mysql/lib64
    [ ! -f /etc/redhat-release ] && ln -fs /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib64/libldap.so
    [ ! -z "`cat /etc/issue | grep Ubuntu`" ] && ln -fs /usr/lib/x86_64-linux-gnu/liblber* /usr/lib64/
    ./configure '--disable-fileinfo' '--prefix=/usr/local/lsws/lsphp5' '--with-libdir=lib64' '--with-pdo-mysql=mysqlnd' '--with-mysql=mysqlnd' '--with-mysqli=mysqlnd' '--with-zlib' '--with-gd' '--enable-shmop' '--enable-sockets' '--enable-sysvsem' '--enable-sysvshm' '--enable-magic-quotes' '--enable-mbstring' '--with-iconv' '--enable-inline-optimization' '--with-curl' '--with-curlwrappers' '--with-mcrypt' '--with-mhash' '--with-openssl' '--with-freetype' '--with-jpeg-dir=/usr/lib' '--with-png-dir' '--with-libxml-dir=/usr' '--enable-xml' '--disable-rpath' '--enable-mbregex' '--enable-gd-native-ttf' '--enable-pcntl' '--with-ldap' '--with-ldap-sasl' '--with-xmlrpc' '--enable-zip' '--enable-soap' '--enable-ftp' '--disable-debug' '--with-gettext' '--enable-bcmath' '--with-litespeed'
else
    ln -s /usr/local/mysql/lib/libmysqlclient.so.18  /usr/lib/
    [ ! -f /etc/redhat-release ] && ln -fs /usr/lib/i386-linux-gnu/libldap.so /usr/lib/libldap.so
    [ ! -z "`cat /etc/issue | grep Ubuntu`" ] && ln -fs /usr/lib/i386-linux-gnu/liblber* /usr/lib/
    ./configure '--disable-fileinfo' '--prefix=/usr/local/lsws/lsphp5' '--with-pdo-mysql=mysqlnd' '--with-mysql=mysqlnd' '--with-mysqli=mysqlnd' '--with-zlib' '--with-gd' '--enable-shmop' '--enable-exif' '--enable-sockets' '--enable-sysvsem' '--enable-sysvshm' '--enable-magic-quotes' '--enable-mbstring' '--with-iconv' '--with-curl' '--with-curlwrappers' '--with-mcrypt' '--with-mhash' '--with-openssl' '--with-freetype' '--with-jpeg-dir=/usr/lib' '--with-png-dir' '--with-libxml-dir=/usr' '--enable-xml' '--disable-rpath' '--enable-bcmath' '--enable-mbregex' '--enable-gd-native-ttf' '--enable-pcntl' '--with-ldap' '--with-ldap-sasl' '--with-xmlrpc' '--enable-zip' '--enable-inline-optimization' '--enable-soap' '--disable-ipv6' '--enable-ftp' '--disable-debug' '--with-gettext' '--with-litespeed'
fi

make -j $cpu_num
make -k install

[ ! -s /usr/local/lsws/lsphp5/lib ] && mkdir -p /usr/local/lsws/lsphp5/lib

yes | cp -rf /usr/local/lsws/phpbuild/php-5.6.20/php.ini-production /usr/local/lsws/lsphp5/lib/php.ini

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
