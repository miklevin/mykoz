# Standard bash file for doing late-stage apt installs

sudo apt install neovim -y 
git clone https://github.com/github/copilot.vim.git /home/ubuntu/.config/nvim/pack/github/start/copilot.vim 
sudo apt-get install libxss1 libappindicator1 libindicator7 -y 
cd /tmp 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb > /dev/null 2>&1
sudo apt install ./google-chrome*.deb -y 
sudo apt install x11-apps -y 
sudo apt install libdbus-glib-1-2 -y 
sudo apt install ffmpeg -y 

# Install Microsoft Playright browsers, edited out in favor of Chrome
playwright install 

