grep -qxF "enable_uart=1" /boot/config.txt || echo "enable_uart=1" | sudo tee -a /boot/config.txt > /dev/null
grep -qxF "dtoverlay=pi3-disable-bt" /boot/config.txt || echo "dtoverlay=pi3-disable-bt" | sudo tee -a /boot/config.txt > /dev/null
sudo systemctl stop serial-getty@ttyS0.service
sudo systemctl disable serial-getty@ttyS0.service
sudo systemctl stop serial-getty@ttyAMA0.service
sudo systemctl disable serial-getty@ttyAMA0.service
sudo systemctl mask serial-getty@ttyAMA0.service