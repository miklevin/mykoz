::  __  __       _  __
:: |  \/  |_   _| |/ /___ _____
:: | |\/| | | | | ' // _ \_  (_)
:: | |  | | |_| | . \ (_) / / _
:: |_|  |_|\__, |_|\_\___/___(_)
::         |___/MyKoz.AI Real/OS

:: You've heard of Marcus Aurelius
:: and Stoicism? This is MyKoz.AI
:: Real/OS and Tow-it-ism; a way
:: of using a Linux Subsystem on
:: Windows for a minimalistic and
:: portable approach to computing.

:: This .bat script replaces the
:: default Windows 10 or 11 Linux
:: Subsystem Ubuntu 22.04 with a
:: new one that has JupyterLab
:: installed along with the
:: latest Python, NeoVim, and a
:: few other goodies to get you
:: started on your journey.

:: If you've been thinking of
:: taking up skills that will
:: last a lifetime in the areas
:: of programming, data science,
:: and machine learning, this
:: URL is the place to start:

:: https://mikelev.in/mykoz/

cls
@echo off

set "wsl_status="

REM CHECK IF WSL IS INSTALLED
for /f "delims=" %%i in ('wsl --status 2^>nul') do set "wsl_status=%%i"
if "%wsl_status%" == "" (
    echo WSL is not installed. Do you want to install it now?
    echo Your system will be rebooted after the installation.
    echo After reboot, please run this script again.
    echo.
    echo Press [Enter] to install WSL or close this window.
    set /p warning= %
    wsl --install
    echo Reboot system and run this script again.
    set /p warning= %
    exit
)

REM SET UP ENVIRONMENT VARIABLES
set giturl=https://raw.githubusercontent.com/miklevin/mykoz/main/
set mykoz=0.9.57
set python=3.11

REM Check if a different version of Python was requested by
REM passing a version number as an argument to this script.
if not "%1" == "" (
    REM if argument has period in it, use it as version
    for %%I in ("%~1") do (
        if "%%~xI" neq "" set "version=%%~nI%%~xI"
    )
) else (
    REM if no argument, check if script name has period in it
    for %%I in ("%script_name%") do (
        if "%%~xI" neq "" set "version=%%~nI%%~xI"
    )
)

REM THIS IS THE FIRST SCREEN OF THE INSTALLER.



:::rabbit::: -------------------------------------------------------------------------
::rabbit:::  This installs Linux JupyterLab on Windows 10 or 11. Make sure your system
:::rabbit::: is up to date. This script can be re-run occasionally to update WSL Linux
:::rabbit::: All your configuration files, data & Notebooks are kept safe Windows-side
:::rabbit::: -------------------------------------------------------------------------
:::rabbit:::
:::rabbit::: <== Comfort Zone      WHO DO YOU WANT TO BE?             Your Future ==>
:::rabbit:::                       A) A newb every 2 to 5 years
:::rabbit:::                       B) Forever improving                    /)  ___
:::rabbit:::     ____ _                      __  __      _           /)\__//  /   \
:::rabbit:::    / ___| |__   __ _ ___  ___  |  \/  | ___| |      ___(/_ 0 0  |     |
:::rabbit:::   | |   | '_ \ / _` / __|/ _ \ | |\/| |/ _ \ |    *(    ==(_T_)==LINUX|
:::rabbit:::   | |___| | | | (_| \__ \  __/ | |  | |  __/_|      \  )   \"\  |     |
:::rabbit:::    \____|_| |_|\__,_|___/\___| |_|  |_|\___(_)       |__>-\_>_>  \___/
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::rabbit:::" "%~f0"') do (echo.%%B)

REM WRITE OUT THE TYPEWRITER SCRIPT TO A TEMP FILE.
echo(
(
echo strText=wscript.arguments(0^)
echo intTextLen = Len(strText^)
echo Set WS = CreateObject("wscript.shell"^)
echo intPause = 12
echo For x = 1 to intTextLen
echo   strTempText = Mid(strText,x,1^)
echo   WScript.StdOut.Write strTempText
echo   WScript.Sleep intPause
echo Next
)>"%TEMP%\tt.vbs"
@cscript //nologo "%TEMP%\tt.vbs" "                                    WOULD YOU LIKE TO IMPROVE YOUR GAME?"
echo.
echo.
timeout /t 2 >nul

@cscript //nologo "%TEMP%\tt.vbs" " There are many paths in life that will lead to dead ends. This isn't one."
echo.
@cscript //nologo "%TEMP%\tt.vbs" " By installing the Linux version of JupyterLab on Windows, you are running"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " the same code on your computer as you can on all Linux servers. From there"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " you ease your way into a lifetime of mindfulness and timeless skills by"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " keeping a 1-text-file Journal in vim for the rest of your life."
echo.
echo.
echo                         Press [Enter] to continue (or Ctrl+C to Escape)...
echo                                                                 prompt 1/4
set /p warning= %
cls

REM THIS IS THE SECOND SCREEN OF THE INSTALLER.

@cscript //nologo "%TEMP%\tt.vbs" " As we live, we are always getting closer to the end of our lives, and there is"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " precious little time to get sidetracked by short-lived trends and superficial"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " tools. Marcus Aurelius gave us STOICISM, a philosophy for finding meaning and"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " resilience in a chaotic world. MyKoz.AI Real/OS offers TOW-IT-ISM, a modern"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " approach to finding value in life by focusing on mastering a few simple,"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " lasting skills that can be carried with us from one context to the next."
echo.
timeout /t 3 >nul
:::unicorn:::
:::unicorn:::          TOW-IT-ISM?           _________________________________
:::unicorn:::                               /                                 \
:::unicorn:::                              |   Local versions as good as the   |
:::unicorn:::                              |   Cloud? There's no such thing!   |
:::unicorn:::        Yes there is, Mr.      \_________________________________/
:::unicorn:::        Unicorn! Here's                                          ()
:::unicorn:::        how it works...                                Tow it      O   ,
:::unicorn:::    _______________________          (\              /)             o  \\  .
:::unicorn:::   |    Windows 10 or 11   |       ___\\____________//__               |\\/|
:::unicorn:::   |     ____ ____         |      |   MyKoz.AI Real/OS  |             / " '\
:::unicorn:::   |  ,_/site\____\______. |      |   Linux Subsystem!  |    See!    . .   .
:::unicorn:::   |  |                  | |      |  _________________  |<- - - - - /    ) |
:::unicorn:::   |  |    WEB BROWSER   | |      | |  screen session | |          '  _.'  |
:::unicorn:::   |  |  localhost:8888 <------------> Jupyter Server | |          '-'/    \
:::unicorn:::   |__|                  |_|      | |_________________| |
:::unicorn:::      '------------------'        |_____________________|      What, no Docker?
:::unicorn:::
:::unicorn:::
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::unicorn:::" "%~f0"') do (echo.%%B)
echo                         Press [Enter] to continue (or Ctrl+C to Escape)...
echo                                                                 prompt 2/4
set /p warning= %
cls

REM THIS IS THE THIRD SCREEN OF THE INSTALLER.

:::mykoz:::  __  __       _  __             _    ___    ____            _    _____  ____  
:::mykoz::: |  \/  |_   _| |/ /___ ____    / \  |_ _|  |  _ \ ___  __ _| |  / / _ \/ ___| 
:::mykoz::: | |\/| | | | | ' // _ \_  /   / _ \  | |   | |_) / _ \/ _` | | / / | | \___ \ 
:::mykoz::: | |  | | |_| | . \ (_) / / _ / ___ \ | |   |  _ <  __/ (_| | |/ /| |_| |___) |
:::mykoz::: |_|  |_|\__, |_|\_\___/___(_)_/   \_\___|  |_| \_\___|\__,_|_/_/  \___/|____/ 
:::mykoz:::         |___/ MyKoz.AI Real/OS Tow-It-Ism: Small Portable Lifelong Linux Tech
:::mykoz:::
for /f "delims=: tokens=1*" %%a in ('findstr /b ":::mykoz:::" "%~f0"') do (echo.%%b)
timeout /t 3 >nul
@cscript //nologo "%TEMP%\tt.vbs" " You've heard of Marcus Aurelius and Stoicism? This is MyKoz: AReal/OS and "
echo.
@cscript //nologo "%TEMP%\tt.vbs" " Tow-it-ism; a way of using a Linux Subsystem for timeless computing."
echo.
timeout /t 2 >nul
:::future:::                              ___                     ___
:::future:::      (\  Tow-it-ism  /)     /   \ Tow it            /   \ Tow it    ,
:::future:::    ___\\____________//__   /     V      /)         /     V          \\  .
:::future:::   |   MyKoz.AI Real/OS  |         /)\__//     ____                  |\\/|
:::future:::   |   ================  |     ___(/_ 0 0     /    \   Far into      / " '\
:::future:::   | * Linux server      |   *(    ==(_T_)== | Mac  |  The Future   . .   .
:::future:::   | * Python coding     |     \  )   \"\   Anything|  And Still   /    ) |
:::future:::   | * vim text editor   |      |__>-\_>_>   |  PCs |  Relevant!  '  _.'  |
:::future:::   | * git code control  |  Linux Subsystem   \____/   AIs? NP!   '-'/    \
:::future:::   |_____________________|
for /f "delims=: tokens=1*" %%a in ('findstr /b ":::future:::" "%~f0"') do (echo.%%b)
timeout /t 2 >nul
echo.
@cscript //nologo "%TEMP%\tt.vbs" " Running JupyterLab on Linux Python in Window opens the door to unparalleled"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " compatibility with a wide range of hardware and software systems, from the cloud"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " to small-footprint devices, starting your career as a lifetime tech powerhouse."
echo.
@cscript //nologo "%TEMP%\tt.vbs" " Yet the amazing thing is this is an experience you will find nowhere else."
echo.
echo.
echo                         Press [Enter] to continue (or Ctrl+C to Escape)...
echo                                                                 prompt 3/4
set /p warning= %
cls

REM THIS IS THE FOURTH SCREEN OF THE INSTALLER.

:::hole:::   <<== Comfort Zone             Replaces WSL's Ubuntu 22.04 ==> ____
:::hole:::    _              _      ____ _                          _     / Ahhhhh
:::hole:::   | |    __ _ ___| |_   / ___| |__   __ _ _ __   ___ ___| |   7_O_/  |
:::hole:::   | |   / _` / __| __| | |   | '_ \ / _` | '_ \ / __/ _ \ |   |(/    |
:::hole:::   | |__| (_| \__ \ |_  | |___| | | | (_| | | | | (_|  __/_|   |/\/'  |
:::hole:::   |_____\__,_|___/\__|  \____|_| |_|\__,_|_| |_|\___\___(_)   ~\____/
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::hole:::" "%~f0"') do (echo.%%B)
timeout /t 2 >nul
echo.
@cscript //nologo "%TEMP%\tt.vbs" " Look, you could be using VSCode and be doing everything exactly the same "
echo.
@cscript //nologo "%TEMP%\tt.vbs" " way as everyone else, beholden to a vendor's vision of what your future"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " should be. What I propose here is in opposition to the status quo, and"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " it's going to be a lot of work."
echo.
echo.
timeout /t 5 >nul
@cscript //nologo "%TEMP%\tt.vbs" " But the approach I propose is devistatingly clever and simple. Merely by"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " making your JupyterLab powered by real Linux, coming from the Microsoft"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " Subsystem for Linux, you will be able to do things that few others can;"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " specifically that step from a LOST button-pusher to REAL AUTOMATION."
echo.
echo.
timeout /t 5 >nul
@cscript //nologo "%TEMP%\tt.vbs" " Following that, you will be able to venture into the Linux Terminal and the"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " vim text editor. I'll get you set up for daily journaling in a text file."
echo.
echo.
timeout /t 5 >nul
@cscript //nologo "%TEMP%\tt.vbs" " And the final warning, if you have Ubuntu 22.04 already installed under"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " WSL, THIS WILL DELETE IT! So if you have any data you want to keep, you"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " need to back it up now. I'm not kidding, this will delete your Ubuntu"
echo.
@cscript //nologo "%TEMP%\tt.vbs" " 22.04 installation and replace it with one configured for JupyterLab."
echo.
echo.
echo                         Press [Enter] to continue (or Ctrl+C to Escape)...
echo                                                                 prompt 4/4
set /p warning= %

REM THE INSTALL HAS BEEN APPROVED, LET'S DO THIS!

:::down:::
:::down:::                                         ___
:::down:::                                        |   |         _____
:::down:::                                        |_  |        /     \
:::down:::                                          \ |       |       \
:::down:::                                          |  \      |       /
:::down:::                                           \  \____ \_      \
:::down:::                                            \      \_/      |
:::down:::                                      ___.   \_            _/
:::down:::                     .-,             /    \    |          |
:::down:::                     |  \          _/      `--_/           \_
:::down:::                      \  \________/                     /\   \
:::down:::                      |                                /  \_  \
:::down:::                      `-----------,                   |     \  \
:::down:::                                  |                  /       \  |
:::down:::                                  |                 |         | \
:::down:::                                  /                 |         \__|
:::down:::                                 /   _              |
:::down:::                                /   / \_             \
:::down:::                                |  /    \__      __--`
:::down:::                               _/ /        \   _/
:::down:::                           ___/  /          \_/
:::down:::                          /     /
:::down:::                          `----`
:::down:::
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::down:::" "%~f0"') do (echo.%%B)
@cscript //nologo "%TEMP%\tt.vbs" " Installing: Ubuntu 22.04, Python %python% (MyKoz %mykoz%). Please have patience."
echo.
@cscript //nologo "%TEMP%\tt.vbs" " If you haven't read the opening chapter to Alice's Adventures in Wonderland," 
echo.
@cscript //nologo "%TEMP%\tt.vbs" " this would be an excellent time to do so, because this takes about 10 minutes."
echo.

REM There are subtle differences between Windows 10 and Windows 11, 
REM so we need to check which one we're on based on ubuntu.exe.

set "windows_apps_path=%USERPROFILE%\AppData\Local\Microsoft\WindowsApps"
set "install_command="
set "config_command="

REM In Windows 11 we Ubuntu distro name to just plain "Ubuntu".
if exist "%windows_apps_path%\ubuntu.exe" (
    set "install_command=ubuntu.exe install --root >nul"
    set "config_command=ubuntu.exe config --default-user "%%wsluser%%" >nul"
    set "Ubuntu=Ubuntu"
)

REM In Windows 10 the Ubuntu distro name is "Ubuntu-22.04".
if not defined install_command (
    if exist "%windows_apps_path%\ubuntu2204.exe" (
        set "install_command=ubuntu2204.exe install --root >nul"
        set "config_command=ubuntu2204.exe config --default-user "%%wsluser%%" >nul"
        set "Ubuntu=Ubuntu-22.04"
    )
)

REM If both ubuntu.exe and ubuntu2204.exe are not present, show an error message.
REM I must update this script from time to time to keep in sync with Microsoft.
if not defined install_command (
    echo "Error: Neither ubuntu.exe nor ubuntu2204.exe found in %windows_apps_path%"
    exit /b 1
)

::  _   _ _                 _           ___           _        _ _ 
:: | | | | |__  _   _ _ __ | |_ _   _  |_ _|_ __  ___| |_ __ _| | |
:: | | | | '_ \| | | | '_ \| __| | | |  | || '_ \/ __| __/ _` | | |
:: | |_| | |_) | |_| | | | | |_| |_| |  | || | | \__ \ || (_| | | |
::  \___/|_.__/ \__,_|_| |_|\__|\__,_| |___|_| |_|___/\__\__,_|_|_|
REM THIS IS A BIG DEAL! THIS DELETES EXISTING UBUNTU 22.04 INSTALL!

wsl --unregister %Ubuntu% >nul
wsl --set-default-version 2 >nul
set wsluser="ubuntu"
set password="foo"
call %install_command%

REM SET UP DEFAULT UBUNTU USER
wsl -d %Ubuntu% -u root useradd -m "%wsluser%" >nul 2>&1
wsl -d %Ubuntu% -u root sh -c "echo "%wsluser%:%password%" | chpasswd" >nul 2>&1
wsl -d %Ubuntu% -u root chsh -s /bin/bash "%wsluser%" >nul
wsl -d %Ubuntu% -u root usermod -aG adm,cdrom,sudo,dip,plugdev,lxd "%wsluser%" >nul 2>&1

REM BE VERY SURE WE'RE IN THE RIGHT PLACE
for /F "tokens=2 delims=\" %%U in ('whoami') do set "USERNAME=%%U"
call %config_command%

::  ____                  _           _ _        _     _       _        
:: / ___| _   _ _ __ ___ | |__   ___ | (_) ___  | |   (_)_ __ | | _____ 
:: \___ \| | | | '_ ` _ \| '_ \ / _ \| | |/ __| | |   | | '_ \| |/ / __|
::  ___) | |_| | | | | | | |_) | (_) | | | (__  | |___| | | | |   <\__ \
:: |____/ \__, |_| |_| |_|_.__/ \___/|_|_|\___| |_____|_|_| |_|_|\_\___/
::        |___/                                                         
REM KEY LOCATIONS SUCH AS REPOS, SSH, ETC. ARE SET UP WINDOWS SIDE

if not exist "%USERPROFILE%\.ssh" mkdir %USERPROFILE%\.ssh >nul 2>&1
if not exist "%USERPROFILE%\repos" mkdir %USERPROFILE%\repos >nul 2>&1
if not exist "%USERPROFILE%\repos\transfer" mkdir %USERPROFILE%\repos\transfer >nul 2>&1
if not exist "%USERPROFILE%\.wslconfig" curl -sL -o %USERPROFILE%\.wslconfig "%giturl%.wslconfig" >nul 2>&1
if not exist "%USERPROFILE%\.jupyter" mkdir %USERPROFILE%\.jupyter >nul 2>&1
if not exist "%USERPROFILE%\.config" mkdir %USERPROFILE%\.config >nul 2>&1
curl -sL -o %USERPROFILE%\repos\transfer\wsl.conf "%giturl%wsl.conf" >nul 2>&1
curl -sL -o %USERPROFILE%\.config\bash.ico "%giturl%icons/bash.ico" >nul 2>&1
curl -sL -o %USERPROFILE%\.config\jupyter.ico "%giturl%icons/jupyter.ico" >nul 2>&1
wsl -d %Ubuntu% -u root cp "/mnt/c/Users/%USERNAME%/repos/transfer/wsl.conf" /etc/wsl.conf
if exist apt_installs.sh (copy apt_installs.sh %USERPROFILE%\repos\transfer > nul 2>&1) else (curl -L -o %USERPROFILE%\repos\transfer\apt_installs.sh "%giturl%apt_installs.sh" > nul 2>&1)
if exist requirements.txt (copy requirements.txt %USERPROFILE%\repos\transfer > nul 2>&1) else (curl -L -o %USERPROFILE%\repos\transfer\requirements.txt "%giturl%requirements.txt" >nul 2>&1)

REM This stops and restarts like a wsl --shutdown to activate systemd and metadata options.
wsl -t %Ubuntu% >nul 2>&1

REM Create symbolic links from Windows paths to WSL paths.
wsl -d %Ubuntu% -e bash -lic "ln -s /mnt/c/Users/%USERNAME%/.ssh/ /home/ubuntu/.ssh && ln -s /mnt/c/Users/%USERNAME%/repos/ /home/ubuntu/repos && ln -s /mnt/c/Users/%USERNAME%/.config/ /home/ubuntu/.config && ln -s /mnt/c/Users/%USERNAME%/.jupyter/ /home/ubuntu/.jupyter" >nul 2>&1

REM Put the Windows config files Linux-side if they exist, otherwise download them.
if exist %USERPROFILE%\.gitconfig (wsl -d %Ubuntu% -e bash -lic "cp /mnt/c/Users/%USERNAME%/.gitconfig /home/ubuntu/" >nul 2>&1) else (wsl -d %Ubuntu% -u ubuntu -e curl -L -o /home/ubuntu/.gitconfig "%giturl%.gitconfig" >nul 2>&1)
if exist %USERPROFILE%\.vimrc (wsl -d %Ubuntu% -e bash -lic "cp /mnt/c/Users/%USERNAME%/.vimrc /home/ubuntu/" >nul 2>&1) else (wsl -d ubuntu -u ubuntu -e curl -l -o /home/ubuntu/.vimrc "%giturl%.vimrc" >nul 2>&1)
if exist %USERPROFILE%\.pypirc (wsl -d %Ubuntu% -e bash -lic "cp /mnt/c/Users/%USERNAME%/.pypirc /home/ubuntu/" >nul 2>&1) else (wsl -d ubuntu -u ubuntu -e curl -l -o /home/ubuntu/.pypirc "%giturl%.pypirc" >nul 2>&1)

REM We update the software repository on the Ubuntu 22.04 Machine
echo.
@cscript //nologo "%TEMP%\tt.vbs" " Hold tight. I'll start typing to you again as it gets good..."
echo.
wsl -d %Ubuntu% -u root -e sudo apt update >nul 2>&1

REM And now the big upgrading of all the Ubuntu 22.04 software.
wsl -d %Ubuntu% -u root -e sudo apt upgrade -y >nul 2>&1

REM You know what's nice? Not having to type a password every time you sudo a command!
wsl -d %Ubuntu% -u root /bin/bash -c "echo 'ubuntu	ALL=(ALL:ALL) NOPASSWD:ALL'> /etc/sudoers.d/ubuntu" >nul 2>&1

REM Grab and run second-half of install that runs under WSL and set up Linux graphics.
wsl -d %Ubuntu% -u ubuntu -e curl -L -o /home/ubuntu/install_wsl.sh "%giturl%install_wsl.sh" >nul 2>&1
wsl -d %Ubuntu% -e bash -c "bash /home/ubuntu/install_wsl.sh %python% 2>&1

REM ACLs need a wsl --shutdown for git clone to work. Also keep the WSL session alive.
wsl -t %Ubuntu% >nul 2>&1

REM Finessing permissions so that git clone works.
wsl -d %Ubuntu% -u root -e chown ubuntu:ubuntu /mnt/c/Users/%USERNAME%/.ssh/id_rsa_mykoz >nul 2>&1
wsl -d %Ubuntu% -u root -e chown ubuntu:ubuntu /mnt/c/Users/%USERNAME%/.ssh/id_rsa_mykoz.pub >nul 2>&1
wsl -d %Ubuntu% -u root -e chown ubuntu:ubuntu /mnt/c/Users/%USERNAME%/.ssh/config >nul 2>&1
wsl -d %Ubuntu% -u root -e chmod 600 /mnt/c/Users/%USERNAME%/.ssh/id_rsa_mykoz >nul 2>&1
wsl -d %Ubuntu% -u root -e curl -L -o /home/ubuntu/repos/transfer/git_installs.sh "%giturl%git_installs.sh" >nul 2>&1

REM Install git repos
wsl -d %Ubuntu% -e bash -lic "sh /home/ubuntu/repos/transfer/git_installs.sh" >nul 2>&1

REM Create the Bash on Ubuntu on Windows shortcut
set SCRIPT="%TEMP%\mykoz-%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%~dp0Linux Shell.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%USERPROFILE%\AppData\Local\Microsoft\WindowsApps\wt.exe" >> %SCRIPT%
echo olink.Arguments = "-p Ubuntu" >> %SCRIPT%
echo olink.IconLocation = "%USERPROFILE%\.config\bash.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%
cscript /nologo %SCRIPT%
del %SCRIPT%

REM Create the JupyterLab URL shortcut
curl -s -o "JupyterLab.url" "https://raw.githubusercontent.com/miklevin/mykoz/main/icons/JupyterLab.url"
echo "%USERPROFILE%\.config\jupyter.ico" >> JupyterLab.url

del /Q %USERPROFILE%\repos\transfer\*

:::thump:::                                                       .----------------. 
:::thump:::                                                       | Oh, my fur and |
:::thump:::        MyKoz.AI Real/OS HAS...                    /) (  whiskers! It's |
:::thump::: _                    _          _ _        /)\___// O | 2 Jupyter I go |
:::thump:::| |    __ _ _ __   __| | ___  __| | |   ___(/_ 0 0  o  '----------------'
:::thump:::| |   / _` | '_ \ / _` |/ _ \/ _` | | *(    ==(_T_)==
:::thump:::| |__| (_| | | | | (_| |  __/ (_| |_|   \  )   \"\     * Find the "Intro"   
:::thump:::|_____\__,_|_| |_|\__,_|\___|\__,_(_)    |__>-\_>_>
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::thump:::" "%~f0"') do (echo.%%B)
echo.
echo.
@cscript //nologo "%TEMP%\tt.vbs" "Congratulations! You have a working Ubuntu 22.04 system with Python %python%"
echo.
@cscript //nologo "%TEMP%\tt.vbs" "and JupyterLab installed. You can reach JupyterLab in a Windows browser at"
echo.
@cscript //nologo "%TEMP%\tt.vbs" "http://localhost:8888 or with the shortcut on your desktop (hit F5 to refresh"
echo.
@cscript //nologo "%TEMP%\tt.vbs" "if you don't see it). This is where you should start: Python in the browser."
echo.
echo.
@cscript //nologo "%TEMP%\tt.vbs" "There is also a Linux Shell shortcut on your desktop. Windows 10 users should"
echo.
@cscript //nologo "%TEMP%\tt.vbs" "install Windows Terminal from the Microsoft Store to make it work. The Linux"
echo.
@cscript //nologo "%TEMP%\tt.vbs" "Shell is what we will use to teach you the vim text editor. If you're feeling"
echo.
@cscript //nologo "%TEMP%\tt.vbs" "brave, you can try it out now by typing vimtutor at the Linux Shell prompt."
echo.
echo.

REM GET README.TXT FROM GITHUB
set "URL=https://raw.githubusercontent.com/miklevin/mykoz/main/README.txt?cache=%T%"
curl -s -o "README.txt" "%URL%" ^
    -H "Cache-Control: no-cache, no-store, must-revalidate" ^
    -H "Pragma: no-cache" ^
    -H "Expires: 0" ^
    --proxy-header "Cache-Control: no-cache" ^
    --proxy-header "Cache-Control: no-store"

set /p warning=Press [Enter] to release this console window. %

