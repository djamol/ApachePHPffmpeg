# CSF Setup Program  )
# DjAmol Group Pvt Ltd.
# WWW.DjAmol.Com
# djamolpatil@gmail.com


#Install CSF
#cd $SCRIPTPATH
#rm -fv csf.tgz
cd $SCRIPTPATH/src
FILE=csf.tgz
if [ ! -f $FILE ]
then
		echo -e "\033[33;34m file " $FILE " does not exist.";date +"%r" >> $BUILD;echo "Status : Downloading $FILE" >> $BUILD
		wget http://www.configserver.com/free/csf.tgz
else
		echo -e "\033[33;32m file " $FILE " exists.";date +"%r" >> $BUILD;echo "Status : Exist $FILE" >> $BUILD
fi

tar -xzf csf.tgz
cd csf
sh install.sh
date +"%r" >> $BUILD;echo "CSF Program Complete" >> $BUILD

sh /usr/local/csf/bin/remove_apf_bfd.sh


 sed -i '/TESTING =/c\TESTING = "0"' /etc/csf/csf.conf
 sed -i '/TCP_IN =/c\TCP_IN = "20,21,22,25,53,55,2066,80,110,143,443,465,587,993,995"' /etc/csf/csf.conf
 sed -i '/TCP_OUT =/c\TCP_OUT = "20,21,22,25,53,80,2066,110,113,443,587,993,995"' /etc/csf/csf.conf
 sed -i '/UDP_IN =/c\UDP_IN = "20,21,53"' /etc/csf/csf.conf
 sed -i '/UDP_OUT =/c\UDP_OUT = "20,21,53,113,123"' /etc/csf/csf.conf
 sed -i '/PORTFLOOD =/c\PORTFLOOD = "80;tcp;50;10"' /etc/csf/csf.conf
 sed -i '/CONNLIMIT =/c\CONNLIMIT = "80;10,55;2"' /etc/csf/csf.conf
 sed -i '/CT_LIMIT =/c\CT_LIMIT = "100"' /etc/csf/csf.conf
 sed -i '/CT_PERMANENT =/c\CT_PERMANENT = "1"' /etc/csf/csf.conf
 sed -i '/CT_INTERVAL =/c\CT_INTERVAL = "60"' /etc/csf/csf.conf
 sed -i '/CT_BLOCK_TIME =/c\CT_BLOCK_TIME = "3600"' /etc/csf/csf.conf
   csf -r
  
