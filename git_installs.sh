[ ! -d "/home/ubuntu/repos/journal" ] && GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:miklevin/journal /home/ubuntu/repos/journal
[ ! -d "/home/ubuntu/repos/intro" ] && GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:miklevin/intro /home/ubuntu/repos/intro
[ ! -d "/home/ubuntu/repos/yourservice" ] && GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:miklevin/yourservice /home/ubuntu/repos/yourservice
[ ! -d "/home/ubuntu/repos/webdev" ] && GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:miklevin/webdev /home/ubuntu/repos/webdev
/home/ubuntu/pyenv/bin/playwright install


