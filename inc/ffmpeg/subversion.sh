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

_package='subversion-1.2.0.tar.gz'
clear
sleep 2
echo -e $RED"Installation of $_package ....... started"$RESET
subversion=$_package
ldconfig
cd $INSTALL_SDIR
echo "removing old source"
   rm -vrf $INSTALL_SDIR/subversion*
if [ -e "/etc/apt.conf" ];then
	apt -y install subversion
fi
if [ -e "/usr/bin/svn" ]; then
	ln -sf /usr/bin/svn /usr/local/avpffmpeg/bin/svn
else
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

   	tar -zxvf $_package
   	cd subversion-1.2.0/
   	./configure --prefix=$INSTALL_DDIR 
	make -j$cpu
if   make install; then
date +"%r" >> $BUILD;echo "Succcess :subversion Installled" >> $BUILD;
echo -e $RED" subversion Installed Success ......"$RESET
else
date +"%r" >> $BUILD;echo "Failed :subversion Installation Failed" >> $BUILD;
echo -e $RED"Failed :subversion Installation Failed ......"$RESET
fi
fi
echo -e $RED"
                        :rvri                     
                  :vJUJYri:::::i::                
            .sDgEJi                 r7i           
         .KQX7.                        .L:        
       iRRs.        5vsvv7v7Yv            Kr      
     :gd5.         5Yv7LYL777I.             M     
    PbuI  ..      ru7rrv:77rrr5              Q7   
   QUYI. .        I7r7vr .srir7j              BJ  
  g2LYj          ULr7rS   17rirJ:              Rr 
  EY7JL         i1r7rj:    2rrirU              KS 
 sUvvvI.        57rr7U     7LrrivJ             r1.
.1sv7vss       2v7r7J       sriiiJ:            r7:
:jjv77r7L     ru777vY       :7rirr2            7i:
 uJvriBMvI:   KL7vr:vuUIUI1urririrru           :r:
  Zvi1BBEiK2i:ii7:...jI2IUI11Lririrvr         ..X 
  gJ5BYB:i.iUYr:..rJ:         Jririrv7        .ur 
   DZQBu : 7Yvv77777j.        iYriiiirjr:...:iUY  
    5q: ...v:7Ls7v7uvU:        is7iriri77vvvvSr   
     :SYJ:::::. Iqr :7U.        .rLrrrrirrrsU     
       vq1vri.  Er   u75.         .::iirrJJ.      
         1JvJv.Ii  rBB:.i.    . .   ..r7i         
        LRbbPZbEKI .BR   s:....:ir7Lr:            
                  :......ir.....                 
"$RESET

echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
