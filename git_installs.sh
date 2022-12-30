figlet -t "Cloning git repos..."
cd /home/ubuntu/repos

figlet -t "Pipulate FOSS SEO..."
[ ! -d "/home/ubuntu/repos/pipulate" ] && git clone git@github.com:miklevin/automatechrome /home/ubuntu/repos/automatechrome

figlet -t "Skite SSGenerator..."
[ ! -d "/home/ubuntu/repos/skite" ] && git clone git@github.com:miklevin/skite /home/ubuntu/repos/skite

figlet -t "Google OAuth2..."
[ ! -d "/home/ubuntu/repos/ohawf" ] && git clone git@github.com:miklevin/ohawf /home/ubuntu/repos/ohawf

figlet -t "Done repo cloning."

figlet -t "Playwright Install..."
playwright install


