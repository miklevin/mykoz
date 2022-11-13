figlet -t "Cloining git repos"
cd /home/ubuntu/repos
[ ! -d "/home/ubuntu/repos/mlseo" ] && git clone git@github.com:miklevin/mlseo /home/ubuntu/repos/mlseo
[ ! -d "/home/ubuntu/repos/ohawf" ] && git clone git@github.com:miklevin/mlseo /home/ubuntu/repos/ohawf
echo "Done git cloning."

