#!/bin/bash
# Amol Patil
#Email US :support@djamol.com
# WEB@DjAmol.com

echo -e '                                  ..:ir7YsJYLii:.                               
                           :iL1XqEZggQgQgQgRMQRQRRDd2Yi.                        
                    .rIZBBBBBQBRgPSjLrr::.......::rv5dBQBBQ2i                   
                .vPBBBQMEbSU7i:                          :vPBBBX:               
             :IRBQQdKUj7i:.                                   rPBBq:            
          .URBQRE5v77:.......  dZdbEPEPEbZdEbZM1                 igBQL          
        :PBRZEDUrirLi...:.:.. SgPKPKPqPKPKPKPKPR7                  .PBBs        
      .EQRPbdPi:ivv7.:::::.. YgKIS25ISKPIS25IIIPM:                   .PBQv      
     JBMPKPES.:7v7vi:::::.. rgqI5252SPuJd55UI2IIPg.                    7BBZ:    
    ZBPPXqPq.:vv77rr:::::. :DPSSI52Sqg  EPIIUIUIIdd                     :BgQ7   
   RBPPSKKD::77rrrrr:::::..dbISI525SRi  :gK25UI2I2DS                     iBbMs  
  EBPPSXSbS:r7rrrriri:::..XZ55ISI55g2    LgS2IUI1I5gs      .              SQKR7 
 :BPqXKSKqqirrrrririi::..JgSXIS2S5bE. ..  XdSU222UI5Rr    . . .           .RPSQ 
 PgPXqXKSKbY:rirrriiii:.7gXSISI5IKgi .... .Dq52IUI25SR:  . . . . .         EqXP7
iEEKqSqXKXPPr:iiiii:i:.igKS5SISISEs .....  :gS52212U5qg.  . . . . . . .    qq2SY
vZPPSKSXXXSPPv::iiii:.:EPXISI5ISq2          iP2IUIUIU5Pd   ... ..... . .  .E2IIj
iZdKKXqSX5X1qd5i::i::.PbKIS5SIKSPvirv77r7r7iiS5UIUIU225bX  .............  YX1jXs
 bgPXKXX1dBR5SdZ27:..SDqSS5XXKJ1KPdDZgZDZDZZPS25UIUIU2USZu  ...........  iXjL5Pr
 iBPqXK2UBBgBSXKZDPY7U2IqXqX17srjPPqbqPqPqPPPKqIIUIUIU22XZY  .........  iUY7uKQ 
  gQqKI2BBvgB17b1KqZP5jsvsJvvSKqrLIS5SIS5S5SII2P25UI12UIUSd2.  ..... .:7vrrUKQr 
   QQXbBBXZBP:PIrrXKXSKXSUJ1P5XXPr ........ .  1d25UIUI1225PEJi.....:irrrYSKQL  
    DBPdQBBgiuuYr5qPSK5X5KSX5S5SSEY..:::::::::..5dIIU21I12UI5PddKXI5U21SSqPQ7   
     jBZX5LirLuvvb1j5XqKq5SIS5X5SSD1:.i:i:i:iii::ubS5UIUI12U225IXXXSK5X5qDg:    
      .EBMrLX12rYKJusuKUuXPD5dPbqS5E5::i:iiiiiii::7SKXI5UIUIU2U2UIUIU5SggJ      
        :dBQgPPI2J2Y21r7.1QPZr..rI55dXi:riiiririri:ivuX5X5SIIUIUI255Pggs        
          .2RQqPKqI5uu:v.Rgd: X7:ZI5KZP7irrrrrrrrrrrirrvLjuU122IIqdgq7          
             .PKKSqXPKY7EQ.i rgJBRBvrY5Ivir7777r7777v77r77vvYs5PdXL.            
            .IMgdZdEPEZDPP1Z: .EQQBivr77Psrv7vvLvYLsYssu1SXEdb2r.               
          .qBQDZDEggMgRMQQBQBDZEQRs7Jv7sEqUvssJJuuIIPPZEdSJi.                   
                           .:irrrrvus1vJJjjsLsvL77ii..                          ';

_package='flac-1.3.2.tar.xz'
clear
sleep 2
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

echo -e $RED"Installation of $_package ....... started"$RESET
cd $INSTALL_SDIR/
rm -rf flac*
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

tar -xvJf $_package
cd flac-1.3.2/
./configure --prefix=$INSTALL_DDIR

make -j$cpu
if   make install; then
date +"%r" >> $BUILD;echo "Succcess :libflac Installled" >> $BUILD;
echo -e $RED" libflac Installed Success ......"$RESET
else
date +"%r" >> $BUILD;echo "Failed :libflac Installation Failed" >> $BUILD;
echo -e $RED"Failed :libflac Installation Failed ......"$RESET
fi
ldconfig
echo -e $RED"Installation of $_package ....... Completed"$RESET
sleep 2
