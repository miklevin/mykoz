figlet -t "Cloning git repos."
cd /home/ubuntu/repos
echo "Cloning mlseo..."
[ ! -d "/home/ubuntu/repos/mlseo" ] && git clone git@github.com:miklevin/mlseo /home/ubuntu/repos/mlseo
echo "Cloning ohawf..."
[ ! -d "/home/ubuntu/repos/ohawf" ] && git clone git@github.com:miklevin/mlseo /home/ubuntu/repos/ohawf
figlet -t "Done cloning."

