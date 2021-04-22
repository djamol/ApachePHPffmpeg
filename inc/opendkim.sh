DOMAIN=example.com
# $SCRIPTPATH/conf/awstats.conf /usr/local/apache2/conf/amolhost/awstats.conf
#opendkim-genkey -b 2048 -d domain.com -D /etc/opendkim/keys/domain.com  -s 20200308 -v
##TEst key
## opendkim-testkey -d  domain.com  -s 20200308 -vvv
yum install -y opendkim
sed -i "39s/Mode\t v/Mode\tsv/" /etc/opendkim.conf
sed -i '103s/# KeyTable/KeyTable/' /etc/opendkim.conf
sed -i '108s/# SigningTable/SigningTable/' /etc/opendkim.conf
sed -i '115s/# InternalHosts/InternalHosts/' /etc/opendkim.conf


#echo "AutoRestart             Yes" >> /etc/opendkim.conf
#echo "AutoRestartRate         10/1h" >> /etc/opendkim.conf
#echo "UMask                   002" >> /etc/opendkim.conf
#echo "Syslog                  yes" >> /etc/opendkim.conf
#echo "SyslogSuccess           Yes" >> /etc/opendkim.conf
#echo "LogWhy                  Yes" >> /etc/opendkim.conf
#echo "Canonicalization        relaxed/simple" >> /etc/opendkim.conf
#echo "ExternalIgnoreList      refile:/etc/opendkim/TrustedHosts" >> /etc/opendkim.conf
#echo "InternalHosts           refile:/etc/opendkim/TrustedHosts" >> /etc/opendkim.conf
#echo "KeyTable                refile:/etc/opendkim/KeyTable" >> /etc/opendkim.conf
#echo "SigningTable            refile:/etc/opendkim/SigningTable" >> /etc/opendkim.conf
#echo "Mode                    sv" >> /etc/opendkim.conf
#echo "PidFile                 /var/run/opendkim/opendkim.pid" >> /etc/opendkim.conf
#echo "SignatureAlgorithm      rsa-sha256" >> /etc/opendkim.conf
#echo "UserID                  opendkim:opendkim" >> /etc/opendkim.conf
#echo "Socket                  inet:12301@localhost" >> /etc/opendkim.conf

#cat >> /etc/opendkim/SigningTable <<EOF
#*@example.com default._domainkey.example.com
#EOF
#cat >> TrustedHosts <<EOF
# your all of server ip address.
#EOF

iptables -A INPUT -p tcp --dport 465 -j ACCEPT
mkdir -p /etc/opendkim/keys/$DOMAIN
opendkim-genkey -D /etc/opendkim/keys/$DOMAIN/ -d $DOMAIN -s default
echo -e  '*@$DOMAIN $DOMAIN'>>  /etc/opendkim/SigningTable
echo -e '$DOMAIN $DOMAIN:default:/etc/opendkim/keys/$DOMAIN/default.private' >>   /etc/opendkim/KeyTable
echo "127.0.0.1" > /etc/opendkim/TrustedHosts
echo "localhost" >> /etc/opendkim/TrustedHosts
echo -e '*.$DOMAIN'  >> /etc/opendkim/TrustedHosts
chown opendkim:opendkim /etc/opendkim/keys/ -R
 
systemctl start opendkim
systemctl enable opendkim

## POSTFIX WITH Opendkim
cat >> /etc/postfix/main.cf <<'EOF'
#smtpd_milters setting
smtpd_milters           = inet:127.0.0.1:8891
non_smtpd_milters       = $smtpd_milters
milter_protocol         = 2
milter_default_action   = accept
EOF

systemctl restart postfix

echo "Success : ADD TXT Record $DOMAIN \n " >> $BUILD

cat  /etc/opendkim/keys/$DOMAIN/default.txt >> $BUILD

postmap -q domain.com  mysql:/etc/postfix/mysql-virtual_domains.cf
postmap -q amol@domain.com  mysql:/etc/postfix/mysql-virtual_mailboxes.cf
service postfix reload
