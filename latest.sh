yum -y install wget unzip;
wget --no-check-certificate -O installer.zip https://github.com/djamol/ApachePHPffmpeg/archive/amol.zip; 
unzip installer.zip; cd ApachePHPffmpeg-amol;chmod +x autoinstall;chmod +x inc/*.sh; ./autoinstall 
