#!/bin/bash
#  ____            _   ____  _                     ___           _        _ _ 
# |___ \ _ __   __| | / ___|| |_ __ _  __ _  ___  |_ _|_ __  ___| |_ __ _| | |
#   __) | '_ \ / _` | \___ \| __/ _` |/ _` |/ _ \  | || '_ \/ __| __/ _` | | |
#  / __/| | | | (_| |  ___) | || (_| | (_| |  __/  | || | | \__ \ || (_| | | |
# |_____|_| |_|\__,_| |____/ \__\__,_|\__, |\___| |___|_| |_|___/\__\__,_|_|_|
#                                     |___/                                   
# Set this variable to control the quiet mode

quiet_mode=false

VAR=${1:-3.11}
# Check if we have a Python version passed in as an argument
# ${1} refers to the first argument passed to the script.
# :- is a special operator that sets a default value for the variable if it is not already set.
# 3.11 is the default value that will be used if the first argument is not provided or is empty.

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

# quiet sudo apt update -y
# quiet sudo apt upgrade -y

# Make sure Clock is in sync with Windows hardware clock
quiet sudo hwclock -systohc --utc
quiet sudo apt install figlet pv -y

echo " ------------------------------------------------------------------------------"
figlet -t "Python $VAR..."
echo " Have you ever had difficulty getting the latest Python or controlling which"| pv -qL 100
echo " version Python you're using? Just re-run this script to upgrade to the latest!" | pv -qL 100
echo " You'll be using the genuine Linux Python running on cloud servers around the" | pv -qL 100
echo " world. No more DOS backslashes or pathing issues. Just Python bliss." | pv -qL 100
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
quiet usr/bin/python$VAR -m pip install virtualenv
quiet figlet -t "Creating virtualenv..."
quiet /usr/bin/python$VAR -m virtualenv /home/ubuntu/pyenv
echo ""
echo " Done Python install!" | pv -qL 100

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

quiet curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
quiet sudo bash /tmp/nodesource_setup.sh
quiet sudo apt install nodejs -y

# DO THE APT GET INSTALLS
if [ -f /home/ubuntu/repos/transfer/apt_installs.sh ]
then
    echo "------------------------------------------------------------------------------"
    figlet -t "apt get's..."
    echo " Grabbing a few of the 60K+ Ubuntu packages which are now at your disposal." | pv -qL 100
    echo " Debian-derivative distros like Ubuntu have a package manager called apt." | pv -qL 100
    echo " It's like the Windows Store, but automatable in server install scripts." | pv -qL 100
    source /home/ubuntu/repos/transfer/apt_installs.sh > /dev/null 2>&1
    echo ""
    echo " Done apt get's!"
fi
sh -c 'curl -fLo /home/ubuntu/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' > /dev/null 2>&1

# DO THE PIP INSTALLS
if [ -f /home/ubuntu/repos/transfer/requirements.txt ]
then
    echo " ------------------------------------------------------------------------------"
    figlet -t "pip installs..."
    echo " Grabbing a few of the 300K+ Python Packaging Index (PyPI or pip) packages." | pv -qL 100
    echo " Python is the most popular programming language in the world, and pip is how." | pv -qL 100
    echo " non-standard libraries get installed. It's like the Python Store." | pv -qL 100
    quiet /home/ubuntu/pyenv/bin/python -m pip install -r /home/ubuntu/repos/transfer/requirements.txt
    echo ""
    echo " Done pip installs!"
fi

# DO THE NODEJS INSTALL
echo " ------------------------------------------------------------------------------"
figlet -t "NodeJS..."
echo " NodeJS has taken the world by storm, but it's completely the opposite of STOIC." | pv -qL 100
echo " You would call it BLOATIC. So why is it here? Because one essential thing we're" | pv -qL 100
echo " doing here is browser-automation for Web data collection, and this is needed."
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
echo " started with Linux. You can use it to gently get familair with Linux." | pv -qL 100
echo " Use Linux on Windows with WSL and JupyterLab."
quiet sudo systemctl enable jupyter
quiet sudo systemctl start jupyter
echo ""
echo " Done JupyterLab install!"
echo " ------------------------------------------------------------------------------"
