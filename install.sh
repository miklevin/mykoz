#!/usr/bin/env bash

# echo "You must have a repos and .ssh folder in your home folder C:\\Users\\[username]"
# echo "This will replace your current Jupyter Container, config and pip installs."
# echo
# read -p "Are you sure you want to continue? " -n 1 -r
# echo
# if [[ ! $REPLY =~ ^[Yy]$ ]]
# then
#     [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
# fi

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

lxc exec jupyter -- chown -R ubuntu:ubuntu /home/ubuntu/
WINUSER=`printenv | grep -o '/mnt/c/Users/[a-zA-Z]*/'`
lxc config device add jupyter repos disk source=$(WINUSER)repos path=/home/ubuntu/repos
lxc config device add jupyter ssh disk source=$(WINUSER).ssh/ path=/home/ubuntu/.ssh

lxc exec jupyter -- add-apt-repository ppa:deadsnakes/ppa -y
lxc exec jupyter -- apt install figlet -y
lxc exec jupyter -- figlet -t "Updating LXD Container"
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

lxc exec jupyter -- figlet -t "Configuring"
echo .bash_profile
lxc exec jupyter -- su --login ubuntu bash -c "sudo curl -L -o /home/ubuntu/.bash_profile https://raw.githubusercontent.com/miklevin/wsl2lxd/main/.bash_profile"
lxc exec jupyter -- chown ubuntu:ubuntu /home/ubuntu/.bash_profile
lxc exec jupyter -- chmod 777 /home/ubuntu/.bash_profile
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
echo jupyterscreen
lxc exec jupyter -- sudo curl -L -o /usr/local/sbin/jupyterscreen https://raw.githubusercontent.com/miklevin/wsl2lxd/main/jupyterscreen

lxc exec jupyter -- chmod +x /usr/local/sbin/jupyterscreen

lxc exec jupyter -- figlet -t "Installing JupyterLab"
lxc exec jupyter -- su --login ubuntu bash -c "/home/ubuntu/py310/bin/python3.10 -m pip install jupyterlab"

lxc exec jupyter -- su --login ubuntu bash -c "jupyterstart >/dev/null 2>&1 &"
lxc alias remove jupyterstart
lxc alias add jupyterstart "exec jupyter -- su --login ubuntu -c /usr/local/sbin/jupyterstart"
lxc alias remove jupyterscreen
lxc alias add jupyterscreen "exec jupyter -- su --login ubuntu -c /usr/local/sbin/jupyterscreen"
lxc alias remove jupyter
lxc alias add jupyterlogin "exec jupyter -- su --login ubuntu"
lxc exec jupyter -- figlet -t "Done!"

echo "Use JuypterLab at http://localhost:8888"
echo "From Edge .../Apps/Install this site as an app."
echo "Learn more at https://MikeLev.in/rabbithole"
