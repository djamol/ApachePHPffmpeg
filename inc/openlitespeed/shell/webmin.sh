weba=$1
webp=$2
webport=$3
BUILD=$4
if ! [ "$webport" -eq "$webport" ] 2> /dev/null
then
    echo "Sorry integers only now your control panel PORT"; webport=2083;
fi
# Wemin Manual/tar.gz file installation
FILE=webmin-1.791.tar.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";
		if wget http://prdownloads.sourceforge.net/webadmin/webmin-1.791.tar.gz; then 
		echo -e "\033[33;32m Webmin Success";date +"%r" >> $BUILD;echo "Success : Download File $FILE" >> $BUILD
		else
		echo -e "\033[33;31m Webmin Failed";date +"%r" >> $BUILD;echo "Failed : Download File $FILE" >> $BUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Exist $FILE" >> $BUILD
fi


tar xvzf webmin-1.791.tar.gz
cd webmin-1.791
## Webmin Setup with configure
#./setup.sh /usr/local/webmin
#Log file directory [/var/webmin]:#Full path to perl (default /usr/bin/perl):
#Web server port (default 10000):#Login name (default admin):
#Login password:#Password again:#Start Webmin at boot time (y/n):
SECURE_WEBMIN=$(expect -c "
set timeout 10
spawn ./setup.sh /usr/local/webmin
expect -nocase
send \"\r\"
expect -nocase
send \"\r\"
expect -nocase
send \"\r\"
expect -nocase
send \"$webport\r\"
expect -nocase
send \"$weba\r\"
expect -nocase
send \"$webp\r\"
expect -nocase
send \"$webp\r\"
expect -nocase
send \"y\r\"
expect eof
")
echo "$SECURE_WEBMIN"
service webmin  start
date +"%r" >> $BUILD;service webmin status >> $BUILD
date +"%r" >> $BUILD;echo "Status : Webmin Automatic Program :$SECURE_WEBMIN" >> $BUILD
date +"%r" >> $BUILD;echo "Webmin Program Complete" >> $BUILD
