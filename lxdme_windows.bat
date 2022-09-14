@echo off 

echo "This will install Ubuntu 18.04 to host LXD Linux containers."
set /p warning=hit enter to continue...

mkdir %USERPROFILE%\repos
mkdir %USERPROFILE%\repos\transfer
wsl --install --distribution Ubuntu-18.04
wsl --set-default-version 2
wsl --set-default Ubuntu-18.04
copy requirements.txt %USERPROFILE%\repos\transfer
copy apt_installs.txt %USERPROFILE%\repos\transfer
copy lxdme.sh %USERPROFILE%\repos\transfer

echo "Done!"
set /p warning=hit enter to continue...
