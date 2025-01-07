# This script will install xbps-src on your Void Linux.
# Enjoy!

# Make sure git is installed first

sudo xbps-install git -y

# Clone the repository

git clone https://github.com/void-linux/void-packages.git

# Get to the cloned folder

cd void-packages

# Assemble the bootstrap

./xbps-src binary-bootstrap

# Informed finished installation

echo "Installation complete. Now build packages with './xbps-src pkg <package_name>' and install with 'sudo xbps-install --repository hostdir/binpkgs <package_name>'"

echo "To allow for restricted packages, use 'echo XBPS_ALLOW_RESTRICTED=yes >> etc/conf"

