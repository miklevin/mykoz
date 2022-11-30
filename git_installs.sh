figlet -t "Cloning git repos..."
sleep 2
cd /home/ubuntu/repos
echo "Cloning automatebrowser..."
[ ! -d "/home/ubuntu/repos/automatechrome" ] && git clone git@github.com:miklevin/automatechrome /home/ubuntu/repos/automatechrome
pip install -e /home/ubuntu/repos/ohawf
figlet -t "Done repo cloning."
sleep 2

