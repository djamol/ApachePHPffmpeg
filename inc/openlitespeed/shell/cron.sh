BUILD=$1
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
