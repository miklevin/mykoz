[ ! -d "/home/ubuntu/repos/Journal" ] && GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:miklevin/Journal /home/ubuntu/repos/Journal
[ ! -d "/home/ubuntu/repos/Intro" ] && GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:miklevin/Intro /home/ubuntu/repos/Intro
[ ! -d "/home/ubuntu/repos/Service" ] && GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:miklevin/Service /home/ubuntu/repos/Service

# figlet -t "Playwright..."
# /home/ubuntu/py311/bin/playwright install


