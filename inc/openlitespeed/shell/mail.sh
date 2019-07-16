MAINDOMAIN=$1
MAINE=$2
MAINIP=$3

#mkdir /etc;mkdir /etc/ssl;mkdir /etc/ssl/certs;mkdir /etc/ssl/private;
#openssl req -new -x509 -days 3650 -nodes -out /etc/ssl/certs/postfix.pem -keyout /etc/ssl/private/postfix.pem

#   Config. DNS Required
# Add Entry in DNS (MX)
# Example 
# DNS(A) : mail.domain.com 00.00.00.00   (eg. [mail.Your Domain.tld] [Server IP])
# DNS(MX) : mail.domain.com 5 (eg. [mail.Your Domain.tld] [Peority:5]) 
#Example(BIND DNS):
#     mail.mobiletel.com. IN A 001.10.011.123
#     mail.mobiletel.com. IN MX 5 mail.mobiletel.com.


# INSTALL postfix(Mail Service/server)
yum -y install postfix sendmail
service sendmail start

#echo -n "Enter Domain(Eg. domain.com) > "
#read text
#echo "Your Domain: $text"
#MAINDOMAIN=$text
#MAINIP=$(hostname --ip-address)
echo "And Please Create MX Entry in Your Domain DNS: \n
Example : 
mail.$MAINDOMAIN. IN A $MAINIP
mail.$MAINDOMAIN. IN MX 5 mail.$MAINDOMAIN."

#
#
#           edit /etc/postfix/main.cf
#Then you need to edit /etc/postfix/main.cf customizing myhostname with your domain name and 
#add virtual_alias_maps and virtual_alias_domains parameters. Please also check that mynetworks is 
#configured exactly as I did, or you will make your mail server vulnerable to spam bots. 
#andreagrandi.it change to your domain in configuration setting
#You can see my complete configuration here:

echo -e 'myhostname = mail.'$MAINDOMAIN'\nsmtpd_banner = $myhostname ESMTP $mail_name (Ubuntu)
\nbiff = no
\nappend_dot_mydomain = no
\n
readme_directory = no
\nsmtpd_tls_cert_file=/etc/ssl/certs/postfix.pem
\nsmtpd_tls_key_file=/etc/ssl/private/postfix.key
\nsmtpd_use_tls=yes
\nsmtpd_tls_session_cache_database = btree:${data_directory}/smtpd_scache
\nsmtp_tls_session_cache_database = btree:${data_directory}/smtp_scache
\nsmtpd_relay_restrictions = permit_mynetworks permit_sasl_authenticated defer_unauth_destination
\nalias_maps = hash:/etc/aliases
\nalias_database = hash:/etc/aliases
\nvirtual_alias_domains = '$MAINDOMAIN'
\nvirtual_alias_maps =  hash:/etc/postfix/virtual, regexp:/etc/postfix/virtual-regexp
\nmyorigin = /etc/mailname
\nmydestination = mail.'$MAINDOMAIN', '$MAINDOMAIN', localhost.localdomain, localhost
\nmynetworks = 127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
\nmailbox_size_limit = 0
\nrecipient_delimiter = +
\ninet_interfaces = all
' >> /etc/postfix/main.cf







#Add your email aliases

#Edit /etc/postfix/virtual file and add your aliases, one per line, like in this example:
touch /etc/postfix/virtual
touch /etc/postfix/virtual-regexp

echo -e 'info@'$MAINDOMAIN' '$MAINE'
\nsupport@'$MAINDOMAIN' '$MAINE'' >> /etc/postfix/virtual


echo -e '\n#I want to forward an email from domain1.com to domain2.com using /etc/aliases
\n#The incoming email has the following syntax: mail+somerandomstring@domain1.com and should #be forwarded to mail+somerandomstring@domain2.com
\n#Solved it using regex in the virtual alias table in postfix "hash" to "regexp" /etc/postfix/main.cf>>
\n#virtual_alias_maps = regexp:/etc/postfix/virtual
\n#/etc/postfix/virtual>>
\n#/^mail+([^@]*)@domain1.com/ mail+$(1)@domain2.com
\n#/^mail+([^@]*)@djamol.com/ googleuser@gmail.com
\n/^ticket+([^@]*)@'$MAINDOMAIN'/ '$MAINE'
' >> /etc/postfix/virtual-regexp




service postfix start
postmap /etc/postfix/virtual
postmap /etc/postfix/virtual-regexp
service postfix reload
yum install mailx # Required for mail command system


################  All Emails for to one Email Address ##################

#Create /etc/postfix/virtual-regexp with the following content:
#/.+@.+/ email@gmail.com

#Edit /etc/postfix/main.cf and add regexp:/etc/postfix/virtual-regexp to the virtual_maps configuration. The end result might look like this in main.cf:

#virtual_alias_maps = hash:/etc/postfix/virtual, regexp:/etc/postfix/virtual-regexp

#Build the mapfile by typing command:

#postmap /etc/postfix/virtual-regexp

#This also requires a virtual.db to exist. If it doesn't create an empty file called virtual and run :

#touch /etc/postfix/virtual && postmap /etc/postfix/virtual



##############   Generate Ssl cerificate ################
#mkdir /etc/ssl/private/

#openssl req -new -x509 -days 3650 -nodes -out /etc/ssl/certs/dovecot.pem -keyout /etc/ssl/private/dovecot.pem
#chmod o= /etc/ssl/private/dovecot.pem

#openssl req -new -x509 -days 3650 -nodes -out /etc/ssl/certs/postfix.pem -keyout /etc/ssl/private/postfix.pem
#postconf -e smtpd_tls_cert_file=/etc/ssl/certs/postfix.pem
#postconf -e smtpd_tls_key_file=/etc/ssl/private/postfix.pem
#service dovecot restart

#service postfix restart
