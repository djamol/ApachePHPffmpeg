##############################start server
SRC_Source=$1/src
cpu_num=$2
PWD_DIR=$1

webuser=$3
webpass=$4
webemail=$5

rm -rf /home/www
mkdir /home
mkdir /home/www
touch /home/www/index.html
cp $PWD_DIR/conf/vhost.sh $SRC_Source/vhost.sh
chmod +x $SRC_Source/vhost.sh

cp $PWD_DIR/conf/p.php /home/www/p.php
cp $PWD_DIR/conf/llnmp.jpg /home/www/llnmp.jpg
cp $PWD_DIR/conf/index.html /home/www/index.html
cache_select="1"
[ "$cache_select" = 1 ] && sed -i 's/{cache}/\&nbsp;<a href=\"http:\/\/{ip}\/opcache\.php\" title=\"Zend Opcache\" target=\"_blank\">Zend Opcache<\/a>/g' /home/www/index.html
[ "$cache_select" = 2 ] && sed -i 's/{cache}/\&nbsp;<a href=\"http:\/\/{ip}\/apcu\.php\" title=\"APCU\" target=\"_blank\">APCU<\/a>/g' /home/www/index.html
[ "$cache_select" = 3 ] && sed -i 's/{cache}/\&nbsp;<a href=\"http:\/\/{ip}\/xcache\/\" title=\"xCache\" target=\"_blank\">xCache<\/a>/g' /home/www/index.html
redis_install="y"
memcache_install="y"
pureftpd_install="y"
[ "$redis_install" = "y" ] && sed -i 's/{redis}/\&nbsp;<a href=\"http:\/\/{ip}\/redis\.php\" title=\"Redis\" target=\"_blank\">Redis<\/a>/g' /home/www/index.html || sed -i 's/{redis}//g' /home/www/index.html
[ "$memcache_install" = "y" ] && sed -i 's/{memcached}/\&nbsp;<a href=\"http:\/\/{ip}\/memcached\.php\" title=\"MemCached\" target=\"_blank\">MemCached<\/a>/g' /home/www/index.html || sed -i 's/{memcached}//g' /home/www/index.html

[ "$pureftpd_install" = "y" ] && sed -i 's/{ftp}/<a href=\"http:\/\/{ip}\/ftp\/\" title=\"FTP Manager\" target=\"_blank\">FTP Manager<\/a>\&nbsp;/g' /home/www/index.html || sed -i 's/{ftp}//g' /home/www/index.html


[ ! -f $SRC_Source/phpMyAdmin-4.1.14-english.tar.gz ] && wget -c https://github.com/djamol/centos-INSTALLER/raw/master/src/openlite/phpMyAdmin-4.1.14-english.tar.gz -O phpMyAdmin-4.1.14-english.tar.gz
tar zxf phpMyAdmin-4.1.14-english.tar.gz
mv phpMyAdmin-4.1.14-english /home/www/phpmyadmin/
chown -R www:www /home/www/

#Error litespeed then reinstall
cd $SRC_Source/openlitespeed*
 ./configure --prefix=/usr/local/lsws --with-user=www --with-group=www --with-admin=$webuser --with-password=$webpass --with-email=$webemail --enable-adminssl=no
make 
make install



chmod 755 /etc/init.d/nginx
chkconfig --add nginx
chkconfig --list nginx
chkconfig nginx on
/etc/init.d/nginx restart

sed -i '/listen-on port/c\	listen-on port 53 { any; };' /etc/named.conf
sed -i '/allow-query/c\	allow-query     { any; };' /etc/named.conf
touch /etc/named.main.zones; chmod 640 /etc/named.main.zones; chown -R root:named /etc/named.main.zones
echo -e 'include "/etc/named.main.zones";' >> /etc/named.conf

#echo -e '$TTL 14400\n@      86400	IN      SOA     ns1.'$MAINDOMAIN'. djamolpatil.gmail.com. (\n		2016033001	; serial, todays date+todays\n		3600		; refresh, seconds\n		7200		; retry, seconds\n		1209600		; expire, seconds\n		86400 )		; minimum, seconds\n\nns1.'$MAINDOMAIN'. 86400 IN NS ns1.'$MAINDOMAIN'.\nns1.'$MAINDOMAIN'. 86400 IN NS ns2.'$MAINDOMAIN'.\n\n\nns1.'$MAINDOMAIN'. IN A '$MAINIP'\n\nns1.'$MAINDOMAIN'. IN MX 0 ns1.'$MAINDOMAIN'.\n\nmail IN CNAME ns1.'$MAINDOMAIN'.\nwww IN CNAME ns1.'$MAINDOMAIN'.\nftp IN CNAME ns1.'$MAINDOMAIN'.\n' >> /var/named/ns1.$MAINDOMAIN.db
#echo -e '$TTL 14400\n@      86400	IN      SOA     ns1.'$MAINDOMAIN'. djamolpatil.gmail.com. (\n		2016033001	; serial, todays date+todays\n		3600		; refresh, seconds\n		7200		; retry, seconds\n		1209600		; expire, seconds\n		86400 )		; minimum, seconds\n\nns2.'$MAINDOMAIN'. 86400 IN NS ns1.'$MAINDOMAIN'.\nns2.'$MAINDOMAIN'. 86400 IN NS ns2.'$MAINDOMAIN'.\n\n\nns2.'$MAINDOMAIN'. IN A '$MAINIP'\n\nns2.'$MAINDOMAIN'. IN MX 0 ns2.'$MAINDOMAIN'.\n\nmail IN CNAME ns2.'$MAINDOMAIN'.\nwww IN CNAME ns2.'$MAINDOMAIN'.\nftp IN CNAME ns2.'$MAINDOMAIN'.\n' >> /var/named/ns2.$MAINDOMAIN.db
#echo -e '$TTL 14400\n@      86400	IN      SOA     ns1.'$MAINDOMAIN'. djamolpatil.gmail.com. (\n		2016033003	; serial, todays date+todays\n		3600		; refresh, seconds\n		7200		; retry, seconds\n		1209600		; expire, seconds\n		86400 )		; minimum, seconds\n\n'$MAINDOMAIN'. 86400 IN NS ns1.'$MAINDOMAIN'.\n'$MAINDOMAIN'. 86400 IN NS ns2.'$MAINDOMAIN'.\n\n\n'$MAINDOMAIN'. IN A '$MAINIP'\nmail.'$MAINDOMAIN'. IN A '$MAINIP'\nns1.'$MAINDOMAIN'. IN A '$MAINIP'\nns2.'$MAINDOMAIN'. IN A '$MAINIP'\n'$MAINDOMAIN'. IN MX 5 '$MAINDOMAIN'.\n\n\nwww IN CNAME '$MAINDOMAIN'.\nftp IN CNAME '$MAINDOMAIN'.\nmobile IN CNAME '$MAINDOMAIN'.\nwap IN CNAME '$MAINDOMAIN'.\n' >> /var/named/$MAINDOMAIN.db
#echo -e 'zone "ns1.'$MAINDOMAIN'" {	type master;	file "/var/named/ns1.'$MAINDOMAIN'.db";};\nzone "ns2.'$MAINDOMAIN'" {	type master;	file "/var/named/ns2.'$MAINDOMAIN'.db";};\nzone "'$MAINDOMAIN'" {	type master;	file "/var/named/'$MAINDOMAIN'.db";};' >> /etc/named.main.zones


sed -i "s/{ip}/$IP/g" /home/www/index.html
#check litespeed
[ -s /usr/local/lsws ] && service lsws restart
[ -s /usr/local/nginx ] && service nginx restart
[ -s /usr/local/mysql ] && service mysqld restart
[ -s /usr/local/redis ] && service redis restart
[ -s /usr/local/memcached ] && service memcached restart
[ -s /usr/local/pureftpd ] && service pureftpd restart
