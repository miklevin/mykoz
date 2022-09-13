#!/usr/bin/env bash

CONTAINERS="$(lxc ls -c "n" --format csv | grep jupyter)"

for container in $CONTAINERS; do
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
lxc config device add jupyter jupyme proxy listen=tcp:0.0.0.0:8888 connect=tcp:127.0.0.1:8888

until [ ! -z "$(lxc ls jupyter -c '4' --format csv)" ]
do
  sleep 2
done

lxc exec jupyter -- sudo --login --user ubuntu bash -ilc "mkdir /home/ubuntu/repos"
lxc exec jupyter -- sudo --login --user ubuntu bash -ilc "add-apt-repository ppa:deadsnakes/ppa -y"
lxc exec jupyter -- sudo --login --user ubuntu bash -ilc "add-apt-repository ppa:deadsnakes/ppa -y"
lxc exec jupyter -- apt update
lxc exec jupyter -- apt upgrade -y
lxc exec jupyter -- apt autoremove -y
lxc exec jupyter -- apt install figlet
figlet foo
# lxc exec jupyter -- sudo apt install python3.10 -y
# lxc exec jupyter -- sudo apt install python3.10-venv -y
# lxc exec jupyter -- sudo --login --user ubuntu bash -ilc "/usr/bin/python3 -m venv /home/ubuntu/py310"
# lxc exec jupyter -- sudo --login --user ubuntu bash -ilc "https://raw.githubusercontent.com/miklevin/jupyme/main/.bash_profile"
# lxc exec jupyter -- sudo --login --user ubuntu bash -ilc "https://raw.githubusercontent.com/miklevin/jupyme/main/.bash_prompt"
# lxc exec jupyter -- sudo --login --user ubuntu bash -ilc "https://raw.githubusercontent.com/miklevin/jupyme/main/.screenrc"
# lxc exec jupyter -- sudo --login --user ubuntu bash -ilc "/home/ubuntu/py310/bin/python3.10 -m pip install jupyterlab"
