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
lxc config device add jupyter localhost8888 proxy listen=tcp:0.0.0.0:8888 connect=tcp:127.0.0.1:8888

until [ ! -z "$(lxc ls jupyter -c '4' --format csv)" ]
do
  sleep 2
done

lxc exec jupyter -- su --login ubuntu bash -c "echo 'export DEBIAN_FRONTEND=noninteractive' > /home/ubuntu/.bash_profile"
lxc exec jupyter -- add-apt-repository ppa:deadsnakes/ppa -y
lxc exec jupyter -- apt update
lxc exec jupyter -- apt upgrade -y
lxc exec jupyter -- apt autoremove -y
lxc exec jupyter -- apt install python3.10 -y
lxc exec jupyter -- apt install python3.10-venv -y

lxc exec jupyter -- su --login ubuntu bash -c "/usr/bin/python3.10 -m venv /home/ubuntu/py310"
lxc exec jupyter -- su --login ubuntu bash -c "echo 'source ~/py310/bin/activate' > /home/ubuntu/.bash_profile"

lxc exec jupyter -- su --login ubuntu bash -c "curl -L -o /home/ubuntu/.screenrc https://raw.githubusercontent.com/miklevin/jupyme/main/.screenrc"
lxc exec jupyter -- su --login ubuntu bash -c "curl -L -o /home/ubuntu/.bash_prompt https://raw.githubusercontent.com/miklevin/jupyme/main/.bash_prompt"
lxc exec jupyter -- su --login ubuntu bash -c "curl -L -o /home/ubuntu/.bash_profile https://raw.githubusercontent.com/miklevin/jupyme/main/.bash_profile"
lxc exec jupyter -- curl -L -o /usr/local/sbin https://raw.githubusercontent.com/miklevin/jupyme/main/jupyme
lxc exec jupyter -- chmod +x /usr/local/sbin/jupyme

WIN_HOME="$(printenv | grep -o '/mnt/c/Users/[a-zA-Z]*/')"
lxc config device add jupyter repos disk source=${WIN_HOME}repos path=/home/ubuntu/repos
lxc config device add jupyter ssh disk source=${WIN_HOME}.ssh/ path=/home/ubuntu/.ssh

lxc exec jupyter -- sudo --login --user ubuntu bash -ilc "/home/ubuntu/py310/bin/python3.10 -m pip install jupyterlab"

lxc exec jupyter -- su --login ubuntu bash -c "jupyme >/dev/null 2>&1 &"

echo "Visit JyupterLab at http://localhost:8888"
echo "If it's not running, use the jupyme command to start server."
