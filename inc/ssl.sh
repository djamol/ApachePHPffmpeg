CAC="US"; CAS="New York"; CAL="New York City"; CAO="Private ORG"; CAU="DA Group"; CACM="serv.djamol.com"; CAM="support@djamol.com";
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
