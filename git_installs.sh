figlet -t "Cloning git repos."
cd /home/ubuntu/repos
figlet -t "Cloning mlseo"
[ ! -d "/home/ubuntu/repos/mlseo" ] && git clone git@github.com:miklevin/mlseo /home/ubuntu/repos/mlseo
figlet -t "Cloning ohawf"
[ ! -d "/home/ubuntu/repos/ohawf" ] && git clone git@github.com:miklevin/mlseo /home/ubuntu/repos/ohawf
figlet -t "Done cloning."

