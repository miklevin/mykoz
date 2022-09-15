cls
@echo off
:::intro:::  Begin your life-time journey of Linux, Python, vim & git.         /)
:::intro:::      _                   _          __   __                 /)\_ _//
:::intro:::     | |_   _ _ __  _   _| |_ ___ _ _\ \ / /__  _   _    ___(/_ 0 0
:::intro:::  _  | | | | | '_ \| | | | __/ _ \ '__\ V / _ \| | | | *(     =(_T_)=
:::intro::: | |_| | |_| | |_) | |_| | ||  __/ |   | | (_) | |_| |   \  )   \"\
:::intro:::  \___/ \__,_| .__/ \__, |\__\___|_|   |_|\___/ \__,_|    |__>-\_>_>
:::intro:::             |_|    |___/
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::intro:::" "%~f0"') do (echo.%%B)
echo.
echo This will uninstall any previous Ubuntu-18.04 and install a new one.
echo The new Ubutnu 18.04 will then create a new JupyterLab LXD container
echo which you will be able to reach in browser at http://localhost:8888.
echo.
set /p warning=Press [Enter] to jump down this rabbit hole or press Ctrl+C escape. %
echo.

wsl --unregister Ubuntu-18.04
wsl --set-default-version 2
timeout /t 3 /nobreak >nul

:::alice:::  Insert Alice falling down rabbit hole ascii art here.
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::alice:::" "%~f0"') do (echo.%%B)

set wsluer="ubuntu"
set password="foo"

ubuntu1804 install --root

REM create user account
wsl --distribution Ubuntu-18.04 -u root useradd -m "%wsluer%"
wsl --distribution Ubuntu-18.04 -u root sh -c "echo "%wsluer%:%password%" | chpasswd" # wrapped in sh -c to get the pipe to work
wsl --distribution Ubuntu-18.04 -u root  chsh -s /bin/bash "%wsluer%"
wsl --distribution Ubuntu-18.04 -u root usermod -aG adm,cdrom,sudo,dip,plugdev "%wsluer%"

ubuntu1804 config --default-user "%wsluer%"

mkdir %USERPROFILE%\repos
rmdir /S /Q %USERPROFILE%\repos\temp
mkdir %USERPROFILE%\repos\temp
wsl --distribution Ubuntu-18.04 -u root -e echo -e "[automount]\n"options = \"metadata\" > wsl.conf
wsl --distribution Ubuntu-18.04 -u root -e mv wsl.conf /etc/
wsl --distribution Ubuntu-18.04 -u root -e ln -s /mnt/c/Users/%USERNAME%/.ssh/ /home/ubuntu/.ssh
wsl --distribution Ubuntu-18.04 -u root -e ln -s /mnt/c/Users/%USERNAME%/repos/ /home/ubuntu/repos

wsl --distribution Ubuntu-18.04 -e bash -lic "cp /mnt/c/Users/%USERNAME%/.gitconfig /home/ubuntu/"
wsl --distribution Ubuntu-18.04 -e bash -lic "cp /mnt/c/Users/%USERNAME%/.vimrc /home/ubuntu/"

wsl --distribution Ubuntu-18.04 -u root -e sudo apt update
wsl --distribution Ubuntu-18.04 -u root -e sudo apt upgrade -y

wsl --distribution Ubuntu-18.04 -u root -e curl -L -o /home/ubuntu/repos/temp/install.sh "https://raw.githubusercontent.com/nullpo-head/wsl-distrod/main/install.sh"
wsl --distribution Ubuntu-18.04 -u root -e chmod 777 /home/ubuntu/repos/temp/install.sh
wsl --distribution Ubuntu-18.04 -u root -e chown ubuntu:ubuntu /home/ubuntu/repos/temp/install.sh
wsl --distribution Ubuntu-18.04 -u root -e /home/ubuntu/repos/temp/install.sh install
wsl --distribution Ubuntu-18.04 -u root -e /opt/distrod/bin/distrod enable

wsl --distribution Ubuntu-18.04 -u root -- echo 'ubuntu	ALL=(ALL:ALL) NOPASSWD:ALL'> ubuntu
wsl --distribution Ubuntu-18.04 -u root -- chmod 0440 ubuntu
wsl --distribution Ubuntu-18.04 -u root -- chown 0 ubuntu
wsl --distribution Ubuntu-18.04 -u root -- mv ubuntu /etc/sudoers.d/

timeout /t 3 /nobreak >nul
wsl --distribution Ubuntu-18.04 exec -- sudo lxd init --auto

cls
wsl --distribution Ubuntu-18.04 -u root -e curl -L -o /home/ubuntu/repos/temp/install.sh "https://raw.githubusercontent.com/miklevin/jupyme/main/install.sh"
wsl --distribution Ubuntu-18.04 -u root -e chmod 777 /home/ubuntu/repos/temp/install.sh
wsl --distribution Ubuntu-18.04 -u root -e chown ubuntu:ubuntu /home/ubuntu/repos/temp/install.sh
wsl --distribution Ubuntu-18.04 -u root -e /home/ubuntu/repos/temp/install.sh

set /p warning=Installation done! Press Enter to release this console. %


