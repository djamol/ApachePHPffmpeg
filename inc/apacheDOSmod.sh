
#Install CSF
#cd $SCRIPTPATH
#rm -fv csf.tgz
cd $SCRIPTPATH/src
FILE=mod_evasive.tar.gz
if [ ! -f $FILE ]
then
		echo -e "\033[33;34m file " $FILE " does not exist.";date +"%r" >> $BUILD;echo "Status : Downloading $FILE" >> $BUILD
		###
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Exist $FILE" >> $BUILD
fi

tar -xzf mod_evasive.tar.gz
cd mod_evasive*
/usr/local/apache2/bin/apxs -i -a -c mod_evasive24.c


#added in domainauto.sh
#LoadModule evasive24_module modules/mod_evasive24.so
#echo -e '\nLoadModule evasive24_module modules/mod_evasive24.so\n' >> /usr/local/apache2/conf/httpd.conf
#echo -e '\n<IfModule mod_evasive24.c>\nDOSHashTableSize 3097\nDOSPageCount 2\nDOSSiteCount 50\nDOSPageInterval 1\nDOSSiteInterval 1\nDOSBlockingPeriod 60\nDOSEmailNotify mramolpatil1@gmail.com\n</IfModule>' >> /usr/local/apache2/conf/httpd.conf


cd $SCRIPTPATH/src
FILE=mod_qos.tar.gz
if [ ! -f $FILE ]
then
		echo -e "\033[33;34m file " $FILE " does not exist.";date +"%r" >> $BUILD;echo "Status : Downloading $FILE" >> $BUILD
		###
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Exist $FILE" >> $BUILD
fi

tar -xzf mod_qos.tar.gz
cd mod_qos*
cd apache2
/usr/local/apache2/bin/apxs -i -c mod_qos.c -lcrypto -lpcre



## add this line LoadModule qos_module modules/mod_qos.so
#echo -e '\nLoadModule qos_module modules/mod_qos.so\n' >> /usr/local/apache2/conf/httpd.conf
#echo -e '\n<IfModule mod_qos.c>\n# max connection per IP is\nQS_SrvMaxConnPerIP 15 \n</IfModule>' >> /usr/local/apache2/conf/httpd.conf

#service apache2 restart
## LOG TRACK
mkdir -p /var/log/apache/mod_evasive
chown daemon:amolhttpd –R /var/log/apache/mod_evasive
# httpd.conf file DOSLogDir "/var/log/apache/mod_evasive"

#test mod
#perl test.pl
# if above command return "HTTP/1.1 302 Found" multiple times then its work
date +"%r" >> $BUILD;echo "mod_evasive DOS Apache Program Complete" >> $BUILD
