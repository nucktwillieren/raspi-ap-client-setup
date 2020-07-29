sudo apt install -y hostapd
sudo systemctl unmask hostapd
sudo systemctl enable hostapd
sudo apt install -y dnsmasq
sudo DEBIAN_FRONTEND=noninteractive apt install -y netfilter-persistent iptables-persistent
sudo cp /home/pi/ap/dhcpcd.conf /etc/
sudo cp /home/pi/ap/routed-ap.conf /etc/sysctl.d/
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo netfilter-persistent save
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig
sudo cp /home/pi/ap/dnsmasq.conf /etc/
sudo rfkill unblock wlan
sudo cp /home/pi/ap/hostapd.conf /etc/hostapd/
sudo cp /home/pi/ap/interfaces  /etc/network/interfaces
sudo systemctl stop hostapd.service
sudo systemctl stop dnsmasq.service
