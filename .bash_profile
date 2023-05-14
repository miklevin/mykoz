# Activate py310 virtual environment.
source ~/pyenv/bin/activate

# Color-code prompt.
source ~/.bash_prompt

# Make gnu screen show more useful information.
export SCREENDIR=$HOME/.screen

# Enable WSL Graphics & Auido (redundant)
export WSL2_GUI_APPS_ENABLED=1
export DISPLAY=:0
export XDG_RUNTIME_DIR=/mnt/wslg/runtime-dir
export WAYLAND_DISPLAY=wayland-0
export PULSE_SERVER=/mnt/wslg/pulseserver

# Ping the Microsoft WSL-group every 6 seconds to keep systemd alive.
if ! pgrep -x "ping" > /dev/null
then
    nohup ping -i 4 172.17.224.1 >/dev/null 2>&1 &
fi

cd ~/repos
alias vim='nvim'

echo "Visit http://localhost:8888 for JupyterLab, or to see where it's running, type: screen -ls"
