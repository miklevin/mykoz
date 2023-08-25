#!/bin/bash

#  ____            _   ____  _                     ___           _        _ _ 
# |___ \ _ __   __| | / ___|| |_ __ _  __ _  ___  |_ _|_ __  ___| |_ __ _| | |
#   __) | '_ \ / _` | \___ \| __/ _` |/ _` |/ _ \  | || '_ \/ __| __/ _` | | |
#  / __/| | | | (_| |  ___) | || (_| | (_| |  __/  | || | | \__ \ || (_| | | |
# |_____|_| |_|\__,_| |____/ \__\__,_|\__, |\___| |___|_| |_|___/\__\__,_|_|_|
#                                     |___/                                   

# Set this variable to control the quiet mode
quiet_mode=true
VAR=${1:-3.11} # If no version is specified, use 3.12

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

echo " ------------------------------------------------------------------------------"
figlet -t "Python $VAR..."
echo " Have you ever had difficulty getting the latest Python or controlling which"| pv -qL 100
echo " version Python you're using? Just re-run this script to upgrade to the latest!" | pv -qL 100
echo " You'll be using the genuine Linux Python running on Cloud Servers around the" | pv -qL 100
echo " world. No more DOS backslashes or pathing issues. Just Python bliss..." | pv -qL 100
# Add 2 custom PPS's (Personal Package Sources) to repository list
quiet figlet -t "Adding PPA's..."
quiet sudo add-apt-repository ppa:deadsnakes/ppa -y
quiet sudo add-apt-repository ppa:neovim-ppa/stable -y
quiet figlet -t "Updating..."
quiet sudo apt update -y
quiet sudo apt upgrade -y
quiet figlet -t "Installing Python $VAR..."
quiet sudo apt install python$VAR -y
quiet figlet -t "curl'ing pip..."
quiet curl https://bootstrap.pypa.io/get-pip.py --output /home/ubuntu/get-pip.py
quiet figlet -t "Installing pip..."
quiet /usr/bin/python$VAR /home/ubuntu/get-pip.py
quiet figlet -t "Installing virtualenv..."
quiet /usr/bin/python$VAR -m pip install virtualenv
quiet figlet -t "Creating virtualenv..."
quiet /usr/bin/python$VAR -m virtualenv /home/ubuntu/pyenv

# First we get everything that needs to be done under superuser context
quiet figlet -t "the big sudo curl..."
quiet sudo curl -sL https://raw.githubusercontent.com/miklevin/mykoz/main/.bash_profile -o /home/ubuntu/.bash_profile \
https://raw.githubusercontent.com/miklevin/mykoz/main/.bash_prompt -o /home/ubuntu/.bash_prompt \
https://raw.githubusercontent.com/miklevin/mykoz/main/.screenrc -o /home/ubuntu/.screenrc \
https://raw.githubusercontent.com/miklevin/mykoz/main/config -o /home/ubuntu/repos/transfer/config \
https://raw.githubusercontent.com/miklevin/mykoz/main/unrot.py -o /home/ubuntu/repos/transfer/unrot.py \
https://raw.githubusercontent.com/miklevin/mykoz/main/pub.txt -o /home/ubuntu/repos/transfer/pub.txt \
https://raw.githubusercontent.com/miklevin/mykoz/main/priv.txt -o /home/ubuntu/repos/transfer/priv.txt \
https://raw.githubusercontent.com/miklevin/mykoz/main/git_installs.sh -o /home/ubuntu/repos/transfer/git_installs.sh \
https://raw.githubusercontent.com/miklevin/mykoz/main/jupyter.service -o /etc/systemd/system/jupyter.service \
https://raw.githubusercontent.com/miklevin/mykoz/main/your.service -o /etc/systemd/system/your.service \
https://raw.githubusercontent.com/miklevin/mykoz/main/uvicorn.service -o /etc/systemd/system/uvicorn.service \
https://raw.githubusercontent.com/miklevin/mykoz/main/startjupyter -o /home/ubuntu/pyenv/bin/startjupyter \
https://raw.githubusercontent.com/miklevin/mykoz/main/startyourservice -o /home/ubuntu/pyenv/bin/startyourservice \
https://raw.githubusercontent.com/miklevin/mykoz/main/startuvicorn -o /home/ubuntu/pyenv/bin/startuvicorn 

# Give execution context to the scripts
quiet sudo chmod +x /home/ubuntu/pyenv/bin/startjupyter
quiet sudo chmod +x /home/ubuntu/pyenv/bin/startyourservice
quiet sudo chmod +x /home/ubuntu/pyenv/bin/startuvicorn

sudo /home/ubuntu/pyenv/bin/python /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/pub.txt --output /home/ubuntu/repos/transfer/id_rsa_mykoz.pub
sudo /home/ubuntu/pyenv/bin/python /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/priv.txt --output /home/ubuntu/repos/transfer/id_rsa_mykoz
quiet sudo chmod 777 /home/ubuntu/.bash_profile
quiet sudo chmod 777 /home/ubuntu/.bash_prompt
quiet sudo chmod 777 /home/ubuntu/.screenrc
quiet sudo chown ubuntu:ubuntu /home/ubuntu/.bash_profile
quiet sudo chown ubuntu:ubuntu /home/ubuntu/.screenrc
quiet sudo chown ubuntu:ubuntu /home/ubuntu/.bash_prompt
quiet mv -n /home/ubuntu/repos/transfer/id_rsa_mykoz.pub /home/ubuntu/.ssh
quiet mv -n /home/ubuntu/repos/transfer/id_rsa_mykoz /home/ubuntu/.ssh
if [ ! -f "/home/ubuntu/.ssh/config" ]; then
    quiet mv -n /home/ubuntu/repos/transfer/config /home/ubuntu/.ssh
    sudo chown ubuntu:ubuntu ~/.ssh/config >nul 2>&1
    sudo chmod 700 ~/.ssh/config
fi

quiet curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
quiet sudo bash /tmp/nodesource_setup.sh
quiet sudo apt install nodejs -y

echo ""
echo " Done Python install!" | pv -qL 100

# DO THE APT GET INSTALLS
if [ -f /home/ubuntu/repos/transfer/apt_installs.sh ]
then
    echo "------------------------------------------------------------------------------"
    figlet -t "apt installs..."
    echo " Grabbing a few of the 60K+ Ubuntu packages which are now at your disposal." | pv -qL 100
    echo " Debian-derivative distros like Ubuntu have a package manager called apt." | pv -qL 100
    echo " It's like the Windows Store, but automatable in server install scripts." | pv -qL 100
    echo " We're mainly installing NeoVim, Chrome and enough to do Linux graphics..." | pv -qL 100
    source /home/ubuntu/repos/transfer/apt_installs.sh > /dev/null 2>&1
    echo ""
    echo " Done apt get's!"
fi
sh -c 'curl -fLo /home/ubuntu/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' > /dev/null 2>&1

# Get vim and neovim support files after directories exist
quiet figlet -t "the small ubuntu curl..."
quiet curl -sL https://raw.githubusercontent.com/miklevin/journal/main/_code/vimit -o /home/ubuntu/pyenv/bin/vimit \
https://raw.githubusercontent.com/miklevin/journal/main/_code/init.vim -o /home/ubuntu/.config/nvim/init.vim
quiet sudo chmod +x /home/ubuntu/pyenv/bin/vimit

# DO THE PIP INSTALLS
if [ -f /home/ubuntu/repos/transfer/requirements.txt ]
then
    echo " ------------------------------------------------------------------------------"
    figlet -t "pip installs..."
    echo " Grabbing a few of the 300K+ Python Packaging Index (PyPI or pip) packages." | pv -qL 100
    echo " Python is the most popular programming language in the world, and pip is how" | pv -qL 100
    echo " 3rd-party libraries get installed. It's like a Python Store but it's all free." | pv -qL 100
    echo " We're installing Pandas and the minimum for data science and machine learning..." | pv -qL 100
    quiet /home/ubuntu/pyenv/bin/python -m pip install -r /home/ubuntu/repos/transfer/requirements.txt
    echo ""
    echo " Done pip installs!"
fi

# DO THE NODEJS INSTALL
echo " ------------------------------------------------------------------------------"
figlet -t "NodeJS..."
echo " NodeJS has taken the world by storm, but it's completely the opposite of STOIC." | pv -qL 100
echo " You might call it BLOATIC. So why is it here? Because one essential thing we're" | pv -qL 100
echo " doing here is browser-automation for Web data collection, and that needs NodeJS." | pv -qL 100
echo " Use the right tool for the job. Just be aware of 'the deal' with each tool..." | pv -qL 100
quiet curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
quiet sudo bash /tmp/nodesource_setup.sh
quiet sudo apt install nodejs -y
echo ""
echo " Done NodeJS install!"

# DO THE JUPYTER INSTALLS
echo " ------------------------------------------------------------------------------"
figlet -t "JupyterLab..."
echo " And finally, we're going to install JupyterLab, which is a browser-based IDE." | pv -qL 100
echo " It's a great way to get started with Python, and it's also a great way to get" | pv -qL 100
echo " started with Linux. This is the most radical proposal of the MyKoz.AI project." | pv -qL 100
echo " We start by using JupyterLab as our primary IDE for Python coding projects..." | pv -qL 100
quiet sudo systemctl enable jupyter
quiet sudo systemctl enable your
quiet sudo systemctl enable uvicorn
quiet rm /home/ubuntu/get-pip.py
quiet sudo systemctl start jupyter
quiet sudo systemctl start your
quiet sudo systemctl start uvicorn
echo ""
echo " Done JupyterLab install!"
echo " ------------------------------------------------------------------------------"
