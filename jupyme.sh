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

lxc exec jupyter -- apt update
lxc exec jupyter -- apt upgrade -y
lxc exec jupyter -- mkdir /home/ubuntu/repos
lxc exec jupyter -- add-apt-repository ppa:deadsnakes/ppa -y
lxc exec jupyter -- apt install python3.10 -y
lxc exec jupyter -- apt install python3.10-venv -y
lxc exec jupyter -- python3.10 -m venv /home/ubuntu/py310
lxc exec jupyter -- curl -L -o /home/ubuntu/.bash_profile "https://raw.githubusercontent.com/miklevin/dotconfigs/main/.bash_profile"
lxc exec jupyter -- curl -L -o /home/ubuntu/.bash_prompt "https://raw.githubusercontent.com/miklevin/dotconfigs/main/.bash_prompt"
lxc exec jupyter -- /home/ubuntu/py310/bin/python3.10 -m pip install jupyterlab
