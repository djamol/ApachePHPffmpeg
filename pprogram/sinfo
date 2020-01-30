
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

sysinfo () {
	# Removing existing bench.log
	rm -rf $HOME/bench.log
	# Reading out system information...
	# Reading CPU model
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
	# Reading amount of CPU cores
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	# Reading CPU frequency in MHz
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo | sed 's/^[ \t]*//;s/[ \t]*$//' )
	# Reading total memory in MB
	tram=$( free -m | awk 'NR==2 {print $2}' )
	# Reading Swap in MB
	vram=$( free -m | awk 'NR==4 {print $2}' )
	# Reading system uptime
	up=$( uptime | awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }' | sed 's/^[ \t]*//;s/[ \t]*$//' )
	# Reading operating system and version (simple, didn't filter the strings at the end...)
	opsy=$( cat /etc/issue.net | awk 'NR==1 {print}' ) # Operating System & Version
	arch=$( uname -m ) # Architecture
	lbit=$( getconf LONG_BIT ) # Architecture in Bit
	hn=$( hostname ) # Hostname
	kern=$( uname -r )
	# Date of benchmark
	bdates=$( date )
	#CPU_AES
        CPU_AES=$(cat /proc/cpuinfo | grep aes)
        [[ -z "$CPU_AES" ]] && CPU_AES="\xE2\x9D\x8C Disabled" || CPU_AES="\xE2\x9C\x94 Enabled"
	# CPU_VIRT
	CPU_VIRT=$(cat /proc/cpuinfo | grep 'vmx\|svm')
	[[ -z "$CPU_VIRT" ]] && CPU_VIRT="\xE2\x9D\x8C Disabled" || CPU_VIRT="\xE2\x9C\x94 Enabled"
	echo "Benchmark started on $bdates" | tee -a $HOME/bench.log
	echo "Full benchmark log: $HOME/bench.log" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	# Output of results
	echo "System Info" | tee -a $HOME/bench.log
	echo "-----------" | tee -a $HOME/bench.log
	echo "Processor	: $cname" | tee -a $HOME/bench.log
	echo "CPU Cores	: $cores" | tee -a $HOME/bench.log
	echo "Frequency	: $freq MHz" | tee -a $HOME/bench.log
	echo "Memory		: $tram MB" | tee -a $HOME/bench.log
	echo "AES-NI     : $CPU_AES" | tee -a $HOME/bench.log
	echo "VM-x/AMD-V : $CPU_VIRT" | tee -a $HOME/bench.log
	echo "Swap		: $vram MB" | tee -a $HOME/bench.log
	echo "Uptime		: $up" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	echo "OS		: $opsy" | tee -a $HOME/bench.log
	echo "Arch		: $arch ($lbit Bit)" | tee -a $HOME/bench.log
	echo "Kernel		: $kern" | tee -a $HOME/bench.log
	echo "Hostname	: $hn" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
}
speedtest4 () {
	ipiv=$( wget -qO- ipv4.icanhazip.com ) # Getting IPv4
	# Speed test via wget for IPv4 only with 10x 100 MB files. 1 GB bandwidth will be used!
	echo "Speedtest (IPv4 only)" | tee -a $HOME/bench.log
	echo "---------------------" | tee -a $HOME/bench.log
	echo "Your public IPv4 is $ipiv" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	# Cachefly CDN speed test
	echo "Location		Provider	Speed"	| tee -a $HOME/bench.log
	cachefly=$( wget -4 -O /dev/null http://cachefly.cachefly.net/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "CDN			Cachefly	$cachefly" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	# United States speed test
	coloatatl=$( wget -4 -O /dev/null http://speed.atl.coloat.com/100mb.test 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Atlanta, GA, US		Coloat		$coloatatl " | tee -a $HOME/bench.log
	sldltx=$( wget -4 -O /dev/null http://speedtest.dal05.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Dallas, TX, US		Softlayer	$sldltx " | tee -a $HOME/bench.log
	slwa=$( wget -4 -O /dev/null http://speedtest.sea01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Seattle, WA, US		Softlayer	$slwa " | tee -a $HOME/bench.log
	slsjc=$( wget -4 -O /dev/null http://speedtest.sjc01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "San Jose, CA, US	Softlayer	$slsjc " | tee -a $HOME/bench.log
	slwdc=$( wget -4 -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Washington, DC, US	Softlayer 	$slwdc " | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	# Asia speed test
	linodejp=$( wget -4 -O /dev/null http://speedtest.tokyo.linode.com/100MB-tokyo.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Tokyo, Japan		Linode		$linodejp " | tee -a $HOME/bench.log
	slsg=$( wget -4 -O /dev/null http://speedtest.sng01.softlayer.com/downloads/test100.zip 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Singapore 		Softlayer	$slsg " | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	# Europe speed test
	i3d=$( wget -4 -O /dev/null http://mirror.i3d.net/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Rotterdam, Netherlands	id3.net		$i3d" | tee -a $HOME/bench.log
	leaseweb=$( wget -4 -O /dev/null http://mirror.leaseweb.com/speedtest/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Haarlem, Netherlands	Leaseweb	$leaseweb " | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
}
speedtest6 () {
	ipvii=$( wget -qO- ipv6.icanhazip.com ) # Getting IPv6
  	# Speed test via wget for IPv6 only with 10x 100 MB files. 1 GB bandwidth will be used! No CDN - Cachefly not IPv6 ready...
  	echo "Speedtest (IPv6 only)" | tee -a $HOME/bench.log
  	echo "---------------------" | tee -a $HOME/bench.log
  	echo "Your public IPv6 is $ipvii" | tee -a $HOME/bench.log
  	echo "" | tee -a $HOME/bench.log
  	echo "Location		Provider	Speed" | tee -a $HOME/bench.log
  	# United States speed test
	v6atl=$( wget -6 -O /dev/null http://speedtest.atlanta.linode.com/100MB-atlanta.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Atlanta, GA, US		Linode		$v6atl" | tee -a $HOME/bench.log
  	v6dal=$( wget -6 -O /dev/null http://speedtest.dallas.linode.com/100MB-dallas.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
  	echo "Dallas, TX, US		Linode		$v6dal" | tee -a $HOME/bench.log
  	v6new=$( wget -6 -O /dev/null http://speedtest.newark.linode.com/100MB-newark.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
  	echo "Newark, NJ, US		Linode	 	$v6new" | tee -a $HOME/bench.log
	v6fre=$( wget -6 -O /dev/null http://speedtest.fremont.linode.com/100MB-fremont.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Fremont, CA, US		Linode	 	$v6fre" | tee -a $HOME/bench.log
  	v6chi=$( wget -6 -O /dev/null http://testfile.chi.steadfast.net/data.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
  	echo "Chicago, IL, US		Steadfast	$v6chi" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	# Asia speed test
  	v6tok=$( wget -6 -O /dev/null http://speedtest.tokyo.linode.com/100MB-tokyo.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
  	echo "Tokyo, Japan		Linode	 	$v6tok" | tee -a $HOME/bench.log
  	v6sin=$( wget -6 -O /dev/null http://speedtest.singapore.linode.com/100MB-singapore.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
  	echo "Singapore		Linode		$v6sin" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	# Europe speed test
	v6fra=$( wget -6 -O /dev/null http://speedtest.frankfurt.linode.com/100MB-frankfurt.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "Frankfurt, Germany	Linode		$v6fra" | tee -a $HOME/bench.log
        v6lon=$( wget -6 -O /dev/null http://speedtest.london.linode.com/100MB-london.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
	echo "London, UK		Linode		$v6lon" | tee -a $HOME/bench.log
        v6har=$( wget -6 -O /dev/null http://mirror.nl.leaseweb.net/speedtest/100mb.bin 2>&1 | awk '/\/dev\/null/ {speed=$3 $4} END {gsub(/\(|\)/,"",speed); print speed}' )
        echo "Haarlem, Netherlands	Leaseweb	$v6har" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
}
iotest () {
	echo "Disk Speed" | tee -a $HOME/bench.log
	echo "----------" | tee -a $HOME/bench.log
	# Measuring disk speed with DD
	io=$( ( dd if=/dev/zero of=test_$$ bs=64k count=16k conv=fdatasync && rm -f test_$$ ) 2>&1 | awk -F, '{io=$NF} END { print io}' | sed 's/^[ \t]*//;s/[ \t]*$//' )
	io2=$( ( dd if=/dev/zero of=test_$$ bs=64k count=16k conv=fdatasync && rm -f test_$$ ) 2>&1 | awk -F, '{io=$NF} END { print io}' | sed 's/^[ \t]*//;s/[ \t]*$//' )
	io3=$( ( dd if=/dev/zero of=test_$$ bs=64k count=16k conv=fdatasync && rm -f test_$$ ) 2>&1 | awk -F, '{io=$NF} END { print io}' | sed 's/^[ \t]*//;s/[ \t]*$//' )
	# Calculating avg I/O (better approach with awk for non int values)
	ioraw=$( echo $io | awk 'NR==1 {print $1}' )
	ioraw2=$( echo $io2 | awk 'NR==1 {print $1}' )
	ioraw3=$( echo $io3 | awk 'NR==1 {print $1}' )
	ioall=$( awk 'BEGIN{print '$ioraw' + '$ioraw2' + '$ioraw3'}' )
	ioavg=$( awk 'BEGIN{print '$ioall'/3}' )
	# Output of DD result
	echo "I/O (1st run)	: $io" | tee -a $HOME/bench.log
	echo "I/O (2nd run)	: $io2" | tee -a $HOME/bench.log
	echo "I/O (3rd run)	: $io3" | tee -a $HOME/bench.log
	echo "Average I/O	: $ioavg MB/s" | tee -a $HOME/bench.log
	echo "" | tee -a $HOME/bench.log
}
gbench () {
echo -en "\nPerforming Geekbench 4 benchmark test. This may take a couple minutes to complete..."

	# create a temp directory to house all geekbench files
	GEEKBENCH_PATH=$YABS_PATH/geekbench
	mkdir -p $GEEKBENCH_PATH
	# download the latest Geekbench 4 tarball and extract to geekbench temp directory
	curl -s http://cdn.geekbench.com/Geekbench-4.3.3-Linux.tar.gz  | tar xz --strip-components=1 -C $GEEKBENCH_PATH &>/dev/null
	# run the Geekbench 4 test and grep the test results URL given at the end of the test
	GEEKBENCH_TEST=$($GEEKBENCH_PATH/geekbench4 2>/dev/null | grep "https://browser")

	# ensure the test ran successfully
	if [ -z "$GEEKBENCH_TEST" ]; then
		# if the Geekbench 4 test failed for any reason, exit cleanly and print error message
		echo -e "\r\033[0KGeekbench 4 test failed. Run manually to determine cause."
	else
		# if the Geekbench 4 test succeeded, parse the test results URL
		GEEKBENCH_URL=$(echo -e $GEEKBENCH_TEST | head -1)
		GEEKBENCH_URL_CLAIM=$(echo $GEEKBENCH_URL | awk '{ print $2 }')
		GEEKBENCH_URL=$(echo $GEEKBENCH_URL | awk '{ print $1 }')
		# sleep a bit to wait for results to be made available on the geekbench website
		sleep 10
		# parse the public results page for the single and multi core geekench scores
		GEEKBENCH_SCORES=$(curl -s $GEEKBENCH_URL | grep "class='score' rowspan")
		GEEKBENCH_SCORES_SINGLE=$(echo $GEEKBENCH_SCORES | awk -v FS="(>|<)" '{ print $3 }')
		GEEKBENCH_SCORES_MULTI=$(echo $GEEKBENCH_SCORES | awk -v FS="(<|>)" '{ print $7 }')
	
		# print the Geekbench 4 results
		echo -en "\r\033[0K"
		echo -e "Geekbench 4 Benchmark Test:"
		echo -e "---------------------------------"
		printf "%-15s | %-30s\n" "Test" "Value"
		printf "%-15s | %-30s\n"
		printf "%-15s | %-30s\n" "Single Core" "$GEEKBENCH_SCORES_SINGLE"
		printf "%-15s | %-30s\n" "Multi Core" "$GEEKBENCH_SCORES_MULTI"
		printf "%-15s | %-30s\n" "Full Test" "$GEEKBENCH_URL"

		# write the geekbench 4 claim URL to a file so the user can add the results to their profile (if desired)
		[ ! -z "$GEEKBENCH_URL_CLAIM" ] && echo -e "$GEEKBENCH_URL_CLAIM" > geekbench4_claim.url 2> /dev/null
	fi
echo "" | tee -a $HOME/bench.log
}
hlp () {
	echo ""
	echo "(C) DjAmol Group Inc Benchmark MENU"
	echo ""
	echo "Usage: sinfo <option>"
	echo ""
	echo "Available options:"
	echo "No option	: System information, IPv4 only speedtest and disk speed & IOPing benchmark will be run."
	echo "-sys		: Displays system information such as CPU, amount CPU cores, RAM and more."
	echo "-io		: Runs a disk speed test and a IOPing benchmark and displays the results."
	echo "-iops		: Runs a extended IOPing test for latency, reading and et cetera."
	echo "-6		: Normal benchmark but with a IPv6 only speedtest (run when you have IPv6)."
	echo "-46		: Normal benchmark with IPv4 and IPv6 speedtest."
	echo "-64		: Same as above."
	echo "-b		: Normal benchmark with IPv4 only speedtest, I/O test and Geekbench system benchmark."
	echo "-b6		: Normal benchmark with IPv6 only speedtest, I/O test and Geekbench system benchmark."
	echo "-b46		: Normal benchmark with IPv4 and IPv6 speedtest, I/O test and Geekbench system benchmark."
	echo "-b64		: Same as above."
	echo "-h		: This help page."
	echo ""
	echo "Powered By DjAmol Group INC"
	echo ""
}
case $1 in
	'-sys')
		sysinfo;;
	'-io')
		iotest;;
	'-6' )
		sysinfo; speedtest6; iotest;;
	'-46' )
		sysinfo; speedtest4; speedtest6; iotest;;
	'-64' )
		sysinfo; speedtest4; speedtest6; iotest;;
	'-b' )
		sysinfo; speedtest4; iotest; gbench;;
	'-b6' )
		sysinfo; speedtest6; iotest; gbench;;
	'-b46' )
		sysinfo; speedtest4; speedtest6; iotest; gbench;;
	'-b64' )
		sysinfo; speedtest4; speedtest6; iotest; gbench;;
	'-h' )
		hlp;;
	*)
		sysinfo; speedtest4; iotest; gbench;;
esac
