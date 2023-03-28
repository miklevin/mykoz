#!/bin/bash

figlet -t "Installing Python 3.11..."
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt install python3.11 -y
sudo apt install python3.11-venv -y
sudo apt autoremove -y
/usr/bin/python3.11 -m venv /home/ubuntu/py311
figlet -t "Configuring Linux..."
sudo curl -L -o /home/ubuntu/.bash_profile https://raw.githubusercontent.com/miklevin/drinkme/main/.bash_profile
sudo curl -L -o /home/ubuntu/.bash_prompt https://raw.githubusercontent.com/miklevin/drinkme/main/.bash_prompt
sudo curl -L -o /home/ubuntu/.screenrc https://raw.githubusercontent.com/miklevin/drinkme/main/.screenrc
sudo curl -L -o /home/ubuntu/repos/transfer/configure https://raw.githubusercontent.com/miklevin/drinkme/main/config
sudo curl -L -o /home/ubuntu/repos/transfer/unrot.py https://raw.githubusercontent.com/miklevin/drinkme/main/unrot.py
sudo curl -L -o /home/ubuntu/repos/transfer/pub.txt https://raw.githubusercontent.com/miklevin/drinkme/main/pub.txt
sudo curl -L -o /home/ubuntu/repos/transfer/priv.txt https://raw.githubusercontent.com/miklevin/drinkme/main/priv.txt
sudo curl -L -o /home/ubuntu/repos/transfer/known_hosts https://raw.githubusercontent.com/miklevin/drinkme/main/known_hosts
sudo curl -L -o /home/ubuntu/repos/transfer/configure https://raw.githubusercontent.com/miklevin/drinkme/main/config
sudo curl -L -o /home/ubuntu/repos/transfer/git_installs.sh https://raw.githubusercontent.com/miklevin/drinkme/main/git_installs.sh
sudo curl -L -o /etc/systemd/system/jupyter.service https://raw.githubusercontent.com/miklevin/drinkme/main/jupyter.service
sudo curl -L -o /usr/local/sbin/startjupyter https://raw.githubusercontent.com/miklevin/drinkme/main/startjupyter
sudo curl -L -o /usr/local/sbin/all https://raw.githubusercontent.com/miklevin/vim/master/all
sudo curl -L -o /home/ubuntu/repos/transfer/configure https://raw.githubusercontent.com/miklevin/drinkme/main/config
sudo chmod +x /usr/local/sbin/startjupyter
sudo chmod +x /usr/local/sbin/all
sudo /home/ubuntu/py311/bin/python3.11 /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/pub.txt --output /home/ubuntu/repos/transfer/id_rsa_drinkme.pub
sudo /home/ubuntu/py311/bin/python3.11 /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/priv.txt --output /home/ubuntu/repos/transfer/id_rsa_drinkme
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
/home/ubuntu/py311/bin/python3.11 -m pip install --upgrade pip

figlet -t "NodeJS install..."
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt install nodejs

if [ -f /home/ubuntu/repos/transfer/apt_installs.sh ]
then
    figlet -t "Apt Installs..."
    source /home/ubuntu/repos/transfer/apt_installs.sh
fi
sh -c 'curl -fLo /home/ubuntu/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
if [ -f /home/ubuntu/repos/transfer/requirements.txt ]
then
    figlet -t "Pip Installs..."
    /home/ubuntu/py311/bin/python3.11 -m pip install -r /home/ubuntu/repos/transfer/requirements.txt
fi

jupyter labextension install jupyterlab-plotly
sudo systemctl enable jupyter
sudo systemctl start jupyter
figlet -t "jupyter installed!"
