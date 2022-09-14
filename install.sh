#!/usr/bin/env bash

echo "You must have a repos and .ssh folder in your home folder C:\\Users\\[username]"
echo "This will replace your current Jupyter Container, config and pip installs."
echo
read -p "Are you sure you want to continue? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

CONTAINERS="$(lxc ls -c "n" --format csv | grep jupyter)"
for container in $CONTAINERS; do
  sleep 1
  echo "Stopping $container..."
  lxc stop $container
done

JUPYTER_EXISTS="$(lxc ls -c "n" --format csv | grep jupyter)"
if [ "$JUPYTER_EXISTS" == "jupyter" ]; then
  lxc delete jupyter --force
  echo "Old Jupyter container deleted."
else
  echo "jupyter container doesn't exist"
fi

lxc launch ubuntu:18.04 jupyter
lxc config device add jupyter localhost8888 proxy listen=tcp:0.0.0.0:8888 connect=tcp:127.0.0.1:8888

until [ ! -z "$(lxc ls jupyter -c '4' --format csv)" ]
do
  sleep 2
done

lxc exec jupyter -- su --login ubuntu bash -c "echo 'export DEBIAN_FRONTEND=noninteractive' > /home/ubuntu/.bash_profile"
lxc exec jupyter -- add-apt-repository ppa:deadsnakes/ppa -y
lxc exec jupyter -- apt install figlet -y
lxc exec jupyter -- figlet -t "Installing Jupyter Right!"
lxc exec jupyter -- apt update
lxc exec jupyter -- apt upgrade -y
lxc exec jupyter -- apt autoremove -y

lxc exec jupyter -- figlet -t "Installing Python 3.10"
lxc exec jupyter -- apt install python3.10 -y
lxc exec jupyter -- apt install python3.10-venv -y

lxc exec jupyter -- su --login ubuntu bash -c "/usr/bin/python3.10 -m venv /home/ubuntu/py310"
lxc exec jupyter -- su --login ubuntu bash -c "echo 'source ~/py310/bin/activate' > /home/ubuntu/.bash_profile"

lxc exec jupyter -- su --login ubuntu bash -c "curl -L -o /home/ubuntu/.screenrc https://raw.githubusercontent.com/miklevin/jupyme/main/.screenrc"
lxc exec jupyter -- su --login ubuntu bash -c "curl -L -o /home/ubuntu/.bash_prompt https://raw.githubusercontent.com/miklevin/jupyme/main/.bash_prompt"
lxc exec jupyter -- su --login ubuntu bash -c "curl -L -o /home/ubuntu/.bash_profile https://raw.githubusercontent.com/miklevin/jupyme/main/.bash_profile"
lxc exec jupyter -- sudo curl -L -o /usr/local/sbin/jupyme https://raw.githubusercontent.com/miklevin/jupyme/main/jupyme
lxc exec jupyter -- chmod +x /usr/local/sbin/jupyme
lxc exec jupyter -- sudo curl -L -o /usr/local/sbin/jupysee https://raw.githubusercontent.com/miklevin/jupyme/main/jupysee
lxc exec jupyter -- chmod +x /usr/local/sbin/jupysee

WIN_HOME="$(printenv | grep -o '/mnt/c/Users/[a-zA-Z]*/')"
lxc config device add jupyter repos disk source=${WIN_HOME}repos path=/home/ubuntu/repos
lxc config device add jupyter ssh disk source=${WIN_HOME}.ssh/ path=/home/ubuntu/.ssh

lxc exec jupyter -- figlet -t "Installing Jupyter Lab"
lxc exec jupyter -- sudo --login --user ubuntu bash -ilc "/home/ubuntu/py310/bin/python3.10 -m pip install jupyterlab"

lxc exec jupyter -- su --login ubuntu bash -c "jupyme >/dev/null 2>&1 &"
lxc alias remove jupyme
lxc alias add jupyme "exec jupyter -- su --login ubuntu -c /usr/local/sbin/jupyme"
lxc alias remove jupysee
lxc alias add jupysee "exec jupyter -- su --login ubuntu -c /usr/local/sbin/jupysee"
lxc alias remove jupyter
lxc alias add jupyter "exec jupyter -- su --login ubuntu"
lxc exec jupyter -- figlet -t "Done!"

echo "Use JuypterLab at http://localhost:8888"
echo "If using Edge be sure to .../Apps/Install this site as an app."
echo "If Jupyter isn't running, type: lxc jupyme"
echo "To see the server running, type (Ctrl+A,D to exit): lxc jupysee"
echo "To log into the Container, type (type exit to exit): lxc jupyter"
