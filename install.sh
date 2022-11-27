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
lxc config set jupyter security.privileged true

lxc config device add jupyter localhost8888 proxy listen=tcp:0.0.0.0:8888 connect=tcp:127.0.0.1:8888
until [ ! -z "$(lxc ls jupyter -c '4' --format csv)" ]
do
  echo "Waiting for lxd to start"
  sleep 2
done

sleep 5
lxc exec jupyter -- chown -R ubuntu:ubuntu /home/ubuntu/

lxc exec jupyter -- add-apt-repository ppa:deadsnakes/ppa -y
lxc exec jupyter -- apt install figlet -y
lxc exec jupyter -- figlet -t "Upgrading LXD Container"
sleep 2
lxc exec jupyter -- apt upgrade -y
# lxc exec jupyter -- apt install build-essential -y

lxc exec jupyter -- figlet -t "Installing Python 3.11"
sleep 2
lxc exec jupyter -- apt install python3.11 -y
lxc exec jupyter -- apt install python3.11-venv -y
lxc exec jupyter -- apt autoremove -y

lxc exec jupyter -- figlet -t "Creating Python venv"
sleep 2
lxc exec jupyter -- su --login ubuntu bash -c "/usr/bin/python3.11 -m venv /home/ubuntu/py311"
echo "Done"
lxc exec jupyter -- figlet -t "Adding LXD Devices"
sleep 2

WIN_HOME="$(printenv | grep -m 1 -o '/mnt/c/Users/[a-zA-Z]*/')"
ACMD="lxc config device add jupyter repos disk source=${WIN_HOME}repos/ path=/home/ubuntu/repos/"
echo "$ACMD"
eval "$ACMD"
ACMD="lxc config device add jupyter ssh disk source=${WIN_HOME}.ssh/ path=/home/ubuntu/.ssh/"
echo "$ACMD"
eval "$ACMD"
ACMD="lxc config device add jupyter config disk source=${WIN_HOME}.config/ path=/home/ubuntu/.config/"
echo "$ACMD"
eval "$ACMD"
ACMD="lxc config device add jupyter wslg disk source=/mnt/wslg/ path=/mnt/wslg/"
echo "$ACMD"
eval "$ACMD"
# ACMD="lxc config device add jupyter config disk source=/tmp/.X11-unix/ path=/tmp/.X11-unix/"
# echo "$ACMD"
# eval "$ACMD"

lxc config set jupyter environment.WAYLAND_DISPLAY wayland-0
lxc config set jupyter environment.XDG_RUNTIME_dir /mnt/wslg/runtime-dir
lxc config set jupyter environment.PULSE_SERVER /mnt/wslg/pulseserver

echo .bash_profile
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/.bash_profile https://raw.githubusercontent.com/miklevin/lxdwin/main/.bash_profile"
lxc exec jupyter -- chown ubuntu:ubuntu /home/ubuntu/.bash_profile
lxc exec jupyter -- chmod 777 /home/ubuntu/.bash_profile

echo .bash_prompt
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/.bash_prompt https://raw.githubusercontent.com/miklevin/lxdwin/main/.bash_prompt"
lxc exec jupyter -- chown ubuntu:ubuntu /home/ubuntu/.bash_prompt
lxc exec jupyter -- chmod 777 /home/ubuntu/.bash_prompt

echo .screenrc
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/.screenrc https://raw.githubusercontent.com/miklevin/lxdwin/main/.screenrc"
lxc exec jupyter -- chown ubuntu:ubuntu /home/ubuntu/.screenrc
lxc exec jupyter -- chmod 777 /home/ubuntu/.screenrc

echo ssh keys
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/repos/transfer/configure https://raw.githubusercontent.com/miklevin/lxdwin/main/config" 
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/repos/transfer/unrot.py https://raw.githubusercontent.com/miklevin/lxdwin/main/unrot.py" 
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/repos/transfer/pub.txt https://raw.githubusercontent.com/miklevin/lxdwin/main/pub.txt" 
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/repos/transfer/priv.txt https://raw.githubusercontent.com/miklevin/lxdwin/main/priv.txt" 
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/repos/transfer/known_hosts https://raw.githubusercontent.com/miklevin/lxdwin/main/known_hosts"
lxc exec jupyter -- /home/ubuntu/py311/bin/python3.11 /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/pub.txt --output /home/ubuntu/repos/transfer/id_rsa_lxdwin.pub
lxc exec jupyter -- /home/ubuntu/py311/bin/python3.11 /home/ubuntu/repos/transfer/unrot.py --input /home/ubuntu/repos/transfer/priv.txt --output /home/ubuntu/repos/transfer/id_rsa_lxdwin

mv -n /home/ubuntu/repos/transfer/id_rsa_lxdwin.pub /home/ubuntu/.ssh
mv -n /home/ubuntu/repos/transfer/id_rsa_lxdwin /home/ubuntu/.ssh
mv -n /home/ubuntu/repos/transfer/known_hosts /home/ubuntu/.ssh
mv -n /home/ubuntu/repos/transfer/configure /home/ubuntu/.ssh

echo jupyterstart
lxc exec jupyter -- sudo curl -L -o /usr/local/sbin/jupyterstart https://raw.githubusercontent.com/miklevin/lxdwin/main/jupyterstart
lxc exec jupyter -- chmod +x /usr/local/sbin/jupyterstart
echo jupyterscreen
lxc exec jupyter -- sudo curl -L -o /usr/local/sbin/jupyterscreen https://raw.githubusercontent.com/miklevin/lxdwin/main/jupyterscreen
lxc exec jupyter -- chmod +x /usr/local/sbin/jupyterscreen

lxc exec jupyter -- figlet -t "Optional Installs"
sleep 2
lxc exec jupyter -- sudo curl -L -o /usr/local/sbin/postinstall https://raw.githubusercontent.com/miklevin/lxdwin/main/postinstall
lxc exec jupyter -- chmod +x /usr/local/sbin/postinstall
lxc exec jupyter -- su --login ubuntu bash -c "postinstall"
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/repos/transfer/git_installs.sh https://raw.githubusercontent.com/miklevin/lxdwin/main/git_installs.sh" 

lxc exec jupyter -- figlet -t "Installing JupyterLab"
sleep 2
lxc exec jupyter -- su --login ubuntu bash -c "/home/ubuntu/py311/bin/python3.11 -m pip install --upgrade pip"
lxc exec jupyter -- su --login ubuntu bash -c "/home/ubuntu/py311/bin/python3.11 -m pip install jupyterlab"
lxc exec jupyter -- figlet -t "jupyter installed"
sleep 2
lxc alias remove jupyterstart >/dev/null 2>&1
lxc alias add jupyterstart "exec jupyter -- su --login ubuntu -c /usr/local/sbin/jupyterstart"
lxc alias remove jupyterscreen >/dev/null 2>&1
lxc alias add jupyterscreen "exec jupyter -- su --login ubuntu -c /usr/local/sbin/jupyterscreen"
lxc alias remove jupyter >/dev/null 2>&1
lxc alias add jupyterlogin "exec jupyter -- su --login ubuntu"
exit
