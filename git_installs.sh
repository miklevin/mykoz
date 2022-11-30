figlet -t "Cloning git repos..."
sleep 2
cd /home/ubuntu/repos
figlet -t "automatechrome..."
[ ! -d "/home/ubuntu/repos/automatechrome" ] && git clone git@github.com:miklevin/automatechrome /home/ubuntu/repos/automatechrome
figlet -t "skite..."
[ ! -d "/home/ubuntu/repos/skite" ] && git clone git@github.com:miklevin/skite /home/ubuntu/repos/skite
figlet -t "Done repo cloning."
sleep 2

