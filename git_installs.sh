[ ! -d "/home/ubuntu/repos/journal" ] && GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:miklevin/journal /home/ubuntu/repos/journal
[ ! -d "/home/ubuntu/repos/intro" ] && GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:miklevin/intro /home/ubuntu/repos/intro
[ ! -d "/home/ubuntu/repos/yourservice" ] && GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:miklevin/yourservice /home/ubuntu/repos/yourservice

# figlet -t "Playwright..."
# /home/ubuntu/py311/bin/playwright install


