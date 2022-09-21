#!/bin/bash

# This is the second-stage install script for activating LXD Containers on
# the Windows Subsystem for Linux (WSL). It does a JupyterLab Server install
# by default. Put other things you want installed in the apt_installs.sh and
# requirements.txt files. Linux graphics are supported with VcXsrv or Xming.

JUPYTER_EXISTS="$(lxc ls -c "n" --format csv | grep jupyter)"
if [ "$JUPYTER_EXISTS" == "jupyter" ]; then
  lxc stop jupyter
  lxc delete jupyter --force
  echo "Old Jupyter container deleted."
else
  echo "jupyter container doesn't exist"
fi

lxc launch ubuntu:20.04 jupyter
lxc config device add jupyter localhost8888 proxy listen=tcp:0.0.0.0:8888 connect=tcp:127.0.0.1:8888

until [ ! -z "$(lxc ls jupyter -c '4' --format csv)" ]
do
  sleep 2
done

sleep 5
lxc exec jupyter -- chown -R ubuntu:ubuntu /home/ubuntu/

lxc exec jupyter -- figlet -t "Updating LXD Container"
lxc exec jupyter -- add-apt-repository ppa:deadsnakes/ppa -y
lxc exec jupyter -- apt install figlet -y
lxc exec jupyter -- apt update
lxc exec jupyter -- figlet -t "Upgrading LXD Container"
lxc exec jupyter -- apt upgrade -y
# lxc exec jupyter -- apt install build-essential -y

lxc exec jupyter -- figlet -t "Installing Python 3.10"
lxc exec jupyter -- apt install python3.10 -y
lxc exec jupyter -- apt install python3.10-venv -y
lxc exec jupyter -- apt autoremove -y

lxc exec jupyter -- figlet -t "Creating Python venv"
lxc exec jupyter -- su --login ubuntu bash -c "/usr/bin/python3.10 -m venv /home/ubuntu/py310"

echo .bash_profile
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/.bash_profile https://raw.githubusercontent.com/miklevin/wsl2lxd/main/.bash_profile"
lxc exec jupyter -- chown ubuntu:ubuntu /home/ubuntu/.bash_profile
lxc exec jupyter -- chmod 777 /home/ubuntu/.bash_profile

lxc exec jupyter -- figlet -t "Linking Repos & .ssh"
lxc exec jupyter -- sudo curl -L -o /usr/local/sbin/lxconfig https://raw.githubusercontent.com/miklevin/wsl2lxd/main/lxconfig
lxc exec jupyter -- chmod +x /usr/local/sbin/lxconfig
lxc exec jupyter -- su --login ubuntu bash -c "lxconfig"
sleep 10

# WIN_HOME="$(printenv | grep -o '/mnt/c/Users/[a-zA-Z]*/')"
# lxc config device add jupyter repos disk source="$WIN_HOME"repos/ path=/home/ubuntu/repos/
# lxc config device add jupyter ssh disk source="$WIN_HOME".ssh/ path=/home/ubuntu/.ssh/

echo .bash_prompt
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/.bash_prompt https://raw.githubusercontent.com/miklevin/wsl2lxd/main/.bash_prompt"
lxc exec jupyter -- chown ubuntu:ubuntu /home/ubuntu/.bash_prompt
lxc exec jupyter -- chmod 777 /home/ubuntu/.bash_prompt
echo .screenrc
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/.screenrc https://raw.githubusercontent.com/miklevin/wsl2lxd/main/.screenrc"
lxc exec jupyter -- chown ubuntu:ubuntu /home/ubuntu/.screenrc
lxc exec jupyter -- chmod 777 /home/ubuntu/.screenrc
echo jupyterstart
lxc exec jupyter -- sudo curl -L -o /usr/local/sbin/jupyterstart https://raw.githubusercontent.com/miklevin/wsl2lxd/main/jupyterstart
lxc exec jupyter -- chmod +x /usr/local/sbin/jupyterstart
echo jupyterscreen
lxc exec jupyter -- sudo curl -L -o /usr/local/sbin/jupyterscreen https://raw.githubusercontent.com/miklevin/wsl2lxd/main/jupyterscreen
lxc exec jupyter -- chmod +x /usr/local/sbin/jupyterscreen

lxc exec jupyter -- figlet -t "Optional Installs"
lxc exec jupyter -- sudo curl -L -o /usr/local/sbin/postinstall https://raw.githubusercontent.com/miklevin/wsl2lxd/main/postinstall
lxc exec jupyter -- chmod +x /usr/local/sbin/postinstall
lxc exec jupyter -- su --login ubuntu bash -c "postinstall"

lxc exec jupyter -- figlet -t "Installing JupyterLab"
lxc exec jupyter -- su --login ubuntu bash -c "/home/ubuntu/py310/bin/python3.10 -m pip install jupyterlab"

lxc exec jupyter -- su --login ubuntu bash -c "jupyterstart >/dev/null 2>&1 &"
lxc alias remove jupyterstart >/dev/null 2>&1
lxc alias add jupyterstart "exec jupyter -- su --login ubuntu -c /usr/local/sbin/jupyterstart"
lxc alias remove jupyterscreen >/dev/null 2>&1
lxc alias add jupyterscreen "exec jupyter -- su --login ubuntu -c /usr/local/sbin/jupyterscreen"
lxc alias remove jupyter >/dev/null 2>&1
lxc alias add jupyterlogin "exec jupyter -- su --login ubuntu"
lxc exec jupyter -- figlet -t "Jupyter Installed"
lxc exec jupyter -- figlet -t "Done."

echo "Use JuypterLab at http://localhost:8888"
echo "From Edge .../Apps/Install this site as an app."
echo "Learn more at https://mikelev.in/ux"
read -p "Press any key to continue."
