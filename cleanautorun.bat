:A1
@ECHO OFF
rem @attrib -r -s -h  X:\ShareDrive\*.*
rem @del X:\ShareDrive\kh* /Q
rem @del X:\ShareDrive\*.exe /Q
rem @del X:\ShareDrive\*.inf /Q
rem @rd X:\ShareDrive\RECYCLER /S /Q

@cls
@ECHO Program Kill Autorun Virus Version 2.2
@ECHO Created By Chaowarit  Chawangkiet.
@ECHO --------------------------------------
@ECHO Working...

SET /a c=0
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
