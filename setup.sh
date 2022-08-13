#
# Copyright (C) 2022 Dhina17 <dhinalogu@gmail.com>
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

# Install and setup ZSH
sudo apt install zsh
chsh -s $(which zsh)

# Install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


