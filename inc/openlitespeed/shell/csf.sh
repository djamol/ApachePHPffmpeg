BUILD=$1
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
