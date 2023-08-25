@ECHO OFF
:: Bash config
mklink %USERPROFILE%\.bashrc %USERPROFILE%\.dotfiles\bashrc
:: Need to specifically target the symbolic link, rather than the file it
:: points to
:: https://stackoverflow.com/a/76975371/6335363
attrib %USERPROFILE%\.bashrc +h /l
mklink %USERPROFILE%\.inputrc %USERPROFILE%\.dotfiles\inputrc
attrib %USERPROFILE%\.inputrc +h /l

:: No other config necessary
pause
exit
