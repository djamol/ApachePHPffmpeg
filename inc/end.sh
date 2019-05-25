/etc/init.d/apache2 restart
systemctl restart proftpd
service named restart


date +"%r" >> $BUILD;/usr/local/apache2/bin/httpd -v >> $BUILD;openssl version >> $BUILD;
/usr/local/bin/php -v >> $BUILD;mysql -V >> $BUILD;named -v >> $BUILD;curl -V >> $BUILD;
clear

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
echo -e "\033[33;34m OPENLSSL Testing";
if openssl version; then 
echo -e "\033[33;32m OPENLSSL is Installed";
else
echo -e "\033[33;31m OPENLSSL is Not Install (Try Manually Install) "
fi


echo -e "\033[33;34m CURL Testing";
if curl -V; then 
echo -e "\033[33;32m CURL is Installed";
else
echo -e "\033[33;31m CURL is Not Install (Try Manually Install) "
fi

echo -e "\033[33;34m FTP Testing";
if proftpd -v; then 
echo -e "\033[33;32m PROFTP is Installed";
else
echo -e "\033[33;31m PROFTP is Not Install (Try Manually Install) "
fi


echo -e "\033[33;34m MariaDB/Mysql Testing";
if mysql -V; then 
echo -e "\033[33;32m Mariadb is Installed";
else
echo -e "\033[33;31m MariaDB is Not Install (Try Manually Install) "
fi

echo -e "\033[33;34m BIND DNS Testing";
if named -v; then 
echo -e "\033[33;32m BIND DNS is Installed";
else
echo -e "\033[33;31m BIND DNS is Not Install (Try Manually Install) "
fi


echo -e "\033[33;34m Apache Testing";
if /usr/local/apache2/bin/httpd -v; then 
echo -e "\033[33;32m Apache is Installed";
else
echo -e "\033[33;31m Apache is Not Install (Try Manually Install or Restart Program) "
fi

echo -e "\033[33;34m PHP 5 Testing";
if /usr/local/bin/php -v; then 
echo -e "\033[33;32m PHP is Installed";
else
echo -e "\033[33;31m PHP is Not Install (Try Manually Install or Restart Program) "
fi
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

