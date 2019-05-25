# HIDE Apache Version,PHP,Openssl details on http 
#Example : Apache/2.4.18 (Unix) OpenSSL/1.0.2g PHP/5.6.20 To only Show ("apache")
echo -e '\nServerSignature Off\nServerTokens Prod\n' >> /usr/local/apache2/conf/httpd.conf


echo "Domain Added (MAIN):$MAINDOMAIN (Domain Directory:/home/www)"

if [ $EXTRAD = "no" ]
    then 
    echo "No Extra Domain Founds "
   else
echo "Request By You Domains: $EXTRAD (...Wait..)"

IFS=', ' read -r -a array <<< "$EXTRAD"
for element in "${array[@]}"
do
    echo -e '<VirtualHost '$MAINIP':80>\nServerName '$element'\nServerAlias www.'$element'\nDocumentRoot /home/www/domain/'$element'\nServerAdmin webmaster@djamol.com\n</VirtualHost>' >> /usr/local/apache2/conf/httpd.conf
    echo -e '$TTL 14400\n@      86400	IN      SOA     ns1.'$MAINDOMAIN'. djamolpatil.gmail.com. (\n		2016033003	; serial, todays date+todays\n		3600		; refresh, seconds\n		7200		; retry, seconds\n		1209600		; expire, seconds\n		86400 )		; minimum, seconds\n\n'$element'. 86400 IN NS ns1.'$MAINDOMAIN'.\n'$element'. 86400 IN NS ns2.'$MAINDOMAIN'.\n\n\n'$element'. IN A '$MAINIP'\nmail.'$element'. IN A '$MAINIP'\nmail.'$element'. IN MX 5 mail.'$element'.\n\nwww IN CNAME '$element'.\nftp IN CNAME '$element'.\n' >> /var/named/$element.db
    echo -e '\nzone "'$element'" {	type master;	file "/var/named/'$element'.db";};' >> /etc/named.main.zones
    echo "Domain Added :$element (Domain Directory:/home/www/domain/$element)"
done

fi


if [ $EXTRADS = "no" ]
    then 
    echo "No Extra Domain Founds "
   else
echo "Request By You Domains For HTTPS Enable: $EXTRADS (...Wait..)"

                        IFS=', ' read -r -a array <<< "$EXTRADS"
                        for element in "${array[@]}"
                        do
                        echo -e '<VirtualHost '$MAINIP':443>\nServerName '$element'\nServerAlias www.'$element'\nDocumentRoot /home/www/domain/'$element'\n<IfModule mod_ssl.c>\nSSLEngine on\n        SSLCertificateFile /usr/share/ssl/certs/ssl.crt\n        SSLCertificateKeyFile /usr/share/ssl/certs/ssl.crt\n    </IfModule>\n</VirtualHost>\n' >> /usr/local/apache2/conf/httpd.conf
                        echo "Domain HTTPS enable :$element Done"
                         done


fi




