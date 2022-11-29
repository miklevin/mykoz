if [ -f ~/repos/transfer/requirements.txt ]
then
    figlet -t "Doing Pip Installs"
    /home/ubuntu/py311/bin/python3.11 -m pip install -r /home/ubuntu/repos/transfer/requirements.txt
fi

if [ -f ~/repos/transfer/apt_installs.sh ]
then
    figlet -t "Doing Apt Installs"
    source /home/ubuntu/repos/transfer/apt_installs.sh
fi
