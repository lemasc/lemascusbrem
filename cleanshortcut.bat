@ECHO OFF
@cls
set /p ver=<VERSION
goto printtitle

:printtitle
@TITLE Lemasc USB Virus Remover %ver%
@ECHO -------------------------------------------------------------------------
@ECHO Lemasc USB Virus Remover Portable Version %ver%
@ECHO Kill *.lnk, autorun.inf, *.vbs, *.scr and more
@ECHO ------------------------------------------------------------------------
@ECHO Special Command: -q -s (RemoveShortcut:QuickMode)
@ECHO Working...
ECHO Enter drive letter using the format "X:"
@SET /P DRIVELETTER= 
SET /a c=0
IF "%~d0"=="%DRIVELETTER%" goto cleanshortcut

:cleanshortcut
attrib -h -r -s /s /d %DRIVELETTER%\*.*
del %DRIVELETTER%\*.lnk
del %DRIVELETTER%\*.scr
del %DRIVELETTER%\*.inf
del %DRIVELETTER%\*.FAT32
ECHO Restoring shortcut succesful
ECHO The System can't find the file expected.
ECHO  Fail to moved files, please manually moved it.
ECHO Command running successfully
pause
exit