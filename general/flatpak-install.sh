# This script was made by Secret Firefox.
# This facilitates installing Flatpak on your Void Linux.
# This is useful so you do not need to go to the website everytime.
# Enjoy! (Mandatory)

# Install Flatpak

sudo xbps-install flatpak

# Add the flathub repository

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Inform finished setup

echo "Setup complete. Reboot so your applications show in your menus."

