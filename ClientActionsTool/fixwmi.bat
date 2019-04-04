net stop winmgmt
PUSHD "%windir%\system32\wbem"
for %%i in (*.dll) do regsvr32 -s %%i
mofcomp.exe /RegServer
scrcons.exe /RegServer
unsecapp.exe /RegServer
winmgmt.exe /RegServer
wmiadap.exe /RegServer
wmiapsrv.exe /RegServer
wmiprvse.exe /RegServer
IF EXIST "%windir%\SysWOW64\wbem" (
GOTO OS_64
) ELSE (
GOTO Gate1
)
:OS_64
PUSHD "%windir%\SysWOW64\wbem"
for %%i in (*.dll) do regsvr32 -s %%i
mofcomp.exe /RegServer
scrcons.exe /RegServer
unsecapp.exe /RegServer
winmgmt.exe /RegServer
wmiadap.exe /RegServer
wmiapsrv.exe /RegServer
wmiprvse.exe /RegServer
POPD
:Gate1
ver | find "XP" > nul
IF NOT %ERRORLEVEL% == 1 (
GOTO ver_xp
) ELSE (
GOTO ver_7
)
:ver_xp
for %%i in (*.mof) do mofcomp %%i
for %%i in (*.mfl) do mofcomp %%i
GOTO End
:ver_7
"%windir%\system32\wbem\winmgmt.exe" /resetrepository
GOTO End
:End
net start ccmexec
net start winmgmt
POPD
DEL /F /Q "%windir%\temp\fixwmi.bat"
EXIT
