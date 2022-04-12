# MariaDB (mysql) Setup ( )
# DjAmol Group Pvt Ltd.
# WWW.DjAmol.Com
# djamolpatil@gmail.com



cd $SCRIPTPATH/src
#if [ $OSN = "debian" ]
#        then


#
#  Mysql / Mariadb Installation
touch /etc/yum.repos.d/MariaDB.repo
echo -e "[mariadb]\nname = MariaDB\nbaseurl = http://yum.mariadb.org/10.2/rhel$OSV-amd64\ngpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB\ngpgcheck=1" >> /etc/yum.repos.d/MariaDB.repo
yum -y list|grep  MariaDB-server
rpm --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
if yum -y install MariaDB-server MariaDB-client MariaDB-devel MariaDB-shared; then 
echo -e "\033[33;32m extract MariaDB Success";date +"%r" >> $BUILD;echo "Success : Install MariaDB" >> $BUILD
yum -y remove postfix
else
echo -e "\033[33;31m extract MariaDB Failed";date +"%r" >> $BUILD;echo "Failed : Install MariadB" >> $BUILD;
fi
if mysql -V; then 
echo -e "\033[33;32m Mariadb is Installed";
else
yum -y install mariadb-*;
fi

yum -y install expect


#        else
#                echo "Debian MariaDB ";date +"%r" >> $BUILD;
#                apt-get install expect mariadb-*
#                curl -LsS -O https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
#                bash mariadb_repo_setup --mariadb-server-version=10.6
#                sudo apt-get update
#                sudo apt-get install mariadb-server mariadb-client  mariadb-devel mariadb-shared
#                echo "Status : OK Debian-Maria DB" >> $BUILD
#fi


if mysql -V; then 
echo -e "\033[33;32m Mariadb is Installed";
else
echo -e "\033[33;32m Mariadb is Failed";echo "Failed : Install MariadB" >> $FAILBUILD
fi

systemctl start mysql.service
##mysql_secure_installation
## MYSQL SECURE INSTALLATION Start

# Not required in actual script

SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"$MYSQL\r\"
expect \"Change the root password?\"
send \"n\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")

echo "$SECURE_MYSQL"

echo "Status: MYSQL Secure Installation Automatic Program :$SECURE_MYSQL" >> $BUILD
## MYSQL SECURE INSTALLATION End


systemctl status mysql.service
