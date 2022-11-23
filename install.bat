@echo off
cls
:::intro:::   ____ _                      __  __      _                        _. 
:::intro:::  / ___| |__   __ _ ___  ___  |  \/  | ___| |                /)    /  \     
:::intro::: | |   | '_ \ / _` / __|/ _ \ | |\/| |/ _ \ |         /)\_ _//    /    |    
:::intro::: | |___| | | | (_| \__ \  __/ | |  | |  __/_|     ___(/_ 0 0      |LXD |    
:::intro:::  \____|_| |_|\__,_|___/\___| |_|  |_|\___(_)   *(     =(_T_)=    | WIN|    
:::intro:::                                                  \  )   \"\      \    /   
:::intro:::            Linux, Python, vim & git!              |__>-\_>_>      \__/

:: Display the above bunny-banner when the script is run as Windows .BAT file.
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::intro:::" "%~f0"') do (echo.%%B)

:: HOW TO INSTALL (SAVE & RUN THIS AS A .bat FILE)
::
:: Right-click in this window (if you're viewing it from the Github raw view at
:: https://raw.githubusercontent.com/miklevin/lxdwin/main/install.bat ), select
:: all, create a file named install.bat on your local Windows 10 or 11 computer
:: and right-click it to Run as administrator. If the icon doesn't look like gears
:: then you have a hidden .txt extension you can get rid of with File Explorer /
:: View / Options / View (tab) / Uncheck "Hide extensions for known types" after
:: which you will be able to see and delete the .txt extension.

:: WHERE To GO TO LEARN MORE
:: If you found this page from https://mikelev.in/ux and want to learn more, then
:: please visit the Github project main page at https://github.com/miklevin/lxdwin

echo.
echo.
echo   Do you ever get the feeling that you're learning the wrong tools
echo   for developing live-long skills? Shouldn't we in tech be able to
echo   get forever better at our craft as would a musician, athelete or
echo   any craftsperson without the tools changing every 2 to 10 years?
echo.  
echo   You can. You should. Microsoft added Linux to Windows because it
echo   had to in order to keep credibility as a developer platform, but
echo   manages to trap you in true Microsoft style. This is your escape
echo   to Linux, Python, vim and git, cushioning it through JuputerLab.
echo.
echo.
echo                      Press [Enter] to jump down the Linux rabbit hole...
echo                                (or press Ctrl+C escape.)      prompt 1/3
set /p warning= %
cls
:::two:::                       _________________________________
:::two:::                      /                                 \
:::two:::     GENERIC LINUX    |      Excellent Choice!          |
:::two:::                      \______________________________ '\
:::two:::                                                 ()    \\
:::two:::  This script will install one Linux under the     O    \\  .
:::two:::  Windows Subsystem for Linux (WSL) and use it to    o  |\\/|
:::two:::  host ANOTHER Linux under the LXD Container system     / " '\
:::two:::  that will host JupyterLab, which will be accessible   . .   .
:::two:::  from your Windows browser at http://localhost:8888   /    ) |
:::two:::                                                      '  _.'  |
:::two:::                           HYPERVISOR                 '-'/    \
:::two:::   ____________________________ ______________________________
:::two:::  |Windows 10 or 11           | |Windows Subsystem for Linux |
:::two:::  |         ____ ____         | |Ubuntu 18.04 with LXD       |
:::two:::  |      ,_/site\____\____.   | | __________________________ |
:::two:::  |      |                |   | | |Ubuntu 20.04 (non-WSL)  | |
:::two:::  |      | localhost:8888 -------->JupyterLab Server       | |
:::two:::  |      |   ( browser )  |   | | |________________________| |
:::two:::  |______|                |___| |____________________________|
:::two:::         '----------------'
:::two:::
:::two:::                      Press [Enter] to jump down the Linux rabbit hole...
:::two:::                                (or press Ctrl+C escape.)      prompt 2/3
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::two:::" "%~f0"') do (echo.%%B)
set /p warning= %
cls

:::three::: AFTER THE SCRIPT IS DONE:
:::three:::
:::three::: - A "JuputerLab Login" icon will be created where you run the script.
:::three:::
:::three::: - Double-clicking it will start JupyterLab and open a Terminal window.
:::three:::
:::three::: - The Terminal, a.k.a. Shell or command-line CAN be immediately closed
:::three:::   and you can just use Jupyter as you would with Anaconda or Desktop.
:::three:::
:::three::: - But the Jupyter server and the entire Linux system it's running under
:::three:::   can ALSO be reached through the Terminal using the screen command.
:::three:::
:::three::: WARNING:
:::three::: - This will uninstall any previous Ubuntu-18.04 under WSL.
:::three::: - A new Ubuntu 18.04 will be installed to host LXD Containers.
:::three::: - ALL other Linuxes running under WSL are left untouched.
:::three::: - JupyterLab will be reachable at http://localhost:8888
:::three:::
:::three:::                      Press [Enter] to jump down the Linux rabbit hole...
:::three:::                                (or press Ctrl+C escape.)      prompt 3/3
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::three:::" "%~f0"') do (echo.%%B)
set /p warning= %

timeout /t 2
:::wee:::          ____       _     _     _ _     _   _       _
:::wee:::         |  _ \ __ _| |__ | |__ (_) |_  | | | | ___ | | ___
:::wee:::         | |_) / _` | '_ \| '_ \| | __| | |_| |/ _ \| |/ _ \
:::wee:::         |  _ < (_| | |_) | |_) | | |_  |  _  | (_) | |  __/
:::wee:::         |_| \_\__,_|_.__/|_.__/|_|\__| |_| |_|\___/|_|\___|
:::wee:::     
:::wee:::      'It  is  a long tail, certainly said Alice, looking down
:::wee:::      with wonder at the Mouse's tail; 'but why do you call it
:::wee:::      sad?'  And  she  kept  on  puzzling  about  it while the
:::wee:::      Mouse was speaking, so that her idea  of  the  tale  was
:::wee:::      something like this:- 'Fury said to a
:::wee:::                         mouse, That
:::wee:::                           he met in the
:::wee:::                                house, "Let
:::wee:::                                    us both go
:::wee:::                                       to law: I
:::wee:::                                       will prosec-
:::wee:::                                        cute you --
:::wee:::                                      Come, I'll
:::wee:::                                   take no de-
:::wee:::                               nial:  We
:::wee:::                           must  have
:::wee:::                       the trial;
:::wee:::                     For really
:::wee:::                   this morn-
:::wee:::                 ing I've
:::wee:::                nothing
:::wee:::               to do."
:::wee:::                Said the
:::wee:::                 mouse to
:::wee:::                  the cur,
:::wee:::                   "Such   a
:::wee:::                     trial, dear
:::wee:::                         sir, With
:::wee:::                            no  jury
:::wee:::                              or judge,
:::wee:::                                  would
:::wee:::                               be wast-
:::wee:::                            ing our
:::wee:::                         breath."
:::wee:::                       "I'll be
:::wee:::                     judge,
:::wee:::                  I'll be
:::wee:::                jury,"
:::wee:::               said
:::wee:::              cun-
:::wee:::              ning
:::wee:::                old
:::wee:::                 Fury;
:::wee:::                   "I'll
:::wee:::                     try
:::wee:::                       the
:::wee:::                        whole
:::wee:::                         cause,
:::wee:::                          and
:::wee:::                        con-
:::wee:::                      demn
:::wee:::                    you to
:::wee:::                 death"
:::wee:::
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::wee:::" "%~f0"') do (echo.%%B)
timeout /t 2

echo Prepare for A LOT of scrolling (falling down the rabbit-hole).
echo Installing Ubuntu 18.04 under Windows Subsystem for Linux...
echo.
wsl --unregister Ubuntu-18.04
wsl --set-default-version 2

:: These are variables for the automatically created Ubuntu 18.04 user under WSL.
set wsluer="ubuntu"
set password="foo"

:: The big install! If it's your first time, it will make you reboot your machine.
ubuntu1804 install --root

:: Once Ubuntu 18.04 is installed, this sets up the default user.
wsl --distribution Ubuntu-18.04 -u root useradd -m "%wsluer%"
wsl --distribution Ubuntu-18.04 -u root sh -c "echo "%wsluer%:%password%" | chpasswd" # wrapped in sh -c to get the pipe to work
wsl --distribution Ubuntu-18.04 -u root  chsh -s /bin/bash "%wsluer%"
wsl --distribution Ubuntu-18.04 -u root usermod -aG adm,cdrom,sudo,dip,plugdev "%wsluer%"
ubuntu1804 config --default-user "%wsluer%"

:: This creates "repos" folder in your Windows HOME for Windows/Linux file sharing.
if not exist "%USERPROFILE%\repos" mkdir %USERPROFILE%\repos
if not exist "%USERPROFILE%\.config" mkdir %USERPROFILE%\.config
if not exist "%USERPROFILE%\repos\transfer\.jupyter" mkdir %USERPROFILE%\repos\transfer\.jupyter
if not exist "%USERPROFILE%\repos\transfer" mkdir %USERPROFILE%\repos\transfer
if not exist "%USERPROFILE%\repos\transfer\.jupyter" mkdir %USERPROFILE%\repos\transfer\.jupyter

:: If you're running from a location with these optional second-stage install files, copy them over.
echo "Copying optional installer files apt_installs.sh and requirements.txt if they exist."
if exist apt_installs.sh (copy apt_installs.sh %USERPROFILE%\repos\transfer) else (curl -L -o %USERPROFILE%\repos\transfer\apt_installs.sh "https://raw.githubusercontent.com/miklevin/lxdwin/main/apt_installs.sh")
if exist requirements.txt (copy requirements.txt %USERPROFILE%\repos\transfer) else (curl -L -o %USERPROFILE%\repos\transfer\requirements.txt "https://raw.githubusercontent.com/miklevin/lxdwin/main/requirements.txt")

:: This makes file permissions under WSL keyed off of your Windows-side.
wsl --distribution Ubuntu-18.04 -u root -e echo -e "[automount]\n"options = \"metadata\" > wsl.conf
wsl --distribution Ubuntu-18.04 -u root -e mv wsl.conf /etc/

:: This creates the a repos, .ssh and .config folders on WSL by linking to your Windows-side.
wsl --distribution Ubuntu-18.04 -e bash -lic "ln -s /mnt/c/Users/%USERNAME%/.ssh/ /home/ubuntu/.ssh" >nul
wsl --distribution Ubuntu-18.04 -e bash -lic "ln -s /mnt/c/Users/%USERNAME%/repos/ /home/ubuntu/repos" >nul
wsl --distribution Ubuntu-18.04 -e bash -lic "ln -s /mnt/c/Users/%USERNAME%/.config/ /home/ubuntu/.config" >nul

:: If you keep a .vimrc and .gitconfig Windows-side, this copies them over.
wsl --distribution Ubuntu-18.04 -e bash -lic "cp /mnt/c/Users/%USERNAME%/.vimrc /home/ubuntu/" >nul
wsl --distribution Ubuntu-18.04 -e bash -lic "cp /mnt/c/Users/%USERNAME%/.gitconfig /home/ubuntu/" >nul

:::apt:::  _   _           _       _   _              __        ______  _       _     _                  
:::apt::: | | | |_ __   __| | __ _| |_(_)_ __   __ _  \ \      / / ___|| |     | |   (_)_ __  _   ___  __
:::apt::: | | | | '_ \ / _` |/ _` | __| | '_ \ / _` |  \ \ /\ / /\___ \| |     | |   | | '_ \| | | \ \/ /
:::apt::: | |_| | |_) | (_| | (_| | |_| | | | | (_| |   \ V  V /  ___) | |___  | |___| | | | | |_| |>  < 
:::apt:::  \___/| .__/ \__,_|\__,_|\__|_|_| |_|\__, |    \_/\_/  |____/|_____| |_____|_|_| |_|\__,_/_/\_\
:::apt:::       |_|                            |___/                                                     
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::apt:::" "%~f0"') do (echo.%%B)

:: We update the software reposotory on the Ubuntu 18.04 Machine
wsl --distribution Ubuntu-18.04 -u root -e sudo apt update

:: With Figlet installed, I no longer need to embed ASCII art headlines.
wsl --distribution Ubuntu-18.04 -u root -e sudo apt install figlet
wsl --distribution Ubuntu-18.04 -e bash -lic "figlet -t 'Upgrading WSL Linux'"
timeout /t 2

:: And now the big upgrading of all the Ubuntu 18.04 software.
wsl --distribution Ubuntu-18.04 -u root -e sudo apt upgrade -y
wsl --distribution Ubuntu-18.04 -e bash -lic "figlet -t 'Installing systemd'"
timeout /t 2

:: Grab program that waits for Jupyter to start on Ubuntu 18.04 and put in sbin.
wsl --distribution Ubuntu-18.04 -u root -e curl -L -o /usr/local/sbin/jupyterlogin "https://raw.githubusercontent.com/miklevin/lxdwin/main/jupyterlogin"
wsl --distribution Ubuntu-18.04 -u root -e chown ubuntu:ubuntu /usr/local/sbin/jupyterlogin
wsl --distribution Ubuntu-18.04 -u root -e chmod +x /usr/local/sbin/jupyterlogin

:: Grab and run distrod's install.sh from Github to turn on systemd (required for LXD).
wsl --distribution Ubuntu-18.04 -u root -e curl -L -o /home/ubuntu/install.sh "https://raw.githubusercontent.com/nullpo-head/wsl-distrod/main/install.sh"
wsl --distribution Ubuntu-18.04 -u root -e chmod 777 /home/ubuntu/install.sh
wsl --distribution Ubuntu-18.04 -u root -e chown ubuntu:ubuntu /home/ubuntu/install.sh
wsl --distribution Ubuntu-18.04 -u root -e /home/ubuntu/install.sh install

:: Activate the LXD requirement "systemd" under WSL (previously unvailable).
wsl --distribution Ubuntu-18.04 -u root -e /opt/distrod/bin/distrod enable
wsl --distribution Ubuntu-18.04 -e bash -lic "figlet -t 'Systemd Installed'"
timeout /t 2

:: You know what's nice? Not having to type a password every time you sudo a command!
wsl --distribution Ubuntu-18.04 -u root -- echo "ubuntu	ALL=(ALL:ALL) NOPASSWD:ALL> /etc/sudoers.d/ubuntu"

:: Deep breath... Install the LXD Linux Container system on WSL accepting all defaults.
timeout /t 2 /nobreak >nul
wsl --distribution Ubuntu-18.04 -e bash -lic "figlet -t 'Installing LXD'"
timeout /t 2
wsl --distribution Ubuntu-18.04 -u ubuntu -e lxd init --auto

:: Grab and run second-half of install that runs under WSL and set up Linux graphics.
wsl --distribution Ubuntu-18.04 -u ubuntu -e curl -L -o /home/ubuntu/install.sh "https://raw.githubusercontent.com/miklevin/lxdwin/main/install.sh"
wsl --distribution Ubuntu-18.04 -e bash -lic "bash /home/ubuntu/install.sh && exit"
wsl --distribution Ubuntu-18.04 -e bash -lic "curl -L -o /home/ubuntu/.bash_profile 'https://raw.githubusercontent.com/miklevin/lxdwin/main/.bash_profile-wsl'"
echo Returning from install.sh, rebooting WSL for updated ACLs (access control list)

:: Grab post-reboot scripts. ACLs aren't sufficent for git cloning without a wsl --shutdown
:: wsl --shutdown
wsl -t Ubuntu-18.04

wsl --distribution Ubuntu-18.04 -u root -e echo "Back from shutdown"
wsl --distribution Ubuntu-18.04 -u root -e chmod 600 /home/ubuntu/.ssh/id_rsa_lxdwin
wsl --distribution Ubuntu-18.04 -u root -e chmod 600 /home/ubuntu/.ssh/id_rsa_lxdwin.pub
wsl --distribution Ubuntu-18.04 -u ubuntu -e curl -L -o /home/ubuntu/repos/transfer/git_installs.sh "https://raw.githubusercontent.com/miklevin/lxdwin/main/git_installs.sh"
wsl --distribution Ubuntu-18.04 -u ubuntu -e sh /home/ubuntu/repos/transfer/git_installs.sh

:: Clean up after the install, deleting whatever is not intentionally left behind.
wsl --distribution Ubuntu-18.04 -u root rm /home/ubuntu/install.sh
wsl --distribution Ubuntu-18.04 -u root rm /home/ubuntu/repos/transfer/pub.txt
wsl --distribution Ubuntu-18.04 -u root rm /home/ubuntu/repos/transfer/priv.txt
wsl --distribution Ubuntu-18.04 -u root rm /home/ubuntu/repos/transfer/unrot.py

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\JupyterLab Login.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%USERPROFILE%\AppData\Local\Microsoft\WindowsApps\wt.exe" >> %SCRIPT%
echo olink.Arguments = "-p Ubuntu-18.04" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%
del /Q %USERPROFILE%\repos\transfer\*

echo.
echo You can now reach JupyterLab in a Windows browser at http://localhost:8888
echo From Microsoft Edge, you can make JupyterLab an app from: .../Apps/Install
echo Double-click the icon "JupyterLab Login" created where you ran the script.
echo.

set /p warning=Press [Enter] to release this console window. %

:: See the rest at https://raw.githubusercontent.com/miklevin/jupyme/main/install.sh
:: but you don't have to do anything because it is downloaded and run from above.

::  _____     ____
:: |_   _|__ |  _ \  ___
::   | |/ _ \| | | |/ _ \
::   | | (_) | |_| | (_) |
::   |_|\___/|____/ \___/

:: - Switch Jupyter startup method from .bash_profile to Linux service.
:: - Set the keyboard shortcut for reset kernel and clear all outputs 

::  ____                   
:: |  _ \  ___  _ __   ___ 
:: | | | |/ _ \| '_ \ / _ \
:: | |_| | (_) | | | |  __/
:: |____/ \___/|_| |_|\___|

:: WEEK OF SEPT 18, 2022
:: - Preserving Google Chrome settings between reinstalls.
:: - Provided drag-copy shortcut in repo to run server after reboot.
:: - Prevented Jupyter configuration from being wiped-out by reinstalls.
:: - Copied requirements.txt LXD-side and one-time pip install -r requirements.txt
:: - Copied apt_installs.txt LXD-side and one-time source avtivate them.
