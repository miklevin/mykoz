@echo off
setlocal enableDelayedExpansion
set "TIME=%TIME::=%"
set "TIME=%TIME:.=%"
set /a "T=%TIME%"
set "URL=https://raw.githubusercontent.com/miklevin/mykoz/main/install.bat?cache=%T%"
set "FILENAME=Jupyter Ubuntu.bat"
curl -s -o "%FILENAME%" "%URL%" ^
    -H "Cache-Control: no-cache, no-store, must-revalidate" ^
    -H "Pragma: no-cache" ^
    -H "Expires: 0" ^
    --proxy-header "Cache-Control: no-cache" ^
    --proxy-header "Cache-Control: no-store"

