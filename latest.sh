yum -y install wget unzip;
wget --no-check-certificate -O installer.zip https://github.com/djamol/ApachePHPffmpeg/archive/master.zip; 
unzip installer.zip; cd ApachePHPffmpeg-master;chmod +x autoinstall;chmod +x inc/*.sh; ./autoinstall 