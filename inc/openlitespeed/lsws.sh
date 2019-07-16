#SCRIPTPATH=$(dirname "$SCRIPT")
##SRC_Source="/src"
SCRIPTPATH=$(pwd)

PWD_DIR=$SCRIPTPATH
mkdir $SCRIPTPATH/src
dbpass=admin
cpu_num=`cat /proc/cpuinfo | grep processor | wc -l`

BUILD=log.txt

echo -n "Enter Your Main Domain(Eg. domain.com) >"
read text
echo "Main Domain: $text"
MAINDOMAIN=$text
MAINIP=$(hostname --ip-address)
MYHOST=$(hostname)
while true; do
    read -p "Your System Main Ip is : $MAINIP?" yn
    case $yn in
        [Yy]* )  echo "Main IP Detect"; break;;
        [Nn]* ) echo -n "Enter Server Ipv4(Eg. 001.100.200.300) > ";read text;MAINIP=$text;break;;#exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
echo "Main IP: $MAINIP";

echo -n "Enter Your Main Email Account(Eg. mymail@gmail.com[Gmail,Yahoo]) > ";read text;MAINE=$text;

echo -n "Control Panel Username (Eg. root) > ";read btext;weba=$btext;
echo -n "Control Panel Password (Eg. pass1234) > ";read ctext;webp=$ctext;
echo -n "Control Panel Port (Eg. 2083) > ";read ctext;webport=$ctext;
if ! [ "$webport" -eq "$webport" ] 2> /dev/null
then
    echo "Sorry integers only now your control panel PORT 2083"; webport=2083;
fi
yum -y install openssl openssl-devel ;
mkdir /etc;mkdir /etc/ssl;mkdir /etc/ssl/certs;mkdir /etc/ssl/private;
openssl req -new -x509 -days 3650 -nodes -out /etc/ssl/certs/postfix.pem -keyout /etc/ssl/private/postfix.pem

yum -y install ncurses ncurses-devel glibc wget flex re2c unzip bison gcc gcc-c++ autoconf autoconf213 patch make automake cmake expect ruby file ntp bzip2 bzip2-devel diff* mhash-devel libtool libtool-libs libjpeg libjpeg-devel libpng libpng-devel libxml2 libxml2-devel libmcrypt-devel curl curl-devel freetype freetype-devel zlib zlib-devel libtool-ltdl-devel expat-devel pcre-devel geoip-devel openldap-devel e2fsprogs e2fsprogs-devel krb5-devel libidn libidn-devel vixie-cron libevent libevent-devel

if yum -y groupinstall "Development Tools"; then 
echo -e "\033[33;32m yum -y groupinstall ----Development Tools Success ";date +"%r" >> $BUILD;echo "Success : Development Tools Install" >> $BUILD
else
echo -e "\033[33;31m yum -y groupinstall ----Development Tools Failed";date +"%r" >> $BUILD;echo "Failed : Development Tools Install" >> $BUILD
fi
if yum -y install sudo; then 
echo -e "\033[33;32m Sudo Success";date +"%r" >> $BUILD;echo "Success : Sudo Install" >> $BUILD
else
echo -e "\033[33;31m Sudo Failed";date +"%r" >> $BUILD;echo "Failed : Sudo Install" >> $BUILD
fi

if yum -y install perl; then 
echo -e "\033[33;32m perl Success";date +"%r" >> $BUILD;echo "Success : Perl Install" >> $BUILD
else
echo -e "\033[33;31m perl Failed";date +"%r" >> $BUILD;yum -y install perl;echo "Failed : Perl Install" >> $BUILD
fi
if yum -y install libxml2-devel; then 
echo -e "\033[33;32m libxml2 Success";date +"%r" >> $BUILD;echo "Success : libxml2 devel Install" >> $BUILD
else
echo -e "\033[33;31m libxml2 Failed";date +"%r" >> $BUILD;echo "Failed : libxml2 devel Install" >> $BUILD
fi
if yum -y install bzip2-devel; then 
echo -e "\033[33;32m bzip2 Success";date +"%r" >> $BUILD;echo "Success : bzip devel Install" >> $BUILD
else
echo -e "\033[33;31m bzip2 Failed";date +"%r" >> $BUILD;echo "Failed : bzip devel Install" >> $BUILD
fi
if yum -y install gmp-devel; then 
echo -e "\033[33;32m gmp Success";date +"%r" >> $BUILD;echo "Success : gmp devel Install" >> $BUILD
else
echo -e "\033[33;31m gmp Failed";date +"%r" >> $BUILD;echo "Failed : gmp devel Install" >> $BUILD
fi
if yum -y install aspell-devel; then 
echo -e "\033[33;32m aspell Success";date +"%r" >> $BUILD;echo "Success : aspell devel Install" >> $BUILD
else
echo -e "\033[33;31m aspell Failed";date +"%r" >> $BUILD;echo "Failed : aspell devel Install" >> $BUILD
fi
if yum -y install recode-devel; then 
echo -e "\033[33;32m recode Success";date +"%r" >> $BUILD;echo "Success : recode devel Install" >> $BUILD
else
echo -e "\033[33;31m recode Failed";date +"%r" >> $BUILD;echo "Failed : recode devel Install" >> $BUILD
fi
if yum -y install libjpeg-devel; then 
echo -e "\033[33;32m libjpeg Success";date +"%r" >> $BUILD;echo "Success : libjpeg devel Install" >> $BUILD
else
echo -e "\033[33;31m libjpeg Failed";date +"%r" >> $BUILD;echo "Failed : libjpeg devel Install" >> $BUILD
fi
if yum -y install libpng-devel; then 
echo -e "\033[33;32m libpng Success";date +"%r" >> $BUILD;echo "Success : libpng devel Install" >> $BUILD
else
echo -e "\033[33;31m libpng Failed";date +"%r" >> $BUILD;echo "Failed : libpng devel Install" >> $BUILD
fi
if yum -y install libXpm-devel; then 
echo -e "\033[33;32m libxpm Success";date +"%r" >> $BUILD;echo "Success : libxpm devel Install" >> $BUILD
else
echo -e "\033[33;31m libxpm Failed";date +"%r" >> $BUILD;echo "Failed : libXpm devel Install" >> $BUILD
fi
if yum -y install freetype-devel; then 
echo -e "\033[33;32m freetype Success";date +"%r" >> $BUILD;echo "Success : freetype devel Install" >> $BUILD
else
echo -e "\033[33;31m freetype Failed";date +"%r" >> $BUILD;echo "Failed : freetype devel Install" >> $BUILD
fi
if yum -y install libicu-devel; then 
echo -e "\033[33;32m libicu Success";date +"%r" >> $BUILD;echo "Success : libicu devel Install" >> $BUILD
else
echo -e "\033[33;31m libicu Failed";date +"%r" >> $BUILD;echo "Failed : libicu devel Install" >> $BUILD
fi
if yum -y install libmcrypt-devel; then 
echo -e "\033[33;32m libmcrypt Success";date +"%r" >> $BUILD;echo "Success : libmcrypt devel Install" >> $BUILD
else
echo -e "\033[33;31m libmcrypt Failed";date +"%r" >> $BUILD;echo "Failed : libmcrypt devel Install" >> $BUILD
fi




 sh $SCRIPTPATH/shell/jemalloc.sh $SCRIPTPATH $cpu_num 2>&1 | tee -a openl-jemalloc.txt
 sh $SCRIPTPATH/shell/openlite.sh $SCRIPTPATH $cpu_num 2>&1 | tee -a openl-openlite.txt
 sh $SCRIPTPATH/shell/nginx.sh $SCRIPTPATH $cpu_num 2>&1 | tee -a openl-nginx.txt
 sh $SCRIPTPATH/shell/php.sh $SCRIPTPATH $cpu_num 2>&1 | tee -a openl-php.txt
 sh $SCRIPTPATH/shell/ext-php-redis.sh $SCRIPTPATH $cpu_num 2>&1 | tee -a openl-redis.txt
 sh $SCRIPTPATH/shell/ext-php-mem.sh $SCRIPTPATH $cpu_num 2>&1 | tee -a openl-mem.txt
 sh $SCRIPTPATH/shell/ext-php-zendOPcache.sh $SCRIPTPATH $cpu_num 2>&1 | tee -a openl-zendOPcache.txt
 sh $SCRIPTPATH/shell/maria.sh $SCRIPTPATH $cpu_num $dbpass 2>&1 | tee -a openl-maria.txt
 sh $SCRIPTPATH/shell/ftp.sh $SCRIPTPATH $BUILD 2>&1 | tee -a openl-ftp.txt
 
 sh $SCRIPTPATH/shell/bind.sh $BUILD 2>&1 | tee -a openl-bind.txt
  sh $SCRIPTPATH/shell/cron.sh $BUILD 2>&1 | tee -a openl-cron.txt
  sh $SCRIPTPATH/shell/maria.sh $BUILD 2>&1 | tee -a openl-maria.txt
    sh $SCRIPTPATH/shell/mail.sh $MAINDOMAIN $MAINE $MAINIP 2>&1 | tee -a openl-mail.txt
	  sh $SCRIPTPATH/shell/webmin.sh $weba $webp $webport $BUILD 2>&1 | tee -a openl-webmin.txt
   

sh $SCRIPTPATH/shell/end.sh $SCRIPTPATH $cpu_num $weba $webp $MAINE  2>&1 | tee -a openl-end.txt


