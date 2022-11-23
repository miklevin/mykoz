figlet -t "Cloning git repos..."
sleep 2
cd /home/ubuntu/repos
echo "Cloning ohawf..."
[ ! -d "/home/ubuntu/repos/ohawf" ] && git clone git@github.com:miklevin/mlseo /home/ubuntu/repos/ohawf
pip install -e /home/ubuntu/repos/ohawf
echo "Cloning mlseo..."
[ ! -d "/home/ubuntu/repos/mlseo" ] && git clone git@github.com:miklevin/mlseo /home/ubuntu/repos/mlseo
pip install -e /home/ubuntu/repos/mlseo
figlet -t "Done repo cloning."
sleep 2

