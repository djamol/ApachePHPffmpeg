if [[ ${EUID} -ne 0 ]]; then

  echo -e "ERROR: THIS SCRIPT MUST BE RUN AS ROOT!"
  echo -e "------> USE SUPER-USER PRIVILEGES."
  exit 1
  else
  echo -e "PASS: ROOT!"
fi

# do we have CentOS 7?
if grep "CentOS.* 7\." /etc/redhat-release  > /dev/null 2>&1; then
  echo -e "PASS: CENTOS RELEASE 7"
  else
  echo -e "ERROR: UNABLE TO DETERMINE DISTRIBUTION TYPE."
  echo -e "------> THIS CONFIGURATION FOR CENTOS 7"
##  exit 1
fi

# check if x64.
ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
  echo -e "PASS: YOUR ARCHITECTURE IS 64-BIT"
  else  
  echo -e "ERROR: YOUR ARCHITECTURE IS 32-BIT?"
  echo -e "------> CONFIGURATION FOR 64-BIT ONLY."  
##  exit 1
fi
yum -y install wget unzip;
wget --no-check-certificate -O installer.zip https://github.com/djamol/ApachePHPffmpeg/archive/amol.zip; 
unzip installer.zip; cd ApachePHPffmpeg-amol;chmod +x autoinstall;chmod +x inc/*.sh; ./autoinstall 
