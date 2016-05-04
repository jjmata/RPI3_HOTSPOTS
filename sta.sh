#! /bin/bash
a="\"$1\""
b="\"$2\""
sudo sed -i -e "s/\(ssid=\).*/\1$a/" /etc/wpa_supplicant/wpa_supplicant.conf 
sudo sed -i -e "s/\(psk=\).*/\1$b/" /etc/wpa_supplicant/wpa_supplicant.conf
sudo /etc/init.d/hostapd stop
sudo /etc/init.d/udhcpd stop
sudo ifdown wlan0
sudo ifconfig wlan0 down
sudo rm -rf /etc/network/interfaces
sudo cp /etc/network/interfaces.sta /etc/network/interfaces
sudo ifconfig wlan0 up
sudo ifup wlan0
