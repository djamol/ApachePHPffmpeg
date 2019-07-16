BUILD=$1
#  Mysql / Mariadb Installation
touch /etc/yum.repos.d/MariaDB.repo
echo -e '[mariadb]\nname = MariaDB\nbaseurl = http://yum.mariadb.org/10.2/rhel7-amd64\ngpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB\ngpgcheck=1' >> /etc/yum.repos.d/MariaDB.repo
yum -y list|grep  MariaDB-server
rpm --import https://yum.mariadb.org/RPM-GPG-KEY-MariaDB
if yum -y install MariaDB-server MariaDB-client MariaDB-devel MariaDB-shared; then 
echo -e "\033[33;32m extract MariaDB Success";date +"%r" >> $BUILD;echo "Success : Install MariaDB" >> $BUILD
yum -y remove postfix
else
echo -e "\033[33;31m extract MariaDB Failed";date +"%r" >> $BUILD;echo "Failed : Install MariadB" >> $BUILD
fi
systemctl start mysql.service
##mysql_secure_installation
## MYSQL SECURE INSTALLATION Start
yum -y install expect

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
