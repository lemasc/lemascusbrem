@ECHO OFF
@cls
set /p ver=<VERSION
@TITLE Lemasc USB Virus Remover %ver%
echo Loading Components...
ping 127.0.0.1>nul
cls
echo Lemasc USB Virus Remover %ver%
set oldpath=%CD%
color 17
goto printtitle

:printtitle
@ECHO --------------------------------------------------
ECHO Menu:
ECHO Press S to remove Shortcut and SCR Virus.           
ECHO Press A to remove Autorun Virus. 
ECHO Press V to remove VBS Virus.                 
ECHO Press L to perform all proccess.                         
ECHO Press X to exit.                 
ECHO ---------------------------------------------------
SET /P MENU=Choice: 
cls
IF %MENU%==S (goto selectdrive)
IF %MENU%==s (goto selectdrive)
IF %MENU%==A (goto cleanautorun)
IF %MENU%==a (goto cleanautorun)
IF %MENU%==V (goto cleanvbs)
IF %MENU%==v (goto cleanvbs)
IF %MENU%==L (goto selectdrive)
IF %MENU%==l (goto selectdrive)
exit

:selectdrive
ECHO Enter drive letter using the format "X:"
@SET /P DRIVELETTER=Drive: 
ECHO Please confirm that your drive is "%DRIVELETTER%".
@SET /P CONFIRMDRIVE=Is that correct? (Y/X): 
cls
IF %CONFIRMDRIVE%==X (goto selectdrive)
IF %CONFIRMDRIVE%==x (goto selectdrive)
goto cleanshortcut

:cleanshortcut
SET /a c=0
ping 127.0.0.1>nul
attrib -h -r -s /s /d %DRIVELETTER%\*.*
del %DRIVELETTER%\*.lnk
del %DRIVELETTER%\*.scr
del %DRIVELETTER%\*.inf
del %DRIVELETTER%\*.FAT32
ECHO The System can't find the file expected.
ECHO Fail to moved files, please manually moved it.
pause
echo The action "Clean Shortcut" has been executed successfully.
IF %MENU%==L (goto cleanautorun)
IF %MENU%==l (goto cleanautorun)
cls
echo The action "Clean Shortcut" has been executed successfully.
goto printtitle

:cleanautorun
echo Cleaning Autorun, please wait...
FOR %%x  in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO (
    FOR /f  "tokens=3 delims=\:" %%k in ('reg query hklm\system\mounteddevices^|findstr /C:"4300640052006F006D00"')  DO (
       IF  %%k==%%x  (
           IF %c%==0   SET fg1=%%k
           IF %c%==1   SET fg2=%%k
           SET /a c=1
       )
   )
)
IF  "%fg2%"=="" SET fg2=1
FOR %%x  in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) DO  (
    IF  %fg1% NEQ %%x (   
         IF  %fg2% NEQ %%x (   
             IF  EXIST %%x:\Autorun.inf (  
                  @attrib -r -s -h %%x:\Autorun.inf 
                  @del  %%x:\Autorun.inf  /Q
                  @echo "%%x:\Autorun.inf killed."
             )
             IF  EXIST %%x:\RECYCLER (  
                  @attrib -r -s -h %%x:\RECYCLER
                  @rd %%x:\RECYCLER /S /Q
              )
        )
    )
)
echo The action "Clean Autorun" has been executed successfully.
IF %MENU%==L (goto cleanvbs)
IF %MENU%==l (goto cleanvbs)
cls
echo The action "Clean Autorun" has been executed successfully.
goto printtitle

:cleanvbs
echo Please make sure you didn't do any operations. (copying, deleting, etc.)
pause
cls
taskkill /f /im explorer.exe
taskkill /f /im wsscript.exe
ver | findstr /l "5.1" > nul
if %ERRORLEVEL% == 0 (
cd %APPDATA%\Roaming\Microsoft\Start Menu\Programs\Startup
) else ( 
cd %HOMEPATH%\Start Menu\Programs\Startup
)
attrib -h -r -s /s /d *.*
del *.vbs
del *.ovbss
del *.vbs_1
del *.vbs.out
del *.vbss
cd %TEMP%
del autorun.exe
del *.vbs  
ping 127.0.0.1>nul
start explorer.exe
pause
cls
echo The action "Clean VBS" has been executed successfully.
goto printtitle
