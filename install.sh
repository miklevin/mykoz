#!/bin/bash
#  ____            _   ____  _                     ___           _        _ _ 
# |___ \ _ __   __| | / ___|| |_ __ _  __ _  ___  |_ _|_ __  ___| |_ __ _| | |
#   __) | '_ \ / _` | \___ \| __/ _` |/ _` |/ _ \  | || '_ \/ __| __/ _` | | |
#  / __/| | | | (_| |  ___) | || (_| | (_| |  __/  | || | | \__ \ || (_| | | |
# |_____|_| |_|\__,_| |____/ \__\__,_|\__, |\___| |___|_| |_|___/\__\__,_|_|_|
#                                     |___/                                   
# Make sure Clock is in sync with Windows hardware clock
sudo hwclock -systohc --utc > /dev/null 2>&1
sudo apt install figlet -y > /dev/null 2>&1

# Check if we have a Python version passed in as an argument
VAR=${1:-3.11}
figlet -t "Python $VAR..."

# Add 2 custom PPS's (Personal Package Sources) to repository list
sudo add-apt-repository ppa:deadsnakes/ppa -y > /dev/null 2>&1
sudo add-apt-repository ppa:neovim-ppa/stable -y > /dev/null 2>&1

# Update the package list (now that all PPAs are added)
sudo apt update -y > /dev/null 2>&1

# Install Python and create the virtual environment
sudo apt install python$VAR -y > /dev/null 2>&1
sudo apt install python$VAR-venv -y > /dev/null 2>&1
sudo apt autoremove -y > /dev/null 2>&1
/usr/bin/python$VAR -m venv /home/ubuntu/pyenv > /dev/null 2>&1

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
https://raw.githubusercontent.com/miklevin/drinkme/main/jupyter.service -o /etc/systemd/system/jupyter.service > /dev/null

# Then we get everything that needs to be done under the ubuntu user context
curl -sL https://raw.githubusercontent.com/miklevin/vim/master/all -o /home/ubuntu/pyenv/bin/all > /dev/null 2>&1
curl -sL https://raw.githubusercontent.com/miklevin/drinkme/main/startjupyter -o /home/ubuntu/pyenv/bin/startjupyter > /dev/null 2>&1

# Give execution context to the scripts
sudo chmod +x /home/ubuntu/pyenv/bin/startjupyter > /dev/null 2>&1
sudo chmod +x /home/ubuntu/pyenv/bin/all > /dev/null 2>&1

sudo /home/ubuntu/pyenv/bin/python /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/pub.txt --output /home/ubuntu/repos/transfer/id_rsa_drinkme.pub
sudo /home/ubuntu/pyenv/bin/python /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/priv.txt --output /home/ubuntu/repos/transfer/id_rsa_drinkme
sudo chmod 777 /home/ubuntu/.bash_profile > /dev/null 2>&1
sudo chmod 777 /home/ubuntu/.bash_prompt > /dev/null 2>&1
sudo chmod 777 /home/ubuntu/.screenrc > /dev/null 2>&1
sudo chown ubuntu:ubuntu /home/ubuntu/.bash_profile > /dev/null 2>&1
sudo chown ubuntu:ubuntu /home/ubuntu/.screenrc > /dev/null 2>&1
sudo chown ubuntu:ubuntu /home/ubuntu/.bash_prompt > /dev/null 2>&1
mv -n /home/ubuntu/repos/transfer/id_rsa_drinkme.pub /home/ubuntu/.ssh > /dev/null 2>&1
mv -n /home/ubuntu/repos/transfer/id_rsa_drinkme /home/ubuntu/.ssh > /dev/null 2>&1
mv -n /home/ubuntu/repos/transfer/known_hosts /home/ubuntu/.ssh > /dev/null 2>&1
mv -n /home/ubuntu/repos/transfer/configure /home/ubuntu/.ssh > /dev/null 2>&1
/home/ubuntu/pyenv/bin/python -m pip install --upgrade pip > /dev/null 2>&1

curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh > /dev/null 2>&1
sudo bash /tmp/nodesource_setup.sh > /dev/null 2>&1
sudo apt install nodejs -y > /dev/null 2>&1

if [ -f /home/ubuntu/repos/transfer/apt_installs.sh ]
then
    figlet -t "DbPkg..."
    sleep 1s
    source /home/ubuntu/repos/transfer/apt_installs.sh > /dev/null 2>&1
fi
sh -c 'curl -fLo /home/ubuntu/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' > /dev/null 2>&1
if [ -f /home/ubuntu/repos/transfer/requirements.txt ]
then
    figlet -t "PyPI..."
    sleep 1s
    /home/ubuntu/pyenv/bin/python -m pip install -r /home/ubuntu/repos/transfer/requirements.txt > /dev/null 2>&1
fi

figlet -t "NodeJS..."
sleep 1s
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh > /dev/null 2>&1
sudo bash /tmp/nodesource_setup.sh > /dev/null 2>&1
sudo apt install nodejs -y > /dev/null 2>&1

figlet -t "Jupyter..."
jupyter labextension install jupyterlab-plotly > /dev/null 2>&1
sudo systemctl enable jupyter > /dev/null 2>&1
sudo systemctl start jupyter > /dev/null 2>&1
