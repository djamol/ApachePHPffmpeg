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

export cpu=`cat "/proc/cpuinfo" | grep "processor"|wc -l`
#presetup
export TMPDIR=$HOME/tmp
echo -n "Removing useless libraries,please wait............."
rm -rf $INSTALL_SDIR
mkdir -p $INSTALL_SDIR

rm -rf /lib/liba52*
rm -rf /lib/libamr*
rm -rf /lib/libavcodec*
rm -rf /lib/libavformat*
rm -rf /lib/libavutil*
rm -rf /lib/libdha*
rm -rf /lib/libfaac*
rm -rf /lib/libfaad*
rm -rf /lib/libmp3lame*
rm -rf /lib/libmp4v2*
rm -rf /lib/libogg*
rm -rf /lib/libtheora*
rm -rf /lib/libvorbis*

rm -rf /usr/lib/liba52*
rm -rf /usr/lib/libamr*
rm -rf /usr/lib/libavcodec*
rm -rf /usr/lib/libavformat*
rm -rf /usr/lib/libavutil*
rm -rf /usr/lib/libdha*
rm -rf /usr/lib/libfaac*
rm -rf /usr/lib/libfaad*
rm -rf /usr/lib/libmp3lame*
rm -rf /usr/lib/libmp4v2*
rm -rf /usr/lib/libogg*
rm -rf /usr/lib/libtheora*
rm -rf /usr/lib/libvorbis*

rm -rf /usr/local/lib/liba52*
rm -rf /usr/local/lib/libamr*
rm -rf /usr/local/lib/libavcodec*
rm -rf /usr/local/lib/libavformat*
rm -rf /usr/local/lib/libavutil*
rm -rf /usr/local/lib/libdha*
rm -rf /usr/local/lib/libfaac*
rm -rf /usr/local/lib/libfaad*
rm -rf /usr/local/lib/libmp3lame*
rm -rf /usr/local/lib/libmp4v2*
rm -rf /usr/local/lib/libogg*
rm -rf /usr/local/lib/libtheora*
rm -rf /usr/local/lib/libvorbis*

unlink  /usr/bin/ffmpeg >/dev/null 2>&1
unlink /usr/local/bin/ffmpeg >/dev/null 2>&1
unlink /bin/mplayer >/dev/null 2>&1
unlink /usr/bin/mplayer >/dev/null 2>&1
unlink  /usr/local/bin/mplayer >/dev/null 2>&1
unlink /bin/mencoder >/dev/null 2>&1
unlink /usr/bin/mencoder  >/dev/null 2>&1
unlink  /usr/local/bin/mencoder >/dev/null 2>&1
unlink /bin/flvtool2 >/dev/null 2>&1
unlink /usr/bin/flvtool2 >/dev/null 2>&1
unlink  /usr/local/bin/flvtool2 >/dev/null 2>&1
rm -rf /usr/local/avpffmpeg
rm -rf $HOME/tmp
mkdir -p $HOME/tmp
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

echo -n ".......... done"
echo " "
echo "creating folders..........done"
echo -n "Creating ldd configurations "
cp -f ./djamol.so.conf /etc/ld.so.conf.d/
echo -n ".......... done"
