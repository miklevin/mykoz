# This keeps systemd services running in the background.
if ! ps ax | grep -v grep | grep sleep > /dev/null
then
    nohup sleep infinity >/dev/null 2>&1 &
fi

# Make sure clock hasn't drifted. Unedit if you have a clock problem.
# sudo hwclock -s

# Activate Python virtual environment.
source ~/pyenv/bin/activate

# Make vim find its .vimrc same place as NeoVim.
export VIMINIT="source ~/.config/nvim/init.vim"

# Color-code prompt, even git branch!
source ~/.bash_prompt

# Make gnu screen show more useful information.
export SCREENDIR=$HOME/.screen

# Enable WSL Graphics & Auido (maybe redundant)
export WSL2_GUI_APPS_ENABLED=1
export DISPLAY=:0
export XDG_RUNTIME_DIR=/mnt/wslg/runtime-dir
export WAYLAND_DISPLAY=wayland-0
export PULSE_SERVER=/mnt/wslg/pulseserver

# Start in the repo where most work is done.
cd ~/repos

echo "To see how JupyterLab runs invisibly type: screen -ls"
echo "JupyterLab URL: http://localhost:8888 password is foo"
echo "To begin your vim (NeoVim) experience, type: vimtutor"
# echo "Visit http://localhost:8000 for more on MyKoz.AI."
