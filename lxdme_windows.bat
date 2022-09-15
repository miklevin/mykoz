cls
@echo off 
echo.
echo This will install Ubuntu 18.04 to host LXD Linux containers.
echo After you set username and password, close Ubuntu window and
echo come back to this window to complete following instructions.
set /p warning=Press enter to continue...
echo.

wsl --install --distribution Ubuntu-18.04
wsl --shutdown

echo.
echo Have you set an Ubuntu username and password? If so, close
echo the Ubuntu window now (leave this window open) and press Enter
set /p warning=Press enter to continue...
echo.

mkdir %USERPROFILE%\repos
mkdir %USERPROFILE%\repos\temp
wsl --set-default-version 2
wsl --set-default Ubuntu-18.04
wsl -u root -e echo -e "[automount]\n"options = \"metadata\" > wsl.conf
wsl -u root -e mv wsl.conf /etc/
wsl --shutdown
wsl -e bash -lic "ln -s /mnt/c/Users/%USERNAME%/repos /home/ubuntu/ >/dev/null 2>&1"

wsl -u root -e curl -L -o /home/ubuntu/repos/temp/install.sh "https://raw.githubusercontent.com/nullpo-head/wsl-distrod/main/install.sh"
wsl -u root -e chmod 777 /home/ubuntu/repos/temp/install.sh
wsl -u root -e chown ubuntu:ubuntu /home/ubuntu/repos/temp/install.sh
wsl -u root -e /home/ubuntu/repos/temp/install.sh install
wsl -u root -e /opt/distrod/bin/distrod enable

wsl -u root -e  lxd init --auto
wsl -u root -e curl -L -o /home/ubuntu/repos/temp/install.sh "https://raw.githubusercontent.com/miklevin/jupyme/main/install.sh"
wsl -u root -e chmod 777 /home/ubuntu/repos/temp/install.sh
wsl -u root -e chown ubuntu:ubuntu /home/ubuntu/repos/temp/install.sh
wsl -u root -e /home/ubuntu/repos/temp/install.sh

set /p warning=Done! Hit Enter to dismiss install script.

