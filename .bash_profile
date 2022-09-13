# Activate py310 virtual environment.
source ~/py310/bin/activate

# Color-code prompt.
. ~/.bash_prompt

# Make gnu screen show more useful information.
export SCREENDIR=$HOME/.screen

# Un-comment the following lines to enable Linux graphics using VcXsrv or Xming.
# export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
# LIBGL_ALWAYS_INDIRECT=1

# Un-comment the following line if you have a shared folder between WSL & LXD
# and want to enable Linux graphics on LXD.
# echo "export DISPLAY=${DISPLAY}" > ~/data/display.sh

# This runs Jupyter server in a way accessible to WSL upon first Container login.
# If you have not done so already, execute the following line on WSL to add proxy.
# lxc config device add kingcoyote jupyme proxy listen=tcp:0.0.0.0:8888 connect=tcp:127.0.0.1:8888

# Set Jupyter folder and run in gnu screen in a way accessible from WSL
jn
