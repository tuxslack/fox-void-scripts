#!/bin/bash

# This will fix problems with audio noise on Pipewire.
# Let's kill that noise!

# Move the provided file to /etc/moprobe.d/ to stop the noise.

sudo mv snd_hda_intel.conf /etc/modprobe.d/

# Informed successfull fix.

echo "You are now noiseless. Reboot the computer to activate it."

