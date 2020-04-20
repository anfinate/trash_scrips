#update
sudo yum update -y
wait
#Iptables Config
yum install iptables-services -y
wait
sudo systemctl enable iptables.service
systemctl disable firewalld
systemctl mask firewalld
iptables -P INPUT ACCEPT
iptables -F
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 389 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 636 -j ACCEPT
iptables-save
service iptables save
iptables -L -n -v --line-numbers
#Repos
yum install -y http://mirror.team-cymru.com/remi/enterprise/remi-release-7.rpm
yum repolist
#Packages
sudo yum install -y wget gcc-c++ make httpd htop git python3 python3-devel epel-release nginx