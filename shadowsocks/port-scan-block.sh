sudo apt update && sudo apt install ipset -y
sudo ipset create port_scanners hash:ip family inet hashsize 32768 maxelem 65536 timeout 600
sudo ipset create scanned_ports hash:ip,port family inet hashsize 32768 maxelem 65536 timeout 60
sudo iptables -A INPUT -m state --state INVALID -j DROP
sudo iptables -A INPUT -m state --state NEW -m set ! --match-set scanned_ports src,dst -m hashlimit --hashlimit-above 1/hour --hashlimit-burst 5 --hashlimit-mode srcip --hashlimit-name portscan --hashlimit-htable-expire 10000 -j SET --add-set port_scanners src --exist
sudo iptables -A INPUT -m state --state NEW -m set --match-set port_scanners src -j DROP
sudo iptables -A INPUT -m state --state NEW -j SET --add-set scanned_ports src,dst