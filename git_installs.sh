figlet -t "Cloning git repos..."
cd /home/ubuntu/repos

figlet -t "Pipulate FOSS SEO..."
[ ! -d "/home/ubuntu/repos/pipulate" ] && git clone git@github.com:miklevin/piplate /home/ubuntu/repos/pipulate

figlet -t "Practice folder..."
[ ! -d "/home/ubuntu/repos/practice" ] && git clone git@github.com:miklevin/practice /home/ubuntu/repos/practice

figlet -t "Skite SSGenerator..."
[ ! -d "/home/ubuntu/repos/skite" ] && git clone git@github.com:miklevin/skite /home/ubuntu/repos/skite

figlet -t "Google OAuth2..."
[ ! -d "/home/ubuntu/repos/ohawf" ] && git clone git@github.com:miklevin/ohawf /home/ubuntu/repos/ohawf

figlet -t "Done repo cloning."

figlet -t "Playwright Install..."
/home/ubuntu/py311/bin/playwright install


