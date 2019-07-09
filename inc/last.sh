# Some Config  apache Program (last.sh )
# DjAmol Group Pvt Ltd.
# WWW.DjAmol.Com
# djamolpatil@gmail.com


mkdir -p /usr/local/apache2/conf/amolhost
## Make Public folder And enable php allow to access makefolder/create file and more
mkdir /home; mkdir /home/www;
#mkdir -p /home/www/filemanager;
mkdir -p /usr/share/amolpanel/;
chmod 755 /usr/share/amolpanel/;
cp -f $SCRIPTPATH/conf/fm.php /usr/share/amolpanel/index.php
cp -f $SCRIPTPATH/conf/fm.inc /usr/share/amolpanel/fm.inc
chmod 644 /usr/share/amolpanel/index.php;
chmod 644 /usr/share/amolpanel/fm.inc;

cp -f $SCRIPTPATH/conf/ind /home/www//index.php
#echo "<html><body>" >> /home/www/index.php
#echo "<center><h1>It works Apache!<br></h1><br><br><h1><a href='filemanager/'>File Manager</a></h1></center><br><small>Change user name password for filemanager edit /home/www/filemanager/index.php </small><br> <?php phpinfo(); ?></body></html>" >> /home/www/index.php
#First :We need to set the owner/group of the web root (and any directories/files therein):
chown -R daemon:daemon /home/www
#Second:We need to setup the proper permissions for users and groups.'go'-'group' and 'other'.rwx-Read,Write,execute
chmod go-rwx /home/www/;chmod go+x /home/www/;chgrp -R www-data /home/www/;chmod -R go-rwx /home/www/
chmod -R g+rx /home/www/;chmod -R g+rwx /home/www/

#Auto Start Apache2 on boot/reboot server
#touch /etc/init.d/apache2
#echo -e '#!/bin/bash\n# apache2-Startup script for the Apache HTTP Server\n/usr/local/apache2/bin/apachectl $@' >> /etc/init.d/apache2
cp -f $SCRIPTPATH/conf/apache2 /etc/init.d/apache2
chmod 755 /etc/init.d/apache2
chkconfig --add apache2
chkconfig --list apache2
chkconfig apache2 on
systemctl daemon-reload; /etc/init.d/apache2 restart
#https://confluence.atlassian.com/kb/starting-service-on-linux-throws-a-no-such-file-or-directory-error-794203722.html
sed -i -e 's/\r//g' /etc/init.d/apache2 #This issue may occurs on *nix systems , looking for ^M at the end of each line. 
date +"%r" >> $BUILD;echo "Apache Make Boot script complete start it from webmin.panel Startup and bootup option" >> $BUILD
cp -f $SCRIPTPATH/conf/a /etc/init.d/amol
chmod 755 /etc/init.d/amol
chkconfig --add amol
chkconfig --list amol
chkconfig amol on

## awstats update  automatically
mkdir -p /etc/awstats/
cp -f $SCRIPTPATH/conf/awupdate.sh /etc/awstats/update.sh
echo -e '55 23 * * * sh /etc/awstats/update.sh #update awstats' >> /var/spool/cron/root

# sed '/pattern/a some text here\nNewline' filename
#sed '/libphp5.so/a # grep PHP set php.ini file declare path\nPHPIniDir /usr/'
# sed '/DirectoryIndex /c index.php index.cgi index.pl index.php index.xhtml index.htm ' filename.txt
# now comment out all the stuff below up to the EOF

##automatic setting
##apache conf
sed -i '/DirectoryIndex index/c\DirectoryIndex index.php index.html index.cgi index.pl index.php index.xhtml index.htm' /usr/local/apache2/conf/httpd.conf


echo -e "\033[33;32m Setup Status Log File Save At $BUILD"
echo -e "\033[33;32m Login With http://yourip:$webport (default username:$weba,password:$webp)"

# HTTPD Apache VERSION
echo /usr/local/apache2/bin/httpd -v
#PHP VERSION CHECK
echo /usr/local/bin/php -v
#MYSQL VERSION CHECK
echo mysql -V
#BIND DNS VERSION CHECK
echo named -v
#CURL VERSION
echo curl -V
#OPEN SSL VERSION
echo openssl version

#AmolPrograms
mkdir -p /usr/amol/bin
#cp -f $SCRIPTPATH/pgrogram/ftp /usr/amol/bin/addftp
#export PATH="$PATH:/usr/amol/bin"
for filename in $SCRIPTPATH/pprogram/*; do
   if [ ! -d "$filename" ]; then # if not directory
   # for ((i=0; i<=3; i++)); do
     #   echo "$filename" "Logs/$(basename "$filename" .txt)_Log$i.txt"
     echo "$filename Command Added"
     FX=`basename $filename`
     echo "Filname-$FX"
     cp -f $filename /usr/amol/bin/$FX
     chmod 755 -R /usr/amol/bin/$FX
     ln -sf /usr/amol/bin/$FX /usr/local/bin
  # done
   fi
done
#chmod -R +x /usr/amol/bin


cp -f $SCRIPTPATH/conf/apache.conf /etc/webmin/apache/config
cp -f $SCRIPTPATH/conf/httpd.conf /usr/local/apache2/conf/httpd.conf
sed -i "s/host.name.com/$MYHOST/g" /usr/local/apache2/conf/httpd.conf
cp -f $SCRIPTPATH/conf/php.ini /usr/local/lib/php.ini
          LogFile=""
          if[ $AW="true" ]
             then
          mkdir -p /var/logs/httpd/$element
          LogFile="CustomLog /var/logs/httpd/$MAINDOMAIN/aclog.log \"combined\""
          else
          LogFile="#CustomLog /var/logs/httpd/$MAINDOMAIN/aclog.log \"combined\""
fi

echo -e '<VirtualHost '$MAINIP':80>\nServerName '$MAINDOMAIN'\nServerAlias www.'$MAINDOMAIN'\n'$LogFile'\nDocumentRoot /home/www\nServerAdmin webmaster@djamol.com\n</VirtualHost>' >> /usr/local/apache2/conf/amolhost/main.conf
echo -e '<VirtualHost '$MAINIP':443>\nServerName '$MAINDOMAIN'\nServerAlias www.'$MAINDOMAIN'\n'$LogFile'\nDocumentRoot /home/www\n<IfModule mod_ssl.c>\nSSLEngine on\n        SSLCertificateFile /usr/share/ssl/certs/ssl.crt\n        SSLCertificateKeyFile /usr/share/ssl/certs/ssl.crt\n    </IfModule>\n</VirtualHost>\n' >> /usr/local/apache2/conf/amolhost/main.conf

sed -i '/listen-on port/c\	listen-on port 53 { any; };' /etc/named.conf
sed -i '/allow-query/c\	allow-query     { any; };' /etc/named.conf
touch /etc/named.main.zones; chmod 640 /etc/named.main.zones; chown -R root:named /etc/named.main.zones
echo -e 'include "/etc/named.main.zones";' >> /etc/named.conf
echo -e '$TTL 14400\n@      86400	IN      SOA     ns1.'$MAINDOMAIN'. djamolpatil.gmail.com. (\n		2016033001	; serial, todays date+todays\n		3600		; refresh, seconds\n		7200		; retry, seconds\n		1209600		; expire, seconds\n		86400 )		; minimum, seconds\n\nns1.'$MAINDOMAIN'. 86400 IN NS ns1.'$MAINDOMAIN'.\nns1.'$MAINDOMAIN'. 86400 IN NS ns2.'$MAINDOMAIN'.\n\n\nns1.'$MAINDOMAIN'. IN A '$MAINIP'\n\nns1.'$MAINDOMAIN'. IN MX 0 ns1.'$MAINDOMAIN'.\n\nmail IN CNAME ns1.'$MAINDOMAIN'.\nwww IN CNAME ns1.'$MAINDOMAIN'.\nftp IN CNAME ns1.'$MAINDOMAIN'.\n' >> /var/named/ns1.$MAINDOMAIN.db
echo -e '$TTL 14400\n@      86400	IN      SOA     ns1.'$MAINDOMAIN'. djamolpatil.gmail.com. (\n		2016033001	; serial, todays date+todays\n		3600		; refresh, seconds\n		7200		; retry, seconds\n		1209600		; expire, seconds\n		86400 )		; minimum, seconds\n\nns2.'$MAINDOMAIN'. 86400 IN NS ns1.'$MAINDOMAIN'.\nns2.'$MAINDOMAIN'. 86400 IN NS ns2.'$MAINDOMAIN'.\n\n\nns2.'$MAINDOMAIN'. IN A '$MAINIP'\n\nns2.'$MAINDOMAIN'. IN MX 0 ns2.'$MAINDOMAIN'.\n\nmail IN CNAME ns2.'$MAINDOMAIN'.\nwww IN CNAME ns2.'$MAINDOMAIN'.\nftp IN CNAME ns2.'$MAINDOMAIN'.\n' >> /var/named/ns2.$MAINDOMAIN.db
echo -e '$TTL 14400\n@      86400	IN      SOA     ns1.'$MAINDOMAIN'. djamolpatil.gmail.com. (\n		2016033003	; serial, todays date+todays\n		3600		; refresh, seconds\n		7200		; retry, seconds\n		1209600		; expire, seconds\n		86400 )		; minimum, seconds\n\n'$MAINDOMAIN'. 86400 IN NS ns1.'$MAINDOMAIN'.\n'$MAINDOMAIN'. 86400 IN NS ns2.'$MAINDOMAIN'.\n\n\n'$MAINDOMAIN'. IN A '$MAINIP'\nmail.'$MAINDOMAIN'. IN A '$MAINIP'\nns1.'$MAINDOMAIN'. IN A '$MAINIP'\nns2.'$MAINDOMAIN'. IN A '$MAINIP'\n'$MAINDOMAIN'. IN MX 5 '$MAINDOMAIN'.\n\n\nwww IN CNAME '$MAINDOMAIN'.\nftp IN CNAME '$MAINDOMAIN'.\nmobile IN CNAME '$MAINDOMAIN'.\nwap IN CNAME '$MAINDOMAIN'.\n' >> /var/named/$MAINDOMAIN.db
echo -e 'zone "ns1.'$MAINDOMAIN'" {	type master;	file "/var/named/ns1.'$MAINDOMAIN'.db";};\nzone "ns2.'$MAINDOMAIN'" {	type master;	file "/var/named/ns2.'$MAINDOMAIN'.db";};\nzone "'$MAINDOMAIN'" {	type master;	file "/var/named/'$MAINDOMAIN'.db";};' >> /etc/named.main.zones


service qmail stop

