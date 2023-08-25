@ECHO OFF
:: Bash config
mklink %USERPROFILE%\.bashrc %USERPROFILE%\.dotfiles\bashrc
attrib +h %USERPROFILE%\.bashrc
mklink %USERPROFILE%\.inputrc %USERPROFILE%\.dotfiles\inputrc
attrib +h %USERPROFILE%\.inputrc

:: No other config necessary
pause
exit
