#_file="$1"
#[ $# -eq 0 ] && { echo "Usage: $0 filename"; exit 1; }
#[ ! -f "$_file" ] && { echo "Error: $0 file not found."; exit 2; }
#if [ -s "$_file" ] && [ -f "$_file" ]
#then
#        echo "$_file has some data."
        # do something as file has data
#else
#        echo "$_file is empty."
        # do something as file is empty
#fi
CAC="US"; CAS="New York"; CAL="New York City"; CAO="Private ORG"; CAU="DA Group"; CACM="serv.djamol.com"; CAM="support@djamol.com";
mkdir -p /usr/share/ssl/certs
mkdir -p /etc/ssl/private
_file="/etc/ssl/certs/postfix.pem"
if [ -s "$_file" ] && [ -f "$_file" ] then
        echo "$_file ssl certificate Exist."
else
        echo "$_file certificate file is empty or not found."
SSLCERt=$(expect -c "
set timeout 35
  spawn openssl req -new -x509 -days 3650 -nodes -out /etc/ssl/certs/postfix.pem -keyout /etc/ssl/private/postfix.pem
  expect \"Country Name*:\"
  send \"$CAC\r\"
  expect \"State*:\"
  send \"$CAS\r\"
  expect \"Locality*:\"
  send \"$CAL\r\"
  expect \"Organization Name*:\"
  send \"$CAO\r\"
  expect \"Organizational Unit*:\"
  send \"$CAU\r\"
  expect \"Common Name*:\"
  send \"$CACM\r\"
  expect \"Email*:\"
  send \"$CAM\r\"
expect eof
")
echo "$SSLCERt"
fi

_file="/usr/share/ssl/certs/amol.cert"
if [ -s "$_file" ] && [ -f "$_file" ] then
        echo "$_file ssl certificate Exist."
else
        echo "$_file certificate file is empty or not found."

SSLCERt=$(expect -c "
set timeout 35
  spawn openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /usr/share/ssl/certs/amol.key -out /usr/share/ssl/certs/amol.cert
  expect \"Country Name*:\"
  send \"$CAC\r\"
  expect \"State*:\"
  send \"$CAS\r\"
  expect \"Locality*:\"
  send \"$CAL\r\"
  expect \"Organization Name*:\"
  send \"$CAO\r\"
  expect \"Organizational Unit*:\"
  send \"$CAU\r\"
  expect \"Common Name*:\"
  send \"$CACM\r\"
  expect \"Email*:\"
  send \"$CAM\r\"

expect eof
")
echo "$SSLCERt"
fi


_file="/usr/share/ssl/certs/ssl.crt"
if [ -s "$_file" ] && [ -f "$_file" ] then
        echo "$_file ssl certificate Exist."
else
        echo "$_file certificate file is empty or not found."

SSLHTTPS=$(expect -c "
set timeout 35
  spawn openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /usr/share/ssl/certs/ssl.crt -out /usr/share/ssl/certs/ssl.crt
  expect \"Country Name*:\"
  send \"$CAC\r\"
  expect \"State*:\"
  send \"$CAS\r\"
  expect \"Locality*:\"
  send \"$CAL\r\"
  expect \"Organization Name*:\"
  send \"$CAO\r\"
  expect \"Organizational Unit*:\"
  send \"$CAU\r\"
  expect \"Common Name*:\"
  send \"$CACM\r\"
  expect \"Email*:\"
  send \"$CAM\r\"

expect eof
")
echo "$SSLHTTPS"
fi
