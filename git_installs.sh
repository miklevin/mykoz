figlet -t "Cloning git repos..."
cd /home/ubuntu/repos

figlet -t "Automate Chrome..."
[ ! -d "/home/ubuntu/repos/automatechrome" ] && git clone git@github.com:miklevin/automatechrome /home/ubuntu/repos/automatechrome

figlet -t "Comibine CSV Files..."
[ ! -d "/home/ubuntu/repos/combinecsvfiles" ] && git clone git@github.com:miklevin/combinecsvfiles /home/ubuntu/repos/combinecsvfiles

figlet -t "Site Generator..."
[ ! -d "/home/ubuntu/repos/skite" ] && git clone git@github.com:miklevin/skite /home/ubuntu/repos/skite

figlet -t "Done repo cloning."

