set -x
sudo lshw -c network
sudo rfkill list
#sudo rfkill unblock all
#
#
# sudo systemctl restart systemd-networkd

cat <<'EOM' > /dev/null
@yobo@beast:~/Documents$ bash ~/ws/misc/utils/cmd_wifi_investigate.sh 
+ sudo lshw -c network
  *-network:0 DISABLED      
       description: Wireless interface
       product: Cannon Lake PCH CNVi WiFi
       vendor: Intel Corporation
       physical id: 14.3
       bus info: pci@0000:00:14.3
       logical name: wlo1
       version: 10
       serial: 00:24:d6:fa:e1:e6
       width: 64 bits
       clock: 33MHz
       capabilities: pm msi pciexpress msix bus_master cap_list ethernet physical wireless
       configuration: broadcast=yes driver=iwlwifi driverversion=6.8.0-45-generic firmware=46.7e3e4b69.0 9000-pu-b0-jf-b0- latency=0 link=no multicast=yes wireless=IEEE 802.11
       resources: irq:162 memory:50734000-50737fff
  *-network:1
       description: Ethernet interface
       product: Ethernet Connection (7) I219-V
       vendor: Intel Corporation
       physical id: 1f.6
       bus info: pci@0000:00:1f.6
       logical name: eno2
       version: 10
       serial: e0:d5:5e:84:1f:95
       capacity: 1Gbit/s
       width: 32 bits
       clock: 33MHz
       capabilities: pm msi bus_master cap_list ethernet physical tp 10bt 10bt-fd 100bt 100bt-fd 1000bt-fd autonegotiation
       configuration: autonegotiation=on broadcast=yes driver=e1000e driverversion=6.8.0-45-generic firmware=0.5-4 latency=0 link=no multicast=yes port=twisted pair
       resources: irq:163 memory:50700000-5071ffff
+ sudo rfkill list
1: phy0: Wireless LAN
	Soft blocked: no
	Hard blocked: no
2: hci0: Bluetooth
	Soft blocked: no
	Hard blocked: no
@yobo@beast:~/Documents$ sudo ifconfig wlo1:fakenfs 192.168.10.111 netmask 255.255.255.255
EOM
