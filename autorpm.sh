##for centos 7 (no required for centos minimal version)
##  yum install iptables-services
    systemctl start iptables
    systemctl enable iptables
    systemctl disable firewalld
    systemctl stop firewalld
    iptables -P INPUT ACCEPT
    iptables -F
    iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
    iptables -A INPUT -m state --state RELATED -j ACCEPT
    iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    iptables -A INPUT -p tcp --dport 80 -j ACCEPT
    iptables -A INPUT -p tcp --dport 443 -j ACCEPT # if need
    # add any other port you need, like above
    iptables -P INPUT DROP
    service iptables save
    service iptables stop
    chkconfig iptables off
    chkconfig ip6tables off
    #### END ###


RED='\033[01;31m'
RESET='\033[0m'
GREEN='\033[01;32m'
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
echo -e '▒█░▒░▓█░█▒░▒▒█░█▓░▒░█▓   █████▒    ▓█ ▒█▓▓█▓ ██████ ▓████▒░█░      ░█████░▒████▓ ▓█████░ 
 ░▓ █▓▓█ ▓ ██▒█░▓░▓█░█▓   ▓▒  █▓    ▒█ ▒▓▓▓█▓ ▓░█▓▒█░▓▒  █▓ ▓       ░█░  ▓ ▒▓  ▓█ ▓▒▓█▒█▒ 
 ▒█▒█▓▓█░█▓▓█▒█▒█▓▓█▒█▓   █▓  █▓░▓░ ▓█ ██▒▒█▓░█▒█▓▒█░██  █▓░█▒  ░   ▒█▒ ░▓ ██  ██ █▓▓█░█▒ 
 ░█████▓ ██████ ▓█████░▓█ █████░░█████ █▓  █▓░█▒░░▒█ ▓████▒░█████▒█▓ █████ ▒████▓ █▓░▒░█▒ ';
echo -e "$GREEN 
# Powered By DjAmol Group Inc         #
# Email : Support@djamol.com          #
# Website : www.djamol.com            #
# Copyright By PatilWeb.com           #
# IG:PatilWeb FB:PatilWeb TW:PatilWeb #
$RESET";
echo -n "Enter Your Main Domain(Eg. domain.com) >"
read text
echo "Main Domain: $text"
MAINDOMAIN=$text
MAINIP=$(hostname --ip-address)
MYHOST=$(hostname)
echo "Main IP: $MAINIP";
SCRIPT=$(readlink -f "$0")
# Absolute path this script is in, thus /home/user/bin
SCRIPTPATH=$(dirname "$SCRIPT")
#echo $SCRIPTPATH

BIND="n"; CURL="n"; DB="n"; Apache="n";PHPe="n";CRON="n";CSSF="n";WCP="n";PFTP="n";PostFix="n";FF="n";PHPT="n";AW="n";
#set timezone
rm -rf /etc/localtime
ln -s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

mkdir $SCRIPTPATH/log
BUILDDIR=$SCRIPTPATH/log/
BUILDFILE=$RANDOM.txt
BUILD=$BUILDDIR$BUILDFILE

echo $BUILD
clear

echo -e '▒█░▒░▓█░█▒░▒▒█░█▓░▒░█▓   █████▒    ▓█ ▒█▓▓█▓ ██████ ▓████▒░█░      ░█████░▒████▓ ▓█████░ 
 ░▓ █▓▓█ ▓ ██▒█░▓░▓█░█▓   ▓▒  █▓    ▒█ ▒▓▓▓█▓ ▓░█▓▒█░▓▒  █▓ ▓       ░█░  ▓ ▒▓  ▓█ ▓▒▓█▒█▒ 
 ▒█▒█▓▓█░█▓▓█▒█▒█▓▓█▒█▓   █▓  █▓░▓░ ▓█ ██▒▒█▓░█▒█▓▒█░██  █▓░█▒  ░   ▒█▒ ░▓ ██  ██ █▓▓█░█▒ 
 ░█████▓ ██████ ▓█████░▓█ █████░░█████ █▓  █▓░█▒░░▒█ ▓████▒░█████▒█▓ █████ ▒████▓ █▓░▒░█▒ ';
echo -e "$GREEN 
# Powered By DjAmol Group Inc         #
# Email : Support@djamol.com          #
# Website : www.djamol.com            #
# Copyright By PatilWeb.com           #
# IG:PatilWeb FB:PatilWeb TW:PatilWeb #
$RESET";
BIND="true"
CURL="true";
DB="true";
Apache="true";
ctrxx="IN";
statx="Mah";
cityx="Pune";
otext="DA Group Inc";
outext="IT Sector";
srvtext="server.demo.com";
etext="demo@demo.com";
PHPe="true"; 
# testing php program
PHPT="no";
CRON="true";
CSSF="true"; 
WCP="true";
weba="admin";
webp="pass@123";
webo="2066";
if ! [ "$webo" -eq "$webo" ] 2> /dev/null
then
echo "Sorry integers only now your control panel PORT - default 2083"; webo=2083;
fi
PFTP="true";
PostFix="true"; 
FF="true";
AW="true";
EXTRAD="no";
EXTRADS="no";


set -a
# Global Variable to access any bash other files run by this file
#TESTVARIABLE=hellohelloheloo
WEBA=$weba
WEBP=$webp
WEBO=$webo
SCRIPTPATH=$SCRIPTPATH
BUILD=$BUILD
CAC=$ctrxx
CAS=$statx
CAL=$cityx
CAO=$otext
CAU=$outext
CACM=$srvtext
CAM=$etext
BIND=$BIND
CURL=$CURL
DB=$DB
WCP=$WCP
AW=$AW
Apache=$Apache
PHPe=$PHPe
PHPT=$PHPT;
CRON=$CRON
CSSF=$CSSF
PFTP=$PFTP
PostFix=$PostFix
MAINDOMAIN=$MAINDOMAIN
MAINIP=$MAINIP
MYHOST=$MYHOST
EXTRAD=$EXTRAD
EXTRADS=$EXTRADS
FF=$FF
# ...
# Here put all the variables that will be marked for export
# and that will be available from within test2 (and all other commands).
# If test2 modifies the variables, the modifications will never be
# seen in the present script!
set +a

# Here, even if test2 modifies TESTVARIABLE, you'll still have
 # TESTVARIABLE=hellohelloheloo
#./start.sh > FFMPEG-output.log 2>&1 &
chmod +x auto*;
chmod +x inc/*.sh
./auto > ServerInstaller-output.log 2>&1 &




RED='\033[01;31m'
RESET='\033[0m'
GREEN='\033[01;32m'
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
echo -e '▒█░▒░▓█░█▒░▒▒█░█▓░▒░█▓   █████▒    ▓█ ▒█▓▓█▓ ██████ ▓████▒░█░      ░█████░▒████▓ ▓█████░ 
 ░▓ █▓▓█ ▓ ██▒█░▓░▓█░█▓   ▓▒  █▓    ▒█ ▒▓▓▓█▓ ▓░█▓▒█░▓▒  █▓ ▓       ░█░  ▓ ▒▓  ▓█ ▓▒▓█▒█▒ 
 ▒█▒█▓▓█░█▓▓█▒█▒█▓▓█▒█▓   █▓  █▓░▓░ ▓█ ██▒▒█▓░█▒█▓▒█░██  █▓░█▒  ░   ▒█▒ ░▓ ██  ██ █▓▓█░█▒ 
 ░█████▓ ██████ ▓█████░▓█ █████░░█████ █▓  █▓░█▒░░▒█ ▓████▒░█████▒█▓ █████ ▒████▓ █▓░▒░█▒ ';
echo -e "$GREEN 
# Powered By DjAmol Group Inc         #
# Email : Support@djamol.com          #
# Website : www.djamol.com            #
# Copyright By PatilWeb.com           #
# IG:PatilWeb FB:PatilWeb TW:PatilWeb #
$RESET";

echo -e "$GREEN 
Now Relax Installation is Started in Background
#######################
Now Relax Installation is Started in Background
PHP Apache,PHP,MariaDB,Curl,OpenSSLL And Other Customization Auto Installation Maximum Time ->> Time 20-30  minutes
FFMPEG Customization Auto Installation Maximum Time ->> Time 19-25  minutes
Check Installation is Completed By Command
ffmpeg -v
amol
######################################
$RESET";




clear
RED='\033[01;31m'
RESET='\033[0m'
GREEN='\033[01;32m'
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
echo -e '▒█░▒░▓█░█▒░▒▒█░█▓░▒░█▓   █████▒    ▓█ ▒█▓▓█▓ ██████ ▓████▒░█░      ░█████░▒████▓ ▓█████░ 
 ░▓ █▓▓█ ▓ ██▒█░▓░▓█░█▓   ▓▒  █▓    ▒█ ▒▓▓▓█▓ ▓░█▓▒█░▓▒  █▓ ▓       ░█░  ▓ ▒▓  ▓█ ▓▒▓█▒█▒ 
 ▒█▒█▓▓█░█▓▓█▒█▒█▓▓█▒█▓   █▓  █▓░▓░ ▓█ ██▒▒█▓░█▒█▓▒█░██  █▓░█▒  ░   ▒█▒ ░▓ ██  ██ █▓▓█░█▒ 
 ░█████▓ ██████ ▓█████░▓█ █████░░█████ █▓  █▓░█▒░░▒█ ▓████▒░█████▒█▓ █████ ▒████▓ █▓░▒░█▒ ';
echo -e "$GREEN 
# Powered By DjAmol Group Inc         #
# Email : Support@djamol.com          #
# Website : www.djamol.com            #
# Copyright By PatilWeb.com           #
# IG:PatilWeb FB:PatilWeb TW:PatilWeb #
$RESET";


echo -e "$GREEN 
Now Relax Installation is Started in Background
But if you want check output then all output live store in
ServerInstaller-output.log  File
Command To Check LOG
1)All-Command-OUPUT(Show on Console)
  cat ApachePHPffmpeg-amol/ServerInstaller-output.log;
2)Status-OUPUT-Only(Show on Console)
  cat  ApachePHPffmpeg-amol/log/*.txt;
&(if)  FFMPEG Installation Output
  1) All-Output
  cat ApachePHPffmpeg-amol/FFMPEG-output.log;
  2) Status Output ONly
 cat /root/djamolDEV/ffmpeg/log/*.txt;
 #######################
 After Complete Installation 
  You Can use below shell command
 #######################
 # adddomain <-for add domain in apache server with bind dns
 # addftp OR addftpuser <- add ftp account to access ftp service
 # backup <- backup home directory with server config files
 # dbbackup  <- database backup StructureWithDATA or Only Table Structure
 # dbrestore <- restore database from sql file
 # sinfo <- Your VPS benchmark information
 ######################################
Now Relax Installation is Started in Background
PHP Apache,PHP,MariaDB,Curl,OpenSSLL And Other Customization Auto Installation Maximum Time ->> Time 20-30  minutes
FFMPEG Customization Auto Installation Maximum Time ->> Time 19-25  minutes
Check Installation is Completed By Command
ffmpeg -v
amol
######################################
Live Track Status Run ssh Below command
 tail -f $BUILD | sed '/^AmolInstaller: SUCCESS$/ q' 
$RESET";
