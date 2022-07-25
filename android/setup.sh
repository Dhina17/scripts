set -e

# Initital setup
# Install required packages.
# Credits - https://github.com/akhilnarang/scripts
bash -c "$(wget -O- https://github.com/akhilnarang/scripts/raw/master/setup/android_build_env.sh)"

# Pull git config
wget -O ~/.gitconfig https://github.com/Dhina17/dotfiles/raw/main/.gitconfig

# Setup gdrive tool
wget https://raw.githubusercontent.com/usmanmughalji/gdriveupload/master/gdrive
chmod +x gdrive
sudo install gdrive /usr/local/bin/gdrive
rm gdrive
