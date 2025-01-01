#!/bin/bash

# This script will install Virtual Machine Manager on your existing Void Linux system.

# Install libvirt and QEMU

sudo xbps-install libvirt qemu -y

# Enable services

sudo ln -s /etc/sv/libvirtd /var/service
sudo ln -s /etc/sv/virtlockd /var/service
sudo ln -s /etc/sv/virtlogd /var/service 

# Inform finished installation

echo "Installation complete. Please reboot the computer." 
