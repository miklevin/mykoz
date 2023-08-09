# Keep systemd services running in the background.
if ! ps ax | grep -v grep | grep sleep > /dev/null
then
    nohup sleep infinity >/dev/null 2>&1 &
fi

# Make sure clock hasn't drifted.
sudo hwclock -s

# Activate Python virtual environment.
source ~/pyenv/bin/activate

# Color-code prompt.
source ~/.bash_prompt

# Make gnu screen show more useful information.
export SCREENDIR=$HOME/.screen

# Enable WSL Graphics & Auido (maybe redundant)
export WSL2_GUI_APPS_ENABLED=1
export DISPLAY=:0
export XDG_RUNTIME_DIR=/mnt/wslg/runtime-dir
export WAYLAND_DISPLAY=wayland-0
export PULSE_SERVER=/mnt/wslg/pulseserver

cd ~/repos

echo "To see how JupyterLab runs invisibly type: screen -ls"
echo "Ctrl+Click http://localhost:8888 to use JupyterLab or"
echo "to begin your vim (NeoVim) experience, type: vimtutor"
