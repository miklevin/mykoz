#!/bin/bash
#  ____            _   ____  _                     ___           _        _ _ 
# |___ \ _ __   __| | / ___|| |_ __ _  __ _  ___  |_ _|_ __  ___| |_ __ _| | |
#   __) | '_ \ / _` | \___ \| __/ _` |/ _` |/ _ \  | || '_ \/ __| __/ _` | | |
#  / __/| | | | (_| |  ___) | || (_| | (_| |  __/  | || | | \__ \ || (_| | | |
# |_____|_| |_|\__,_| |____/ \__\__,_|\__, |\___| |___|_| |_|___/\__\__,_|_|_|
#                                     |___/                                   
# Make sure Clock is in sync with Windows hardware clock
sudo hwclock -systohc

# Check if we have a Python version passed in as an argument
VAR=${1:-3.11}
figlet -t "Installing Python $VAR..."

# Add 2 custom PPS's (Personal Package Sources) to repository list
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo add-apt-repository ppa:neovim-ppa/stable -y

# Update the package list (now that all PPAs are added)
sudo apt update -y

# Install Python and create the virtual environment
sudo apt install python$VAR -y
sudo apt install python$VAR-venv -y
sudo apt autoremove -y
/usr/bin/python$VAR -m venv /home/ubuntu/pyenv



figlet -t "Configuring Linux..."
sleep 1s
# First we get everything that needs to be done under superuser context
sudo curl -sL https://raw.githubusercontent.com/miklevin/drinkme/main/.bash_profile -o /home/ubuntu/.bash_profile \
https://raw.githubusercontent.com/miklevin/drinkme/main/.bash_prompt -o /home/ubuntu/.bash_prompt \
https://raw.githubusercontent.com/miklevin/drinkme/main/.screenrc -o /home/ubuntu/.screenrc \
https://raw.githubusercontent.com/miklevin/drinkme/main/config -o /home/ubuntu/repos/transfer/configure \
https://raw.githubusercontent.com/miklevin/drinkme/main/unrot.py -o /home/ubuntu/repos/transfer/unrot.py \
https://raw.githubusercontent.com/miklevin/drinkme/main/pub.txt -o /home/ubuntu/repos/transfer/pub.txt \
https://raw.githubusercontent.com/miklevin/drinkme/main/priv.txt -o /home/ubuntu/repos/transfer/priv.txt \
https://raw.githubusercontent.com/miklevin/drinkme/main/known_hosts -o /home/ubuntu/repos/transfer/known_hosts \
https://raw.githubusercontent.com/miklevin/drinkme/main/git_installs.sh -o /home/ubuntu/repos/transfer/git_installs.sh \
https://raw.githubusercontent.com/miklevin/drinkme/main/jupyter.service -o /etc/systemd/system/jupyter.service \

# Then we get everything that needs to be done under the ubuntu user context
curl -sL https://raw.githubusercontent.com/miklevin/vim/master/all -o /home/ubuntu/pyenv/bin/all \
https://raw.githubusercontent.com/miklevin/drinkme/main/startjupyter -o /home/ubuntu/pyenv/bin/startjupyter 

# Give execution context to the scripts
sudo chmod +x /home/ubuntu/pyenv/bin/startjupyter
sudo chmod +x /home/ubuntu/pyenv/bin/all

# sudo curl -L -o /home/ubuntu/.bash_profile https://raw.githubusercontent.com/miklevin/drinkme/main/.bash_profile
# sudo curl -L -o /home/ubuntu/.bash_prompt https://raw.githubusercontent.com/miklevin/drinkme/main/.bash_prompt
# sudo curl -L -o /home/ubuntu/.screenrc https://raw.githubusercontent.com/miklevin/drinkme/main/.screenrc
# sudo curl -L -o /home/ubuntu/repos/transfer/configure https://raw.githubusercontent.com/miklevin/drinkme/main/config
# sudo curl -L -o /home/ubuntu/repos/transfer/unrot.py https://raw.githubusercontent.com/miklevin/drinkme/main/unrot.py
# sudo curl -L -o /home/ubuntu/repos/transfer/pub.txt https://raw.githubusercontent.com/miklevin/drinkme/main/pub.txt
# sudo curl -L -o /home/ubuntu/repos/transfer/priv.txt https://raw.githubusercontent.com/miklevin/drinkme/main/priv.txt
# sudo curl -L -o /home/ubuntu/repos/transfer/known_hosts https://raw.githubusercontent.com/miklevin/drinkme/main/known_hosts
# sudo curl -L -o /home/ubuntu/repos/transfer/configure https://raw.githubusercontent.com/miklevin/drinkme/main/config
# sudo curl -L -o /home/ubuntu/repos/transfer/git_installs.sh https://raw.githubusercontent.com/miklevin/drinkme/main/git_installs.sh
# sudo curl -L -o /etc/systemd/system/jupyter.service https://raw.githubusercontent.com/miklevin/drinkme/main/jupyter.service
# sudo curl -L -o /home/ubuntu/pyenv/startjupyter https://raw.githubusercontent.com/miklevin/drinkme/main/startjupyter
# sudo curl -L -o /home/ubuntu/pyenv/bin/all https://raw.githubusercontent.com/miklevin/vim/master/all
# sudo curl -L -o /home/ubuntu/repos/transfer/configure https://raw.githubusercontent.com/miklevin/drinkme/main/config
# sudo curl -L -o /home/ubuntu/pyenv/bin/all https://raw.githubusercontent.com/miklevin/vim/master/all
# sudo curl -L -o /home/ubuntu/repos/transfer/configure https://raw.githubusercontent.com/miklevin/drinkme/main/config

sudo /home/ubuntu/pyenv/bin/python /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/pub.txt --output /home/ubuntu/repos/transfer/id_rsa_drinkme.pub
sudo /home/ubuntu/pyenv/bin/python /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/priv.txt --output /home/ubuntu/repos/transfer/id_rsa_drinkme
sudo chmod 777 /home/ubuntu/.bash_profile
sudo chmod 777 /home/ubuntu/.bash_prompt
sudo chmod 777 /home/ubuntu/.screenrc
sudo chown ubuntu:ubuntu /home/ubuntu/.bash_profile
sudo chown ubuntu:ubuntu /home/ubuntu/.screenrc
sudo chown ubuntu:ubuntu /home/ubuntu/.bash_prompt
mv -n /home/ubuntu/repos/transfer/id_rsa_drinkme.pub /home/ubuntu/.ssh
mv -n /home/ubuntu/repos/transfer/id_rsa_drinkme /home/ubuntu/.ssh
mv -n /home/ubuntu/repos/transfer/known_hosts /home/ubuntu/.ssh
mv -n /home/ubuntu/repos/transfer/configure /home/ubuntu/.ssh
/home/ubuntu/pyenv/bin/python -m pip install --upgrade pip

figlet -t "NodeJS install..."
sleep 1s
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt install nodejs -y

if [ -f /home/ubuntu/repos/transfer/apt_installs.sh ]
then
    figlet -t "Apt Installs..."
    sleep 1s
    source /home/ubuntu/repos/transfer/apt_installs.sh
fi
sh -c 'curl -fLo /home/ubuntu/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if [ -f /home/ubuntu/repos/transfer/requirements.txt ]
then
    figlet -t "Pip Installs..."
    sleep 1s
    /home/ubuntu/pyenv/bin/python -m pip install -r /home/ubuntu/repos/transfer/requirements.txt
fi

figlet -t "NodeJS install..."
sleep 1s
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt install nodejs -y

jupyter labextension install jupyterlab-plotly
sudo systemctl enable jupyter
sudo systemctl start jupyter
figlet -t "jupyter installed!"
sleep 1s
