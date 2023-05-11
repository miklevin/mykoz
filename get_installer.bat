:: Write a bash script that will fetch a bash script from the internet and save it side-by-side with this file

@echo off
setlocal
:: Set the URL of the bash script to fetch
set URL=https://raw.githubusercontent.com/miklevin/drinkme/main/install.bat
:: Set the name of the bash script to fetch
:: This is the name of the file that will be saved side-by-side with this file
set FILENAME=install.bat
:: Fetch the script and save it
curl -s -o %FILENAME% %URL%

