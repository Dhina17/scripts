#
# Copyright (C) 2022 Dhina17 <dhinalogu@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# Configs
# Use raw file link
GERRIT_SSH_PRIVATE_KEY_LINK=""
#Gdrive shared drive or folder ID
GDRIVE_PARENT_ID=""

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

# Add custom function to handle gdrive shared drive
# Usage gu <file_name>
CUS_FUNC="gu() { gdrive upload --share \"\${1:?Error: Please give file name}\"  --parent $GDRIVE_PARENT_ID }"
if [ $(basename $SHELL) == "zsh" ]; then
    echo $CUS_FUNC >> ~/.zshrc
    source ~/.zshrc
else
    echo $CUS_FUNC >> ~/.bashrc
    source ~/.bashrc
fi
