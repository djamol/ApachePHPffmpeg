

cd $SCRIPTPATH/src
FILE=php.tar.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";
		if wget http://us2.php.net/get/php-5.6.20.tar.gz/from/this/mirror -O $FILE; then 
		echo -e "\033[33;32m php download Success";date +"%r" >> $BUILD;echo "Success : Download File $FILE" >> $BUILD
		else
		echo -e "\033[33;31m php download Failed";date +"%r" >> $BUILD;echo "Failed : Download File $FILE" >> $BUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $FILE" >> $BUILD
fi
		
		
if tar -xzf $FILE; then 
echo -e "\033[33;32m php extract Success";date +"%r" >> $BUILD;echo "Success : Extract $FILE" >> $BUILD
else
echo -e "\033[33;31m php extract Failed";date +"%r" >> $BUILD;echo "Failed : Extract $FILE" >> $BUILD
tar -xzf php-*
fi
cd php-5.6.20
if rpm -ivh http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm; then 
echo -e "\033[33;32m Epel Fedoraproject update Success";date +"%r" >> $BUILD;echo "Success : Epel RPM " >> $BUILD
else
	#if rpm -ivh $SCRIPTPATH/src/epel-release-7-6.noarch.rpm; then 
	# Remove Epel if error Error: xz compression not available in yum install package command
	#yum remove epel-release;rm -rf /var/cache/yum/x86_64/6/epel
	wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
	rpm -ivh epel-release-latest-7.noarch.rpm
	echo -e "\033[33;31m Epel Feoraproject update Failed";date +"%r" >> $BUILD;echo "Failed : Epel RPM " >> $BUILD
	#fi
fi

if yum -y install perl; then 
echo -e "\033[33;32m perl Success";date +"%r" >> $BUILD;echo "Success : Perl Install" >> $BUILD
else
echo -e "\033[33;31m perl Failed";date +"%r" >> $BUILD;yum -y install perl;echo "Failed : Perl Install" >> $BUILD
fi
if yum -y install libxml2-devel; then 
echo -e "\033[33;32m libxml2 Success";date +"%r" >> $BUILD;echo "Success : libxml2 devel Install" >> $BUILD
else
echo -e "\033[33;31m libxml2 Failed";date +"%r" >> $BUILD;echo "Failed : libxml2 devel Install" >> $BUILD
fi
if yum -y install bzip2-devel; then 
echo -e "\033[33;32m bzip2 Success";date +"%r" >> $BUILD;echo "Success : bzip devel Install" >> $BUILD
else
echo -e "\033[33;31m bzip2 Failed";date +"%r" >> $BUILD;echo "Failed : bzip devel Install" >> $BUILD
fi
if yum -y install gmp-devel; then 
echo -e "\033[33;32m gmp Success";date +"%r" >> $BUILD;echo "Success : gmp devel Install" >> $BUILD
else
echo -e "\033[33;31m gmp Failed";date +"%r" >> $BUILD;echo "Failed : gmp devel Install" >> $BUILD
fi
if yum -y install aspell-devel; then 
echo -e "\033[33;32m aspell Success";date +"%r" >> $BUILD;echo "Success : aspell devel Install" >> $BUILD
else
echo -e "\033[33;31m aspell Failed";date +"%r" >> $BUILD;echo "Failed : aspell devel Install" >> $BUILD
fi
if yum -y install recode-devel; then 
echo -e "\033[33;32m recode Success";date +"%r" >> $BUILD;echo "Success : recode devel Install" >> $BUILD
else
echo -e "\033[33;31m recode Failed";date +"%r" >> $BUILD;echo "Failed : recode devel Install" >> $BUILD
fi
if yum -y install libjpeg-devel; then 
echo -e "\033[33;32m libjpeg Success";date +"%r" >> $BUILD;echo "Success : libjpeg devel Install" >> $BUILD
else
echo -e "\033[33;31m libjpeg Failed";date +"%r" >> $BUILD;echo "Failed : libjpeg devel Install" >> $BUILD
fi
if yum -y install libpng-devel; then 
echo -e "\033[33;32m libpng Success";date +"%r" >> $BUILD;echo "Success : libpng devel Install" >> $BUILD
else
echo -e "\033[33;31m libpng Failed";date +"%r" >> $BUILD;echo "Failed : libpng devel Install" >> $BUILD
fi
if yum -y install libXpm-devel; then 
echo -e "\033[33;32m libxpm Success";date +"%r" >> $BUILD;echo "Success : libxpm devel Install" >> $BUILD
else
echo -e "\033[33;31m libxpm Failed";date +"%r" >> $BUILD;echo "Failed : libXpm devel Install" >> $BUILD
fi
if yum -y install freetype-devel; then 
echo -e "\033[33;32m freetype Success";date +"%r" >> $BUILD;echo "Success : freetype devel Install" >> $BUILD
else
echo -e "\033[33;31m freetype Failed";date +"%r" >> $BUILD;echo "Failed : freetype devel Install" >> $BUILD
fi
if yum -y install libicu-devel; then 
echo -e "\033[33;32m libicu Success";date +"%r" >> $BUILD;echo "Success : libicu devel Install" >> $BUILD
else
echo -e "\033[33;31m libicu Failed";date +"%r" >> $BUILD;echo "Failed : libicu devel Install" >> $BUILD
fi
if yum -y install libmcrypt-devel; then 
echo -e "\033[33;32m libmcrypt Success";date +"%r" >> $BUILD;echo "Success : libmcrypt devel Install" >> $BUILD
else
echo -e "\033[33;31m libmcrypt Failed";date +"%r" >> $BUILD;echo "Failed : libmcrypt devel Install" >> $BUILD
fi
./configure --prefix=/usr/local --disable-fileinfo --disable-opcache --enable-bcmath --enable-calendar --enable-ftp --enable-mbstring --enable-soap --enable-zip --enable-gd-native-ttf --enable-libxml --enable-pdo --enable-sockets --with-gettext --with-apxs2=/usr/local/apache2/bin/apxs --with-curl=/opt/curl-ssl --with-freetype-dir=/usr --with-gd --with-jpeg-dir==/usr --with-kerberos  --with-libxml-dir=/opt/libmcrypt/ --with-mysql --with-mysqli --with-mysql-sock=/var/lib/mysql/mysql.sock --with-openssl=/usr/local/ssl --with-pcre-regex=/usr/local/pcre --with-pdo-mysql --with-pdo-sqlite --with-pic --with-png-dir=/usr --with-xpm-dir=/usr --with-zlib --with-zlib-dir=/usr
make
#./configure --prefix=/usr/local/php7/usr --with-config-file-path=/usr/local/php7/usr/etc --disable-fileinfo --disable-opcache --enable-bcmath --enable-calendar --enable-ftp --enable-mbstring --enable-soap --enable-zip --enable-gd-native-ttf --enable-libxml --enable-pdo --enable-sockets --with-gettext --with-apxs2=/usr/local/apache2/bin/apxs --with-curl=/opt/curl-ssl --with-freetype-dir=/usr --with-gd --with-jpeg-dir==/usr --with-kerberos --with-libxml-dir=/opt/libmcrypt/  --with-mysqli --with-mysql-sock=/var/lib/mysql/mysql.sock --with-openssl=/usr/local/ssl  --with-pcre-regex=/usr/local/pcre --with-pdo-mysql --with-pdo-sqlite --with-pic --with-png-dir=/usr --with-xpm-dir=/usr --with-zlib --with-zlib-dir=/usr 
#./configure --prefix=/usr/local  --disable-fileinfo --disable-opcache --enable-bcmath --enable-calendar --enable-ftp --enable-mbstring --enable-soap --enable-zip --enable-gd-native-ttf --enable-libxml --enable-pdo --enable-sockets --with-gettext --with-apxs2=/usr/local/apache2/bin/apxs --with-curl=/opt/curl-ssl --with-freetype-dir=/usr --with-gd --with-jpeg-dir==/usr --with-kerberos --with-libxml-dir=/opt/libmcrypt/  --with-mysqli --with-mysql-sock=/var/lib/mysql/mysql.sock --with-openssl=/usr/local/ssl  --with-pcre-regex=/usr/local/pcre --with-pdo-mysql --with-pdo-sqlite --with-pic --with-png-dir=/usr --with-xpm-dir=/usr --with-zlib --with-zlib-dir=/usr 


####
#Configure enable phpize for adding phpextension such as redis php-ffmpeg memcached and many more
#
#yum install openssl-devel
#./configure --prefix=/usr/local/lsws/lsphp5 --disable-fileinfo --disable-opcache --enable-bcmath --enable-calendar --enable-ftp --enable-mbstring --enable-soap --enable-zip --enable-gd-native-ttf --enable-libxml --enable-pdo --enable-sockets --with-gettext --with-curl=/opt/curl-ssl --with-freetype-dir=/usr --with-gd --with-jpeg-dir==/usr --with-kerberos --with-libxml-dir=/opt/libmcrypt/ --with-mysql --with-mysqli --with-mysql-sock=/var/lib/mysql/mysql.sock --with-openssl  --with-pdo-mysql --with-pdo-sqlite --with-pic --with-png-dir=/usr --with-xpm-dir=/usr --with-zlib --with-zlib-dir=/usr --with-libdir=lib64 --enable-shmop --enable-sysvsem --enable-sysvshm --with-iconv --enable-inline-optimization --with-mhash --enable-xml --disable-rpath --enable-mbregex --enable-pcntl --with-ldap-sasl --with-xmlrpc --disable-debug --with-apxs2=/usr/local/apache2/bin/apxs; #--with-ldap
####


echo -e "
  █    █ █    █ ▓    █    █████      █  █▓▓█  ▓█████  ████  █        ▓████  ████▒  █████  
  ▒ █ ░█ ▓ ██ █    █ █    ▒   █▒     █  ░▓▓█▓ ▓ █▓ █     █▓ ▓        ▓      ░  ▓█ ▒ ▓█ █  
  █ █░▓█ █ ▓█ █ █▓░█ █    █▓  █  ▒   █ ██  █▓ █ █▓ █ ██  █▒ █        █     ██  ▓█ █ ▓█ █  
  █████  ▓█████  █████  █ █████  ████▓ ▓▒  █  █    █  ████  █████    █████  ████  █    █  
                                                                                          
											  ";

if [ $PHPT = "true" ]
        then
                 date +"%r" >> $BUILD;echo "Status : Php Testing Started" >> $BUILD;
                 make test; 
                  date +"%r" >> $BUILD;echo "Status : Php Testing END" >> $BUILD;
        else
                 date +"%r" >> $BUILD;echo "Status : Php Testing function Disable" >> $BUILD;
fi

#Do you want to send this report now? [Yns]:

PHPINSTALL=$(expect -c "
spawn make install
expect -nocase
send \"n\r\"
expect eof
")
echo "$PHPINSTALL"

date +"%r" >> $BUILD;echo "PHP Program Complete" >> $BUILD
