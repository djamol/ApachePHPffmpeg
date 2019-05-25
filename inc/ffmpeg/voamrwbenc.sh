#!/bin/bash
# Amol Patil
#Email US :support@djamol.com
 # WEB@DjAmol.com
echo -e '
 ▒█░▒░▓█░█▒░▒▒█░█▓░▒░█▓   █████▒    ▓█ ▒█▓▓█▓ ██████ ▓████▒░█░      ░█████░▒████▓ ▓█████░ 
 ░▓ █▓▓█ ▓ ██▒█░▓░▓█░█▓   ▓▒  █▓    ▒█ ▒▓▓▓█▓ ▓░█▓▒█░▓▒  █▓ ▓       ░█░  ▓ ▒▓  ▓█ ▓▒▓█▒█▒ 
 ▒█▒█▓▓█░█▓▓█▒█▒█▓▓█▒█▓   █▓  █▓░▓░ ▓█ ██▒▒█▓░█▒█▓▒█░██  █▓░█▒  ░   ▒█▒ ░▓ ██  ██ █▓▓█░█▒ 
 ░█████▓ ██████ ▓█████░▓█ █████░░█████ █▓  █▓░█▒░░▒█ ▓████▒░█████▒█▓ █████ ▒████▓ █▓░▒░█▒ 
';
echo -e "$GREEN 
# Powered By DjAmol Group Inc         #
# Email : Support@djamol.com          #
# Website : www.djamol.com            #
# Copyright By PatilWeb.com           #
# IG:PatilWeb FB:PatilWeb TW:PatilWeb #
$RESET";

_package='vo-amrwbenc-0.1.3.tar.gz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
cd $INSTALL_SDIR/
rm -rf vo-amrwbenc*
   cd $INSTALL_SDIR

if [ ! -f $SCRIPTPATH/src/ffmpeg/$_package ]
then
   echo -e "\033[33;34m file " $_package " does not exist.";

		if wget -O  $_package $SOURCE_URL/$_package; then 
		date +"%r" >> $BUILD;echo "Success : File Download $_package" >> $BUILD
		else
		date +"%r" >> $BUILD;echo "Failed : File Download $_package" >> $BUILD
		fi
else
		cp $SCRIPTPATH/src/ffmpeg/$_package $INSTALL_SDIR/
		echo -e "\033[33;32m file " $_package " exists.";date +"%r" >> $BUILD;echo "Status : Already Exist $_package" >> $BUILD
fi

tar -xvzf $_package
cd vo-amrwbenc-0.1.3/
	./configure  --prefix=$INSTALL_DDIR
	make -j$cpu
if   make install; then
date +"%r" >> $BUILD;echo "Succcess :vo-amrwbenc Installled" >> $BUILD;
echo -e $RED" vo-amrwbenc Installed Success ......"$RESET
else
date +"%r" >> $BUILD;echo "Failed :vo-amrwbenc Installation Failed" >> $BUILD;
echo -e $RED"Failed :vo-amrwbenc Installation Failed ......"$RESET
fi
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
