# Cron JOB Setup Program ( )
# DjAmol Group Pvt Ltd.
# WWW.DjAmol.Com
# djamolpatil@gmail.com



wget https://curl.haxx.se/ca/cacert.pem
if cp cacert.pem /usr/local/ssl/cert.pem; then 
echo -e "\033[33;32m cronie For Cert.pem Success";date +"%r" >> $BUILD;echo "Success : cert.pem devel Install" >> $BUILD
else
cp $SCRIPTPATH/src/cacert.pem /usr/local/ssl/cert.pem; echo -e "\033[33;31m cronie For Cert.pem Failed";date +"%r" >> $BUILD;echo "Failed : cert.pem Certification from curl.haxx.se website Install" >> $BUILD
fi
cp php.ini-production /usr/local/lib/php.ini
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /usr/share/ssl/certs/test.pem -out /usr/share/ssl/certs/test.pem
#OR cp php.ini-development /usr/php.ini



#start apache

#while true; do
#    read -p "Do you want to Start Apache program?" yn
#    case $yn in
#        [Yy]* ) /usr/local/apache2/bin/apachectl start;date +"%r" >> $BUILD;echo "Start Apache" >> $BUILD; break;;
#        [Nn]* ) date +"%r" >> $BUILD;echo "Reject By You : Please Start Manualy Apache Program" >> $BUILD; break;;
#        * ) echo "Please answer yes or no.";;
#    esac
#done
/usr/local/apache2/bin/apachectl start;date +"%r" >> $BUILD;echo "Start Apache" >> $BUILD; 


#Install CronJOB
if yum -y install cronie; then 
echo -e "\033[33;32m cronie For CronJOB Success";date +"%r" >> $BUILD;echo "Success : Cronie for cronjob Install" >> $BUILD
else
echo -e "\033[33;31m cronie For CronJoB Failed";date +"%r" >> $BUILD;echo "Failed : cronie for CronJOB Install" >> $BUILD
fi
chkconfig crond on
service crond start
service crond status
date +"%r" >> $BUILD;echo "Cronjob Program Complete" >> $BUILD
