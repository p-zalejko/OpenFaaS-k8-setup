# IP address of the node
ip=192.168.2.213
dns=192.168.2.1

sudo cat <<EOT >> /etc/dhcpcd.conf
interface eth0
static ip_address=$ip/24
static routers=$dns
static domain_name_servers=$dns
EOT
