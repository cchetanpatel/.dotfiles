#!/bin/bash


sudo dnf install -y tmux
sudo dnf install -y git
sudo dnf install -y cmake
sudo dnf install -y fzf
sudo dnf install -y gcc
sudo dnf install -y ripgrep
sudo dnf install -y icat


# Lazy Git
sudo dnf copr enable atim/lazygit -y
sudo dnf install -y lazygit

# NeoVim
# Add the following to .bashrc, .zshrc etc
# export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo dnf install -y npm # Node required for many lazy installs in nvim

# Ghostty
sudo dnf copr enable pgdev/ghostty -y
sudo dnf install -y ghostty
sudo dnf install -y chafa # Displays images in Ghostty using the kitty protocol

# WDisplays
sudo dnf install -y wdisplays

# Font
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv

# Input Remapper
sudo dnf install -y input-remapper
sudo systemctl enable --now input-remapper

# Oh-My-Zsh
sudo dnf install -y zsh # Ensure zsh is installed first
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# docker 
sudo dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine
sudo dnf -y install dnf-plugins-core
sudo dnf-3 config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo systemctl enable --now docker

# Brave browser
curl -fsS https://dl.brave.com/install.sh | sh

# Sublime Text
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager addrepo --from-repofile=https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install -y sublime-text

# VS Code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

dnf check-update
sudo dnf install -y code 

# Devpod-cli 
curl -L -o devpod "https://github.com/loft-sh/devpod/releases/latest/download/devpod-linux-amd64" && sudo install -c -m 0755 devpod /usr/local/bin && rm -f devpod
devpod provider add docker
devpod provider use docker
devpod use ide none

# Sunshine
wget https://github.com/LizardByte/Sunshine/releases/latest/download/sunshine.AppImage $HOME/AppImage/
sudo firewall-cmd --permanent --new-service=sunshine
sudo firewall-cmd --permanent --service=sunshine --add-port={47984/tcp,47989/tcp,47990/tcp,48010/tcp}
sudo firewall-cmd --permanent --service=sunshine --add-port=47998-48000/udp
sudo firewall-cmd --permanent --zone=public --add-service=sunshine
sudo firewall-cmd --reload

