SRC_Source=$1/src
cpu_num=$2
PWD_DIR=$1

cd $SRC_Source
wget --no-check-certificate https://djamol.com/nginx/ZendOptimizerPlus-master.zip -O ZendOptimizerPlus-master.zip

unzip ZendOptimizerPlus-master.zip
cd ZendOptimizerPlus-master
/usr/local/lsws/lsphp5/bin/phpize
./configure --with-php-config=/usr/local/lsws/lsphp5/bin/php-config
make -j $cpu_num && make install

cat >> /usr/local/lsws/lsphp5/lib/php.ini <<EOF
[opcache]
zend_extension="/usr/local/lsws/lsphp5/lib/php/extensions/`ls /usr/local/lsws/lsphp5/lib/php/extensions/`/opcache.so"
opcache.memory_consumption=128
opcache.interned_strings_buffer=8
opcache.max_accelerated_files=4000
opcache.revalidate_freq=60
opcache.save_comments=0
opcache.fast_shutdown=1
opcache.enable_cli=1
opcache.optimization_level=0
EOF

cp $PWD_DIR/conf/opcache.php /home/www


