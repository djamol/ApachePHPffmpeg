#!/bin/bash
# Amol Patil
#Email US :support@djamol.com
 # WEB@DjAmol.com
RED='\033[01;31m'
RESET='\033[0m'
GREEN='\033[01;32m'
_version=`cat ./version.txt`
clear
echo -e "$GREEN*************************************************************$RESET"
echo -e "          FFmpeg  Installation Wizard  Version $GREEN $_version $RESET"
echo -e "       Copyright (c) 2007-2014  http://syslint.com/"
echo -e "   Linux Server Management And Software Development Services  "
echo -e "$GREEN*************************************************************$RESET"
echo " "
echo " "
export who=`whoami`
lpid=$$
echo "">/var/log/ffmpeginstall.$_version.log.$lpid
echo " All operations are loged to /var/log/ffmpeginstaller.$_version.log.$lpid "
echo -e "$RED"
echo "*************************************************************************"
echo -e "$RESET"
#Don't edit or move the following credits without permissin
echo -e "\033[1mLooking for a server support team ?$RESET"
echo ""
echo -e "Hire a  Sever Admin $GREEN @ 50% $RESET discount rates from. "
echo -e "Hire a cpanel/direcadmin support plan $GREEN @ 50% $RESET discount."
echo -e "Hire a semidedicated team for managing your servers$GREEN  @ 50% $RESET discount."
echo -e "Setup a dedicated support team$GREEN  @ 50%  $RESET discount."
echo ""
echo -e "Log on to \033[4mhttp://djamol.com$RESET for  getting  the above discount coupon, or"
echo -e "Skype  us @ \033[1m \033[4m SyslintSkype$RESET   for placing an order with this discount."
echo ""
echo "This offer is only for you !!!"
echo ""
echo -e "$RED"
echo "**************************************************************************"
echo -e "$RESET"
echo  "If you need to cancell  the installation press Ctrl+C  ...."
echo -n  "Press ENTER to start the installation  ...."
read option
if [[ $who == "root" ]];then
       sh start.sh | tee /var/log/ffmpeginstaller.$_version.log.$lpid
else
        echo "                  Sorry  Buddy, you are not a root user. This is not for yours."
        echo "                  You need admin privilege for installing this applications"
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
