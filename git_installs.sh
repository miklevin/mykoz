figlet -t "Cloning git repos..."

figlet -t "Pipulate"
[ ! -d "/home/ubuntu/repos/pipulate" ] && GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:miklevin/pipulate /home/ubuntu/repos/pipulate

figlet -t "YAMLchop"
[ ! -d "/home/ubuntu/repos/yamlchop" ] && GIT_SSH_COMMAND="ssh -o StrictHostKeyChecking=no" git clone git@github.com:miklevin/yamlchop /home/ubuntu/repos/yamlchop

# figlet -t "Playwright..."
# /home/ubuntu/py311/bin/playwright install


