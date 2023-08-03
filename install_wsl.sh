#!/bin/bash
#  ____            _   ____  _                     ___           _        _ _ 
# |___ \ _ __   __| | / ___|| |_ __ _  __ _  ___  |_ _|_ __  ___| |_ __ _| | |
#   __) | '_ \ / _` | \___ \| __/ _` |/ _` |/ _ \  | || '_ \/ __| __/ _` | | |
#  / __/| | | | (_| |  ___) | || (_| | (_| |  __/  | || | | \__ \ || (_| | | |
# |_____|_| |_|\__,_| |____/ \__\__,_|\__, |\___| |___|_| |_|___/\__\__,_|_|_|
#                                     |___/                                   
# Set this variable to control the quiet mode

quiet_mode=true

# Function to silence output based on the quiet_mode
quiet() {
  if [ "$quiet_mode" = true ]; then
    "$@" >/dev/null 2>&1
  else
    "$@"
  fi
}

# Save the original file descriptors 1 and 2 to variables
exec 3>&1 4>&2

# Make sure Clock is in sync with Windows hardware clock
quiet sudo hwclock -systohc --utc
quiet sudo apt install figlet pv -y

# Check if we have a Python version passed in as an argument
VAR=${1:-3.12}
figlet -t "Python $VAR..."
echo "Have you ever had difficulty getting the latest Python or controlling" | pv -qL 10
echo "which one you're using? Getting the latest, greatest Python has never" | pv -qL 10
echo "been so easy! Just run this script again when a new Python is released!" | pv -qL 10

# Add 2 custom PPS's (Personal Package Sources) to repository list
quiet sudo add-apt-repository ppa:deadsnakes/ppa -y
quiet sudo add-apt-repository ppa:neovim-ppa/stable -y

# Update the package list (now that all PPAs are added)
quiet sudo apt update -y

# Install Python and create the virtual environment
quiet sudo apt install python$VAR -y
quiet sudo apt install python$VAR-venv -y
quiet sudo apt autoremove -y
quiet /usr/bin/python$VAR -m venv /home/ubuntu/pyenv

# First we get everything that needs to be done under superuser context
quiet sudo curl -sL https://raw.githubusercontent.com/miklevin/drinkme/main/.bash_profile -o /home/ubuntu/.bash_profile \
https://raw.githubusercontent.com/miklevin/drinkme/main/.bash_prompt -o /home/ubuntu/.bash_prompt \
https://raw.githubusercontent.com/miklevin/drinkme/main/.screenrc -o /home/ubuntu/.screenrc \
https://raw.githubusercontent.com/miklevin/drinkme/main/config -o /home/ubuntu/repos/transfer/config \
https://raw.githubusercontent.com/miklevin/drinkme/main/unrot.py -o /home/ubuntu/repos/transfer/unrot.py \
https://raw.githubusercontent.com/miklevin/drinkme/main/pub.txt -o /home/ubuntu/repos/transfer/pub.txt \
https://raw.githubusercontent.com/miklevin/drinkme/main/priv.txt -o /home/ubuntu/repos/transfer/priv.txt \
https://raw.githubusercontent.com/miklevin/drinkme/main/git_installs.sh -o /home/ubuntu/repos/transfer/git_installs.sh \
https://raw.githubusercontent.com/miklevin/drinkme/main/jupyter.service -o /etc/systemd/system/jupyter.service

# Then we get everything that needs to be done under the ubuntu user context
quiet curl -sL https://raw.githubusercontent.com/miklevin/vim/master/all -o /home/ubuntu/pyenv/bin/all
quiet curl -sL https://raw.githubusercontent.com/miklevin/drinkme/main/startjupyter -o /home/ubuntu/pyenv/bin/startjupyter

# Give execution context to the scripts
quiet sudo chmod +x /home/ubuntu/pyenv/bin/startjupyter
quiet sudo chmod +x /home/ubuntu/pyenv/bin/all

sudo /home/ubuntu/pyenv/bin/python /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/pub.txt --output /home/ubuntu/repos/transfer/id_rsa_drinkme.pub
sudo /home/ubuntu/pyenv/bin/python /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/priv.txt --output /home/ubuntu/repos/transfer/id_rsa_drinkme
quiet sudo chmod 777 /home/ubuntu/.bash_profile
quiet sudo chmod 777 /home/ubuntu/.bash_prompt
quiet sudo chmod 777 /home/ubuntu/.screenrc
quiet sudo chown ubuntu:ubuntu /home/ubuntu/.bash_profile
quiet sudo chown ubuntu:ubuntu /home/ubuntu/.screenrc
quiet sudo chown ubuntu:ubuntu /home/ubuntu/.bash_prompt
quiet mv -n /home/ubuntu/repos/transfer/id_rsa_drinkme.pub /home/ubuntu/.ssh
quiet mv -n /home/ubuntu/repos/transfer/id_rsa_drinkme /home/ubuntu/.ssh
if [ ! -f "/home/ubuntu/.ssh/config" ]; then
    quiet mv -n /home/ubuntu/repos/transfer/config /home/ubuntu/.ssh
    sudo chmod 600 ~/.ssh/config
fi
quiet /home/ubuntu/pyenv/bin/python -m pip install --upgrade pip

quiet curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
quiet sudo bash /tmp/nodesource_setup.sh
quiet sudo apt install nodejs -y

if [ -f /home/ubuntu/repos/transfer/apt_installs.sh ]
then
    figlet -t "apt get's..."
    echo "Grabbing a few of the 60K+ Ubuntu packages now at your disposal."
    source /home/ubuntu/repos/transfer/apt_installs.sh
fi
sh -c 'curl -fLo /home/ubuntu/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' > /dev/null 2>&1
if [ -f /home/ubuntu/repos/transfer/requirements.txt ]
then
    figlet -t "pip installs..."
    echo "Grabbing a few of the 300K+ PyPI pip-installable packages."
    quiet /home/ubuntu/pyenv/bin/python -m pip install -r /home/ubuntu/repos/transfer/requirements.txt
fi

figlet -t "NodeJS..."
    echo "NodeJS is only in here for browser automation tricks."
quiet curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
quiet sudo bash /tmp/nodesource_setup.sh
quiet sudo apt install nodejs -y

figlet -t "Jupyter..."
echo "Use Linux on Windows with WSL and JupyterLab."
quiet sudo systemctl enable jupyter
quiet sudo systemctl start jupyter
