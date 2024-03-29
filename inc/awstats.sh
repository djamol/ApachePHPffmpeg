##access asstats GUI WEB PAGE
##http://example.com/awstats/?config=example.com
##http://example.com/awstats/?config=domain.in
mkdir /etc/htpasswd

rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
yum --enablerepo=epel install awstats -y

# htpasswd -c /etc/local/user amol

cp -f $SCRIPTPATH/conf/awstats.conf /usr/local/apache2/conf/amolhost/awstats.conf

#WEBA="test1"
#WEBP="djamol007"
SSLCERt=$(expect -c "
set timeout 35
  spawn /usr/local/apache2/bin/htpasswd -c /etc/htpasswd/.htpasswd $WEBA
  expect \"password*:\"
  send \"$WEBP\r\"
  expect \"password*:\"
 send \"$WEBP\r\"
expect eof
")
echo "$SSLCERt"

#GeoIP
# sh geoip.sh

cp /etc/awstats/awstats.localhost.localdomain.conf /etc/awstats/awstats.$MAINDOMAIN.conf
sed -i "s/localhost.localdomain/$MAINDOMAIN/" /etc/awstats/awstats.$MAINDOMAIN.conf
sed -i "s/^LogFile.*/LogFile=\"/usr/local/apache2/logs/access_log\"/" /etc/awstats/awstats.$MAINDOMAIN.conf
sed -i "s/^HostAliases.*/HostAliases=\"localhost\ 127.0.0.1\ ${MAINDOMAIN}\"/" /etc/awstats/awstats.$MAINDOMAIN.conf
/usr/share/awstats/wwwroot/cgi-bin/awstats.pl -config=$MAINDOMAIN -update
## cronjob update daily

echo "0 * * * * /usr/share/awstats/wwwroot/cgi-bin/awstats.pl -config=${MAINDOMAIN} -update" >> /var/spool/cron/root
