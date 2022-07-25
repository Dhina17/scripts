set -e

# Configs
# Use raw file link
GERRIT_SSH_PRIVATE_KEY_LINK=""

# Initital setup
# Install required packages.
# Credits - https://github.com/akhilnarang/scripts
bash -c "$(wget -O- https://github.com/akhilnarang/scripts/raw/master/setup/android_build_env.sh)"

# Pull git config
wget -O ~/.gitconfig https://github.com/Dhina17/dotfiles/raw/main/.gitconfig

# Setup gerrit
# Import ssh key and config
wget -P ~/.ssh/ ${GERRIT_SSH_PRIVATE_KEY_LINK}
wget -O ~/.ssh/config https://github.com/Dhina17/dotfiles/raw/main/.ssh/config
# Read only
chmod 400 ~/.ssh/*

# Setup gdrive tool
wget https://raw.githubusercontent.com/usmanmughalji/gdriveupload/master/gdrive
chmod +x gdrive
sudo install gdrive /usr/local/bin/gdrive
rm gdrive
