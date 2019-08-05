mkdir /opt/httpd
chmod -R 755 /opt/httpd
cd /opt/httpd
wget http://mirrors.viethosting.com/apache//httpd/httpd-2.4.39.tar.gz -O httpd-2.4.39.tar.gz 
wget https://github.com/apache/apr/archive/1.7.0.tar.gz -O apr-1.7.0.tar.gz
wget https://github.com/apache/apr-util/archive/1.6.1.tar.gz -O apr-util-1.6.1.tar.gz
tar -zxvf httpd-2.4.39.tar.gz 
tar -zxvf apr-1.7.0.tar.gz
tar -zxvf apr-util-1.6.1.tar.gz
mv apr-1.7.0 /opt/httpd/httpd-2.4.39/srclib/apr
mv apr-util-1.6.1 /opt/httpd/httpd-2.4.39/srclib/apr-util
cd /opt/httpd/httpd-2.4.39
./buildconf
./configure --enable-so --with-included-apr --with-mpm=event prefix=/usr/local/apache2 --with-pcre=/usr/local/pcre --with-ssl=/usr/local/ssl --enable-rewrite --enable-expires --enable-ssl --enable-deflate
make
make install
