# Standard bash file for doing late-stage apt installs

figlet -t NeoVim
echo  Type with a sign in ages hence, NeoVim made all the difference.
sudo apt install neovim -y
git clone https://github.com/github/copilot.vim.git /home/ubuntu/.config/nvim/pack/github/start/copilot.vim > /dev/null 2>&1

figlet -t Google Chrome
echo  What is the use of a Distro without Graphics or a Browser in it?
sudo apt-get install libxss1 libappindicator1 libindicator7 -y > /dev/null 2>&1
cd /tmp > /dev/null 2>&1
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > /dev/null 2>&1
sudo apt install ./google-chrome*.deb -y > /dev/null 2>&1
sudo apt install x11-apps -y > /dev/null 2>&1
sudo apt install libdbus-glib-1-2 -y > /dev/null 2>&1

# Install Microsoft Playright browsers, edited out in favor of Chrome
# playwright install

