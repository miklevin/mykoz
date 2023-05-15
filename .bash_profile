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

# Ping in a screen session to keep systemd alive.
screen -wipe >/dev/null 2>&1
if ! screen -list | grep -q "ping"; then
    screen -dmS ping ping -i 5 172.17.224.1
fi

cd ~/repos
alias vim='nvim'

echo "Visit http://localhost:8888 for JupyterLab, or to see where it's running, type: screen -ls"
