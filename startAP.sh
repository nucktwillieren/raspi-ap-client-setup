wifidev="wlan0"

echo "Creating Hotspot"
sudo cp /home/pi/ap/dhcpcd.conf /etc/dhcpcd.conf
ip link set dev "$wifidev" down
ip a add 192.168.87.87/24 brd + dev "$wifidev"
ip link set dev "$wifidev" up
dhcpcd -k "$wifidev" >/dev/null 2>&1
systemctl start dnsmasq
systemctl start hostapd
