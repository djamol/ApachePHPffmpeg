# Apache Program 
# DjAmol Group Pvt Ltd.
# WWW.DjAmol.Com
# djamolpatil@gmail.com

# Apache Install 
cd $SCRIPTPATH/src
# http://httpd.apache.org/download.cgi#apache24 and  Apache Portable Runtime Project  apr and apr-util
#http://apr.apache.org/download.cgi
FILE=httpd.tar.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";
		if wget http://mirror.fibergrid.in/apache//httpd/httpd-2.4.18.tar.gz -O $FILE; then 
		echo -e "\033[33;32m httpd download Success";date +"%r" >> $BUILD;echo "Success : File Download $FILE" >> $BUILD
		else
		echo -e "\033[33;31m httpd download Failed";date +"%r" >> $BUILD;echo "Failed : File Download $FILE" >> $BUILD
		echo "Failed : File Download $FILE" >> $FAILBUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $FILE" >> $BUILD
fi
if tar -xzf $FILE; then 
echo -e "\033[33;32m extract httpd Success";date +"%r" >> $BUILD;echo "Success : Extract $FILE" >> $BUILD
else
echo -e "\033[33;31m extract httpd Failed"date +"%r" >> $BUILD;echo "Failed : Extract $FILE" >> $BUILD
echo "Failed : File Download $FILE" >> $FAILBUILD
tar -xzf httpd-2*
fis


cp -r  $SCRIPTPATH/src/apr-1.5.2 $SCRIPTPATH/src/httpd-2.4.18/srclib/apr
cp -r $SCRIPTPATH/src/apr-util-1.5.4 $SCRIPTPATH/src/httpd-2.4.18/srclib/apr-util

cd httpd-2.4.18
#./configure  --enable-so --with-included-apr --with-mpm=event prefix=/usr/local/apache2 --with-pcre=/usr/local/pcre --with-ssl=/opt/ssl LDFLAGS=-L/opt/ssl/lib CPPFLAGS=-I/opt/ssl/include --disable-v4-mapped --enable-access-compat=static --enable-actions=static --enable-alias=static --enable-asis=static --enable-auth_basic=static --enable-authn_core=static --enable-authn_file=static --enable-authz_core=static --enable-authz_groupfile=static --enable-authz_host=static --enable-authz_user=static --enable-autoindex=static --enable-cgi=static --enable-deflate=static --enable-dir=static --enable-env=static --enable-expires=static --enable-filter=static --enable-headers=static --enable-include=static --enable-log_config=static --enable-logio=static --enable-mime=static --enable-modules=none --enable-negotiation=static --enable-proxy=static --enable-proxy-connect=static --enable-proxy-http=static --enable-rewrite=static --enable-setenvif=static --enable-slotmem_shm=static --enable-socache_dbm=static --enable-socache_shmcb=static --enable-ssl=static --enable-status=static  --enable-unique-id=static --enable-unixd=static --enable-userdir=static --enable-version=static
./configure --enable-so --with-included-apr --with-mpm=event prefix=/usr/local/apache2 --with-pcre=/usr/local/pcre --with-ssl=/usr/local/ssl --enable-rewrite --enable-expires --enable-ssl --enable-deflate
make
make install
date +"%r" >> $BUILD;echo "Apache Program Complete" >> $BUILD
# Link httpd program path to any where execute httpd file using httpd file path export into $PATH (echo $PATH)
#export PATH="$PATH:<Program File Folder Path>"
#export PATH="$PATH:/usr/local/apache2/bin"
ln -s /usr/local/apache2/bin/httpd /usr/local/bin

## user account permission
#usermod -a -G groupname username  #usermod -a -G group1,group2 username  /multiple group
#groupadd groupname  #usermod -g groupname username   /primary group
groupadd amolhttpd
groupadd user
useradd -g amolhttpd -G daemon,user server   # // primary group =amolhttpd ..add new user =server

#chown server:amolhttpd -R /home/www
 mkdir -p /var/logs/httpd/
 chown server:amolhttpd -R /var/logs/httpd/




#mkdir /opt/httpd
#chmod -R 755 /opt/httpd
#cd /opt/httpd
#wget http://mirrors.viethosting.com/apache//httpd/httpd-2.4.39.tar.gz -O httpd-2.4.39.tar.gz 
#wget https://github.com/apache/apr/archive/1.7.0.tar.gz -O apr-1.7.0.tar.gz
#wget https://github.com/apache/apr-util/archive/1.6.1.tar.gz -O apr-util-1.6.1.tar.gz
#tar -zxvf httpd-2.4.39.tar.gz 
#tar -zxvf apr-1.7.0.tar.gz
#tar -zxvf apr-util-1.6.1.tar.gz
#mv apr-1.7.0 /opt/httpd/httpd-2.4.39/srclib/apr
#mv apr-util-1.6.1 /opt/httpd/httpd-2.4.39/srclib/apr-util
#cd /opt/httpd/httpd-2.4.39
#./buildconf 

