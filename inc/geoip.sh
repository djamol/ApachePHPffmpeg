mkdir /usr/local/share/GeoIP
#wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
#wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
#wget http://geolite.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz
cd $SCRIPTPATH/src/geoip
FILE=GeoIP.dat.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";

		if wget https://github.com/djamol/geoip/raw/master/GeoIP.dat.gz; then 
		echo -e "\033[33;32m GeoIP download Success";date +"%r" >> $BUILD;echo "Success : File Download $FILE" >> $BUILD
		else
		echo -e "\033[33;31m GeoIP download Failed";date +"%r" >> $BUILD;echo "Failed : File Download $FILE" >> $BUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $FILE" >> $BUILD
    echo "Status : GeoIP.dat Database Installed" >> $BUILD;
    cp $SCRIPTPATH/src/geoip/GeoIP.dat.gz /usr/local/share/GeoIP/GeoIP.dat.gz
fi


FILE=GeoLiteCity.dat.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";

		if wget https://github.com/djamol/geoip/raw/master/GeoLiteCity.dat.gz; then 
		echo -e "\033[33;32m GeoLiteCity download Success";date +"%r" >> $BUILD;echo "Success : File Download $FILE" >> $BUILD
		else
		echo -e "\033[33;31m GeoLiteCity download Failed";date +"%r" >> $BUILD;echo "Failed : File Download $FILE" >> $BUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $FILE" >> $BUILD
    echo "Status : GeoIP.dat Database Installed" >> $BUILD;
    cp $SCRIPTPATH/src/geoip/GeoLiteCity.dat.gz /usr/local/share/GeoIP/GeoLiteCity.dat.gz
fi

FILE=GeoIPASNum.dat.gz
if [ ! -f $FILE ]
then
   echo -e "\033[33;34m file " $FILE " does not exist.";

		if wget https://github.com/djamol/geoip/raw/master/GeoIPASNum.dat.gz; then 
		echo -e "\033[33;32m GeoIPASNum download Success";date +"%r" >> $BUILD;echo "Success : File Download $FILE" >> $BUILD
		else
		echo -e "\033[33;31m GeoIPASNum download Failed";date +"%r" >> $BUILD;echo "Failed : File Download $FILE" >> $BUILD
		fi
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $FILE" >> $BUILD
    echo "Status : GeoIP.dat Database Installed" >> $BUILD;
    cp $SCRIPTPATH/src/geoip/GeoIPASNum.dat.gz /usr/local/share/GeoIP/GeoIPASNum.dat.gz
fi

cd /usr/local/share/GeoIP

gunzip *gz

#Step 2: Install the GeoIP C API
#There will be a dependency on zlib so make sure zlib-devel is installed:

yum install zlib-devel -y
cd /usr/local/share/GeoIP
#wget http://geolite.maxmind.com/download/geoip/api/c/GeoIP-1.4.6.tar.gz
#wget https://github.com/djamol/geoip/raw/master/GeoIP-1.4.6.tar.gz
tar xvzf GeoIP-1.4.6.tar.gz
cd GeoIP-1.4.6
./configure
make
make check
sudo make install


#Make it possible to link against the geoip library:
#sudo echo '/usr/local/lib' > /etc/ld.so.conf.d/geoip.conf
#sudo ldconfig



#Step 3: Install the Geo::IP Perl Module
cd /usr/local/share/GeoIP
#wget http://geolite.maxmind.com/download/geoip/api/perl/Geo-IP-1.38.tar.gz
#wget https://github.com/djamol/geoip/raw/master/Geo-IP-1.38.tar.gz
tar xzvf Geo-IP-1.38.tar.gz
cd Geo-IP-1.38
perl Makefile.PL LIBS='-L/usr/local/lib'
make
make test
sudo make install


#Step 4: Enable the GeoIP Plugin

#Edit /etc/awstats/awstats.yourdomain.conf to add these lines:

#LoadPlugin="geoip GEOIP_STANDARD /usr/local/share/GeoIP/GeoIP.dat"
#LoadPlugin="geoip_city_maxmind GEOIP_STANDARD /usr/local/share/GeoIP/GeoLiteCity.dat"
#LoadPlugin="geoip_org_maxmind GEOIP_STANDARD /usr/local/share/GeoIP/GeoIPASNum.dat"
