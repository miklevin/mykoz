::  ____       _       _      __  __      
:: |  _ \ _ __(_)_ __ | | __ |  \/  | ___ 
:: | | | | '__| | '_ \| |/ / | |\/| |/ _ \
:: | |_| | |  | | | | |   <  | |  | |  __/
:: |____/|_|  |_|_| |_|_|\_\ |_|  |_|\___|
:: For Rabbit Hole Linux, by Mike Levin SEO
::
:: This Windows batch script installs Linux
:: JupyterLab on your Windows 10 or 11 laptop
:: using the invisible Rabbit Hole Linux VM.
::
:: Install Ubuntu 22.04 from Microsoft Store
:: or by using the "wsl --install" command.
:: After WSL is installed, run this script.
::
:: Fetch & re-run this script to update your
:: Linux environment. It's a "floating" Linux
:: environment that can last you a lifetime.
::
:: Your data is stored in your Windows home
:: directory, so you can upgrade your hardware
:: and operating systems without losing data.
::
:: That also means you can re-run this install
:: script often without losing your work.
:: drinkme.bat is a shortcut to this script:
::
:: https://raw.githubusercontent.com/miklevin/drinkme/main/drinkme.bat
::                    ___          
::                   |   |         _____  
::                   |_  |        /     \      
::                     \ |       |       \     
::                     |  \      |       /     
::                      \  \____ \_      \     
::                       \      \_/      |     
::                 ___.   \_            _/     
::.-,             /    \    |          |       
::|  \          _/      `--_/           \_     
:: \  \________/                     /\   \    
:: |                                /  \_  \   
:: `-----------,                   |     \  \  
::             |                  /       \  | 
::             |                 |         | \ 
::             /                 |         \__|
::            /   _              |             
::           /   / \_             \            
::           |  /    \__      __--`            
::          _/ /        \   _/                 
::      ___/  /          \_/                   
::     /     /                                 
::     `----`                                  
::
:: - Always get the latest Python (3.12)
:: - Always get the latest JupyterLab (4)
:: - Name installer 3.8.bat for Python 3.8
:: - Use home VPN software to cycle your IP
:: - Use Playwright to automate Web browsers
:: - Run the versions the Linux servers do.
::
:: ------------------------------------------
:: STILL WORKS BUT DEPRECATED FOR drinkme.bat
:: ------------------------------------------
:: Save & Run this .bat on your Desktop for
:: JupyterLab served at http://localhost:8888

:: INSTRUCTIONS (SAVE AS .BAT)
:: Name file install.bat and save it to your Desktop.
:: Alternatively, name it 3.8.bat for Python 3.8
:: or any other version you want to install.

:: This is usually acomplished by visiting the URL:
:: https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat
:: Right-clicking on the page and choosing Save As...
:: Then, in the Save As dialog, change the Save as
:: type: to All Files (*.*) and name the file install.bat
:: Then, click Save and you're ready to run it.
::
:: There can be challenges such as Windows Defender
:: SmartScreen blocking the file from running. If so,
:: you can right-click on the file and choose Run as
:: Administrator. You may also need to click More Info
:: and then Run Anyway. If you have any problems, you
:: can always contact me at https://pipulate.com
::
:: The reason for this novel approach is that Linux has
:: reached the point where you can have a "floating"
:: Linux environment that is not tied to a particular
:: computer and has all the advantages of the cloud
:: versions of Linux, but without the limitations. It
:: can also last you a lifetime, floating from one
:: computer to the next, as you upgrade your hardware
:: and operating systems. Stuff you make with it will
:: be compatible with the cloud versions, too.

REM Set up envioronment and parse opitonal arguemnts.
set drinkme=0.8.4
set python=3.12
@echo off
local
cls

REM get full path of current script
set "script_path=%~dpnx0"

REM get just the filename portion without extension
for %%I in ("%script_path%") do set "script_name=%%~nI"

REM set default Python version
set "version=%python%"

REM check for first command line argument
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

:::rabbit::: RABBIT HOLE LINUX: Write Once, Run Forever. Future-proof Yourself.
:::rabbit:::                                                                /) ____
:::rabbit:::  ____       _     _     _ _     _   _       _            /)\__// /    \
:::rabbit::: |  _ \ __ _| |__ | |__ (_) |_  | | | | ___ | | ___   ___(/_ 0 0  |     |
:::rabbit::: | |_) / _` | '_ \| '_ \| | __| | |_| |/ _ \| |/ _ \*(     =(_T_)=>Linux|
:::rabbit::: |  _ < (_| | |_) | |_) | | |_  |  _  | (_) | |  __/  \  )   \"\  |     |
:::rabbit::: |_| \_\__,_|_.__/|_.__/|_|\__| |_| |_|\___/|_|\___|   |__>-\_>_>  \___/
:::rabbit:::
:::rabbit::: This script installs Linux under Windows WSL to run JuptyerLab in your
:::rabbit::: browser at http://localhost:8888. It's a "floating" Linux environment.
:::rabbit:::
:::rabbit::: ------------------------------------------------------------------------
:::rabbit::: Before continuing this script, Install Ubuntu 22.04 from Microsoft Store
:::rabbit::: or by using the "wsl --install" command. After WSL is installed, run this
:::rabbit::: script. This script can be re-run often to update your Linux environment.
:::rabbit::: All your configuration and files will be preserved. You can even upgrade.
:::rabbit::: ------------------------------------------------------------------------
:::rabbit:::
:::rabbit::: While there are many ways to run JupyterLab, this way is best because it
:::rabbit::: uses the same versions of Python and JupyterLab that the Linux servers do.
:::rabbit::: This is a baby-step towards future-proofing yourself. Using this method,
:::rabbit::: you can start to learn Python automation, vim, and other TIMELESS skills.
:::rabbit:::
:::rabbit::: Mac Version:
:::rabbit::: Coming Soon!           Press [Enter] to JUMP DOWN THE LINUX RABBIT HOLE...
:::rabbit:::                                  (or press Ctrl+C escape.)      prompt 1/3
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::rabbit:::" "%~f0"') do (echo.%%B)
set /p warning= %
:::unicorn:::
:::unicorn:::  Write once, Run Anywhere without the
:::unicorn:::  need to modify your code for platforms     THE LINUX CAN BE INVISIBLE
:::unicorn:::  or production environments. You don't   _______________________________
:::unicorn:::  even need to see Linux. Just run the   /                               \
:::unicorn:::  best "Cloud" versions of everything.  |  Local versions as good as the  |
:::unicorn:::                                        |  Cloud? There's no such thing.  |
:::unicorn:::                                         \________________________________/
:::unicorn:::   Yes there is, Mr. Unicorn!                               ()   ,
:::unicorn:::    ________________________      (\              /)          O  \\  .
:::unicorn:::   |  Windows 10 or 11     |    ___\\____________//__          o |\\/|
:::unicorn:::   |     ____ ____         |   == Rabbit Hole Linux ==          / " '\
:::unicorn:::   |  ,_/site\____\______. |   |  ( your hardware )  |  See!   . .   .
:::unicorn:::   |  |                  | |   |  __________________ |< - - - /    ) |
:::unicorn:::   |  |   WEB BROWSER    | |   | |  screen session | |       '  _.'  |
:::unicorn:::   |  | localhost:8888 <<--------->>Jupyter Server | |       '-'/    \
:::unicorn:::   |__|                  |_|   | |_________________| |
:::unicorn:::      '------------------'     |_____________________|   What, no Docker?
:::unicorn:::
:::unicorn:::   - Better than ANACONDA for systems automation.   "The time has come to
:::unicorn:::   - Better than DOCKER for ease & admin-ability.   get on standard tools"
:::unicorn:::   - Better than Jupyter-DESKTOP for portable code.  the Walrus never said.
:::unicorn:::   - Better than the CLOUD for privacy, VPN usage,
:::unicorn:::     package availability, browser automation, etc.       - The Carpenter
:::unicorn:::
:::unicorn:::                      Press [Enter] to jump down the Linux rabbit hole...
:::unicorn:::                                (or press Ctrl+C escape.)      prompt 2/3
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::unicorn:::" "%~f0"') do (echo.%%B)
set /p warning= %
:::warn:::  _              _      ____ _
:::warn::: | |    __ _ ___| |_   / ___| |__   __ _ _ __   ___ ___  "You can escape
:::warn::: | |   / _` / __| __| | |   | '_ \ / _` | '_ \ / __/ _ \  with Ctrl+C and
:::warn::: | |__| (_| \__ \ |_  | |___| | | | (_| | | | | (_|  __/  never know vim."
:::warn::: |_____\__,_|___/\__|  \____|_| |_|\__,_|_| |_|\___\___|             -Neo
:::warn:::                                                                       __
:::warn::: - A new Ubuntu 22.04 will be installed REPLACING THE DEFAULT!!!      /  \
:::warn::: - OTHER LINUXES running under WSL are LEFT UNTOUCHED.               |/)\_|
:::warn::: - JupyterLab will be reachable at http://localhost:8888          ___(/_ 0|
:::warn:::                                                                *(     =(_|
:::warn::: THE RULES OF WONDERLAND:                                         \  )   \/
:::warn::: - A "Linux Shell" icon will appear where you ran the installer.   |__>-_/
:::warn::: - Double-clicking it will open a Linux Terminal, but this is not
:::warn:::   necessary until you are ready to go deeper into the rabbit hole.
:::warn::: - Enjoy a genuine Linux Python experience in your browser!
:::warn:::
:::warn::: GETTING A COOL JUPYTER ICON:
:::warn::: - You can create a JupyterLab icon on your Desktop through Microsoft
:::warn:::   Edge browser by clicking the "..." menu in the upper right corner
:::warn:::   and selecting "Apps > Install this site as an app".
:::warn::: - Change the icon to jupyter.ico found in the DrinkMe repo.
:::warn:::
:::warn:::                      Press [Enter] to jump down the Linux rabbit hole...
:::warn:::                                (or press Ctrl+C escape.)      prompt 3/3
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::warn:::" "%~f0"') do (echo.%%B)

set /p warning= %
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
echo  Installing: Ubuntu 22.04, Python %version% (drinkme %drinkme%)... please have patience.
echo  Ease into Linux by using Python in JuputerLab. It's a great way to learn.
echo  Linux DOESN'T mean Desktop! Linux means improving muscle skills for life.

wsl --unregister Ubuntu >nul
wsl --set-default-version 2 >nul

REM These are variables for the automatically created Ubuntu 22.04 user under WSL.
set wsluser="ubuntu"
set password="foo"

REM The big install! If it's your first time, it will make you reboot your machine.
ubuntu.exe install --root >nul

REM Once Ubuntu 22.04 is installed, this sets up the default user.
wsl -d Ubuntu -u root useradd -m "%wsluser%" >nul 2>&1
wsl -d Ubuntu -u root sh -c "echo "%wsluser%:%password%" | chpasswd" >nul 2>&1
wsl -d Ubuntu -u root chsh -s /bin/bash "%wsluser%" >nul
wsl -d Ubuntu -u root usermod -aG adm,cdrom,sudo,dip,plugdev,lxd "%wsluser%" >nul 2>&1

REM Find the Windows username for the current user.
for /F "tokens=2 delims=\" %%U in ('whoami') do set "USERNAME=%%U"

%USERPROFILE%\AppData\Local\Microsoft\WindowsApps\ubuntu.exe config --default-user "%wsluser%" >nul

REM This creates "repos" folder in your Windows HOME for Windows/Linux file sharing.
if not exist "%USERPROFILE%\.ssh" mkdir %USERPROFILE%\.ssh >nul 2>&1
if not exist "%USERPROFILE%\repos" mkdir %USERPROFILE%\repos >nul 2>&1
if not exist "%USERPROFILE%\repos\transfer" mkdir %USERPROFILE%\repos\transfer >nul 2>&1
if not exist "%USERPROFILE%\.wslconfig" curl -sL -o %USERPROFILE%\.wslconfig "https://raw.githubusercontent.com/miklevin/drinkme/main/.wslconfig" >nul 2>&1
if not exist "%USERPROFILE%\.jupyter" mkdir %USERPROFILE%\.jupyter >nul 2>&1
if not exist "%USERPROFILE%\.config" mkdir %USERPROFILE%\.config >nul 2>&1
curl -sL -o %USERPROFILE%\repos\transfer\wsl.conf "https://raw.githubusercontent.com/miklevin/drinkme/main/wsl.conf" >nul 2>&1
curl -sL -o %USERPROFILE%\.config\bash.ico "https://raw.githubusercontent.com/miklevin/drinkme/main/icons/bash.ico" >nul 2>&1
curl -sL -o %USERPROFILE%\.config\jupyter.ico "https://raw.githubusercontent.com/miklevin/drinkme/main/icons/jupyter.ico" >nul 2>&1

REM Put the WSL config files in place.
wsl -d Ubuntu -u root cp "/mnt/c/Users/%USERNAME%/repos/transfer/wsl.conf" /etc/wsl.conf

REM If you're running from a location with these optional second-stage install files, copy them over.
if exist apt_installs.sh (copy apt_installs.sh %USERPROFILE%\repos\transfer > nul 2>&1) else (curl -L -o %USERPROFILE%\repos\transfer\apt_installs.sh "https://raw.githubusercontent.com/miklevin/drinkme/main/apt_installs.sh" > nul 2>&1)
if exist requirements.txt (copy requirements.txt %USERPROFILE%\repos\transfer > nul 2>&1) else (curl -L -o %USERPROFILE%\repos\transfer\requirements.txt "https://raw.githubusercontent.com/miklevin/drinkme/main/requirements.txt" >nul 2>&1)

REM This stops and restarts like a wsl --shutdown to activate systemd and metadata options.
wsl -t Ubuntu >nul 2>&1

:: Create symbolic links from Windows paths to WSL paths.
wsl -d Ubuntu -e bash -lic "ln -s /mnt/c/Users/%USERNAME%/.ssh/ /home/ubuntu/.ssh && ln -s /mnt/c/Users/%USERNAME%/repos/ /home/ubuntu/repos && ln -s /mnt/c/Users/%USERNAME%/.config/ /home/ubuntu/.config && ln -s /mnt/c/Users/%USERNAME%/.jupyter/ /home/ubuntu/.jupyter" >nul 2>&1

if exist %USERPROFILE%\.vimrc (wsl -d Ubuntu -e bash -lic "cp /mnt/c/Users/%USERNAME%/.vimrc /home/ubuntu/" >nul 2>&1) else (curl -L -o %USERPROFILE%\.vimrc "https://raw.githubusercontent.com/miklevin/drinkme/main/.vimrc" >nul 2>&1)
if exist %USERPROFILE%\.gitconfig (wsl -d Ubuntu -e bash -lic "cp /mnt/c/Users/%USERNAME%/.gitconfig /home/ubuntu/" >nul 2>&1) else (curl -L -o %USERPROFILE%\.gitconfig "https://raw.githubusercontent.com/miklevin/drinkme/main/.gitconfig" >nul 2>&1)
if exist %USERPROFILE%\.pypirc (wsl -d Ubuntu -e bash -lic "cp /mnt/c/Users/%USERNAME%/.pypirc /home/ubuntu/" >nul 2>&1) else (curl -L -o %USERPROFILE%\.pypirc "https://raw.githubusercontent.com/miklevin/drinkme/main/.pypirc" >nul 2>&1)

:: We update the software repository on the Ubuntu 22.04 Machine
echo  This is going to take about 10 minutes. Go get a drink.
wsl -d Ubuntu -u root -e sudo apt update >nul 2>&1

:: And now the big upgrading of all the Ubuntu 22.04 software.
wsl -d Ubuntu -u root -e sudo apt upgrade -y >nul 2>&1

:: You know what's nice? Not having to type a password every time you sudo a command!
wsl -d Ubuntu -u root /bin/bash -c "echo 'ubuntu	ALL=(ALL:ALL) NOPASSWD:ALL'> /etc/sudoers.d/ubuntu" >nul 2>&1

:: Grab and run second-half of install that runs under WSL and set up Linux graphics.
wsl -d Ubuntu -u ubuntu -e curl -L -o /home/ubuntu/install_wsl.sh "https://raw.githubusercontent.com/miklevin/drinkme/main/install_wsl.sh" >nul 2>&1
wsl -d Ubuntu -e bash -c "bash /home/ubuntu/install_wsl.sh %version% 2>&1

:: ACLs need a wsl --shutdown for git clone to work. Also keep the WSL session alive.
wsl -t Ubuntu >nul 2>&1

wsl -d Ubuntu -u root -e chmod 600 /home/ubuntu/.ssh/id_rsa_drinkme >nul 2>&1
wsl -d Ubuntu -u root -e chmod 600 /home/ubuntu/.ssh/id_rsa_drinkme.pub >nul 2>&1
wsl -d Ubuntu -u root -e curl -L -o /home/ubuntu/repos/transfer/git_installs.sh "https://raw.githubusercontent.com/miklevin/drinkme/main/git_installs.sh" >nul 2>&1

:: Install git repos
wsl -d Ubuntu -u root -e sh /home/ubuntu/repos/transfer/git_installs.sh 
REM >nul 2>&1

set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"
echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "%USERPROFILE%\Desktop\Linux Shell.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "%USERPROFILE%\AppData\Local\Microsoft\WindowsApps\wt.exe" >> %SCRIPT%
echo olink.Arguments = "-p Ubuntu" >> %SCRIPT%
echo olink.IconLocation = "%USERPROFILE%\.config\bash.ico" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%
del /Q %USERPROFILE%\repos\transfer\*

:::thump:::                                                       .----------------.
:::thump:::                                                       | Oh, my fur and |
:::thump:::      RABBIT HOLE LINUX HAS...                     /) (  whiskers! It's |
:::thump::: _                    _          _ _        /)\___// o | to Jupyer I go |
:::thump:::| |    __ _ _ __   __| | ___  __| | |   ___(/_ 0 0     '----------------'
:::thump:::| |   / _` | '_ \ / _` |/ _ \/ _` | | *(     =(_T_)=> http://localhost:8888
:::thump:::| |__| (_| | | | | (_| |  __/ (_| |_|   \  )   \"\
:::thump:::|_____\__,_|_| |_|\__,_|\___|\__,_(_)    |__>-\_>_>
for /f "delims=: tokens=1*" %%A in ('findstr /b ":::thump:::" "%~f0"') do (echo.%%B)
echo.
echo You can reach JupyterLab in a Windows browser at http://localhost:8888
echo From Microsoft Edge, you can make JupyterLab an app from: .../Apps/Install
echo You can get a nice JupyterLab icon here, even though edge won't show it:
echo https://raw.githubusercontent.com/miklevin/drinkme/main/icons/jupyter.ico
echo.
set /p warning=Press [Enter] to release this console window. %
