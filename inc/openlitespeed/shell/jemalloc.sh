#####  Jemalloc #####
# sh centos.sh 2>&1 | tee -a mylog.txt
SRC_Source=$1/src
cpu_num=$2
cd $SRC_Source
wget -c https://github.com/djamol/centos-INSTALLER/raw/master/src/openlite/jemalloc-3.6.0.tar.bz2 -O jemalloc-3.6.0.tar.bz2
tar xjf jemalloc-3.6.0.tar.bz2
cd jemalloc*
./configure 
make -j $cpu_num 
make install
echo '/usr/local/lib' > /etc/ld.so.conf.d/local.conf
ldconfig
