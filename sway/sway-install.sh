# This script was made by Secret Firefox.
# This speeds up post installation on your Void Linux.
# This will install the Sway Window Manager on your Void Linux system.
# Enjoy! (Mandatory)

#                                                          #
# [Steps bellow are for post-installation and basic setup] #
#                                                          #

# Update the system

sudo xbps-install -Syu

# Add the nonfree repository

sudo xbps-install -Rs void-repo-nonfree -y

# Install dbus, elogind and NetworkManager

sudo xbps-install dbus elogind NetworkManager -y

# Install recommended packages

sudo xbps-install curl wget git xz unzip zip nano vim gptfdisk xtools mtools mlocate ntfs-3g fuse-exfat bash-completion linux-headers ffmpeg mesa-vdpau mesa-vaapi htop fastfetch psmisc 7zip cpupower xmirror mesa-demos noto-fonts-cjk noto-fonts-emoji xdg-user-dirs xdg-user-dirs-gtk -y

# Install development packages

sudo xbps-install autoconf automake bison m4 make libtool flex meson ninja optipng sassc -y

# Install sound system (Pipewire and Wireplumber)

sudo xbps-install pipewire wireplumber -y

# Authorize and set Pipewire and Wireplumber to autostart

sudo chmod +x /usr/share/applications/pipewire.desktop
sudo chmod +x /usr/share/applications/pipewire-pulse.desktop
sudo chmod +x /usr/share/applications/wireplumber.desktop
sudo ln -s /usr/share/applications/pipewire.desktop /etc/xdg/autostart
sudo ln -s /usr/share/applications/pipewire-pulse.desktop /etc/xdg/autostart
sudo ln -s /usr/share/applications/wireplumber.desktop /etc/xdg/autostart

# Install cronie and enable its service

sudo xbps-install cronie -y
sudo ln -s /etc/sv/cronie /var/service

# Install a logging daemon

sudo xbps-install socklog-void -y
sudo ln -s /etc/sv/socklog-unix /var/service
sudo ln -s /etc/sv/nanoklogd /var/service

# Install Profile Sync Daemon (speeds up browsers)

git clone https://github.com/madand/runit-services
cd runit-services
sudo mv psd /etc/sv/
sudo ln -s /etc/sv/psd /var/service/
sudo chmod +x /etc/sv/psd/*
cd ..
sudo rm -rf runit-services

# Install Firefox and set a better font for it

sudo xbps-install firefox firefox-i18n-en-US -y
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d
sudo xbps-reconfigure -f fontconfig

#
# [Steps below are for installing the display servers and KDE]
#

# Install Xorg and Wayland display servers

sudo xbps-install xorg wayland -y

# Install the Sway window manager and necessary components

sudo xbps-install sway swayidle swaylock sway-audio-idle-inhibit Waybar foot wmenu xdg-desktop-portal xdg-desktop-portal-gtk xdg-desktop-portal-wlr rtkit breeze-snow-cursor-theme -y font-fira-ttf polkit -y

# Install some extra applications, like a file manager, image viewer, etc

sudo xbps-install caja engrampa eom mate-calc pluma nwg-look atril vlc mousepad -y

# Install screenshooting utilities

sudo xbps-install grim wl-clipboard

# Turn off dhcpcd and wpa_supplicant in favor of Network Manager

sudo sv down dhcpcd wpa_supplicant
sudo touch /etc/sv/dhcpcd/down /etc/sv/wpa_supplicant/down
sudo sv status dhcpcd
sudo sv status wpa_supplicant

# Enable dbus, elogind, NetworkManager, polkit and rtkit

sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/elogind/ /var/service
sudo ln -s /etc/sv/NetworkManager /var/service
sudo ln -s /etc/sv/polkit /var/service
sudo ln -s /etc/sv/rtkit /var/service

# Run some xdg utilities so GTK applications appear more ready

xdg-user-dirs-update
xdg-user-dirs-gtk-update

# Inform finished installation

echo "Install complete! Please reboot the computer."





