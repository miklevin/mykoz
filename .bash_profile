# Activate py310 virtual environment.
source ~/py311/bin/activate

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

cd ~/repos

# Start JupyterLab and preserve prior configuration
export JUPYTER_CONFIG_DIR=/home/ubuntu/.config/jupyter
cd ~/repos
screen -wipe >/dev/null 2>&1
if ! screen -list | grep -q "jupyter"; then
    screen -dmS jupyter /home/ubuntu/py311/bin/jupyter lab --ip 0.0.0.0 --port 8888 --no-browser --ServerApp.password='argon2:$argon2id$v=19$m=10240,t=10,p=8$ijPab+qx2WAOlDKJiRE56Q$wJ5s4RI9dIw36HxHh+0P6eN8SwqTGy0PmnGe7D+oPlc'
fi
echo "Visit http://localhost:8888 for JupyterLab, or to see where it's running, type: screen -ls"
