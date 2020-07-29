wifidev="wlan0"
echo "Shutting Down Hotspot"
sudo cp /home/pi/ap/dhcpcd_close.conf /etc/dhcpcd.conf
ip link set dev "$wifidev" down
systemctl stop hostapd
systemctl stop dnsmasq
ip addr flush dev "$wifidev"
ip link set dev "$wifidev" up
dhcpcd  -n "$wifidev" >/dev/null 2>&1
wpa_cli reconfigure
