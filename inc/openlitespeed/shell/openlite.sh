
SRC_Source=$1/src
cpu_num=$2
PWD_DIR=$1

cd $SRC_Source
useradd -M -s /sbin/nologin www
mkdir -p /home/wwwroot/default
cd $SRC_Source
wget -c https://github.com/djamol/centos-INSTALLER/raw/master/src/openlite/openlitespeed-1.3.2.tgz -O openlitespeed-1.3.2.tgz
 tar zxf openlitespeed-1.3.2.tgz
 cd openlitespeed*
## [ "$nginx_install" = "n" ] && sed -i "s/HTTP_PORT=8088/HTTP_PORT=80/g" dist/install.sh
webuser="admin"
webpass="admin"
webemail="admin@djamol.com"
 ./configure --prefix=/usr/local/lsws --with-user=www --with-group=www --with-admin=$webuser --with-password=$webpass --with-email=$webemail --enable-adminssl=no
 make  && make install
 
# if [ "$nginx_install" = "y" ]; then
    sed -i 's/<autoUpdateInterval>/<useIpInProxyHeader>1<\/useIpInProxyHeader>\n    &/' /usr/local/lsws/conf/httpd_config.xml
    sed -i 's/<address>*:$port<\/address>/<address>127.0.0.1:$port<\/address>/g' /usr/local/lsws/conf/httpd_config.xml
#fi
sed -i 's/<vhRoot>\$SERVER_ROOT\/DEFAULT\/<\/vhRoot>/<vhRoot>\/home\/www<\/vhRoot>/g' /usr/local/lsws/conf/httpd_config.xml
sed -i 's/<configFile>\$VH_ROOT\/conf\/vhconf\.xml<\/configFile>/<configFile>\$SERVER_ROOT\/conf\/default\.xml<\/configFile>/g' /usr/local/lsws/conf/httpd_config.xml
##copy file%%%%%%%%%%%%%%%%%%%%%
cd $SRC_Source
cp $PWD_DIR/conf/vhconf.xml /usr/local/lsws/conf/default.xml
rm -rf /usr/local/lsws/DEFAULT/
mkdir -p /home/wwwlogs/litespeed
service lsws restart
