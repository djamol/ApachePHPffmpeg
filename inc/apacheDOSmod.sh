
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
echo -e '\n<IfModule mod_evasive24.c>\nDOSHashTableSize 3097\nDOSPageCount 2\nDOSSiteCount 50\nDOSPageInterval 1\nDOSSiteInterval 1\nDOSBlockingPeriod 60\nDOSEmailNotify mramolpatil1@gmail.com\n</IfModule>' >> /usr/local/apache2/conf/httpd.conf
#service apache2 restart
## LOG TRACK
mkdir -p /var/log/apache/mod_evasive
chown –R daemon:amolhttpd /var/log/apache/mod_evasive
# httpd.conf file DOSLogDir "/var/log/apache/mod_evasive"

#test mod
#perl test.pl
# if above command return "HTTP/1.1 302 Found" multiple times then its work
date +"%r" >> $BUILD;echo "mod_evasive DOS Apache Program Complete" >> $BUILD
