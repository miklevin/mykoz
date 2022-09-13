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
# echo "export DISPLAY=${DISPLAY}" > ~/repos/transfer/display.sh

echo "Use the jupyme command to start Jupyter Lab server."
