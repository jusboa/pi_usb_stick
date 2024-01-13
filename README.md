# pi_usb_stick
USB mass storage with Raspberry PI Zero

The PI acts as a mass storage device when connected with host via the USB port. The mass storage data could also be accessed remotely via wifi connection.

Instructions:
1. Change settings in fix-ssh-on-pi.ini.
2. Install raspberry image via fix-ssh-on-pi-wifi-nm/fix-ssh-on-pi.bash.
3. Insert the SD card into your raspberry and power it up.
4. Setup your raspberry and your host machine via Ansible: ansible-playbook -i inventory.yaml playbook.yaml.
5. The usb mass storage shall be ready by now. You can connect its USB port to the host machine. It should act as ordinary mass storage device. The data could be accessed from host computer that is connected via USB and via wifi/nfs (referred here as wifi host). But the access is exclusive, i.e. you cannot change the data from bot computers at the same time.
   1. To access the data from withn raspberry pi launch sudo /opt/from_pi.sh. Mass storage data will be mounted to {{ mount_point }}.
   2. To access the data via wifi/nfs launch sudo /opt/mount_pi_nfs.sh from wifi host computer. The device will be mounted to {{ nfs_mount_point }}.
   3. To switch the raspberry back to mass storage mode, i.e. use it as mass storage device with you USB host computer launch sudo /opt/from_host.sh.