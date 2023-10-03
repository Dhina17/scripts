#
# Copyright (C) 2022 Dhina17 <dhinalogu@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# Install micro editor
curl https://getmic.ro | bash
sudo mv micro /usr/local/bin/
# Copy micro configs
mkdir -p ~/.config/micro/
wget -O ~/.config/micro/settings.json https://github.com/Dhina17/dotfiles/raw/main/.config/micro/settings.json

# Install cool plugins to make life easier.
# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git -b master ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git -b master ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install and setup ZSH
sudo apt install zsh
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
