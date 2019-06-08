#!/bin/bash
# Amol Patil
#Email US :support@djamol.com
 # WEB@DjAmol.com
_package=' '
if [ -e "/scripts/rebuildhttpdconf" ];then
	/scripts/rebuildhttpdconf
fi
clear
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

echo " "
echo " "
echo "The ffmpeg and dependency package installation has  been completed. You can use the following"
echo "paths for the major binary locations. (Powered ByDjAmolGroup) Make sure to configure it in your conversion scripts too."
echo ""
which {ffmpeg,mplayer,mencoder,flvtool2,MP4Box,lame,yamdi}
echo " "
echo "				Don't forget to do the following "
echo " "
echo " "
echo "		Edit your php.ini and increase the value of post_max_size if you need tp post big files via php scripts "
echo " 		Edit your php.ini and  increase the value of upload_max_filesize if you need to upload big vidoe file"
echo "		Restart web server(httpd/nginx,etc.)  "
echo "		Test the installation "
echo " "
echo " "
echo " "
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
echo -e "Skype  us @ \033[1m \033[4m djamol.com$RESET   for placing an order with this discount."
echo ""
echo "This offer is only for you !!!"
echo ""
echo -e "$RED"
echo "**************************************************************************"
echo -e "$RESET"
which {ffmpeg,mplayer,mencoder,flvtool2,MP4Box,yamdi}

date +"%r" >> $BUILD;which {ffmpeg,mplayer,mencoder,flvtool2,MP4Box,yamdi} >> $BUILD;

