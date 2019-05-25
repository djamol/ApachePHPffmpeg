# Apache Required Program ( )
# DjAmol Group Pvt Ltd.
# WWW.DjAmol.Com
# djamolpatil@gmail.com
cd $SCRIPTPATH/src

FILE=pcre-8.37.tar.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";

		if wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.37.tar.gz; then 
		echo -e "\033[33;32m pcre download Success";date +"%r" >> $BUILD;echo "Success : File Download $FILE" >> $BUILD
		else
		echo -e "\033[33;31m pcre download Failed";date +"%r" >> $BUILD;echo "Failed : File Download $FILE" >> $BUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $FILE" >> $BUILD
fi
		

if tar -xzf pcre-8.37.tar.gz; then 
echo -e "\033[33;32m extract pcre Success";date +"%r" >> $BUILD;echo "Success : Extract $FILE" >> $BUILD
else
echo -e "\033[33;31m extract pcre Failed";date +"%r" >> $BUILD;echo "Failed : Extract $FILE" >> $BUILD
fi
cd pcre-8.37
./configure --prefix=/usr/local/pcre  --enable-utf8 --enable-unicode-properties 
make
make install
#
#
#openssl for httpd and php
cd $SCRIPTPATH/src

FILE=openssl-1.0.2g.tar.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";date +"%r" >> $BUILD;echo "Status : Download $FILE" >> $BUILD
		wget https://www.openssl.org/source/openssl-1.0.2g.tar.gz
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $FILE" >> $BUILD
fi
		
		
tar -zxf openssl-1.0.2g.tar.gz
cd openssl-1.0.2g
./config -fPIC --prefix=/usr/local/ssl --openssldir=/usr/local/ssl
make
make install
ln -s /usr/local/ssl/bin/openssl /usr/bin/openssl

cd $SCRIPTPATH/src
FILE=apr-1.5.2.tar.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";
		if wget http://redrockdigimark.com/apachemirror//apr/apr-1.5.2.tar.gz; then 
		echo -e "\033[33;32m apr download Success";date +"%r" >> $BUILD;echo "Success : File Download $FILE" >> $BUILD
		else
		echo -e "\033[33;31m apr download Failed";date +"%r" >> $BUILD;echo "Failed : File Download $FILE" >> $BUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $FILE" >> $BUILD
fi
if tar -xzf $FILE; then 
echo -e "\033[33;32m extract apr Success";date +"%r" >> $BUILD;echo "Success : Extract $FILE" >> $BUILD
else
echo -e "\033[33;31m extract apr Failed"date +"%r" >> $BUILD;echo "Failed : Extract $FILE" >> $BUILD
fi

cd $SCRIPTPATH/src
FILE=apr-util-1.5.4.tar.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";
		if wget http://redrockdigimark.com/apachemirror//apr/apr-util-1.5.4.tar.gz; then 
		echo -e "\033[33;32m apr-util download Success";date +"%r" >> $BUILD;echo "Success : File Download $FILE" >> $BUILD
		else
		echo -e "\033[33;31m apr-util download Failed";date +"%r" >> $BUILD;echo "Failed : File Download $FILE" >> $BUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : File Exist $FILE" >> $BUILD
fi
if tar -xzf $FILE; then 
echo -e "\033[33;32m extract apr-util Success";date +"%r" >> $BUILD;echo "Success : Extract $FILE" >> $BUILD
else
echo -e "\033[33;31m extract apr-util Failed"date +"%r" >> $BUILD;echo "Failed : Extract $FILE" >> $BUILD
fi
