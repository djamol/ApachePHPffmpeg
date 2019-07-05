mkdir /etc/htpasswd

rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
yum --enablerepo=epel install awstats -y

# htpasswd -c /etc/local/user amol

cp -f $SCRIPTPATH/conf/awstats.conf /usr/local/apache2/conf/amolhost/awstats.conf

#WEBA="test1"
#WEBP="djamol007"
SSLCERt=$(expect -c "
set timeout 35
  spawn htpasswd -c /etc/htpasswd/.htpasswd $WEBA
  expect \"password*:\"
  send \"$WEBP\r\"
  expect \"password*:\"
 send \"$WEBP\r\"
expect eof
")
echo "$SSLCERt"


cp /etc/awstats/awstats.localhost.localdomain.conf etc/awstats/awstats.$MAINDOMAIN.conf
