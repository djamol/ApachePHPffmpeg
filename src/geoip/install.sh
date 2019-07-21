mkdir /usr/local/share/GeoIP
cd /usr/local/share/GeoIP
#wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/GeoIP.dat.gz
#wget http://geolite.maxmind.com/download/geoip/database/GeoLiteCity.dat.gz
#wget http://geolite.maxmind.com/download/geoip/database/asnum/GeoIPASNum.dat.gz
gunzip *gz

#Step 2: Install the GeoIP C API
#There will be a dependency on zlib so make sure zlib-devel is installed:

yum install zlib-devel -y
cd ~
#wget http://geolite.maxmind.com/download/geoip/api/c/GeoIP-1.4.6.tar.gz
tar xvzf GeoIP-1.4.6.tar.gz
cd GeoIP-1.4.6
./configure
make
make check
sudo make install


#Make it possible to link against the geoip library:
#sudo echo '/usr/local/lib' > /etc/ld.so.conf.d/geoip.conf
#sudo ldconfig



Step 3: Install the Geo::IP Perl Module
cd ~
wget http://geolite.maxmind.com/download/geoip/api/perl/Geo-IP-1.38.tar.gz
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
