#
iptables="iptables"

# 1. Delete all existing rules
${iptables} -F

# 2. Set default chain policies
#iptables -P INPUT DROP
#iptables -P FORWARD DROP
#iptables -P OUTPUT DROP

# 3. Block a specific ip-address
#BLOCK_THIS_IP="x.x.x.x"
#iptables -A INPUT -s "$BLOCK_THIS_IP" -j DROP

# 4. Allow ALL incoming SSH
${iptables} -A INPUT -i eth0 -p tcp --dport 55 -m state --state NEW,ESTABLISHED -j ACCEPT
${iptables} -A OUTPUT -o eth0 -p tcp --sport 55 -m state --state ESTABLISHED -j ACCEPT

# 5. Allow incoming SSH only from a specific network
#iptables -A INPUT -i eth0 -p tcp -s 192.168.200.0/24 --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
#iptables -A OUTPUT -o eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# 6. Allow incoming HTTP
${iptables} -A INPUT -i eth0 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
${iptables} -A OUTPUT -o eth0 -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT

# Allow incoming HTTPS
${iptables} -A INPUT -i eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
${iptables} -A OUTPUT -o eth0 -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

# 7. MultiPorts (Allow incoming SSH, HTTP, and HTTPS)
${iptables} -A INPUT -i eth0 -p tcp -m multiport --dports 22,80,443 -m state --state NEW,ESTABLISHED -j ACCEPT
${iptables} -A OUTPUT -o eth0 -p tcp -m multiport --sports 22,80,443 -m state --state ESTABLISHED -j ACCEPT

# 8. Allow outgoing SSH
${iptables} -A OUTPUT -o eth0 -p tcp --dport 55 -m state --state NEW,ESTABLISHED -j ACCEPT
${iptables} -A INPUT -i eth0 -p tcp --sport 55 -m state --state ESTABLISHED -j ACCEPT

# 9. Allow outgoing SSH only to a specific network
#iptables -A OUTPUT -o eth0 -p tcp -d 192.168.101.0/24 --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
#iptables -A INPUT -i eth0 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# 10. Allow outgoing HTTPS
${iptables} -A OUTPUT -o eth0 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
${iptables} -A INPUT -i eth0 -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

# 11. Load balance incoming HTTPS traffic
#iptables -A PREROUTING -i eth0 -p tcp --dport 443 -m state --state NEW -m nth --counter 0 --every 3 --packet 0 -j DNAT --to-destination 192.168.1.101:443
#iptables -A PREROUTING -i eth0 -p tcp --dport 443 -m state --state NEW -m nth --counter 0 --every 3 --packet 1 -j DNAT --to-destination 192.168.1.102:443
#iptables -A PREROUTING -i eth0 -p tcp --dport 443 -m state --state NEW -m nth --counter 0 --every 3 --packet 2 -j DNAT --to-destination 192.168.1.103:443

# 12. Ping from inside to outside
${iptables} -A OUTPUT -p icmp --icmp-type echo-request -j ACCEPT
${iptables} -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT

# 13. Ping from outside to inside
${iptables} -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
${iptables} -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT

# 14. Allow loopback access
${iptables} -A INPUT -i lo -j ACCEPT
${iptables} -A OUTPUT -o lo -j ACCEPT

# 15. Allow packets from internal network to reach external network.
# if eth1 is connected to external network (internet)
# if eth0 is connected to internal network (192.168.1.x)
${iptables} -A FORWARD -i eth0 -o eth1 -j ACCEPT

# 16. Allow outbound DNS
${iptables} -A OUTPUT -p udp -o eth0 --dport 53 -j ACCEPT
${iptables} -A INPUT -p udp -i eth0 --sport 53 -j ACCEPT

# 17. Allow NIS Connections
# rpcinfo -p | grep ypbind ; This port is 853 and 850
#iptables -A INPUT -p tcp --dport 111 -j ACCEPT
#iptables -A INPUT -p udp --dport 111 -j ACCEPT
#iptables -A INPUT -p tcp --dport 853 -j ACCEPT
#iptables -A INPUT -p udp --dport 853 -j ACCEPT
#iptables -A INPUT -p tcp --dport 850 -j ACCEPT
#iptables -A INPUT -p udp --dport 850 -j ACCEPT

# 18. Allow rsync from a specific network
#${iptables} -A INPUT -i eth0 -p tcp -s 192.168.101.0/24 --dport 873 -m state --state NEW,ESTABLISHED -j ACCEPT
#${iptables} -A OUTPUT -o eth0 -p tcp --sport 873 -m state --state ESTABLISHED -j ACCEPT

# 19. Allow MySQL connection only from a specific network
#${iptables} -A INPUT -i eth0 -p tcp -s 192.168.200.0/24 --dport 3306 -m state --state NEW,ESTABLISHED -j ACCEPT
#${iptables} -A OUTPUT -o eth0 -p tcp --sport 3306 -m state --state ESTABLISHED -j ACCEPT

# 20. Allow Sendmail or Postfix
${iptables} -A INPUT -i eth0 -p tcp --dport 25 -m state --state NEW,ESTABLISHED -j ACCEPT
${iptables} -A OUTPUT -o eth0 -p tcp --sport 25 -m state --state ESTABLISHED -j ACCEPT

# 21. Allow IMAP and IMAPS
#iptables -A INPUT -i eth0 -p tcp --dport 143 -m state --state NEW,ESTABLISHED -j ACCEPT
#iptables -A OUTPUT -o eth0 -p tcp --sport 143 -m state --state ESTABLISHED -j ACCEPT
#iptables -A INPUT -i eth0 -p tcp --dport 993 -m state --state NEW,ESTABLISHED -j ACCEPT
#iptables -A OUTPUT -o eth0 -p tcp --sport 993 -m state --state ESTABLISHED -j ACCEPT

# 22. Allow POP3 and POP3S
#iptables -A INPUT -i eth0 -p tcp --dport 110 -m state --state NEW,ESTABLISHED -j ACCEPT
#iptables -A OUTPUT -o eth0 -p tcp --sport 110 -m state --state ESTABLISHED -j ACCEPT
#iptables -A INPUT -i eth0 -p tcp --dport 995 -m state --state NEW,ESTABLISHED -j ACCEPT
#iptables -A OUTPUT -o eth0 -p tcp --sport 995 -m state --state ESTABLISHED -j ACCEPT

# 23. Prevent DoS attack
#${iptables} -A INPUT -p tcp --dport 80 -m limit --limit 25/minute --limit-burst 100 -j ACCEPT

# 24. Port forwarding 422 to 22
#iptables -t nat -A PREROUTING -p tcp -d 192.168.102.37 --dport 422 -j DNAT --to 192.168.102.37:22
#iptables -A INPUT -i eth0 -p tcp --dport 422 -m state --state NEW,ESTABLISHED -j ACCEPT
#iptables -A OUTPUT -o eth0 -p tcp --sport 422 -m state --state ESTABLISHED -j ACCEPT

# 25. Log dropped packets
${iptables} -N LOGGING
${iptables} -A INPUT -j LOGGING
${iptables} -A LOGGING -m limit --limit 2/min -j LOG --log-prefix "IPTables Packet Dropped: " --log-level 7
${iptables} -A LOGGING -j DROP



# Accept any related or established connections
${iptables} -I INPUT  1 -m state --state RELATED,ESTABLISHED -j ACCEPT
${iptables} -I OUTPUT 1 -m state --state RELATED,ESTABLISHED -j ACCEPT

# Allow all traffic on the loopback interface
${iptables} -A INPUT -i lo -j ACCEPT
${iptables} -A OUTPUT -o lo -j ACCEPT

# Allow outbound DHCP request
${iptables} -A OUTPUT –o eth0 -p udp --dport 67:68 --sport 67:68 -j ACCEPT

# Allow inbound SSH
${iptables} -A INPUT -i eth0 -p tcp -m tcp --dport 22 -m state --state NEW  -j ACCEPT

# Allow outbound email
${iptables} -A OUTPUT -i eth0 -p tcp -m tcp --dport 25 -m state --state NEW  -j ACCEPT

# Outbound DNS lookups
${iptables} -A OUTPUT -o eth0 -p udp -m udp --dport 53 -j ACCEPT

# Outbound PING requests
${iptables} -A OUTPUT –o eth0 -p icmp -j ACCEPT

# Outbound Network Time Protocol (NTP) requests
${iptables} -A OUTPUT –o eth0 -p udp --dport 123 --sport 123 -j ACCEPT
 
# Outbound HTTP
${iptables} -A OUTPUT -o eth0 -p tcp -m tcp --dport 80 -m state --state NEW -j ACCEPT
${iptables} -A OUTPUT -o eth0 -p tcp -m tcp --dport 443 -m state --state NEW -j ACCEPT
