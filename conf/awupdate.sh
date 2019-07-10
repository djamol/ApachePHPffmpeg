#sh update.sh -d "domainname.com"

while getopts ":a:d:" opt; do
  case $opt in
    a) arg_1="$OPTARG"
    ;;
    d) p_out="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

printf "Argument domain is %s\n" "$p_out"
printf "Argument all is %s\n" "$arg_1"
if [ -z "$p_out" ]
then
      echo "\$p_out is empty"
else
      echo "\$p_out is NOT empty"
      /usr/bin/tar -czvf /var/logs/httpd/$p_out/`(date +%Y%m%d)`.log.tar.gz /var/logs/httpd/$p_out/aclog.log
      rm -rf /var/logs/httpd/$p_out/aclog.log
      /usr/share/awstats/wwwroot/cgi-bin/awstats.pl -config=$p_out -update

fi


## all domain  in already config awstats files

FILES=/etc/awstats/*
for fp in $FILES
do
f="$(basename -- $fp)"
echo "Found $f file..."
domain=$( echo $f | sed "s/.*awstats.//;s/.conf.*//" )
echo "Processing domain : $domain";
aclog = "/var/logs/httpd/$domain/aclog.log";
if test -f "$aclog"; then
    echo "$aclog exist"
  # take action on each file. $f store current file name
      /usr/bin/tar -czvf /var/logs/httpd/$domain/`(date +%Y%m%d)`.log.tar.gz /var/logs/httpd/$domain/aclog.log
      #rm -rf /var/logs/httpd/$domain/aclog.log
      cat /dev/null > $aclog 
      /usr/share/awstats/wwwroot/cgi-bin/awstats.pl -config=$domain -update
fi



done



#/usr/bin/tar -czvf /var/logs/httpd/domain.info/`(date +%Y%m%d)`.log.tar.gz /var/logs/httpd/domain.info/aclog.log
#rm -rf /var/logs/httpd/domain.info/aclog.log
#/usr/share/awstats/wwwroot/cgi-bin/awstats.pl -config=domain.info -update
