#!/data/data/com.termux/files/usr/bin/bash

clear

echo "========================================="
echo "     ELPARADISOGONZALO TERMUX ENGINE"
echo "========================================="

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${CYAN}[+] Updating repositories...${NC}"
pkg update -y && pkg upgrade -y

echo -e "${CYAN}[+] Setting up storage...${NC}"
termux-setup-storage

echo -e "${CYAN}[+] Installing core packages...${NC}"
pkg install -y \
git wget curl zip unzip tar \
python nodejs openjdk-21 \
clang cmake make ninja \
openssh vim nano neofetch \
htop proot-distro tsu \
ruby php rust golang \
ffmpeg imagemagick \
qemu-utils dnsutils \
net-tools termux-api

echo -e "${CYAN}[+] Configuring Git...${NC}"
git config --global init.defaultBranch main
git config --global pull.rebase false

echo -e "${CYAN}[+] Creating workspace...${NC}"
mkdir -p ~/projects
mkdir -p ~/scripts
mkdir -p ~/tools
mkdir -p ~/backups
mkdir -p ~/web3
mkdir -p ~/.termux

echo -e "${CYAN}[+] Installing Python tools...${NC}"
pip install --upgrade pip
pip install requests flask numpy wheel

echo -e "${CYAN}[+] Installing Node.js tools...${NC}"
npm install -g yarn pnpm typescript eslint

echo -e "${CYAN}[+] Setting custom bash aliases...${NC}"

cat >> ~/.bashrc << 'EOL'

# ===== Custom Aliases =====
alias ll='ls -lah'
alias gs='git status'
alias gp='git pull'
alias gc='git clone'
alias py='python'
alias update='pkg update -y && pkg upgrade -y'
alias storage='cd /storage/emulated/0'
alias projects='cd ~/projects'
alias reload='source ~/.bashrc'

# ===== Startup Banner =====
clear
echo "======================================"
echo "  ELPARADISOGONZALO DEV TERMINAL"
echo "======================================"
neofetch
EOL

echo -e "${CYAN}[+] Creating helper scripts...${NC}"

cat > ~/scripts/backup.sh << 'EOL'
#!/data/data/com.termux/files/usr/bin/bash
tar -czvf ~/backups/termux_backup_$(date +%F).tar.gz ~/projects
echo "Backup complete."
EOL

chmod +x ~/scripts/backup.sh

cat > ~/scripts/server.sh << 'EOL'
#!/data/data/com.termux/files/usr/bin/bash
cd ~/projects
python -m http.server 8080
EOL

chmod +x ~/scripts/server.sh

echo -e "${CYAN}[+] Finalizing environment...${NC}"
source ~/.bashrc

echo ""
echo -e "${GREEN}=========================================${NC}"
echo -e "${GREEN}   TERMUX SUPER ENVIRONMENT READY${NC}"
echo -e "${GREEN}=========================================${NC}"

echo -e "${YELLOW}Useful Commands:${NC}"
echo "projects      -> Open projects folder"
echo "storage       -> Open Android storage"
echo "update        -> Update Termux packages"
echo "~/scripts/server.sh  -> Start web server"
echo "~/scripts/backup.sh -> Backup projects"

echo ""
echo -e "${RED}System Ready For:${NC}"
echo "- Web Development"
echo "- Python"
echo "- Node.js"
echo "- Rust & Go"
echo "- Android Tooling"
echo "- Web3 Development"
echo "- Git & GitHub"
echo "- QEMU / VM Tools"
echo "- Networking & Servers"

echo ""
neofetch
