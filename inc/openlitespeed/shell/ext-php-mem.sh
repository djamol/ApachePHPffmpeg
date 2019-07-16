SRC_Source=$1/src
cpu_num=$2
PWD_DIR=$1

cd $SRC_Source
useradd -M -s /sbin/nologin memcached
wget https://github.com/djamol/centos-INSTALLER/raw/master/src/openlite/memcached-1.4.20.tar.gz -O memcached-1.4.20.tar.gz
wget --no-check-certificate -c https://github.com/djamol/centos-INSTALLER/raw/master/src/openlite/libmemcached-1.0.18.tar.gz -O libmemcached-1.0.18.tar.gz
wget  https://github.com/djamol/centos-INSTALLER/raw/master/src/openlite/memcache-2.2.7.tgz -O memcache-2.2.7.tgz
tar zxf memcached-1.4.20.tar.gz
cd memcached-1.4.20
./configure --prefix=/usr/local/memcached
make && make install

ln -s /usr/local/memcached/bin/memcached /usr/bin/memcached

 cp $PWD_DIR/conf/memcached-centos /etc/init.d/memcached
  chmod +x /etc/init.d/memcached
    chkconfig --add memcached
chkconfig memcached on
service memcached start
cd $SRC_Source
tar zxf memcache-2.2.7.tgz
cd memcache-2.2.7
/usr/local/lsws/lsphp5/bin/phpize
./configure --with-php-config=/usr/local/lsws/lsphp5/bin/php-config
make && make install

if [ -f "/usr/local/lsws/lsphp5/lib/php/extensions/`ls /usr/local/lsws/lsphp5/lib/php/extensions`/memcache.so" ];then
    sed -i 's/; extension_dir = ".\/"/extension_dir = ".\/"/g' /usr/local/lsws/lsphp5/lib/php.ini
    [ ! -z "`cat /usr/local/lsws/lsphp5/lib/php.ini | grep '^extension_dir'`" ] && sed -i "s@extension_dir = \".*\"@extension_dir = \"/usr/local/lsws/lsphp5/lib/php/extensions/`ls /usr/local/lsws/lsphp5/lib/php/extensions/`\"@" /usr/local/lsws/lsphp5/lib/php.ini
    sed -i 's@^extension_dir\(.*\)@extension_dir\1\nextension = "memcache.so"@' /usr/local/lsws/lsphp5/lib/php.ini
fi

cd $SRC_Source
tar zxf libmemcached-1.0.18.tar.gz
cd libmemcached-1.0.18

#check gcc version
if [ ! -z "`gcc --version | head -n1 | grep 4\.1`" ]; then
    yum -y install gcc44 gcc44-c++ libstdc++44-devel
    export CC=/usr/bin/gcc44
    export CXX=/usr/bin/g++44
fi
./configure --with-memcached=/usr/local/memcached
make && make install




cp $PWD_DIR/conf/memcached.php /home/www
