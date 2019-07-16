SRC_Source=$1/src
cpu_num=$2
PWD_DIR=$1

cd $SRC_Source
wget https://github.com/djamol/centos-INSTALLER/raw/master/src/openlite/redis-2.8.11.tar.gz -O redis-2.8.11.tar.gz
tar zxf redis-2.8.11.tar.gz
cd redis-2.8.11
/usr/local/lsws/lsphp5/bin/phpize
./configure --with-php-config=/usr/local/lsws/lsphp5/bin/php-config
make  && make install

if [ -f "/usr/local/lsws/lsphp5/lib/php/extensions/`ls /usr/local/lsws/lsphp5/lib/php/extensions`/redis.so" ];then
    sed -i 's/; extension_dir = ".\/"/extension_dir = ".\/"/g' /usr/local/lsws/lsphp5/lib/php.ini
    [ ! -z "`cat /usr/local/lsws/lsphp5/lib/php.ini | grep '^extension_dir'`" ] && sed -i "s@extension_dir = \".*\"@extension_dir = \"/usr/local/lsws/lsphp5/lib/php/extensions/`ls /usr/local/lsws/lsphp5/lib/php/extensions/`\"@" /usr/local/lsws/lsphp5/lib/php.ini
    sed -i 's@^extension_dir\(.*\)@extension_dir\1\nextension = "redis.so"@' /usr/local/lsws/lsphp5/lib/php.ini
fi
if [ `getconf LONG_BIT` = 32 ]; then
    sed -i '1i\CFLAGS= -march=i686' src/Makefile
    sed -i 's@^OPT=.*@OPT=-O2 -march=i686@' src/.make-settings
fi

make -j $cpu_num

if [ -f src/redis-server ]; then
    mkdir -p /usr/local/redis/{bin,etc,var}
    cp src/{redis-benchmark,redis-check-aof,redis-check-dump,redis-cli,redis-sentinel,redis-server} /usr/local/redis/bin/
    cp redis.conf /usr/local/redis/etc/
    ln -s /usr/local/redis/bin/* /usr/local/bin/
    sed -i 's@pidfile.*@pidfile /var/run/redis.pid@' /usr/local/redis/etc/redis.conf
    sed -i "s@logfile.*@logfile /usr/local/redis/var/redis.log@" /usr/local/redis/etc/redis.conf
    sed -i "s@^dir.*@dir /usr/local/redis/var@" /usr/local/redis/etc/redis.conf
    sed -i 's@daemonize no@daemonize yes@' /usr/local/redis/etc/redis.conf

    Memtatol=`free -m | grep 'Mem:' | awk '{print $2}'`
    if [ $Memtatol -le 512 ];then
        [ -z "`grep ^maxmemory /usr/local/redis/etc/redis.conf`" ] && sed -i 's@maxmemory <bytes>@maxmemory <bytes>\nmaxmemory 64000000@' /usr/local/redis/etc/redis.conf
    elif [ $Memtatol -gt 512 -a $Memtatol -le 1024 ];then
        [ -z "`grep ^maxmemory /usr/local/redis/etc/redis.conf`" ] && sed -i 's@maxmemory <bytes>@maxmemory <bytes>\nmaxmemory 128000000@' /usr/local/redis/etc/redis.conf
    elif [ $Memtatol -gt 1024 -a $Memtatol -le 1500 ];then
        [ -z "`grep ^maxmemory /usr/local/redis/etc/redis.conf`" ] && sed -i 's@maxmemory <bytes>@maxmemory <bytes>\nmaxmemory 256000000@' /usr/local/redis/etc/redis.conf
    elif [ $Memtatol -gt 1500 -a $Memtatol -le 2500 ];then
        [ -z "`grep ^maxmemory /usr/local/redis/etc/redis.conf`" ] && sed -i 's@maxmemory <bytes>@maxmemory <bytes>\nmaxmemory 360000000@' /usr/local/redis/etc/redis.conf
    elif [ $Memtatol -gt 2500 -a $Memtatol -le 3500 ];then
        [ -z "`grep ^maxmemory /usr/local/redis/etc/redis.conf`" ] && sed -i 's@maxmemory <bytes>@maxmemory <bytes>\nmaxmemory 512000000@' /usr/local/redis/etc/redis.conf
    elif [ $Memtatol -gt 3500 ];then
        [ -z "`grep ^maxmemory /usr/local/redis/etc/redis.conf`" ] && sed -i 's@maxmemory <bytes>@maxmemory <bytes>\nmaxmemory 1024000000@' /usr/local/redis/etc/redis.conf
    fi
fi


   cp $PWD_DIR/conf/redis-centos /etc/init.d/redis
    chmod +x /etc/init.d/redis
    chkconfig --add redis
chkconfig redis on
service redis start

cp $PWD_DIR/conf/redis.php /home/www
