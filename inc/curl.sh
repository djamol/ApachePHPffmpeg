# CURL SETUP with openssl for enable https
# DjAmol Group Pvt Ltd.
# WWW.DjAmol.Com
# djamolpatil@gmail.com

cd $SCRIPTPATH/src

FILE=openssl-1.0.1s.tar.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";
		if wget http://openssl.org/source/openssl-1.0.1s.tar.gz; then 
		echo -e "\033[33;32m openssl download Success";date +"%r" >> $BUILD;echo "Success : File Download $FILE" >> $BUILD
		else
		echo -e "\033[33;31m openssl download Failed";date +"%r" >> $BUILD;echo "Failed : File Download $FILE" >> $BUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $FILE" >> $BUILD
fi
		

if tar -zxf openssl-1.0.1s.tar.gz; then 
echo -e "\033[33;32m extract openssl Success";date +"%r" >> $BUILD;echo "Success : $FILE Extract" >> $BUILD
else
echo -e "\033[33;31m extract openssl Failed";date +"%r" >> $BUILD;echo "Failed : $FILE Extract" >> $BUILD
fi
if yum -y install zlib-devel; then 
echo -e "\033[33;32m zlib install Success";date +"%r" >> $BUILD;echo "Success : Install zlib devel" >> $BUILD
else
echo -e "\033[33;31m zlib install Failed";date +"%r" >> $BUILD;echo "Failed : Install zlib devel" >> $BUILD
fi
if cd openssl-1.0.1s; then 
echo -e "\033[33;32m goto openssl Success";date +"%r" >> $BUILD;echo "Success : goto dir openssl" >> $BUILD
else
echo -e "\033[33;31m goto openssl Failed";date +"%r" >> $BUILD;echo "Failed : goto dir openssl" >> $BUILD
fi
./config shared -fPIC --prefix=/opt/ssl --openssldir=/etc/pki/tls zlib-dynamic shared
make
make depend
make install
echo "/opt/ssl/lib" >> /etc/ld.so.conf.d/openssl102.conf
ldconfig
#ln -s /usr/local/ssl/bin/openssl /usr/bin/openssl


cd $SCRIPTPATH/src
FILE=curl-7.48.0.tar.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";
		if wget http://curl.haxx.se/download/curl-7.48.0.tar.gz; then 
		echo -e "\033[33;32m curl download Success";date +"%r" >> $BUILD;echo "Success : File Download $FILE" >> $BUILD
		else
		echo -e "\033[33;31m curl download Failed";date +"%r" >> $BUILD;echo "Failed : File Download $FILE" >> $BUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $FILE" >> $BUILD
fi


if tar -xzf curl-7.48.0.tar.gz; then 
echo -e "\033[33;32m extract curl Success";date +"%r" >> $BUILD;echo "Success : Extract $FILE" >> $BUILD
else
echo -e "\033[33;31m extract curl Failed";date +"%r" >> $BUILD;echo "Failed : Extract $FILE" >> $BUILD
fi
if cd curl-7.48.0; then 
echo -e "\033[33;32m curl goto Success";date +"%r" >> $BUILD;echo "Success : goto curl folder" >> $BUILD
else
echo -e "\033[33;31m curl goto Failed";date +"%r" >> $BUILD;echo "Failed : goto curl folder" >> $BUILD
fi
./configure --prefix=/opt/curl-ssl --with-ssl=/opt/ssl --enable-http --enable-ftp LDFLAGS=-L/opt/ssl/lib CPPFLAGS=-I/opt/ssl/include
make
make install
