#!/bin/bash

#greping status of mysql
uname -r | grep '5.4.0-66-generic' > /dev/null 2>&1

if [ $? != 0 ]
then
    sudo apt update
    sudo apt install linux-generic-hwe-18.04 -y
    sleep 10s
    sudo apt install --reinstall alsa-firmware-loaders alsa-base alsa alsa-utils pulseaudio pulseaudio-utils -y
    sleep 10s
    sudo alsa force-reload
    sleep 10s
    sudo sed -i '$a options snd-hda-intel model=auto' /etc/modprobe.d/alsa-base.conf
    sudo alsa force-reload
    sudo reboot
fi
#check for the cards if they are visible now
#dmesg | grep -Ei 'alsa|audio|sound|snd|hda'
#cat /proc/asound/cards

#sudo apt install --reinstall alsa-base alsa-utils pulseaudio -y
#sleep 10s
#sudo alsa force-reload
#sleep 10s
#sudo reboot
