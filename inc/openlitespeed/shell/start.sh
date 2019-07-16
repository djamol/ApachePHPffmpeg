SCRIPTPATH=$(dirname "$SCRIPT")
##SRC_Source="/src"
PWD_DIR=$SCRIPTPATH/conf
cpu_num=`cat /proc/cpuinfo | grep processor | wc -l`

 sh $SCRIPTPATH/inc/openlite/jemalloc.sh 2>&1 | tee -a openl-jemalloc.txt
 sh $SCRIPTPATH/inc/openlite/openlite.sh 2>&1 | tee -a openl-openlite.txt
 sh $SCRIPTPATH/inc/openlite/nginx.sh 2>&1 | tee -a openl-jemalloc.txt
 sh $SCRIPTPATH/inc/openlite/php.sh 2>&1 | tee -a openl-php.txt
 sh $SCRIPTPATH/inc/openlite/ext-php-redis.sh 2>&1 | tee -a openl-redis.txt
 sh $SCRIPTPATH/inc/openlite/ext-php-mem.sh 2>&1 | tee -a openl-mem.txt
 sh $SCRIPTPATH/inc/openlite/ext-php-zendOPcache.sh 2>&1 | tee -a openl-zendOPcache.txt
 sh $SCRIPTPATH/inc/openlite/end.sh 2>&1 | tee -a openl-end.txt
