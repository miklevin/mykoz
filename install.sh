#!/bin/bash

figlet -t "Installing Python 3.11"
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt install python3.11 -y
sudo apt install python3.11-venv -y
sudo apt autoremove -y
/usr/bin/python3.11 -m venv /home/ubuntu/py311
sudo curl -L -o /home/ubuntu/.bash_profile https://raw.githubusercontent.com/miklevin/drinkme/main/.bash_profile-wsl
sudo curl -L -o /home/ubuntu/.bash_prompt https://raw.githubusercontent.com/miklevin/drinkme/main/.bash_prompt
sudo curl -L -o /home/ubuntu/.screenrc https://raw.githubusercontent.com/miklevin/drinkme/main/.screenrc
sudo curl -L -o /home/ubuntu/repos/transfer/configure https://raw.githubusercontent.com/miklevin/drinkme/main/config
sudo curl -L -o /home/ubuntu/repos/transfer/unrot.py https://raw.githubusercontent.com/miklevin/drinkme/main/unrot.py
sudo curl -L -o /home/ubuntu/repos/transfer/pub.txt https://raw.githubusercontent.com/miklevin/drinkme/main/pub.txt
sudo curl -L -o /home/ubuntu/repos/transfer/priv.txt https://raw.githubusercontent.com/miklevin/drinkme/main/priv.txt
sudo curl -L -o /home/ubuntu/repos/transfer/known_hosts https://raw.githubusercontent.com/miklevin/drinkme/main/known_hosts
sudo curl -L -o /home/ubuntu/repos/transfer/configure https://raw.githubusercontent.com/miklevin/drinkme/main/config
sudo /home/ubuntu/py311/bin/python3.11 /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/pub.txt --output /home/ubuntu/repos/transfer/id_rsa_lxdwin.pub
sudo /home/ubuntu/py311/bin/python3.11 /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/priv.txt --output /home/ubuntu/repos/transfer/id_rsa_lxdwin
sudo chmod 777 /home/ubuntu/.bash_profile
sudo chmod 777 /home/ubuntu/.bash_prompt
sudo chmod 777 /home/ubuntu/.screenrc
sudo chown ubuntu:ubuntu /home/ubuntu/.bash_profile
sudo chown ubuntu:ubuntu /home/ubuntu/.screenrc
sudo chown ubuntu:ubuntu /home/ubuntu/.bash_prompt
mv -n /home/ubuntu/repos/transfer/id_rsa_lxdwin.pub /home/ubuntu/.ssh
mv -n /home/ubuntu/repos/transfer/id_rsa_lxdwin /home/ubuntu/.ssh
mv -n /home/ubuntu/repos/transfer/known_hosts /home/ubuntu/.ssh
mv -n /home/ubuntu/repos/transfer/configure /home/ubuntu/.ssh
sudo curl -L -o /home/ubuntu/repos/transfer/configure https://raw.githubusercontent.com/miklevin/drinkme/main/config
sudo curl -L -o /usr/local/sbin/jupyterstart https://raw.githubusercontent.com/miklevin/drinkme/main/jupyterstart
sudo chmod +x /usr/local/sbin/jupyterstart
sudo curl -L -o /usr/local/sbin/jupyterscreen https://raw.githubusercontent.com/miklevin/drinkme/main/jupyterscreen
sudo chmod +x /usr/local/sbin/jupyterscreen
figlet -t "Optional Installs"
if [ -f /home/ubuntu/repos/transfer/requirements.txt ]
then
    figlet -t "Doing Pip Installs"
    /home/ubuntu/py311/bin/python3.11 -m pip install -r /home/ubuntu/repos/transfer/requirements.txt
fi
if [ -f /home/ubuntu/repos/transfer/apt_installs.sh ]
then
    figlet -t "Doing Apt Installs"
    source /home/ubuntu/repos/transfer/apt_installs.sh
fi
sudo curl -L -o /home/ubuntu/repos/transfer/git_installs.sh https://raw.githubusercontent.com/miklevin/drinkme/main/git_installs.sh
figlet -t "Installing JupyterLab"
/home/ubuntu/py311/bin/python3.11 -m pip install --upgrade pip
/home/ubuntu/py311/bin/python3.11 -m pip install jupyterlab
figlet -t "jupyter installed"
