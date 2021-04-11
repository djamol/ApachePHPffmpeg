yum install postfix dovecot dovecot-mysql system-switch-mail -y
mkdir -p /backup/postfix
cp -rf /etc/postfix/* /backup/postfix/
mkdir -p /backup/dovecot
cp -rf /etc/dovecot/*.conf /backup/dovecot/


cp $BASE_DIR/postfix/mysql* /etc/postfix/
chown root:postfix /etc/postfix/mysql-virtual_*.cf
chmod 644 /etc/postfix/mysql-virtual_*.cf
groupadd -g 5000 vmail
useradd -g vmail -u 5000 vmail -d /home/vmail -m


#openssl req -new -x509 -days 3650 -nodes -out /etc/ssl/certs/postfix.pem -keyout /etc/ssl/private/postfix.pem
SSLCERt=$(expect -c "
set timeout 35
  spawn openssl req -new -x509 -days 3650 -nodes -out /etc/ssl/certs/postfix2.pem -keyout /etc/ssl/private/postfix2.pem
  expect \"Country Name*:\"
  send \"$CAC\r\"
  expect \"State*:\"
  send \"$CAS\r\"
  expect \"Locality*:\"
  send \"$CAL\r\"
  expect \"Organization Name*:\"
  send \"$CAO\r\"
  expect \"Organizational Unit*:\"
  send \"$CAU\r\"
  expect \"Common Name*:\"
  send \"$mails\r\"
  expect \"Email*:\"
  send \"$CAM\r\"
expect eof
")
echo "$SSLCERt"

postconf -e 'myhostname =  woho.co.in'
postconf -e 'mydestination = localhost, localhost.localdomain, mail.woho.co.in'
postconf -e 'mynetworks = 127.0.0.0/8'
postconf -e 'inet_interfaces = all'
postconf -e 'message_size_limit = 30720000'
postconf -e 'virtual_alias_domains ='
postconf -e 'virtual_alias_maps = proxy:mysql:/etc/postfix/mysql-virtual_forwardings.cf, mysql:/etc/postfix/mysql-virtual_email2email.cf'
postconf -e 'virtual_mailbox_domains = proxy:mysql:/etc/postfix/mysql-virtual_domains.cf'
postconf -e 'virtual_mailbox_maps = proxy:mysql:/etc/postfix/mysql-virtual_mailboxes.cf'
postconf -e 'virtual_mailbox_base = /home/vmail'
postconf -e 'virtual_uid_maps = static:5000'
postconf -e 'virtual_gid_maps = static:5000'
postconf -e 'smtpd_sasl_type = dovecot'
postconf -e 'smtpd_sasl_path = private/auth'
postconf -e 'smtpd_sasl_auth_enable = yes'
postconf -e 'broken_sasl_auth_clients = yes'
postconf -e 'smtpd_sasl_authenticated_header = yes'
postconf -e 'smtpd_recipient_restrictions = permit_mynetworks, permit_sasl_authenticated, reject_unauth_destination'
postconf -e 'smtpd_use_tls = yes'
postconf -e 'smtpd_tls_cert_file = /etc/ssl/certs/postfix2.pem'
postconf -e 'smtpd_tls_key_file = /etc/ssl/private/postfix2.pem'
postconf -e 'virtual_create_maildirsize = yes'
postconf -e 'virtual_maildir_extended = yes'
postconf -e 'proxy_read_maps = $local_recipient_maps $mydestination $virtual_alias_maps $virtual_alias_domains $virtual_mailbox_maps $virtual_mailbox_domains $relay_recipient_maps $relay_domains $canonical_maps $sender_canonical_maps $recipient_canonical_maps $relocated_maps $transport_maps $mynetworks $virtual_mailbox_limit_maps'
postconf -e 'virtual_transport = dovecot'
postconf -e 'dovecot_destination_recipient_limit = 1'
echo 'dovecot   unix  -       n       n       -       -       pipe	flags=DRhu user=vmail:vmail argv=/usr/libexec/dovecot/deliver -f ${sender} -d ${recipient}' >> /etc/postfix/master.cf




cp $BASE_DIR/dovecot/dovecot.conf /etc/dovecot/dovecot.conf
cp $BASE_DIR/dovecot/dovecot-sql.conf /etc/dovecot/dovecot-sql.conf
chgrp dovecot /etc/dovecot/dovecot-sql.conf
chmod o= /etc/dovecot/dovecot-sql.conf

cp $BASE_DIR/postfix/aliases /etc/aliases
chown root:root /etc/aliases
newaliases


##mysql -u root -p '' < $BASE_DIR/sql/mail.sql 
##mysql -u root -p '' < $BASE_DIR/sql/setmailbox.sql 

CREATE DATABASE mail;
USE mail;

GRANT SELECT, INSERT, UPDATE, DELETE ON mail.* TO 'mail_admin'@'localhost' IDENTIFIED BY 'whynotchangeme';
GRANT SELECT, INSERT, UPDATE, DELETE ON mail.* TO 'mail_admin'@'localhost.localdomain' IDENTIFIED BY 'whynotchangeme';
FLUSH PRIVILEGES;

CREATE TABLE domains (domain varchar(50) NOT NULL, PRIMARY KEY (domain) );
CREATE TABLE forwardings (source varchar(80) NOT NULL, destination TEXT NOT NULL, PRIMARY KEY (source) );
CREATE TABLE users (email varchar(80) NOT NULL, password varchar(20) NOT NULL, PRIMARY KEY (email) );
CREATE TABLE transport ( domain varchar(128) NOT NULL default '', transport varchar(128) NOT NULL default '', UNIQUE KEY domain (domain) );
USE mail;
INSERT INTO domains (domain) VALUES ('woho.co.in');
INSERT INTO users (email, password) VALUES ('amol@woho.co.in', ENCRYPT('amol'));

sudo postmap -q woho.co.in  mysql:/etc/postfix/mysql-virtual_domains.cf
sudo postmap -q amol@woho.co.in  mysql:/etc/postfix/mysql-virtual_mailboxes.cf
echo "And Please Create MX Entry in Your Domain DNS: \n
Example : 
mail.$MAINDOMAIN. IN A $MAINIP
mail.$MAINDOMAIN. IN MX 5 mail.$MAINDOMAIN.
Another Domain (Entry)
anotherdomain.com IN MX 5 mail.$MAINDOMAIN.
google.com IN MX 5 mail.$MAINDOMAIN.
yahoo.com IN MX 5 mail.$MAINDOMAIN.
And run below commands
sudo postmap -q woho.co.in  mysql:/etc/postfix/mysql-virtual_domains.cf
sudo postmap -q amol@woho.co.in  mysql:/etc/postfix/mysql-virtual_mailboxes.cf
service postfix reload
"

service postfix restart
service dovecot restart

