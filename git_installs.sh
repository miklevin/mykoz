figlet -t "Cloning git repos..."
sleep 2
cd /home/ubuntu/repos
echo "Cloning automatebrowser..."
[ ! -d "/home/ubuntu/repos/automatebrowser" ] && git clone git@github.com:miklevin/automatebrowser /home/ubuntu/repos/automatebrowser
pip install -e /home/ubuntu/repos/ohawf
figlet -t "Done repo cloning."
sleep 2

